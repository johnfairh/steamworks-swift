//
//  TestApiSimple.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks
import SteamworksHelpers
import XCTest

class TestApiSimple: XCTestCase {
    /// Synchronous queries to get something out of Steam
    func testSyncQueries() throws {
        let steam = try TestClient.getClient()
        let name = steam.friends.getPersonaName()
        print("name = \(name)")
        let state = steam.friends.getPersonaState()
        print("state = \(state)")
        let friendCount = steam.friends.getFriendCount(friendFlags: .all)
        print("friendCount = \(friendCount)")
        let nickname = steam.friends.getPlayerNickname(player: SteamID(22))
        XCTAssertNil(nickname)
    }

    /// CallReturn -- async callbacks
    func testCallReturn() throws {
        let steam = try TestClient.getClient()
        let steamID = steam.user.getSteamID()
        XCTAssertTrue(steamID.isValid)
        print("SteamID = \(steamID)")

        steam.friends.getFollowerCount(steamID: steamID) { res in
            defer { TestClient.stopRunningFrames() }

            guard let res = res else {
                XCTFail("GetFollowerCount transport failure.")
                return
            }

            guard res.result == .ok else {
                XCTFail("GetFollowerCount failed: \(res.result)")
                return
            }

            print("GetFollowerCount: \(res.count) followers")
        }

        TestClient.runFrames()
    }

    /// Callbacks - pure async notifications
    func testCallback() throws {
        let steam = try TestClient.getClient()
        steam.onUserStatsReceived { statsMsg in
            XCTAssertNotNil(statsMsg)
            print("User stats received: \(statsMsg)")

            TestClient.stopRunningFrames()
        }

        let rc = steam.userStats.requestCurrentStats()
        guard rc else {
            XCTFail("RequestCurrentStats failed")
            return
        }

        TestClient.runFrames() // until callback
    }

    /// Simple string stuff
    func testStringFilter() throws {
        let steam = try TestClient.getClient()
        let steamID = steam.user.getSteamID()
        let str = "Hello world"

        let rc = steam.utils.initFilterText()
        guard rc else {
            XCTFail("InitFilterText")
            return
        }
        let (count, filteredStr) = steam.utils.filterText(context: .chat, steamID: steamID, inputMessage: str)
        XCTAssertEqual(0, count)
        XCTAssertEqual(filteredStr, str)
    }

    /// HTTP
    func testHTTP() throws {
        let steam = try TestClient.getClient()
        let req = steam.http.createHTTPRequest(httpRequestMethod: .get, absoluteURL: "http://example.com")
        steam.http.sendHTTPRequest(request: req) { done in
            defer {
                steam.http.releaseHTTPRequest(request: req)
                TestClient.stopRunningFrames()
            }

            guard let done else {
                XCTFail("HTTP response failure, steam failure")
                return
            }
            guard done.requestSuccessful else {
                XCTFail("HTTP response failure, network failure: \(done)")
                return
            }

            guard let body = steam.http.getHTTPResponseBodyData(request: req) else {
                XCTFail("Can't extract HTTP response body")
                return
            }
            XCTAssertTrue(body.contains("<title>Example Domain</title>"))
        }

        TestClient.runFrames() // until req done
    }
}
