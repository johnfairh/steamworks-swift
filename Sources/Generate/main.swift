//
//  main.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import LibGenerate
import Foundation

let cwd = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

let generator = try Generator(sdkURL: cwd.appendingPathComponent("sdk"),
                              swiftOutputDirURL: cwd.appendingPathComponent("Sources/Steamworks/Generated"),
                              cOutputDirURL: cwd.appendingPathComponent("Sources/CSteamworks/Generated"))
try generator.generate()
