//
//  SteamType.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// A C++ type used in the native Steam API.  Would be understood by the C++ compiler.
///
/// Eg. a straight type name `SteamFoo_t` or a parameter type eg. `const SteamFoo_t *`.
struct SteamType {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }

    /// Decompose a fixed-size array type into its element type and cardinality
    var parseArray: (element: SteamType, size: Int)? {
        name.re_match(#"^(.*) \[(.+)\]$"#).flatMap {
            (element: SteamType($0[1]), size: Int($0[2])!)
        }
    }
}

extension SteamType {
    /// Get the Swift type used in the public Swift API to represent this C++ type
    ///
    /// This is usually not a type that can be passed to the C++ API.
    ///
    /// Various structural and syntactic special cases.
    /// Const removed.
    /// Get rid of C++ nesting - everything top-level in Swift
    /// Drop leading capital E/I/C - used in SDK for enums/interfaces/classes (but not for structs...)
    ///
    /// Does not handle general pointer/reference types: caller responsible for sorting out
    /// the semantics of these and desuffixing before calling here.
    var swiftType: SwiftType {
        if let arrayMatch = parseArray {
            if let special = steamArrayElementTypeToSwiftArrayTypes[arrayMatch.element] {
                return special
            }
            return SwiftType("[\(SwiftType(arrayMatch.element))]")
        }
        if let mapped = steamToSwiftTypes[self] ?? Metadata.steamTypeToSwiftType(self) {
            return mapped
        }
        if let constMatch = name.re_match("^const (.*)$") {
            return SwiftType(SteamType(constMatch[1]))
        }
        var name1 = name
            .re_sub("_t\\b", with: "")
            .re_sub("^.*::", with: "")
            .re_sub("Id\\b", with: "ID")
        if !Metadata.isStruct(steamType: self) {
            name1 = name1.re_sub("^[CEI](?=[A-Z])", with: "")
        }
        return SwiftType(name1.replacingOccurrences(of: "_", with: ""))
    }
}

// How to represent a steam type in the Swift interface, special cases
private let steamToSwiftTypes: [SteamType : SwiftType] = [
    // Base types
    "const char *" : "String",
    "const SteamParamStringArray_t *" : "[String]",
    "int" : "Int",
    "uint8" : "Int",
    "uint16" : "Int",
    "uint32" : "Int",
    "int32" : "Int",
    "const int32" : "Int", // hmm
    "int64" : "Int",
    "int64_t" : "Int", // steamnetworking == disaster
    "uint64": "UInt64",
    "bool" : "Bool",
    "float" : "Float",
    "double" : "Double",
    "void *" : "UnsafeMutableRawPointer",
    "const void *": "UnsafeRawPointer",
    "uint8 *" : "UnsafeMutablePointer<UInt8>",
    "uint64_steamid" : "SteamID",
    "uint64_gameid" : "GameID",
    "const char **": "[String]",
    "char": "Int", // SteamInput going its own way...
    "unsigned short": "Int", // ""
    "unsigned int": "Int", // ""
    "intptr_t": "Int",
    "size_t": "Int",
    "void": "Void",

    // - because these are used all over the place non-const-correctly
    "SteamParamStringArray_t *" : "[String]",
    // - because these occur in arrays
    "SteamNetworkingMessage_t *" : "SteamNetworkingMessage"
]

/// How to represent an array of steam types (in a struct field,) special cases
private let steamArrayElementTypeToSwiftArrayTypes: [SteamType : SwiftType] = [
    "char" : "String",
    "uint8" : "[UInt8]" // Should be Data (?) but can't use Foundation inside Steamworks because C++!
]

extension SteamType {
    /// Get a safe-ish instance of the Swift version of this steam type
    ///
    /// This is a bit messy because we can't do this entirely from the Swift type -- would need to
    /// restructure to do all the name mapping once up-front in Metadata, maybe not the worst thing in the world!
    /// XXX
    var swiftTypeInstance: SwiftExpression? {
        // typedefs conform to ExpressibleBy...
        if Metadata.isTypedef(steamType: self) {
            return "0"
        }
        // enums can generate an initial value
        if let instance = Metadata.findEnumDefaultInstance(steamType: self) {
            return instance
        }

        return swiftType.instance
    }
}

extension SteamType: CustomStringConvertible, Hashable, ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }

    public var description: String {
        name
    }
}

// MARK: SwiftType

/// A Swift type used in the generated interface, derived from a `SteamType`.
struct SwiftType {
    let name: String

    init(_ name: String) {
        self.name = name
    }

    init(_ steamType: SteamType) {
        self = steamType.swiftType
    }

    var isIntegerType: Bool {
        name.re_isMatch(#"^U?Int\d*$"#)
    }

    var isArrayType: Bool {
        name.re_isMatch(#"^\[.*\]$"#)
    }

    /// An expression to create a default instance of the type
    ///
    /// Not comprehensive - have to go via `SteamType.swiftTypeInstance` for reasons
    fileprivate var instance: SwiftExpression? {
        if swiftTypesWithoutDefaultValues.contains(self) {
            return nil
        }
        if let instance = swiftTypeDefaultValues[self] {
            return instance
        }
        if isArrayType {
            return "[]"
        }
        if isIntegerType {
            return "0"
        }

        // General fallback
        return SwiftExpression("\(name)()")
    }
}

extension SwiftType: CustomStringConvertible, Hashable, ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }

    public var description: String {
        name
    }
}

/// Default values for Swift types.  These just need to compile and
/// be broadly sensible.  Int types handled separately.
private let swiftTypeDefaultValues: [SwiftType : SwiftExpression] = [
    "Bool" : "false",
    "String" : #""""#,
    "Double" : "0",
    "Float" : "0",
]

/// Swift types that do not have a default value.
private let swiftTypesWithoutDefaultValues = Set<SwiftType>([
    "UnsafeRawPointer"
])

// MARK: SwiftExpression

/// A complete Swift expression that could serve as an rvalue
///
/// This is just a wrapper to help type safety and confusion
struct SwiftExpression {
    let expr: String

    init(_ expr: String) {
        self.expr = expr
    }
}

extension SwiftExpression: CustomStringConvertible, ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }

    public var description: String {
        expr
    }
}
