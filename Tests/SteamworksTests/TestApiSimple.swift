//
//  TestApiSimple.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
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

            let (rc, data) = steam.http.getHTTPResponseBodyData(request: req)
            XCTAssertTrue(rc)
            let body = String(cString: data + [0])
            XCTAssertTrue(body.contains("<title>Example Domain</title>"))
        }

        TestClient.runFrames() // until req done
    }

    /// Inventory bits - for some kind of API generation
    func testInventory() throws {
        let steam = try TestClient.getClient()

        steam.onSteamInventoryResultReady { r in
            print("InventoryResultReady: \(r.result)")
            guard r.result == .ok else {
                return // we wait
            }
            defer {
                steam.inventory.destroyResult(handle: r.handle)
                TestClient.stopRunningFrames()
            }
            let (rc, items) = steam.inventory.getResultItems(handle: r.handle)
            XCTAssertTrue(rc)
            // depends whether the active steam ID has the spacewar trading card
            print("GetResultItems rc=\(rc) itemCount=\(items.count)")
            if items.isEmpty {
                print("No inventory, skipping rest of test")
                return
            }
            XCTAssertEqual(1, items.count)
            let (rc2, properties) = steam.inventory.getResultItemProperty(handle: r.handle, itemIndex: 0, propertyName: nil)
            XCTAssertTrue(rc2)
            let props = Set(properties.split(separator: ","))
            XCTAssertEqual(10, props.count)
            XCTAssertTrue(props.contains("accountid"))
            let (rc3, accountIdStr) = steam.inventory.getResultItemProperty(handle: r.handle, itemIndex: 0, propertyName: "accountid")
            XCTAssertTrue(rc3)
            XCTAssertEqual(steam.user.getSteamID(), SteamID(UInt64(accountIdStr)!))
        }

        let (rc, _) = steam.inventory.getAllItems()
        guard rc else {
            XCTFail("Inventory.GetAllItems failed")
            return
        }

        TestClient.runFrames() // until IRR happens
    }
}
