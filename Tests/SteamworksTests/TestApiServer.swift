//
//  TestApiServer.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks
import SteamworksHelpers
import XCTest

/// Create and shut down the gameserver version of the API
class TestApiServer: XCTestCase {
    func testGameServer() throws {
        let _ = try TestClient.getClient() // need steam client init to make server work

        guard let server = SteamGameServerAPI(port: 27100, serverMode: .noAuthentication, version: "1.0.0.0") else {
            XCTFail("SteamGameServerAPI init failed")
            return
        }

        let loggedOn = server.gameServer.loggedOn()
        XCTAssertFalse(loggedOn)
        let ip = server.gameServer.getPublicIP()
        XCTAssertEqual(0, ip.ipv4Address)
        server.runCallbacks()

        // seems to cause "src/tier1/fileio.cpp (5164) : m_vecRegisteredWriters.Count() == 0" at exit.
        // definitely calling `SteamGameServer_Shutdown()`; weird
    }
}
