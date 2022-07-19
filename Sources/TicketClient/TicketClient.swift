//
//  TicketClient.swift
//  TicketClient
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks
import SteamworksHelpers
import SteamworksEncryptedAppTicket
import Foundation

// A quick test that the encryptedappticket stuff is linking properly.
// Code smash-ported from SpaceWar, ticket generation is rate-limited
// so this routine doesn't run automatically.

final class Client {
    let steam: SteamAPI

    let frameSource: DispatchSourceTimer
    private(set) var frameCounter: Int

    enum State {
        case idle
        case done
    }
    private var testState: State

    func stop() {
        testState = .done
    }

    init?() {
        guard let api = SteamAPI() else {
            print("SteamAPI init failed")
            return nil
        }
        api.useLoggerForSteamworksWarnings()
        self.steam = api
        frameSource = DispatchSource.makeTimerSource(queue: .main)
        frameCounter = 0
        testState = .idle
    }

    func runFrameLoop() {
        frameSource.schedule(deadline: .now(), repeating: .milliseconds(1000/60))
        frameSource.setEventHandler() { [weak self] in self?.frame() }
        frameSource.resume()

        while testState != .done && RunLoop.current.run(mode: .default, before: .distantFuture) {
        }
    }

    func frame() {
        steam.runCallbacks()
        frameCounter += 1
    }
}

@main
struct Main {
    static func main() {
        let spaceWarKey: [UInt8] = [ 0xed, 0x93, 0x86, 0x07, 0x36, 0x47, 0xce, 0xa5,
                                     0x8b, 0x77, 0x21, 0x49, 0x0d, 0x59, 0xed, 0x44,
                                     0x57, 0x23, 0xf0, 0xf6, 0x6e, 0x74, 0x14, 0xe1,
                                     0x53, 0x3b, 0xa3, 0x3c, 0xd8, 0x03, 0xbd, 0xbd ]

        print("TicketClient testbed, steamworks version \(SteamAPI.steamworksVersion)")
        SteamAPI.logger.logLevel = .trace
        guard let client = Client() else {
            return
        }

        let secret: [UInt8] = [0xfe, 0xed, 0xfa, 0xce]

        client.steam.user.requestEncryptedAppTicket(dataToInclude: secret) { rsp in
            defer { client.stop() }
            guard let rsp = rsp else {
                print("RequestAppTicket failed, IO failure from steam")
                return
            }
            guard rsp.result == .ok else {
                print("RequestAppTicket failed: \(rsp.result)")
                return
            }
            print("RequestAppTicket OK")
            guard let encryptedTicketBytes = client.steam.user.getEncryptedAppTicket() else {
                print("But GetEncryptedAppTicket says no.")
                return
            }
            print("GetEncryptedAppTicket OK, got \(encryptedTicketBytes.count) bytes")

            guard let ticket = SteamEncryptedAppTicket(encryptedBytes: encryptedTicketBytes, key: spaceWarKey) else {
                print("But SteamEncryptedAppTicket couldn't decode it.")
                return
            }

            print("Decrypted ticket, AppID = \(ticket.appID), SteamID = \(ticket.steamID)")
            guard let payload = ticket.userVariableData else {
                print("But payload doesn't exist")
                return
            }
            guard payload == secret else {
                print("But payload is wrong, got: \(payload) but expected: \(secret)")
                return
            }
            print("Payload matches: success.")
        }

        client.runFrameLoop()
        print("Ran \(client.frameCounter) frames")
    }
}
