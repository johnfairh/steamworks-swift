//
//  TestNames.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@testable import LibGenerate
import XCTest

// Test (describe) the Steamworks -> Swift naming rules
// Individual special cases are just in code and observed by generation.
class TestNames: XCTestCase {
    func testTypenames() {
        let cases = [
            ("Type", "Type"),
            ("TypeCamel", "TypeCamel"),
            ("Type_t", "Type"), // strip trailing _t
            ("Type_t *", "Type *"),
            ("EType", "Type"), // strip leading E from enums
            ("EType_t", "Type"),
            ("ErrorType", "ErrorType"), // don't strip leading E if it's part of a word...
            ("ISteamFriends", "SteamFriends"),
            ("CSteamID", "SteamID"),
            ("uint64_steamid", "SteamID"),
            ("EResult", "SteamResult"),
            ("Fred [20]", "[Fred]"),
            ("char [10]", "String"),
            ("uint8 [5]", "[UInt8]"),
            ("SomeId", "SomeID")
        ]
        cases.forEach { steam, swift in
            XCTAssertEqual(steam.asSwiftTypeName, swift)
        }
    }

    func testIdentifiers() {
        let cases = [
            ("flat", "flat"),
            ("Upper", "upper"),
            ("case", "`case`"), // escape swift keywords
            ("ACRONYM", "acronym"), // all caps -> all lc
            ("ACRONYMAnd", "acronymAnd"), // all caps leading into a word
            ("PS4", "ps4"), // all caps -> number
            ("IPv4", "ipv4"), // awful special case -- in a previous product we always wrote "ip4" and "ip6" in code to avoid this issue!
            ("IPv6", "ipv6"),
            ("Abc_Def", "abcDef"),
            ("_Weird", "_weird"),
        ]

        cases.forEach { steam, swift in
            XCTAssertEqual(steam.asSwiftIdentifier, swift)
        }
    }

    func testParameters() {
        let cases = [
            ("steamID", "steamID"), // preserve lone steamID
            ("steamidUser", "user"), // but strip if a prefix however spelt ..
            ("pOutSteamIDUsers", "users"), // ... even wildly
            ("pszInput", "input"), // strip hungarian
            ("aProtocol", "`protocol`"), // respect swift keywords
            ("iEntry", "entryIndex"), // i does not mean integer
            ("iEntryIndex", "entryIndex"), // people are thoughtless
            ("cubData", "dataSize"), // "count of unsigned bytes" ??
            ("wrong", "wrong"), // there's always one
            ("csecsStart", "csecsStart"), // special prefix
        ]

        cases.forEach { steam, swift in
            XCTAssertEqual(steam.asSwiftParameterName, swift)
        }
    }

    /// This is for the nicely-formatted style in the json...
    func testCArray() throws {
        XCTAssertNil("int".parseCArray)
        XCTAssertNil("int []".parseCArray)
        let unwrapped = try XCTUnwrap("int [10]".parseCArray)
        XCTAssertEqual("int", unwrapped.0)
        XCTAssertEqual(10, unwrapped.1)
    }
}
