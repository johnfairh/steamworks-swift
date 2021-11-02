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

/// Some kind of end-to-end tests
class TestGenerate: XCTestCase {
    var fixturesURL: URL {
        URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("Fixtures")
    }

    var fixturesSdkURL: URL {
        fixturesURL.appendingPathComponent("sdk")
    }

    var fixturesExpectedURL: URL {
        fixturesURL.appendingPathComponent("Expected")
    }

    // Run everything against the fixture stub / interesting data
    func testFixtures() throws {
        let outputDirURL = try! FileManager.default.createTemporaryDirectory()
        defer { try? FileManager.default.removeItem(at: outputDirURL) }

        let generator = try Generator(sdkURL: fixturesSdkURL, outputDirURL: outputDirURL)

        try generator.generate()

        let outputFileNames = outputDirURL.fileNames
        let expectedFileNames = fixturesExpectedURL.fileNames

        guard !replaceFixtures else {
            try outputFileNames.forEach { fileName in
                let fromURL = outputDirURL.appendingPathComponent(fileName)
                let toURL = fixturesExpectedURL.appendingPathComponent(fileName)
                try FileManager.default.copyItem(at: fromURL, to: toURL)
            }
            return
        }

        try expectedFileNames.forEach { fileName in
            if outputFileNames.contains(fileName) {
                try compare(fixturesExpectedURL.appendingPathComponent(fileName),
                            outputDirURL.appendingPathComponent(fileName))
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
