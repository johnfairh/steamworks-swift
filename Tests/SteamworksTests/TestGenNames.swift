//
//  TestGenNames.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@testable import LibGenerate
import XCTest

// Test (describe) the Steamworks -> Swift naming rules
// Individual special cases are just in code and observed by generation.
//
// (this is very out of date, really relying on the SDK translation stability...)
class TestNames: XCTestCase {
    func testTypenames() {
        let cases: [(SteamType, SwiftType)] = [
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
            ("EResult", "Result"),
            ("Fred [20]", "[Fred]"),
            ("char [10]", "String"),
            ("uint8 [5]", "[UInt8]"),
            ("SomeId", "SomeID")
        ]
        cases.forEach { steam, swift in
            XCTAssertEqual(steam.swiftType, swift)
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
            ("BIsReady", "isReady")
        ]

        cases.forEach { steam, swift in
            XCTAssertEqual(SteamName(steam).swiftName, SwiftExpr(swift))
        }
    }

    func testParameters() {
        let cases: [(SteamHungarianName, SwiftExpr)] = [
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
            XCTAssertEqual(steam.swiftParameterName, swift)
        }
    }

    /// This is for the nicely-formatted style in the json...
    func testCArray() throws {
        XCTAssertNil(SteamType("int").parseArray)
        XCTAssertNil(SteamType("int []").parseArray)
        let unwrapped = try XCTUnwrap(SteamType("int [10]").parseArray)
        XCTAssertEqual("int", unwrapped.0)
        XCTAssertEqual(10, unwrapped.1)
    }

    /// For "const" value parsing
    func testCValue() {
        let cases = [
            ("- 2", "-2"),
            ("~ 23ull", "~23"),
            ("(Type) 22", "22")
        ]

        cases.forEach { steam, swift in
            XCTAssertEqual(SteamConstantExpr(steam).swiftExpr, SwiftExpr(swift))
        }
    }

    func testConstantNames() {
        let cases = [
            ("I_AM_CONSTANT", "I_AM_CONSTANT"),
            ("k_nConstantValue", "constantValue")
        ]

        cases.forEach { steam, swift in
            XCTAssertEqual(SteamHungarianName(steam).swiftName, SwiftExpr(swift))
        }
    }

    func testCasts() {
        XCTAssertEqual("expr", SwiftExpr("expr").asCast(to: nil).expr)
        XCTAssertEqual("T(expr)", SwiftExpr("expr").asCast(to: SwiftType("T")).expr)
        XCTAssertEqual("expr.map { T($0) }", SwiftExpr("expr").asCast(to: SwiftType("T?")).expr)
    }
}
