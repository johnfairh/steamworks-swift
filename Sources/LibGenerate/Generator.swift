//
//  Generator.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation

public struct Generator {
    let io: IO
    let generated: Generated
    let metadata: Metadata
    let version: Version
    let typedefs: Typedefs
    let constants: Constants
    let enums: Enums
    let structs: Structs
    let interfaces: Interfaces
    let callbacks: Callbacks
    let docStructure: DocStructure

    public init(redistSdkURL: URL,
                swiftOutputDirURL: URL, cOutputDirURL: URL,
                docStructureOutputDirURL: URL,
                doccCollectionOutputDirURL: URL) throws {
        io = try IO(redistSdkURL: redistSdkURL,
                    swiftOutputDirURL: swiftOutputDirURL,
                    cOutputDirURL: cOutputDirURL,
                    docStructureOutputDirURL: docStructureOutputDirURL,
                    doccCollectionOutputDirURL: doccCollectionOutputDirURL)
        generated = Generated()
        metadata = try Metadata(io: io)
        version = Version(io: io)
        typedefs = Typedefs(io: io, metadata: metadata, generated: generated)
        constants = Constants(io: io, metadata: metadata)
        enums = Enums(io: io, metadata: metadata, generated: generated)
        structs = Structs(io: io, metadata: metadata, generated: generated)
        interfaces = Interfaces(io: io, metadata: metadata, generated: generated)
        callbacks = Callbacks(io: io, metadata: metadata, generated: generated)
        docStructure = DocStructure(io: io, generated: generated)
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

        try docStructure.generate()
    }
}
