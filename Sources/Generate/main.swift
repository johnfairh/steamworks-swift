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
                              outputDirURL: cwd.appendingPathComponent("Sources/Steamworks/Generated"))
try generator.generate()
