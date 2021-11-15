//
//  Structs.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

/// Code gen the steamworks structs
///
struct Structs {
    let io: IO
    let metadata: Metadata

    init(io: IO, metadata: Metadata) {
        self.io = io
        self.metadata = metadata
    }

    func generate() throws {
        let contents = metadata.db.structs.values
            .filter(\.shouldGenerate)
            .map(\.generate)
            .joined(separator: "\n\n")
        try io.write(fileName: "Structs.swift", contents: contents)
    }
}

extension MetadataDB.Struct.Field {
    var declLine: [String] {[
        "/// Steamworks `\(fieldname)`",
        "public let \(fieldname.asSwiftParameterName): \(fieldtype.asSwiftTypeName)"
    ]}
}

extension Array where Element == MetadataDB.Struct.Field {
    var declLines: [String] {
        flatMap(\.declLine)
    }
}

extension MetadataDB.Struct {
    var shouldGenerate: Bool {
        true
    }

    // Don't bother generating the callback ID -- don't think it's useful?
    var generate: String {
        """
        /// Steamworks `\(name)`
        public struct \(name.asSwiftTypeName) {
        \(fields.declLines.indented(1).joined(separator: "\n"))
        }
        """
    }
}

// field names
// field types (maybe punt arrays?)
// empty structs
// field conversion lines
// conversion generation
// think about public ctor
// patch marker for 'requires ->steam conversion'
