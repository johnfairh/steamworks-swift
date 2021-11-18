//
//  IO.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

final class IO {
    let sdkURL: URL
    let swiftOutputDirURL: URL
    let cOutputDirURL: URL
    let resources: Bundle

    init(sdkURL: URL, swiftOutputDirURL: URL, cOutputDirURL: URL) throws {
        self.sdkURL = sdkURL
        self.swiftOutputDirURL = swiftOutputDirURL
        self.cOutputDirURL = cOutputDirURL
        #if SWIFT_PACKAGE
        self.resources = Bundle.module
        #else
        /* Xcode testing mode */
        let sourcesURL = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        self.resources = Bundle(url: sourcesURL.appendingPathComponent("Resources"))!
        #endif

        guard FileManager.default.fileExists(atPath: jsonURL.path) else {
            throw Failed("JSON file missing at \(jsonURL.path)")
        }
        try [swiftOutputDirURL, cOutputDirURL].forEach { url in
            var isDir = ObjCBool(false)
            guard FileManager.default.fileExists(atPath: url.path, isDirectory: &isDir), isDir.boolValue else {
                throw Failed("Output directory missing at \(url.path)")
            }
        }
    }

    var jsonURL: URL {
        sdkURL.appendingPathComponent("public")
            .appendingPathComponent("steam")
            .appendingPathComponent("steam_api.json")
    }

    var readmeURL: URL {
        sdkURL.appendingPathComponent("Readme.txt")
    }

    // Text files are normal windows-format that swift + foundation utterly
    // fail to figure out how to manage without explicit instructions.

    func loadReadme() throws -> String {
        try String(contentsOf: readmeURL, encoding: .windowsCP1252)
    }

    func loadSdkJson() throws -> Data {
        try Data(contentsOf: jsonURL)
    }

    static let PATCH_JSON_PATH_VAR = "PATCH_JSON_PATH"

    private var patchJsonUrl: URL {
        get throws {
            if let override = ProcessInfo.processInfo.environment[Self.PATCH_JSON_PATH_VAR] {
                return URL(fileURLWithPath: override)
            }
            guard let url = resources.url(forResource: "steam_api_patch", withExtension: "json") else {
                throw Failed("Missing patch json from resource bundle \(resources)")
            }
            return url
        }
    }

    func loadPatchJson() throws -> Data {
        try Data(contentsOf: patchJsonUrl)
    }

    var fileHeaderLicense: String {
        """
        //  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
        //
        //  This file is generated code: any edits will be overwritten.
        """
    }

    func swiftFileHeader(fileName: String) -> String {
        """
        //
        //  \(fileName)
        //  Steamworks
        //
        \(fileHeaderLicense)

        @_implementationOnly import CSteamworks
        """
    }

    func cFileHeader(fileName: String) -> String {
        """
        //
        //  \(fileName)
        //  CSteamworks
        //
        \(fileHeaderLicense)

        """
    }

    func write(fileName: String, contents: String) throws {
        let baseURL: URL
        let header: String
        if fileName.hasSuffix(".swift") {
            baseURL = swiftOutputDirURL
            header = swiftFileHeader(fileName: fileName)
        } else if fileName.hasSuffix(".h") {
            baseURL = cOutputDirURL
            header = cFileHeader(fileName: fileName)
        } else {
            preconditionFailure("Bad output filename \(fileName)")
        }

        let url = baseURL.appendingPathComponent(fileName)
        let fullContents = header + "\n\n" + contents + "\n"

        if let existing = try? String(contentsOf: url) {
            if existing == fullContents {
                print("\(fileName): unchanged")
                return
            }
        }

        try fullContents.write(to: url, atomically: false, encoding: .utf8)
        print("\(fileName): updated")
    }
}
