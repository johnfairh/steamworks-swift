//
//  Generator.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

public struct Generator {
    let io: IO
    let metadata: Metadata
    let version: Version
    let enums: Enums
    let interfaces: Interfaces

    public init(sdkURL: URL, outputDirURL: URL) throws {
        io = try IO(sdkURL: sdkURL, outputDirURL: outputDirURL)
        metadata = try Metadata(io: io)
        version = Version(io: io)
        enums = Enums(io: io, metadata: metadata)
        interfaces = Interfaces(io: io, metadata: metadata)
    }

    public func generate() throws {
        print("Input JSON: \(io.jsonURL.path)")
        print(metadata.description)
        print("Output directory: \(io.outputDirURL.path)")

        try version.generate()
        try enums.generate()
        try interfaces.generate()
    }
}
