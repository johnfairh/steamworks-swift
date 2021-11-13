//
//  TestTypes.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
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

class TestTypes: XCTestCase {
    /// C enum (raw struct) <-> Swift 'real' enum with fabricated invalid fixedpoint
    func testEnumConversion() {
        XCTAssertEqual(.val1, TestEnum(ETestEnum_t.val1))
        XCTAssertEqual(ETestEnum_t.val1, ETestEnum_t(.val1))
        XCTAssertEqual(.val2, TestEnum(ETestEnum_t.val2))
        XCTAssertEqual(ETestEnum_t.val2, ETestEnum_t(.val2))
        XCTAssertEqual(.unrepresentedInSwift, TestEnum(ETestEnum_t(rawValue: 100)))
    }
}
