//
//  IO.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

struct IO {
    let packageRootURL: URL
    let jsonURL: URL
    let outputDirURL: URL

    init(packageRootURL: URL) throws {
        self.packageRootURL = packageRootURL
        self.jsonURL = packageRootURL
            .appendingPathComponent("sdk")
            .appendingPathComponent("public")
            .appendingPathComponent("steam")
            .appendingPathComponent("steam_api.json")
        self.outputDirURL = packageRootURL
            .appendingPathComponent("Sources")
            .appendingPathComponent("Steamworks")
            .appendingPathComponent("Generated")

        guard FileManager.default.fileExists(atPath: jsonURL.path) else {
            throw Failed("JSON file missing at :\(jsonURL.path)")
        }
        var isDir = ObjCBool(false)
        guard FileManager.default.fileExists(atPath: outputDirURL.path, isDirectory: &isDir), isDir.boolValue else {
            throw Failed("Output directory missing at: \(outputDirURL.path)")
        }
    }
}
