//
//  TestGenVersion.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

@testable import LibGenerate
import XCTest

/// Readme.txt version parsing ... thought there was going to be more here!
///
class TestVersion: XCTestCase {
    let badReadme = """
                    I am not a readme
                    """

    let doubleReadme = """

                       v1.2 Some words

                       v2.3 A word
                       """
    func testBadVersion() throws {
        let harness = try Harness()

        XCTAssertThrowsError(try harness.generator.version.parseVersion(readme: badReadme))
    }

    func testDoubleVersion() throws {
        let harness = try Harness()

        let version = try harness.generator.version.parseVersion(readme: doubleReadme)
        XCTAssertEqual("1.2", version)
    }
}
