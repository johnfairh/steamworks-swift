//
//  Enums.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// Code gen the steamworks enums
///
/// `Enums`is responsible for the top-level enums.  Some structures have nested enums defined in
/// them -- we honour that structure (although it's probably a style bug) and have them generated from
/// the corresponding Struct definition.
struct Enums {
    let io: IO
    let metadata: Metadata

    init(io: IO, metadata: Metadata) {
        self.io = io
        self.metadata = metadata
    }

    func generate() throws {
        let contents = metadata.db.enums.values.map(\.generated).joined(separator: "\n\n")
        try io.write(fileName: "Enums.swift", contents: contents)
    }
}

// MARK: Structure generation

extension MetadataDB.Enum {
    var rawType: String {
        values.values.contains(where: { $0.value.hasPrefix("-") }) ? "Int32" : "UInt32"
    }

    var steamRawType: String {
        rawType.lowercased()
    }

    /// The Swift declaration for the enum or optionset struct
    var generated: String {
        let swiftTypeName = enumname.asSwiftTypeName
        let rawType = rawType

        let typeDecl: String
        let valueGen: (Value, String) -> String

        if !is_set {
            typeDecl = "public enum \(swiftTypeName): \(rawType) {"
            valueGen = generateEnumCaseDecl
        } else {
            typeDecl = """
                       public struct \(swiftTypeName): OptionSet {
                           /// The flags value.
                           public let rawValue: \(rawType)
                           /// Create a new instance with `rawValue` flags set.
                           public init(rawValue: \(rawType)) { self.rawValue = rawValue }
                           /// Workaround for steam API type bugs
                           init(_ rawValue: \(steamRawType)) { self.rawValue = rawValue }
                       """
            valueGen = generateOptionSetDecl
        }

        let elements = values.values
            .map { value in
                """
                    /// Steamworks `\(value.name)`
                    \(valueGen(value, swiftTypeName))
                """
            }
            .joined(separator: "\n")

        return """
               /// Steamworks `\(enumname)`
               \(typeDecl)
               \(elements)
               }

               extension \(enumname): EnumConvertible { typealias From = \(swiftTypeName) }
               extension \(swiftTypeName): EnumConvertible { typealias From = \(enumname) }
               """
    }

    /// The Swift declaration for a OptionSet enum case.
    ///
    /// I have to admit I learnt more about the finickitiness of option sets getting these working
    /// than I learnt in the past five years... who made 0 magical ...
    func generateOptionSetDecl(value: Value, swiftTypeName: String) -> String {
        let initArgs: String
        if value.value == "0" && is_set {
            initArgs = "[]"
        } else {
            initArgs = "rawValue: \(value.value)"
        }
        return "public static let \(swiftCaseName(value.name)) = \(swiftTypeName)(\(initArgs))"
    }

    /// The Swift declaration for the enum case.
    ///
    /// In the very rare case of duplicate values we treat it like an optionset member and force the
    /// init (it's optional for us, `RawRepresentable`) trusting it to actually be a duplicate.
    func generateEnumCaseDecl(value: Value, swiftTypeName: String) -> String {
        guard !value.force_static else {
            return generateOptionSetDecl(value: value, swiftTypeName: swiftTypeName) + "!"
        }
        return "case \(swiftCaseName(value.name)) = \(value.value)"
    }

    /// Convert a steamworks enum member name to Swift.
    ///
    /// Stripping the prefix:
    /// * _Almost_ always begins with `k_`
    /// * _Rarely_ has an `n`
    /// * Scope string is usually constant but sometimes regexp and rarely case-incorrect
    /// * Sometimes this leaves us with a case name that starts with a number, we add a
    ///   prefix to fix this from the patch json.
    func swiftCaseName(_ steamName: String) -> String {
        var name = steamName.re_sub("^(?:k_)?n?\(prefix)_?", with: "", options: .i)
        if name.first!.isNumber {
            guard let numericPrefix = numeric_prefix else {
                preconditionFailure("Unhandled numeric-starting identifier \(steamName) -> \(name) (\(self))")
            }
            name = numericPrefix + name
        }
        return name.asSwiftIdentifier
    }
}
