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
            .sorted(by: { $0.name < $1.name })
            .map(\.generateSwift)
            .joined(separator: "\n\n")
        try io.write(fileName: "Structs.swift", contents: swiftContents)

        let cContents = metadata.db.structs.values
            .filter(\.shouldGenerate)
            .sorted(by: { $0.name < $1.name })
            .flatMap(\.generateC)
            .joined(separator: "\n\n")
        try io.write(fileName: "steam_struct_shims.h", contents: cContents)
    }
}

extension MetadataDB.Struct.Field {
    static let unwantedFieldNames = Set<String>([
        "reserved", "m_ulUnused", "m__pad1"
    ])

    var shouldGenerate: Bool {
        !ignore && !Self.unwantedFieldNames.contains(name)
    }

    var arrayFieldName: String {
        "\(name)_ptr"
    }

    /// Contribution to the C header file to define a method on the C++ structure that returns
    /// a pointer to an array structure element instead of a tuple.
    func getArrayGetterLines(structName: String) -> String? {
        guard let (elemType, arrayLen) = type.parseCArray else {
            return nil
        }
        // Make sure these strings are actually null-terminated.
        // I'm fairly sure this isn't actually UB because the pointer here has been const-washed
        // via a Swift param -- could probably work back up the system and pass these conversion
        // structs as `inout`.
        let extraLine: String
        if elemType == "char" {
            extraLine = "const_cast<\(structName) *>(s)->\(name)[\(arrayLen - 1)] = 0;\n    "
        } else {
            extraLine = ""
        }
        return """
               __attribute__((swift_name(\"getter:\(structName).\(arrayFieldName)(self:)\")))
               static inline const \(elemType) * _Nonnull \(structName)_\(arrayFieldName)(const \(structName) * _Nonnull s)
               {
                   \(extraLine)return s->\(name);
               }
               """
    }

    /// Swift structure declaration field
    var declLine: [String] {[
        "/// Steamworks `\(name)`",
        "public let \(name.asSwiftStructFieldName): \(swiftType ?? type.asSwiftTypeName)"
    ]}

    /// Swift structure initializer lines
    var initLine: String {
        let rvalue: String

        if let decomposed = type.parseCArray {
            if decomposed.0 == "char" {
                rvalue = ".init(steam.\(arrayFieldName))"
            } else if decomposed.0 == "uint8" {
                rvalue = ".init(steam.\(arrayFieldName), \(decomposed.1))"
            } else {
                rvalue = ".init(steam.\(arrayFieldName), \(decomposed.1)) { .init($0) }"
            }
        } else {
            rvalue = ".init(steam.\(name))"
        }
        return "\(name.asSwiftStructFieldName) = \(rvalue)"
    }

    /// Steam structure initializer lines - only for a few types, opt-in
    var steamInitLine: String {
        "\(name) = .init(swift.\(name.asSwiftStructFieldName))"
    }
}

extension Array where Element == MetadataDB.Struct.Field {
    var declLines: [String] {
        filter(\.shouldGenerate).flatMap(\.declLine)
    }

    var initLines: [String] {
        filter(\.shouldGenerate).map(\.initLine)
    }

    var steamInitLines: [String] {
        filter(\.shouldGenerate).map(\.steamInitLine)
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

    var swiftToSteamExtensionLines: [String] {
        guard swiftToSteam else {
            return []
        }
        return [
            "",
            "extension CSteamworks.\(name) {",
            "    init(_ swift: \(name.asSwiftTypeName)) {",
            "        self.init()"
        ] + fields.steamInitLines.indented(2) + [
            "    }",
            "}"
        ]
    }

    // Don't bother generating the callback ID -- don't think it's useful?
    // Not going to conform these to any protocols.  Should review as we go,
    // some will be PODs that make sense to be Equatable/etc, do via patch.
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
        ],
        swiftToSteamExtensionLines
        ].flatMap { $0 }

        return lines.joined(separator: "\n")
    }
}
