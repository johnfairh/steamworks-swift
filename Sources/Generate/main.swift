//
//  main.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import LibGenerate
import Foundation

let generator = try Generator(packageRootPath: FileManager.default.currentDirectoryPath)
try generator.generate()
