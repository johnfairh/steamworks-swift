//
//  main.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import LibGenerate
import Foundation

let cwd = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

let generator = try Generator(redistSdkURL: cwd.appendingPathComponent("redist"),
                              swiftOutputDirURL: cwd.appendingPathComponent("Sources/Steamworks/Generated"),
                              cOutputDirURL: cwd.appendingPathComponent("Sources/CSteamworks/Generated"))
try generator.generate()
