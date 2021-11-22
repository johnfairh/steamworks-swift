//
//  TestSteamID.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import XCTest
@testable import Steamworks

/// Very basic tests of the SteamID cloned type
class TestSteamID: XCTestCase {
    func check(_ id: SteamID, _ expected: (UInt32, Int, Universe, AccountType)) {
        XCTAssertEqual(expected.0, id.accountID.value)
        XCTAssertEqual(expected.1, Int(id.accountInstance))
        XCTAssertEqual(expected.2, id.universe)
        XCTAssertEqual(expected.3, id.accountType)
    }

    func testBitFields() {
        var id = SteamID()
        XCTAssertEqual(0, id.asUInt64)
        XCTAssertFalse(id.isValid)
        check(id, (0, 0, .invalid, .invalid))
        XCTAssertEqual(.nil, id)

        id.accountID = AccountID(UInt32.max)
        XCTAssertFalse(id.isValid)
        check(id, (UInt32.max, 0, .invalid, .invalid))
        id.accountID = AccountID(0)
        id.accountInstance = 0xfffff
        XCTAssertFalse(id.isValid)
        check(id, (0, 0xfffff, .invalid, .invalid))
        id.accountInstance = 0
        id.universe = .dev
        XCTAssertFalse(id.isValid)
        check(id, (0, 0, .dev, .invalid))
        id.universe = .invalid
        id.accountType = .consoleUser
        XCTAssertFalse(id.isValid)
        check(id, (0, 0, .invalid, .consoleUser))
        id.accountType = .invalid
    }

    func testInvalidPatterns() {
        let goodID = SteamID(accountID: AccountID(12345), universe: .public, accountType: .individual)
        XCTAssertTrue(goodID.isValid)
        XCTAssertEqual(1, goodID.accountInstance)
        XCTAssertTrue(goodID.isIndividualAccount)
        let badUniID = SteamID(goodID.asUInt64 | UInt64(0xff) << 56)
        XCTAssertEqual(.unrepresentedInSwift, badUniID.universe)
        XCTAssertFalse(badUniID.isValid)
        let badTypID = SteamID(goodID.asUInt64 | UInt64(0xf) << 52)
        XCTAssertEqual(.public, badTypID.universe)
        XCTAssertEqual(.unrepresentedInSwift, badTypID.accountType)
        XCTAssertFalse(badTypID.isValid)
    }

    func testComparisons() {
        var goodID = SteamID(accountID: AccountID(12345), universe: .public, accountType: .individual)
        XCTAssertEqual(1, goodID.accountInstance)
        let staticKeyID = SteamID(goodID.staticAccountKey)
        XCTAssertEqual(0, staticKeyID.accountInstance)
        goodID.accountInstance = 0
        XCTAssertEqual(staticKeyID, goodID)
    }
}
