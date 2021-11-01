//
//  main.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

struct Failed: Error, CustomStringConvertible {
    let description: String
    init(_ description: String) {
        self.description = description
    }
}

let generator = try Generator(packageRootPath: FileManager.default.currentDirectoryPath)
try generator.generate()
