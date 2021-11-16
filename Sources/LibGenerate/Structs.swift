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
    /// Patch up some systemic errors / C-alignment-reasoning in types
    var type: String {
        if fieldname.starts(with: "m_b") {
            return "bool"
        }
        if fieldtype == "uint64" {
            if fieldname.re_isMatch("steamid", options: .i) { return "CSteamID" }
            if fieldname.re_isMatch("gameid", options: .i) { return "CGameID" }
        }
        return fieldtype
    }

    static let unwantedFieldNames = Set<String>([
        "reserved", "m_ulUnused", "m__pad1"
    ])

    var isReal: Bool {
        !Self.unwantedFieldNames.contains(fieldname)
    }

    var declLine: [String] {[
        "/// Steamworks `\(fieldname)`",
        "public let \(fieldname.asSwiftStructFieldName): \(swiftType ?? type.asSwiftTypeName)"
    ]}
}

extension Array where Element == MetadataDB.Struct.Field {
    var declLines: [String] {
        filter(\.isReal).flatMap(\.declLine)
    }
}

extension MetadataDB.Struct {
    var shouldGenerate: Bool {
        true
    }

    var enumDeclLines: [String] {
        enums.values.flatMap { [""] + $0.declLines }
    }

    var enumExtensionLines: [String] {
        enums.values.flatMap { [""] + $0.extensionLines(namespace: name.asSwiftTypeName) }
    }

    // Don't bother generating the callback ID -- don't think it's useful?
    var generate: String {
        let lines = [
            "/// Steamworks `\(name)`",
            "public struct \(name.asSwiftTypeName) {"
        ] + fields.declLines.indented(1)
          + enumDeclLines.indented(1) + [
            "}"
        ] + enumExtensionLines

        return lines.joined(separator: "\n")
    }
}

// field conversion lines
// conversion generation
// think about public ctor
// patch marker for 'requires ->steam conversion'
// rtime is one word
// m_iInstallFolderIndex
// m_rtAction
