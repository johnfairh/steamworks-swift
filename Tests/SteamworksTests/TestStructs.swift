//
//  TestStructs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

import XCTest
@testable import Steamworks

/// Very basic tests of the manual wrapper structs
class TestStructs: XCTestCase {
    func testIPv4() {
        let addr = SteamIPAddress(ipv4Address: 0x01020304)
        XCTAssertTrue(addr.isSet)
        XCTAssertEqual(.ipv4, addr.type)
        XCTAssertEqual(0x01020304, addr.ipv4Address)
        let addr2 = SteamIPAddress(ipv4Address: 0x01020304)
        XCTAssertEqual(addr, addr2)
    }

    func testIPv6() {
        let ip6: [UInt8] = [1, 2, 5, 6, 0, 0, 12, 59, 250, 0, 0, 0, 0, 0, 0, 144]
        let addr = SteamIPAddress(ipv6Address: ip6)
        XCTAssertTrue(addr.isSet)
        XCTAssertEqual(.ipv6, addr.type)
        XCTAssertEqual(ip6, addr.ipv6Address)
        let addr2 = SteamIPAddress(ipv6Address: ip6)
        XCTAssertEqual(addr, addr2)
    }

    func testSpecial() {
        let any4 = SteamIPAddress.ipv4Any
        let any6 = SteamIPAddress.ipv6Any
        XCTAssertFalse(any4.isSet)
        XCTAssertFalse(any6.isSet)
        XCTAssertNotEqual(any4, any6)
        XCTAssertEqual(0, any4.ipv4Address)
        XCTAssertEqual(Array<UInt8>(repeating: 0, count: 16), any6.ipv6Address)
    }
}
