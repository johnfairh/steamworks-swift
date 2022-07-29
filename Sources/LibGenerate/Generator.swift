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
    let typedefs: Typedefs
    let constants: Constants
    let enums: Enums
    let structs: Structs
    let interfaces: Interfaces
    let callbacks: Callbacks

    public init(redistSdkURL: URL, swiftOutputDirURL: URL, cOutputDirURL: URL) throws {
        io = try IO(redistSdkURL: redistSdkURL, swiftOutputDirURL: swiftOutputDirURL, cOutputDirURL: cOutputDirURL)
        metadata = try Metadata(io: io)
        version = Version(io: io)
        typedefs = Typedefs(io: io, metadata: metadata)
        constants = Constants(io: io, metadata: metadata)
        enums = Enums(io: io, metadata: metadata)
        structs = Structs(io: io, metadata: metadata)
        interfaces = Interfaces(io: io, metadata: metadata)
        callbacks = Callbacks(io: io, metadata: metadata)
    }

    public func generate() throws {
        print("Input JSON: \(io.jsonURL.path)")
        print(metadata.description)
        print("Swift output directory: \(io.swiftOutputDirURL.path)")
        print("C++ output directory: \(io.cOutputDirURL.path)")

        try version.generate()
        try typedefs.generate()
        try constants.generate()
        try enums.generate()
        try structs.generate()
        try interfaces.generate()
        try callbacks.generate()
    }
}
