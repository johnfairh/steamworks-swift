//
//  Generator.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

public struct Generator {
    let io: IO
    let version: Version

    public init(packageRootPath: String) throws {
        try io = IO(packageRootURL: URL(fileURLWithPath: packageRootPath))
        version = Version(io: io)
    }

    public func generate() throws {
        print("Input JSON: \(io.jsonURL.path)")
        print("Output directory: \(io.outputDirURL.path)")

        try version.generate()
    }
}
