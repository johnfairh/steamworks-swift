//
//  TestApiMatchmaking.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks
import SteamworksHelpers
import XCTest

/// Exercise the matchmakingservers stuff, which is very hand-rolled C++-Swift stuff
class TestApiMatchmaking: XCTestCase {

    final class ServerPing: SteamMatchmakingPingResponse {
        let done: () -> Void
        init(done: @escaping () -> Void) {
            self.done = done
        }

        func serverResponded(server: GameServerItem) {
            print("Responded to ping OK: \(server.gameDescription)")
            done()
        }

        func serverFailedToRespond() {
            print("Failed to respond to ping.")
            done()
        }
    }

    final class ServerCallbacks: SteamMatchmakingServerListResponse {
        let api: SteamAPI
        let done: () -> Void
        var serverIDs: Set<Int> = []
        let serverPingRsp: ServerPing
        var request: HServerListRequest?
        var queryHandle: HServerQuery

        init(api: SteamAPI, done: @escaping () -> Void) {
            self.api = api
            self.done = done
            self.serverPingRsp = ServerPing(done: done)
            self.queryHandle = .invalid
        }

        func serverResponded(request: HServerListRequest, iServer: Int) {
            serverIDs.insert(iServer)
            let g = api.matchmakingServers.getServerDetails(request: request, serverIndex: iServer)
            print("Got server \(iServer): \(g.gameDescription)")
            self.request = request
        }

        func serverFailedToRespond(request: HServerListRequest, iServer: Int) {
            print("ServerFailedToRespond: \(iServer)")
        }

        func refreshComplete(request: HServerListRequest, response: MatchMakingServerResponse) {
            print("RefreshComplete: \(response)")
            guard let id = serverIDs.first else {
                print("No servers, not pinging anything")
                done()
                return
            }
            let g = api.matchmakingServers.getServerDetails(request: request, serverIndex: id)
            print("Pinging server \(g.gameDescription) on 0x\(String(g.netAdr.ip, radix: 16)):\(g.netAdr.queryPort)")
            queryHandle = api.matchmakingServers.pingServer(ip: g.netAdr.ip, port: g.netAdr.queryPort, response: serverPingRsp)
        }
    }

    /// This isn't a very testy test because it queries all the servers that random people
    /// around the world are running -- typically at least one -- and then pings one of them.
    func testMatchmakingServers() throws {
        let steam = try TestClient.getClient()

        var handle: HServerListRequest?

        let callbacks = ServerCallbacks(api: steam) {
            steam.matchmakingServers.releaseRequest(handle!)
            TestClient.stopRunningFrames()
        }

        handle = steam.matchmakingServers.requestInternetServerList(appIndex: steam.utils.getAppID(),
                                                                    filters: ["gamedir" : "spacewar", "secure" : "1"],
                                                                    requestServersResponse: callbacks)

        TestClient.runFrames() // until we finish...
    }
}
