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
        let contents = metadata.db.enums.values
            .sorted(by: { $0.name < $1.name })
            .map(\.generated)
            .joined(separator: "\n\n")
        try io.write(fileName: "Enums.swift", contents: contents)
    }
}

// MARK: Structure generation

extension MetadataDB.Enum.Value {
    var shouldGenerate: Bool {
        !name.contains("__")
    }
}

extension MetadataDB.Enum {
    /// This has to match the raw type chosen by the Clang Importer for the imported C enum
    var rawType: String {
        values.values.contains(where: { $0.value.hasPrefix("-") }) ? "Int32" : "UInt32"
    }

    var unrepresentedValue: Int {
        (values.values
            .filter(\.shouldGenerate)
            .compactMap { Int($0.value) }
            .max() ?? 0) + 1
    }

    /// The Swift declaration for the enum or optionset struct, formatted for top-level code
    var generated: String {
        declLines.joined(separator: "\n") + "\n\n" + extensionLines().joined(separator: "\n")
    }

    /// The nominal part of the declaration
    var declLines: [String] {
        let swiftTypeName = name.asSwiftTypeName
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
                       """
            valueGen = generateOptionSetDecl
        }

        var elements = values.values
            .filter(\.shouldGenerate)
            .flatMap { value in [
                "/// Steamworks `\(value.name)`",
                valueGen(value, swiftTypeName)]
            }

        if !is_set {
            elements += [
                "/// Some undocumented value",
                "case unrepresentedInSwift = \(unrepresentedValue)"
            ]
        }

        return [
            "/// Steamworks `\(name)`",
            typeDecl
        ] + elements.indented(1) + [
            "}"
        ]
    }

    var enumProtocol: String {
        is_set ? "RawConvertible" : "EnumWithUnrepresented"
    }

    /// The extension part of the declaration
    func extensionLines(namespace: String? = nil) -> [String] {
        let swiftTypeName = (namespace.flatMap { "\($0)." } ?? "") + name.asSwiftTypeName
        return [
            "extension \(name.asSwiftNameForSteamType): RawConvertible { typealias From = \(swiftTypeName) }",
            "extension \(swiftTypeName): \(enumProtocol) { typealias From = \(name.asSwiftNameForSteamType) }"
        ]
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
        guard !value.forceStatic else {
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
            guard let numericPrefix = numericPrefix else {
                preconditionFailure("Unhandled numeric-starting identifier \(steamName) -> \(name) (\(self))")
            }
            name = numericPrefix + name
        }
        return name.asSwiftIdentifier
    }
}
