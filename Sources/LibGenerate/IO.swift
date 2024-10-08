//
//  IO.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation

final class IO: Sendable {
    let redistSdkURL: URL
    let swiftOutputDirURL: URL
    let cOutputDirURL: URL
    let docStructureOutputDirURL: URL
    let doccCollectionOutputDirURL: URL
    let resources: Bundle

    init(redistSdkURL: URL, swiftOutputDirURL: URL, cOutputDirURL: URL, docStructureOutputDirURL: URL, doccCollectionOutputDirURL: URL) throws {
        self.redistSdkURL = redistSdkURL
        self.swiftOutputDirURL = swiftOutputDirURL
        self.cOutputDirURL = cOutputDirURL
        self.docStructureOutputDirURL = docStructureOutputDirURL
        self.doccCollectionOutputDirURL = doccCollectionOutputDirURL
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
        try [swiftOutputDirURL, cOutputDirURL, docStructureOutputDirURL].forEach { url in
            var isDir = ObjCBool(false)
            guard FileManager.default.fileExists(atPath: url.path, isDirectory: &isDir), isDir.boolValue else {
                throw Failed("Output directory missing at \(url.path)")
            }
        }
    }

    var includeURL: URL {
        redistSdkURL.appendingPathComponent("include")
            .appendingPathComponent("steam")
    }

    var jsonURL: URL {
        includeURL.appendingPathComponent("steam_api.json")
    }

    var readmeURL: URL {
        redistSdkURL.appendingPathComponent("Readme.txt")
    }

    // Text files are normal windows-format that swift + foundation utterly
    // fail to figure out how to manage without explicit instructions.

    func loadReadme() throws -> String {
        try String(contentsOf: readmeURL, encoding: .windowsCP1252)
    }

    func loadSDKJSON() throws -> Data {
        try Data(contentsOf: jsonURL)
    }

    // "Patch" is our format, contains additional annotations to actual SDK
    // definitions to make them generatable.

    static let PATCH_YAML_PATH_VAR = "PATCH_YAML_PATH"

    private var patchYAMLURL: URL {
        get throws {
            try resolve(resource: "steam_api_patch", extnsion: "yaml", env: Self.PATCH_YAML_PATH_VAR)
        }
    }

    func loadPatchYAML() throws -> Data {
        try Data(contentsOf: patchYAMLURL)
    }

    // "Extra" is the same format as the SDK JSON, describing stuff that is
    // omitted from the SDK JSON - the things here get added to the SDK JSON
    // before the Patch is applied.

    static let SDK_EXTRA_JSON_PATH_VAR = "SDK_EXTRA_JSON_PATH"

    private var sdkExtraJSONPatchURL: URL {
        get throws {
            try resolve(resource: "steam_api_extra", extnsion: "json", env: Self.SDK_EXTRA_JSON_PATH_VAR)
        }
    }

    func loadSDKExtraJSON() throws -> Data {
        try Data(contentsOf: sdkExtraJSONPatchURL)
    }

    private func resolve(resource: String, extnsion: String, env: String) throws -> URL {
        if let override = ProcessInfo.processInfo.environment[env] {
            return URL(fileURLWithPath: override)
        }
        guard let url = resources.url(forResource: resource, withExtension: extnsion) else {
            throw Failed("Missing file '\(resource).\(extnsion)' from resource bundle \(resources)")
        }
        return url
    }

    func checkSDKVersion(_ actual: String) {
        func warn(_ message: String) {
            print("\(Colors.red)\(message)\(Colors.reset)")
        }
        guard let url = resources.url(forResource: "EXPECTED_SDK", withExtension: nil),
              let expected = try? String(contentsOf: url, encoding: .utf8).trimmingCharacters(in: .newlines) else {
            warn("Can't resolve EXPECTED_SDK")
            return
        }
        if actual != expected {
            warn("Expected Steamworks SDK version \(expected) but is \(actual)")
        }
    }

    var fileHeaderLicense: String {
        """
        //  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
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

        internal import CSteamworks
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
        try write(baseURL: baseURL, fileName: fileName, header: header, contents: contents)
    }

    func writeDocStructure(fileName: String, contents: String) throws {
        try write(baseURL: docStructureOutputDirURL, fileName: fileName, contents: contents)
    }

    func writeDoccCollection(fileName: String, contents: String) throws {
        try write(baseURL: doccCollectionOutputDirURL, fileName: fileName, contents: contents)
    }

    private func write(baseURL: URL, fileName: String, header: String? = nil, contents: String) throws {
        let url = baseURL.appendingPathComponent(fileName)
        let fullContents = (header.map { $0 + "\n\n" } ?? "") + contents + "\n"

        if let existing = try? String(contentsOf: url, encoding: .utf8) {
            if existing == fullContents {
                print("\(Colors.green)\(fileName): unchanged\(Colors.reset)")
                return
            }
        }

        try fullContents.write(to: url, atomically: false, encoding: .utf8)
        print("\(Colors.blue)\(fileName): updated\(Colors.reset)")
    }
}

private struct Colors {
    static let reset = "\u{001B}[0;0m"
    static let black = "\u{001B}[0;30m"
    static let red = "\u{001B}[0;31m"
    static let green = "\u{001B}[0;32m"
    static let yellow = "\u{001B}[0;33m"
    static let blue = "\u{001B}[0;34m"
    static let magenta = "\u{001B}[0;35m"
    static let cyan = "\u{001B}[0;36m"
    static let white = "\u{001B}[0;37m"
}
