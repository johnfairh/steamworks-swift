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
        let cHeader = "#include <cstring>\n\n"
        try io.write(fileName: "steam_struct_shims.h", contents: cHeader + cContents)
    }
}

extension MetadataDB.Struct.Field {
    static let unwantedFieldNames = Set<String>([
        "reserved", "m_ulUnused", "m__pad1", "_reservePad1"
    ])

    var shouldGenerate: Bool {
        !ignore && !Self.unwantedFieldNames.contains(name)
    }

    var arrayFieldName: String {
        "\(name)_ptr"
    }

    var arraySetterName: String {
        "copy_\(name)"
    }

    /// Contribution to the C header file to define a method on the C++ structure that returns
    /// a pointer to an array structure element instead of a tuple.
    func getArrayGetterLines(structName: String) -> String? {
        guard let (elemType, arrayLen) = type.parseArray else {
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

    func getArraySetterLines(structName: String) -> String? {
        guard let (elemType, arrayLen) = type.parseArray else {
            return nil
        }
        return """
               __attribute__((swift_name(\"\(structName).\(arraySetterName)(self:from:)\")))
               static inline const void \(structName)_\(arraySetterName)(\(structName) * _Nonnull s, const \(elemType) * _Nonnull from)
               {
                   std::memcpy(&s->\(name), from, \(arrayLen));
               }
               """
    }

    /// Swift structure declaration field
    var declLine: [String] {[
        "/// Steamworks `\(name)`",
        "public let \(name.asSwiftStructFieldName): \(type.swiftType)"
    ]}

    /// Swift structure initializer lines
    var initFromSteamLine: String {
        let rvalue: String

        if let decomposed = type.parseArray {
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
    var initSteamFromSwiftLine: String {
        let rvalue = "swift.\(name.asSwiftStructFieldName)"
        if type.parseArray != nil {
            return "self.\(arraySetterName)(from: \(rvalue))"
        }
        return "\(name) = .init(\(rvalue))"
    }

    /// Default value setup for memberwise initializer
    var memberwiseParameter: String {
        let initClause = type.swiftTypeInstance.flatMap { " = \($0)"} ?? ""
        return "\(name.asSwiftStructFieldName): \(type.swiftType)\(initClause)"
    }

    /// Initializer line for memberwise initializer
    var initFromMemberwiseLine: String {
        let field = name.asSwiftStructFieldName
        return "self.\(field) = \(field)"
    }
}

extension Array where Element == MetadataDB.Struct.Field {
    var declLines: [String] {
        filter(\.shouldGenerate).flatMap(\.declLine)
    }

    var initFromSteamLines: [String] {
        filter(\.shouldGenerate).map(\.initFromSteamLine)
    }

    var initSteamFromSwiftLines: [String] {
        filter(\.shouldGenerate).map(\.initSteamFromSwiftLine)
    }

    var initFromMemberwiseLines: [String] {
        filter(\.shouldGenerate).map(\.initFromMemberwiseLine)
    }

    var memberwiseParameters: String {
        filter(\.shouldGenerate).map(\.memberwiseParameter).joined(separator: ", ")
    }

    func getArrayGetterLines(structName: String) -> [String] {
        filter(\.shouldGenerate).compactMap { $0.getArrayGetterLines(structName: structName) }
    }

    func getArraySetterLines(structName: String) -> [String] {
        filter(\.shouldGenerate).compactMap { $0.getArraySetterLines(structName: structName) }
    }
}

extension MetadataDB.Struct {
    var shouldGenerate: Bool {
        !ignore
    }

    var generateC: [String] {
        var lines = fields.getArrayGetterLines(structName: name)
        if swiftToSteam {
            lines += fields.getArraySetterLines(structName: name)
        }
        return lines
    }

    var swiftToSteamExtensionLines: [String] {
        guard swiftToSteam else {
            return []
        }
        return [
            "",
            "extension CSteamworks.\(name) : SwiftCreatable {",
            "    init(_ swift: \(name.asSwiftTypeName)) {",
            "        self.init()"
        ] + fields.initSteamFromSwiftLines.indented(2) + [
            "    }",
            "}"
        ]
    }

    var memberwiseInitializer: [String] {
        [
            "/// Create a customized `\(name.asSwiftTypeName)`",
            "public init(\(fields.memberwiseParameters)) {"
        ] +
        fields.initFromMemberwiseLines.indented(1) +
        ["}"]
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
        fields.isEmpty ? [] : [
            ""
        ],
        memberwiseInitializer.indented(1), [
            "}",
            "",
            "extension \(swiftTypeName): SteamCreatable {",
            "    typealias SteamType = CSteamworks.\(name)",
            "    init(_ steam: CSteamworks.\(name)) {"
        ],
        fields.initFromSteamLines.indented(2), [
            "    }",
            "}"
        ],
        swiftToSteamExtensionLines
        ].flatMap { $0 }

        return lines.joined(separator: "\n")
    }
}

extension String {
    /// Get a safe-ish instance of the Swift version of this steam type
    var asSwiftTypeInstance: String? {
        let swiftTypeName = asSwiftTypeName

        // hard-coded things
        if swiftTypesWithoutDefaultValues.contains(swiftTypeName) {
            return nil
        }
        if let instance = swiftTypeDefaultValues[swiftTypeName] {
            return instance
        }
        // arrays
        if swiftTypeName.isSwiftArrayType {
            return "[]"
        }
        // integer types
        if swiftTypeName.isSwiftIntegerType {
            return "0"
        }
        // typedefs conform to ExpressibleBy...
        if Metadata.isTypedef(steamType: self) {
            return "0"
        }
        // enums can generate an initial value
        if let instance = Metadata.findEnumDefaultInstance(steamType: self) {
            return instance
        }

        // Fallback
        return "\(swiftTypeName)()"
    }
}

// Default values for Swift types.  These just need to compile and
// be broadly sensible.  Int types handled separately.
private let swiftTypeDefaultValues: [String : String] = [
    "Bool" : "false",
    "String" : #""""#,
    "Double" : "0",
    "Float" : "0",
]

// Swift types that do not have a default value.
private let swiftTypesWithoutDefaultValues = Set([
    "UnsafeRawPointer"
])
