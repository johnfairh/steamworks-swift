//
//  TestApiServer.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks
import SteamworksHelpers
import XCTest

// Private client + private server, shutdown server before client => SUCCESS NO CRASHY
// Shared client + private server, no shutdown client => CRASHY ON ATEXIT
// Shared client + private server, shutdown client here & restart it => SUCCESS NO CRASHY

/// Create and shut down the gameserver version of the API
class TestApiServer: XCTestCase {
    func testGameServer() throws {
        let client = try TestClient.getClient() // need steam client init to make server work

        guard let server = SteamGameServerAPI(port: 27100, serverMode: .noAuthentication, version: "1.0.0.0") else {
            XCTFail("SteamGameServerAPI init failed")
            return
        }

        let loggedOn = server.gameServer.loggedOn()
        XCTAssertFalse(loggedOn)
        let ip = server.gameServer.getPublicIP()
        XCTAssertEqual(0, ip.ipv4Address)
        server.runCallbacks()
        client.runCallbacks()
    }

    override func tearDown() {
        try! TestClient.recycleClient()
    }
}
