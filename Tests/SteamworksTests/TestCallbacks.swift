//
//  TestCallbacks.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import XCTest
@testable import Steamworks

/// Tests for callback data structure & locking implementation, not touching the steam api (except a harmless brush...)
class TestCallbacks: XCTestCase {
    /// store and dispatch callbacks (broadcast, permanent)
    func testCallbacks() {
        let api = SteamBaseAPI(steamPipe: HSteamPipe(-1))

        var counter = 0
        let callbackID = CallbackID(100)

        api.callbacks.add(callbackID: callbackID) { _ in counter += 1 }
        api.callbacks.add(callbackID: callbackID) { _ in counter += 1 }

        let raw = UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 1)
        defer { raw.deallocate() }

        api.callbacks.dispatch(callbackID: callbackID, rawData: raw)
        XCTAssertEqual(2, counter)
        api.callbacks.dispatch(callbackID: callbackID, rawData: raw)
        XCTAssertEqual(4, counter)
        api.callbacks.dispatch(callbackID: callbackID + 1, rawData: raw)
        XCTAssertEqual(4, counter)
    }

    /// register callback from callback
    func testReentrantCallbacks() {
        let api = SteamBaseAPI(steamPipe: HSteamPipe(-1))

        var counter = 0
        let callbackID = CallbackID(100)

        api.callbacks.add(callbackID: callbackID) { _ in
            api.callbacks.add(callbackID: callbackID) { _ in counter += 1 }
        }

        let raw = UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 1)
        defer { raw.deallocate() }

        api.callbacks.dispatch(callbackID: callbackID, rawData: raw)
        XCTAssertEqual(0, counter)
        api.callbacks.dispatch(callbackID: callbackID, rawData: raw)
        XCTAssertEqual(1, counter)
    }

    /// callresults - one-shot
    func testCallResults() {
        let system = SteamBaseAPI.CallResults.shared

        var counter = 0
        let callID = UInt64(22)

        system.add(callID: callID) { _ in counter += 1 }

        let raw = UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 1)
        defer { raw.deallocate() }

        system.dispatch(callID: callID, rawData: raw)
        XCTAssertEqual(1, counter)
        system.dispatch(callID: callID, rawData: raw)
        XCTAssertEqual(1, counter)
        system.dispatch(callID: callID + 1, rawData: raw)
        XCTAssertEqual(1, counter)
    }

    /// callresults - can schedule from callback
    func testReentrantCallResults() {
        let system = SteamBaseAPI.CallResults.shared

        var counter = 0
        let callID = UInt64(22)

        system.add(callID: callID) { _ in
            counter += 1
            system.add(callID: callID) { _ in counter += 1 }
        }

        let raw = UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 1)
        defer { raw.deallocate() }

        system.dispatch(callID: callID, rawData: raw)
        XCTAssertEqual(1, counter)
        system.dispatch(callID: callID, rawData: raw)
        XCTAssertEqual(2, counter)
        system.dispatch(callID: callID + 1, rawData: raw)
        XCTAssertEqual(2, counter)
    }

    /// callresults - immediate failures
    func testCallResultsFailures() {
        let system = SteamBaseAPI.CallResults.shared

        var callbackCalled = 0

        system.add(callID: 0) { param in
            XCTAssertNil(param)
            callbackCalled += 1
        }
        XCTAssertEqual(0, callbackCalled)
        system.dispatchFailures()
        XCTAssertEqual(1, callbackCalled)
        system.dispatchFailures()
        XCTAssertEqual(1, callbackCalled)
    }
}
