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
        let swiftContents = metadata.db.structs.values
            .filter(\.shouldGenerate)
            .map(\.generateSwift)
            .joined(separator: "\n\n")
        try io.write(fileName: "Structs.swift", contents: swiftContents)

        let cContents = metadata.db.structs.values
            .filter(\.shouldGenerate)
            .flatMap(\.generateC)
            .joined(separator: "\n\n")
        try io.write(fileName: "steam_struct_shims.h", contents: cContents)
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

    var shouldGenerate: Bool {
        !ignore && !Self.unwantedFieldNames.contains(fieldname)
    }

    /// Contribution to the C header file to define a method on the C++ structure that returns
    /// a pointer to an array structure element instead of a tuple.
    func getArrayGetterLines(structName: String) -> String? {
        guard let (elemType, _) = fieldtype.parseCArray else {
            return nil
        }
        return """
               __attribute__((swift_name(\"getter:\(structName).\(fieldname)_ptr(self:)\")))
               static inline const \(elemType) * _Nonnull \(structName)_\(fieldname)_ptr(const \(structName) * _Nonnull s)
               {
                   return s->\(fieldname);
               }
               """
    }

    /// Swift structure declaration field
    var declLine: [String] {[
        "/// Steamworks `\(fieldname)`",
        "public let \(fieldname.asSwiftStructFieldName): \(swiftType ?? type.asSwiftTypeName)"
    ]}

    /// Swift structure initializer lines
    var initLine: String {
        let rvalue: String

        if let decomposed = fieldtype.parseCArray {
            if decomposed.0 == "char" {
                rvalue = ".init(steam.\(fieldname)_ptr)"
            } else if decomposed.0 == "uint8" {
                rvalue = ".init(steam.\(fieldname)_ptr, \(decomposed.1))"
            } else {
                rvalue = ".init(steam.\(fieldname)_ptr, \(decomposed.1)) { .init($0) }"
            }
        } else {
            rvalue = ".init(steam.\(fieldname))"
        }
        return "\(fieldname.asSwiftStructFieldName) = \(rvalue)"
    }
}

extension Array where Element == MetadataDB.Struct.Field {
    var declLines: [String] {
        filter(\.shouldGenerate).flatMap(\.declLine)
    }

    var initLines: [String] {
        filter(\.shouldGenerate).map(\.initLine)
    }

    func getArrayGetterLines(structName: String) -> [String] {
        filter(\.shouldGenerate).compactMap { $0.getArrayGetterLines(structName: structName) }
    }
}

extension MetadataDB.Struct {
    var shouldGenerate: Bool {
        !ignore
    }

    var generateC: [String] {
        fields.getArrayGetterLines(structName: name)
    }

    var enumDeclLines: [String] {
        enums.values.flatMap { [""] + $0.declLines }
    }

    var enumExtensionLines: [String] {
        enums.values.flatMap { [""] + $0.extensionLines(namespace: name.asSwiftTypeName) }
    }

    // Don't bother generating the callback ID -- don't think it's useful?
    var generateSwift: String {
        let swiftTypeName = name.asSwiftTypeName
        let lines = [[
            "/// Steamworks `\(name)`",
            "public struct \(swiftTypeName) {"
        ],
        fields.declLines.indented(1),
        enumDeclLines.indented(1), [
            "}"
        ],
        enumExtensionLines, [
            "",
            "extension \(swiftTypeName): SteamCreatable {",
            "    init(_ steam: CSteamworks.\(name)) {"
        ],
        fields.initLines.indented(2), [
            "    }",
            "}"
        ]
        ].flatMap { $0 }

        return lines.joined(separator: "\n")
    }
}
