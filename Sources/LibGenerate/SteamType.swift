//
//  SteamType.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

// MARK: SteamType

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

    /// Convert this C++ spelling to something the Swift compiler understands
    ///
    /// Currently only has to deals with unsuffixed/prefixed types.  Basically for
    /// generating extensions to nested C++ types.
    var swiftCompilerSpelling: String {
        name.replacingOccurrences(of: "::", with: ".")
    }

    /// Drop one layer of C pointer/reference from a type
    fileprivate var desuffixed: SteamType {
        SteamType(name.re_sub(" *(\\*|&)$", with: ""))
    }
}

// MARK: SteamType -> SwiftType

extension SteamType {
    /// Get the Swift type used in the public Swift API to represent this C++ type
    ///
    /// This is usually not a type that can be passed to the C++ API: that is the
    /// `SwiftNativeType`.
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
            return SteamType(constMatch[1]).swiftType
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

    /// Does this C++ type look like a pointer but is actually something else?
    /// Mostly for `const char *` -> `String`
    fileprivate var isPointerTypePassedByValue: Bool {
        name.hasSuffix("*") && steamToSwiftTypes[self] != nil
    }

    /// If returned from a C++ function, can this be assigned without a cast to a `swiftType` variable
    /// thanks to happenstance or Clang importer magic.
    var isReturnedWithoutCast: Bool {
        steamTypesReturnedWithoutCast.contains(self)
    }

    /// If passed as a parameter to a C++ function, can a value of `swiftType` be passed directly
    /// thanks to happenstance or Clang importer magic?  If not then a cast to the `nativeSwiftType`
    /// is required.
    var isPassedToFunctionWithoutCast: Bool {
        steamTypesPassedInWithoutCast.contains(self)
    }
}

