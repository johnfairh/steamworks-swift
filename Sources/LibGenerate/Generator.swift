//
//  Generator.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

public struct Generator {
    let io: IO
    let json: JSON
    let version: Version
    let enums: Enums

    public init(sdkURL: URL, outputDirURL: URL) throws {
        self.io = try IO(sdkURL: sdkURL, outputDirURL: outputDirURL)
        json = try JSON(io: io)
        version = Version(io: io)
        enums = Enums(io: io, json: json)
    }

    public func generate() throws {
        print("Input JSON: \(io.jsonURL.path)")
        print(json.description)
        print("Output directory: \(io.outputDirURL.path)")

        try version.generate()
        try enums.generate()
    }
}
