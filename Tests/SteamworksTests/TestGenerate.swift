//
//  TestGenerate.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import LibGenerate
import XCTest

let replaceFixtures = false
//let replaceFixtures = true

/// End-to-end generation from interesting stub data
class TestGenerate: XCTestCase {
    var fixturesExpectedURL: URL {
        Self.fixturesURL.appendingPathComponent("Expected")
    }

    // Run everything against the fixture stub / interesting data
    func testFixtures() throws {
        let harness = try Harness()
        try harness.generator.generate()

        let outputFileNames = harness.outputDirURL.fileNames
        let expectedFileNames = fixturesExpectedURL.fileNames

        guard !replaceFixtures else {
            try outputFileNames.forEach { fileName in
                let fromURL = harness.outputDirURL.appendingPathComponent(fileName)
                let toURL = fixturesExpectedURL.appendingPathComponent(fileName)
                try FileManager.default.removeItem(at: toURL)
                try FileManager.default.copyItem(at: fromURL, to: toURL)
            }
            return
        }

        try expectedFileNames.forEach { fileName in
            if outputFileNames.contains(fileName) {
                try compare(fixturesExpectedURL.appendingPathComponent(fileName),
                            harness.outputDirURL.appendingPathComponent(fileName))
            } else {
                XCTFail("Missing output file \(fileName)")
            }
        }
        let additional = outputFileNames.subtracting(expectedFileNames)
        if !additional.isEmpty {
            XCTFail("Unexpected files created: \(additional)")
        }
    }

    func compare(_ expected: URL, _ actual: URL) throws {
        let expectedContent = try String(contentsOf: expected)
        let actualContent = try String(contentsOf: actual)
        if expectedContent != actualContent {
            XCTFail("Content mismatch for \(expected.lastPathComponent)")
        }
    }
}

extension URL {
    var fileNames: Set<String> {
        Set(
            try! FileManager.default
            .contentsOfDirectory(at: self,includingPropertiesForKeys: nil)
            .map { $0.lastPathComponent }
            .sorted()
        )
    }
}
