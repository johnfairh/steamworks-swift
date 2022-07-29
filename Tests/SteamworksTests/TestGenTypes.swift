//
//  TestTypes.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import XCTest
@testable import Steamworks

// Some quick tests of the more interesting type scaffolding

struct ETestEnum_t: RawRepresentable, Equatable {
    let rawValue: UInt32
    static let val1 = ETestEnum_t(rawValue: 1)
    static let val2 = ETestEnum_t(rawValue: 2)
}

enum TestEnum: UInt32 {
    case val1 = 1
    case val2 = 2
    case unrepresentedInSwift = 3
}

extension ETestEnum_t: RawConvertible { typealias From = TestEnum }
extension TestEnum: EnumWithUnrepresented { typealias From = ETestEnum_t }


public struct ESteamFlags: RawRepresentable {
    public let rawValue: UInt32
    public init(rawValue: UInt32) { self.rawValue = rawValue }
}

public struct SteamFlags: OptionSet {
    public let rawValue: UInt32
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    public static let noTrade = SteamFlags(rawValue: 1)
    public static let removed = SteamFlags(rawValue: 256)
    public static let consumed = SteamFlags(rawValue: 512)
}

// wtf swift insists on the `public` here...
extension SteamFlags: RawConvertible { public typealias From = ESteamFlags }


class TestTypes: XCTestCase {
    /// C enum (raw struct) <-> Swift 'real' enum with fabricated invalid fixedpoint
    func testEnumConversion() {
        XCTAssertEqual(.val1, TestEnum(ETestEnum_t.val1))
        XCTAssertEqual(ETestEnum_t.val1, ETestEnum_t(.val1))
        XCTAssertEqual(.val2, TestEnum(ETestEnum_t.val2))
        XCTAssertEqual(ETestEnum_t.val2, ETestEnum_t(.val2))
        XCTAssertEqual(.unrepresentedInSwift, TestEnum(ETestEnum_t(rawValue: 100)))
    }

    /// OptionSet self-inflicted misery
    func testOptionSetConversion() {
        let dumbVal = Int32(SteamFlags.removed.rawValue)
        XCTAssertEqual(.removed, SteamFlags(dumbVal))
        let mask: SteamFlags = [.noTrade, .consumed]
        XCTAssertEqual(Int32(mask), Int32(SteamFlags.noTrade.rawValue | SteamFlags.consumed.rawValue))
    }

    /// SteamStringArray horrors
    func testStringArray() throws {
        XCTAssertNil(StringArray([]).cStrings)

        let strings = ["one", "two", "three"]
        let ssa = StringArray(strings)
        var base = try XCTUnwrap(ssa.cStrings)
        var oStrings: [String] = []
        for _ in 0..<strings.count {
            oStrings.append(String(cString: base.pointee!))
            base += 1
        }
        XCTAssertNil(base.pointee)
        XCTAssertEqual(strings, oStrings)
    }
}
