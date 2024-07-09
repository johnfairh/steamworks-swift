//
//  TestApiNetworking.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks
import SteamworksHelpers
import XCTest

class TestApiNetworking: XCTestCase {
    /// Some scatty tests of the more hand-rolled structs
    func testNetworkingStructs() throws {
        let _ = try TestClient.getClient() // need steam up for some of these

        let addr4 = try XCTUnwrap(SteamNetworkingIPAddr(addressAndPort: "1.2.3.4:55"))
        XCTAssertTrue(addr4.isIPv4)
        XCTAssertFalse(addr4.isFakeIP)
        XCTAssertEqual("1020304", String(addr4.ipv4, radix: 16))

        let addr6 = SteamNetworkingIPAddr(ipv6: [0,0,0,0,0xff,0xff,0xff,0xff,0x24,0x23,0x22,0x21,0x00,0xda,0xb6,0x8e], port: 5000)
        XCTAssertFalse(addr6.isIPv4)

        let ident = SteamNetworkingIdentity(addr6)
        print("ident: \(ident)")
        let ident2 = try XCTUnwrap(SteamNetworkingIdentity(description: ident.description))
        XCTAssertTrue(ident2.isValid)

        let psnIdent = try XCTUnwrap(SteamNetworkingIdentity(genericString: "Catten", type: .sonyPSN))
        XCTAssertTrue(psnIdent.isValid)

        let localIdent = SteamNetworkingIdentity.localhost
        XCTAssertTrue(localIdent.isLocalhost)
    }

    /// SteamNetworkingMessage -- send a message using this API back to ourselves
    func testNetworkingMessages() throws {
        let steam = try TestClient.getClient()

        let steamID = steam.user.getSteamID()
        let message: [UInt8] = [1,2,3,4]

        steam.onSteamNetworkingMessagesSessionRequest { [weak steam] req in
            print("Session Request from \(req.identityRemote)")
            guard let steam else {
                return
            }

            let (count, msgs) = steam.networkingMessages.receiveMessagesOnChannel(localChannel: 0, maxMessages: 1)
            XCTAssertEqual(1, count)
            print("Received \(count) messages")
            if count > 0 {
                let msg = msgs[0]
                XCTAssertEqual(message.count, msg.size)
                print("Msg size = \(msg.size)")
                let bytePtr = msg.data.bindMemory(to: UInt8.self, capacity: msg.size)
                let bytes = [UInt8](UnsafeBufferPointer(start: bytePtr, count: msg.size))
                print("Msg body = \(bytes)")
                XCTAssertEqual(message, bytes)
                msg.release()
            }

            steam.networkingMessages.closeSessionWithUser(identityRemote: req.identityRemote)

            TestClient.stopRunningFrames()
        }

        let rc = steam.networkingMessages.sendMessageToUser(identityRemote: .init(steamID),
                                                            data: message,
                                                            dataSize: message.count,
                                                            sendFlags: .reliable,
                                                            remoteChannel: 0)
        guard rc == .ok else {
            XCTFail("SendMessageToUser failed: \(rc)")
            return
        }

        TestClient.runFrames() // until callback
    }

