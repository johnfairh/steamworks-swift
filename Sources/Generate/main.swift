//
//  main.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import LibGenerate
import Foundation

let cwd = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

let generator = try Generator(redistSdkURL: cwd.appendingPathComponent("sdk/redist"),
                              swiftOutputDirURL: cwd.appendingPathComponent("Sources/Steamworks/Generated"),
                              cOutputDirURL: cwd.appendingPathComponent("Sources/CSteamworks/Generated"),
                              docStructureOutputDirURL: cwd.appendingPathComponent("DocIndex"),
                              doccCollectionOutputDirURL: cwd.appendingPathComponent("Sources/Steamworks/Documentation.docc/Generated"))
try generator.generate()
