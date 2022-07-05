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
        let contents = metadata.allEnums
            .sorted(by: { $0.name < $1.name })
            .map(\.generated)
            .joined(separator: "\n\n")
        try io.write(fileName: "Enums.swift", contents: contents)
    }
}

// MARK: Structure generation

extension MetadataDB.Enum.Value {
    var shouldGenerate: Bool {
        !name.name.contains("__")
    }
}

private extension SwiftExpr {
    var isNegative: Bool {
        expr.hasPrefix("-")
    }
}

private extension Int {
    init?(_ expr: SwiftExpr) {
        self.init(expr.expr)
    }
}

extension MetadataDB.Enum {
    /// This has to match the raw type chosen by the Clang Importer for the imported C enum
    var rawType: String {
        values.contains(where: { $0.value.isNegative }) ? "CInt" : "CUnsignedInt"
    }

    var unrepresentedValue: Int {
        (values
            .filter(\.shouldGenerate)
            .compactMap { Int($0.value) }
            .max() ?? 0) + 1
    }

    /// The Swift declaration for the enum or optionset struct, formatted for top-level code
    var generated: String {
        declLines.joined(separator: "\n") + "\n\n" + extensionLines().joined(separator: "\n") + intCoerceLines.joined(separator: "\n")
    }

    /// Very few straight enums are baffingly presented in structs as some int-type and need a special conversion.
    var intCoerceLines: [String] {
        guard let intType = intXToSelf else {
            return []
        }
        return [
            "",
            "",
            "extension \(name.swiftType) {",
            "    init(_ from: \(intType)) {",
            "        self.init(From(rawValue: CUnsignedInt(from)))",
            "    }",
            "}"
        ]
    }

    /// The nominal part of the declaration
    var declLines: [String] {
        let swiftType = name.swiftType
        let rawType = rawType

        let typeDecl: String
        let valueGen: (Value, SwiftType) -> String

        if !isSet {
            typeDecl = "public enum \(swiftType): \(rawType) {"
            valueGen = generateEnumCaseDecl
        } else {
            typeDecl = """
                       public struct \(swiftType): OptionSet {
                           /// The flags value.
                           public let rawValue: \(rawType)
                           /// Create a new instance with `rawValue` flags set.
                           public init(rawValue: \(rawType)) { self.rawValue = rawValue }
                       """
            valueGen = generateOptionSetDecl
        }

        var elements = values
            .filter(\.shouldGenerate)
            .flatMap { value in [
                "/// Steamworks `\(value.name)`",
                valueGen(value, swiftType)]
            }

        if !isSet {
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
        isSet ? "RawConvertible" : "EnumWithUnrepresented"
    }

    /// The extension part of the declaration
    func extensionLines(namespace: String? = nil) -> [String] {
        let swiftType = "\(namespace.flatMap { "\($0)." } ?? "")\(name.swiftType)"
        return [
            "extension \(name.swiftCompilerSpelling): RawConvertible { typealias From = \(swiftType) }",
            "extension \(swiftType): \(enumProtocol) { typealias From = \(name.swiftCompilerSpelling) }",
            "extension \(swiftType): SteamCreatable {}"
        ]
    }

    /// The Swift declaration for a OptionSet enum case.
    ///
    /// I have to admit I learnt more about the finickitiness of option sets getting these working
    /// than I learnt in the past five years... who made 0 magical ...
    func generateOptionSetDecl(value: Value, swiftType: SwiftType) -> String {
        let initArgs: String
        if value.value == "0" && isSet {
            initArgs = "[]"
        } else {
            initArgs = "rawValue: \(value.value)"
        }
        return "public static let \(swiftCaseName(value.name)) = \(swiftType)(\(initArgs))"
    }

    /// The Swift declaration for the enum case.
    ///
    /// In the very rare case of duplicate values we treat it like an optionset member and force the
    /// init (it's optional for us, `RawRepresentable`) trusting it to actually be a duplicate.
    func generateEnumCaseDecl(value: Value, swiftType: SwiftType) -> String {
        guard !value.forceStatic else {
            return generateOptionSetDecl(value: value, swiftType: swiftType) + "!"
        }
        return "case \(swiftCaseName(value.name)) = \(value.value)"
    }

    /// Convert a steamworks enum member name to Swift.
    func swiftCaseName(_ steamName: SteamName) -> SwiftExpr {
        steamName.enumCasePrefixStripped(prefix: prefix, numericPrefix: numericPrefix).swiftName
    }

    /// An expression to safely initialize an enum instance, for struct default initializers
    var defaultInstance: SwiftExpr {
        if isSet {
            return "[]"
        }
        return ".\(swiftCaseName(values.filter(\.shouldGenerate).first!.name))"
    }
}

private extension SteamName {
    /// Convert a steamworks enum member name to Swift.
    ///
    /// Stripping the prefix:
    /// * _Almost_ always begins with `k_`
    /// * _Rarely_ has an `n`
    /// * Scope string is usually constant but sometimes regexp and rarely case-incorrect
    /// * Sometimes this leaves us with a case name that starts with a number, we add a
    ///   prefix to fix this from the patch json.
    ///
    func enumCasePrefixStripped(prefix: String, numericPrefix: String?) -> SteamName {
        let deprefixed = name.re_sub("^(?:k_)?n?\(prefix)_?", with: "", options: .i)

        guard let first = deprefixed.first, first.isNumber else {
            return SteamName(deprefixed)
        }
        guard let numericPrefix = numericPrefix else {
            preconditionFailure("Unhandled numeric-starting identifier \(name) -> \(deprefixed)")
        }
        return "\(numericPrefix)\(deprefixed)"
    }
}
