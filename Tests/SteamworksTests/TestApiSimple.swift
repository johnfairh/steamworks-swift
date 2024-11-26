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

    /// CallReturn -- async callbacks with async-await
    func testCallReturnAsync() async throws {
        let steam = try await TestClient.getAsyncClient()
        let steamID = steam.user.getSteamID()
        XCTAssertTrue(steamID.isValid)
        print("SteamID = \(steamID)")

        await withTaskGroup(of: Void.self) { group in
            group.addTask { @Sendable @MainActor in
                MainActor.assertIsolated()

                if let res = await steam.friends.getFollowerCount(steamID: steamID),
                   res.result == .ok {
                    MainActor.assertIsolated()
                    print("GetFollowerCount: \(res.count) followers")
                } else {
                    XCTFail("GetFollowerCount async failed in some way.")
                }

                await TestClient.stopRunningFramesAsync()
            }

            group.addTask {
                // This ends up running frames on the main actor
                await TestClient.runFramesAsync()
            }

            await group.waitForAll()
        }
    }

    /// Callbacks - pure async notifications
    func testCallback() async throws {
        let steam = try TestClient.getClient()
        nonisolated(unsafe) var count = 0

        steam.onGetVideoURLResult { gvMsg in
            XCTAssertNotNil(gvMsg)
            guard count == 0 else {
                return
            }
            count = 1
            // this is supposed to fail, point is the callback...
            XCTAssertEqual(gvMsg.result, .invalidParam)
            print("Video URL received: \(gvMsg)")

            TestClient.stopRunningFrames()
        }

        steam.video.getVideoURL(videoAppID: .spaceWar)

        TestClient.runFrames() // until callback
        print("done")
    }

    /// Version of the same code using async-await
    /// Be very careful to call Steam on the main thread - this is where callbacks are delivered
    /// by the polling in AsyncClient.  The AsyncStream of stats received happens on whatever
    /// thread you want -- but typically I think you'd constrain that to be MainActor as well to make
    /// it easy to call back into steam or other parts of the system.
    func testCallbackAsync() async throws {
        let steam = try await TestClient.getAsyncClient()

        await withTaskGroup(of: Void.self) { group in
            group.addTask {
                // Probably not on main actor here, but that's fine, these guys
                // don't actually call C Steamworks - they just register a function
                // on the Swift side to get called later by the frameloop.
                for await gvMsg in steam.getVideoURLResult {
                    // On same executor as above, probably not main, can't call steam
                    print("VideoURL rceived: \(gvMsg)")
                    await TestClient.stopRunningFramesAsync()
                    break
                }
            }

            group.addTask { @MainActor in
                MainActor.assertIsolated()
                steam.video.getVideoURL(videoAppID: .spaceWar)
            }

            group.addTask {
                // This ends up running frames on the main actor
                await TestClient.runFramesAsync()
            }
        }
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
        steam.http.sendHTTPRequest(request: req) { [weak steam] done in
            guard let steam else { return }
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
            let body = String(decoding: data + [0], as: UTF8.self)
            XCTAssertTrue(body.contains("<title>Example Domain</title>"))
        }

        TestClient.runFrames() // until req done
    }

    /// Inventory bits - for some kind of API generation
    func testInventory() throws {
        let steam = try TestClient.getClient()

        steam.onSteamInventoryResultReady { [weak steam] r in
            guard let steam else { return }

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
            XCTAssertTrue(items.count >= 1)
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
