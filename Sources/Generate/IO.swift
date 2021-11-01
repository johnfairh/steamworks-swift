//
//  IO.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

final class IO {
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

    var sdkURL: URL {
        packageRootURL.appendingPathComponent("sdk")
    }

    var readmeURL: URL {
        sdkURL.appendingPathComponent("Readme.txt")
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
        """
    }

    func write(fileName: String, contents: String) throws {
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
