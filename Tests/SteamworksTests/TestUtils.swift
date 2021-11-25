//
//  TestUtils.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation
import XCTest
@testable import LibGenerate

extension FileManager {
    /// Create a new empty temporary directory.  Caller must delete.
    func createTemporaryDirectory(inDirectory directory: URL? = nil, name: String? = nil) throws -> URL {
        let directoryName = name ?? UUID().uuidString
        let parentDirectoryURL = directory ?? temporaryDirectory
        let directoryURL = parentDirectoryURL.appendingPathComponent(directoryName)
        try createDirectory(at: directoryURL, withIntermediateDirectories: false)
        return directoryURL
    }

    /// Get a new temporary filename.  Caller must delete.
    func temporaryFileURL(inDirectory directory: URL? = nil) -> URL {
        let filename     = UUID().uuidString
        let directoryURL = directory ?? temporaryDirectory
        return directoryURL.appendingPathComponent(filename)
    }

    /// A file URL for the current directory
    var currentDirectory: URL {
        URL(fileURLWithPath: currentDirectoryPath)
    }
}

extension XCTestCase {
    static var fixturesURL: URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .appendingPathComponent("Fixtures")
    }

    static var fixturesSdkURL: URL {
        fixturesURL.appendingPathComponent("sdk")
    }

    static var patchJsonURL: URL {
        fixturesURL.appendingPathComponent("steam_api_patch.json")
    }

    static var sdkExtraJSONURL: URL {
        fixturesURL.appendingPathComponent("steam_api_extra.json")
    }

    class Harness {
        let swiftOutputDirURL: URL
        let cOutputDirURL: URL
        let generator: Generator

        init() throws {
            setenv(IO.PATCH_JSON_PATH_VAR, patchJsonURL.path, 1)
            setenv(IO.SDK_EXTRA_JSON_PATH_VAR, sdkExtraJSONURL.path, 1)
            swiftOutputDirURL = try! FileManager.default.createTemporaryDirectory()
            cOutputDirURL = try! FileManager.default.createTemporaryDirectory()
            generator = try Generator(sdkURL: fixturesSdkURL,
                                      swiftOutputDirURL: swiftOutputDirURL,
                                      cOutputDirURL: cOutputDirURL)
        }

        deinit {
            try? FileManager.default.removeItem(at: swiftOutputDirURL)
            try? FileManager.default.removeItem(at: cOutputDirURL)
            unsetenv(IO.PATCH_JSON_PATH_VAR)
            unsetenv(IO.SDK_EXTRA_JSON_PATH_VAR)
        }
    }
}