    /// SteamNetworkingSockets - send a message through the stream-based API
    func testNetworkingSocket() throws {
        let steam = try TestClient.getClient()

        let msgData: [UInt8] = [1,2,3,4]
        let debugCloseMsg = "Bye"

        final class State: @unchecked Sendable {
            var listenSocket: HSteamListenSocket?
            var clientConnection = HSteamNetConnection(0)
            var serverConnection = HSteamNetConnection(0)
            init() {}
        }

        let state = State()

        // we have to poll for inbound messages, no callback on 'readable'
        let pollFrameCallback: (SteamAPI) -> Void = { steam in
            let (_, msgs) = steam.networkingSockets.receiveMessagesOnConnection(conn: state.serverConnection, maxMessages: 1)
            if !msgs.isEmpty {
                let msg = msgs.first!
                let bytePtr = msg.data.bindMemory(to: UInt8.self, capacity: msg.size)
                let bytes = Array((UnsafeBufferPointer(start: bytePtr, count: msg.size)))
                print("Server received message, len=\(msg.size) body=\(bytes)")
                XCTAssertEqual(msgData, bytes)
                msg.release()
                let rc1 = steam.networkingSockets.closeConnection(peer: state.serverConnection, reason: 0, debug: debugCloseMsg, enableLinger: false)
                let rc2 = steam.networkingSockets.closeListenSocket(socket: state.listenSocket!)
                print("Server close conn=\(rc1) sock=\(rc2)")
                XCTAssertTrue(rc1)
                XCTAssertTrue(rc2)
            }
        }

        // callback for connection state machine -- we get both ends here!
        steam.onSteamNetConnectionStatusChangedCallback { [weak steam] req in
            guard let steam else { return }

            let isClient = req.conn == state.clientConnection
            let connName = isClient ? "Client" : "Server"
            let (rc, steamConnName) = steam.networkingSockets.getConnectionName(peer: req.conn, maxLen: 100)
            print("\(connName) (\(rc ? steamConnName : "")) Connection Status: \(req.oldState)->\(req.info.state)")

            switch req.info.state {
            case .problemDetectedLocally:
                let rc = steam.networkingSockets.closeListenSocket(socket: state.listenSocket!)
                XCTFail("Abandoning test, close rc=\(rc)")
                TestClient.stopRunningFrames()

            case .connecting:
                // Accept connection on server
                guard !isClient else { break }
                let rc = steam.networkingSockets.acceptConnection(conn: req.conn)
                state.serverConnection = req.conn
                steam.networkingSockets.setConnectionName(peer: req.conn, name: "SERVER")
                print("Accept rc=\(rc)")
                XCTAssertEqual(.ok, rc)

            case .connected:
                // Send message from client on connect
                guard isClient else { break }
                let (rc, messageNumber) = steam.networkingSockets.sendMessageToConnection(conn: req.conn, data: msgData, dataSize: msgData.count, sendFlags: [])
                print("SendMsg rc=\(rc) messageNumber=\(messageNumber)")
                XCTAssertEqual(.ok, rc)

                let (rc2, status, _) = steam.networkingSockets.getConnectionRealTimeStatus(conn: req.conn, laneCount: 0, returnLaneStatus: false)
                print("RTStatus rc2=\(rc2) status=\(status)")

            case .closedByPeer:
                // Close client and end test when server closes
                print("Server says: \(req.info.endDebug)")
                XCTAssertEqual(debugCloseMsg, req.info.endDebug)
                let rc = steam.networkingSockets.closeConnection(peer: req.conn, reason: 0, debug: "", enableLinger: false)
                print("Close rc=\(rc), waiting for closed->none ack")
                XCTAssertTrue(rc)

            case .none:
                if isClient {
                    // Ack to closeConnection()
                    TestClient.stopRunningFrames()
                }

            default:
                print("waiting...")
            }
        }

        state.listenSocket = steam.networkingSockets.createListenSocketIP(address: .init(inaddrAnyPort: 27100), options: [])
        print("CreateListenSocketIP rc=\(state.listenSocket!)")
        XCTAssertNotEqual(.invalid, state.listenSocket)
        let (adrRc, adr) = steam.networkingSockets.getListenSocketAddress(socket: state.listenSocket!)
        print("GetListenSocketAddress rc=\(adrRc) adr=\(adr)")
        XCTAssertTrue(adrRc)
        XCTAssertEqual("[::]:27100", adr.description)

        state.clientConnection = steam.networkingSockets.connectByIPAddress(address: .init(ipv4: .ipv4(127, 0, 0, 1), port: 27100), options: [])
        print("ConnectByIP rc=\(state.clientConnection)")
        XCTAssertNotEqual(.invalid, state.clientConnection)

        steam.networkingSockets.setConnectionName(peer: state.clientConnection, name: "CLIENT")
        let status = steam.networkingSockets.getDetailedConnectionStatus(conn: state.clientConnection)
        XCTAssertEqual(0, status.rc)
        print("ConnectionStatus: \(status.buf)")

        TestClient.runFrames(callback: pollFrameCallback)

        // If we run just this test and let the process exit then get "Trying to close low level socket support, but we still have sockets open!"
        // but all 3 sockets are definitely fully closed.  So slip in a recycle - doing a controlled shutdown before too much other network stuff
        // seems to sort things out.
        needRecycle = true
    }

    var needRecycle = false

    override func tearDown() {
        if needRecycle {
            needRecycle = false
            _ = try? TestClient.recycleClient()
        }
    }

    /// API shape test
    func testNetworkSettings() throws {
        let steam = try TestClient.getClient()

        let (rc1, timeout) = steam.networkingUtils.getConfigValueInt(.timeoutInitial, scopeType: .global, obj: 0)
        print("timeoutInitial: rc \(rc1), timeout \(timeout)")
        XCTAssertEqual(.ok, rc1)

        let (rc2, dupSend) = steam.networkingUtils.getConfigValueFloat(.fakePacketDupSend, scopeType: .global, obj: 0)
        print("fakePacketDupSend: rc \(rc2), dupSendRatio \(dupSend)")
        XCTAssertEqual(.ok, rc2)

        let (rc3, stunList) = steam.networkingUtils.getConfigValueString(.p2PSTUNServerList, scopeType: .global, obj: 0)
        print("p2PSTUNServerList: rc \(rc3), stunlist \(stunList)")
        XCTAssertEqual(.ok, rc3)

        let certReq = steam.networkingSockets.getCertificateRequest()
        XCTAssertTrue(certReq.rc)
        XCTAssertFalse(certReq.blob.isEmpty)

        steam.networkingUtils.initRelayNetworkAccess()

        print("Waiting for relay network...")

        var prevStatus = SteamNetworkingAvailability.neverTried
        var prevMsg = ""

        TestClient.runFrames { steam in
            let status = steam.networkingUtils.getRelayNetworkStatus()
            if status.rc != prevStatus || status.details.debugMsg != prevMsg {
                print("  \(status.rc) \(status.details.debugMsg)")
                prevStatus = status.rc
                prevMsg = status.details.debugMsg
            }
            guard status.rc != .waiting && status.rc != .attempting else {
                return // wait
            }
            print(status.details)

            let (_, pops) = steam.networkingUtils.getPOPList()
            print("Got \(pops.count) POPs")
            XCTAssertTrue(pops.count > 0)

            TestClient.stopRunningFrames()
        }
    }
}
