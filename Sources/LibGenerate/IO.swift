//
//  IO.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

final class IO {
    let sdkURL: URL
    let outputDirURL: URL
    let resources: Bundle

    init(sdkURL: URL, outputDirURL: URL) throws {
        self.sdkURL = sdkURL
        self.outputDirURL = outputDirURL
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
        var isDir = ObjCBool(false)
        guard FileManager.default.fileExists(atPath: outputDirURL.path, isDirectory: &isDir), isDir.boolValue else {
            throw Failed("Output directory missing at \(outputDirURL.path)")
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

    func loadPatchJson() throws -> Data {
        guard let url = resources.url(forResource: "steam_api_patch", withExtension: "json") else {
            throw Failed("Missing patch json from resource bundle \(resources)")
        }
        return try Data(contentsOf: url)
    }

    func fileHeader(fileName: String, moduleName: String = "Steamworks") -> String {
        """
        //
        //  \(fileName)
        //  \(moduleName)
        //
        //  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
        //
        //  This file is generated code: any edits will be overwritten.

        @_implementationOnly import CSteamworks
        """
    }

    func write(fileName: String, contents: String) throws {
        precondition(fileName.hasSuffix(".swift"))

        let url = outputDirURL.appendingPathComponent(fileName)
        let fullContents = fileHeader(fileName: fileName) + "\n\n" + contents + "\n"

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
