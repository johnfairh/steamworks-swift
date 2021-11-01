//
//  Generator.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

struct Generator {
    let io: IO
    let version: Version

    init(packageRootPath: String) throws {
        try io = IO(packageRootURL: URL(fileURLWithPath: packageRootPath))
        version = Version(io: io)
    }

    func generate() throws {
        print("Input JSON: \(io.jsonURL.path)")
        print("Output directory: \(io.outputDirURL.path)")

        try version.generate()
    }
}
