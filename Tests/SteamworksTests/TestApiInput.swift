//
//  TestApiInput.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks
import XCTest

/// SteamInput
class TestApiInput: XCTestCase {
    func testInput() throws {
        let steam = try TestClient.getClient()

        let inputRc = steam.input.initialize(explicitlyCallRunFrame: false)
        XCTAssertTrue(inputRc)
        // some hint that we need to run the frameloop to get steaminput working
        TestClient.runFrames(count: 10)

        // can't get this to return anything -- either here or in spacewar, tried
        // - ps5 bluetooth
        // - ps5 wired
        // - xbox with weird drivers wired
        // all appear in steam fine, work fine in steam itself, but just nothing here
        let (_, controllerHandles) = steam.input.getConnectedControllers()
        print("Found \(controllerHandles.count) controllers")

        // can make this return non-zero with wired xbox controller, but doesn't work
        let gamepad0 = steam.input.getControllerForGamepadIndex(index: 0)
        print("Found gamepad0 device \(gamepad0)")

        if controllerHandles.count == 0 && gamepad0 == 0 {
            print("No controller connected, just stop")
            steam.input.shutdown()
            throw XCTSkip("No controller connected, just stop")
        }
        let controller = controllerHandles.first ?? gamepad0

        steam.input.triggerVibration(handle: controller, leftSpeed: 1000, rightSpeed: 1000)
        steam.input.shutdown()
    }
}