/// How to represent a steam type in the Swift interface, special cases
private let steamToSwiftTypes: [SteamType : SwiftType] = [
    // Base types
    "const char *" : "String",
    "char *" : "String",
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

/// How to represent an array of steam types (eg. in a struct field,) special cases
private let steamArrayElementTypeToSwiftArrayTypes: [SteamType : SwiftType] = [
    "char" : "String",
    "uint8" : "[UInt8]" // Should be Data (?) but can't use Foundation inside Steamworks because C++!
]

/// Steam types that, when returned from a C++ function, can be directly assigned
/// to a variable of their `SwiftType` without a cast.
private let steamTypesReturnedWithoutCast = Set<SteamType>([
    "bool", "void"
])

/// Steam types whose `SwiftType` is typesafe to pass directly (without a cast) to
/// a C++ function expecting the type.
private let steamTypesPassedInWithoutCast = Set<SteamType>([
    "bool", "const char *", "void *", "uint8 *",
    "const void *", "float", "double", "uint64",

    "SteamAPIWarningMessageHook_t" // function pointer special case
])

// MARK: SteamParamType, SteamReturnType

/// A C++ type used in function parameter (and return) position
///
/// The NATIVE type is the C++ type as-declared in the json and seen in the header files.
///
/// The SWIFTAPI type is the C++ type that we use to generate the Swift type.  Broadly this
/// means "pass by value not reference" but exceptions.
///
/// ```
/// void * -> void * -> UnsafeMutablePointer
/// const char * -> const char * -> String
/// int32 -> int32 -> Int
/// Foo_t * -> Foo_t -> Foo
/// const Foo & -> const Foo -> Foo
/// void -> void -> Void
/// ```
struct SteamParamType {
    private let nativeType: SteamType
    private let swiftApiSteamType: SteamType

    init(_ nativeType: String) {
        self.nativeType = SteamType(nativeType)
        if self.nativeType.isPointerTypePassedByValue {
            swiftApiSteamType = self.nativeType
        } else {
            swiftApiSteamType = self.nativeType.desuffixed
        }
    }

    var swiftType: SwiftType {
        swiftApiSteamType.swiftType
    }

    /// What type cast, if any, is required on a function returning this type?
    var returnValueCast: SwiftType? {
        swiftApiSteamType.isReturnedWithoutCast ? nil : swiftType
    }

    /// XXX explain this nonsense then track down the ref to the function below this one
    var needsParameterCast: Bool {
        !swiftApiSteamType.isPassedToFunctionWithoutCast
    }

    /// This is a native steam (C) type
    ///
    /// It's being used in a function parameter context.
    /// Detect if this is (probably) supposed to have `out` / `in_out` semantics and return the pointee type
    ///
    /// 'probably' - steam APIs not const-correct for in-arrays, callers have to deal.
    var isProbablyOutParameter: Bool {
        nativeType.isProbablyOutParameter
    }
}

extension SteamParamType: Hashable, CustomStringConvertible {
    var description: String {
        preconditionFailure("Error, can't generally string-interpolate this?") // XXX
    }
}

typealias SteamReturnType = SteamParamType

extension SteamType {
    /// Policy for what parameters in C++ function definitions are treated as 'out' direction, that is
    /// output from functions (includes in-out).  Very hand-rolled.
    fileprivate var isProbablyOutParameter: Bool {
        if name.hasPrefix("const") { // if const then not out
            return false
        }

        if !name.re_isMatch("(?:&|\\*)$") { // if not a pointer/ref then not out
            return false
        }

        if name == "char *" { // special case for non-const strings
            return true
        }

        if isPointerTypePassedByValue {
            // some kind of buffer, like `uint8 *` - model as in-param to keep buffer
            // allocation on the client side
            return false
        }
        return true
    }
}

// MARK: SteamType -> SwiftInstance

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

// MARK: SteamType -> SwiftNativeType

extension SteamType {

    var swiftNativeType: SwiftNativeType {
        // deal with fixed-size arrays, rare
        if let arrayDetails = parseArray,
           let arrayType = steamArrayElementTypeToSwiftArrayTypes[arrayDetails.element] {
            return SwiftNativeType(arrayType.name)
        }
        return steamToSwiftNativeTypes[self]!
    }
}

private let steamToSwiftNativeTypes: [SteamType : SwiftNativeType] = [
    "unsigned int" : "CUnsignedInt",
    "unsigned long long" : "CUnsignedLongLong",
    "long long": "CLongLong",
    "int" : "CInt",
    "short": "CShort",
    "void *": "UnsafeMutableRawPointer", // living on the edge isteammatchmaking
]

// MARK: SteamType boilerplate

extension SteamType: CustomStringConvertible, Hashable, ExpressibleByStringLiteral, Comparable {
    public init(stringLiteral value: String) {
        self.init(value)
    }

    public var description: String {
        name
    }

    static func < (lhs: SteamType, rhs: SteamType) -> Bool {
        lhs.name < rhs.name
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

    var isVoid: Bool {
        name == "Void"
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

protocol SwiftTypeUtils {
    var name: String { get }
}

extension SwiftTypeUtils {
    var isIntegerType: Bool {
        name.re_isMatch(#"^U?Int\d*$"#) || name.re_isMatch(#"^C(?:Unsigned)?(?:Short|Int|Long(?:Long)?)$"#)
    }

    var isArrayType: Bool {
        name.re_isMatch(#"^\[.*\]$"#)
    }
}

extension SwiftType: CustomStringConvertible, Hashable, ExpressibleByStringLiteral, SwiftTypeUtils {
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

// MARK: SwiftNativeType

/// The Swift type required to pass a value to a C++ function parameter with some declared `SteamType`.
struct SwiftNativeType {
    let name: String

    init(_ name: String) {
        self.name = name
    }

    init(_ steamType: SteamType) {
        self = steamType.swiftNativeType
    }
}

extension SwiftNativeType: CustomStringConvertible, Hashable, ExpressibleByStringLiteral, Comparable, SwiftTypeUtils {
    public init(stringLiteral value: String) {
        self.init(value)
    }

    public var description: String {
        name
    }

    static func < (lhs: SwiftNativeType, rhs: SwiftNativeType) -> Bool {
        lhs.name < rhs.name
    }
}

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
