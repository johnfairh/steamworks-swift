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

    public init(sdkURL: URL, outputDirURL: URL) throws {
        self.io = try IO(sdkURL: sdkURL, outputDirURL: outputDirURL)
        version = Version(io: io)
    }

    public func generate() throws {
        print("Input JSON: \(io.jsonURL.path)")
        print("Output directory: \(io.outputDirURL.path)")

        try version.generate()
    }
}
