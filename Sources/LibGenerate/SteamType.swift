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
struct SteamType: StringFungible {
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
    var swiftCompilerSpelling: SwiftNativeType {
        SwiftNativeType(name.replacingOccurrences(of: "::", with: "."))
    }

    /// Drop one layer of C pointer/reference from a type
    fileprivate var desuffixed: SteamType {
        SteamType(name.re_sub(" *(\\*|&)$", with: ""))
    }

    var _val: String { name }
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
            return "[\(arrayMatch.element.swiftType)]"
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

// MARK: SteamType for function parameter and return

/// A C++ type used in function parameter (and return) position
///
/// The NATIVE type is the C++ type as-declared in the json and seen in the header files.
///
/// The 'asParameter/ReturnType' type is the C++ type that we use to generate the Swift type.
/// Broadly this means "pass by value not reference" but exceptions.
///
/// ```
/// void * -> void * -> UnsafeMutablePointer
/// const char * -> const char * -> String
/// int32 -> int32 -> Int
/// Foo_t * -> Foo_t -> Foo
/// const Foo & -> const Foo -> Foo
/// void -> void -> Void
/// ```
extension SteamType {
    /// The API type to reason about for parameters
    var asParameterType: SteamType {
        if isPointerTypePassedByValue {
            return self
        } else {
            return self.desuffixed
        }
    }

    /// The API type to reason about for return values
    var asReturnType: SteamType {
        asParameterType
    }

    /// Does an instance of `swiftType` need a cast to be passed as a parameter to a C++ function declared
    /// to take the native type
    var needsParameterCast: Bool {
        !isPassedToFunctionWithoutCast
    }

    /// What type cast, if any, is required to pass something of `swiftType` as a C++ function
    /// parameter of this steam type?
    var parameterCast: SwiftNativeType? {
        needsParameterCast ? swiftNativeType : nil
    }

    /// What type cast, if any, is required on a C++ function returning the native type to convert to the
    /// `swiftType`?
    var returnValueCast: SwiftType? {
        isReturnedWithoutCast ? nil : swiftType
    }

    /// Policy for what parameters in C++ function definitions are treated as 'out' direction, that is
    /// output from functions (includes in-out).  Very hand-rolled.
    /// 'probably' - steam APIs not const-correct for in-arrays, callers have to deal.
    var isProbablyOutParameter: Bool {
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

// MARK: SteamType -> Swift instance

extension SteamType {
    /// Get a safe-ish instance of the Swift version of this steam type
    ///
    /// This is a bit messy because we can't do this entirely from the Swift type -- would need to
    /// restructure to do all the name mapping once up-front in Metadata, maybe not the worst thing in the world!
    /// XXX
    var swiftTypeInstance: SwiftExpr? {
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
    /// Find the Swift type required to pass this C++ type to a C++ function.
    /// We call this the Swift _native_ type `SwiftNativeType`, contrast with `SwiftType` used in
    /// the public API.
    ///
    /// This is generally a type with the same name of the C++ type, but some special cases.
    var swiftNativeType: SwiftNativeType {
        if let arrayDetails = parseArray,
           let arrayType = steamArrayElementTypeToSwiftArrayTypes[arrayDetails.element] {
            return SwiftNativeType(arrayType.name)
        }

        if let unConsted = name.re_match("^const (.*?)( &)?$") {
            return SteamType(unConsted[1]).swiftNativeType
        }

        if let special = steamToSwiftNativeTypes[self] {
            return special
        }

        if let optionSetType = Metadata.isOptionSetEnumPassedUnpredictably(steamType: self) {
            return optionSetType
        }

        // General case: the compiler's spelling of this C++ type.
        //
        // Watch out though: if the SwiftType has the same name, which happens
        // when the Steam type is something dumb like `SteamSomething` without
        // any prefix or suffix, then we have to add the module prefix to get
        // the right type.
        let result = swiftCompilerSpelling
        if result.name == swiftType.name {
            return SwiftNativeType("CSteamworks.\(result)")
        }
        return result
    }
}

private let steamToSwiftNativeTypes: [SteamType : SwiftNativeType] = [
    "char" : "CChar",
    "short": "CShort",
    "unsigned short" : "CUnsignedShort",
    "bool" : "CBool",
    "int" : "CInt",
    "unsigned int" : "CUnsignedInt",
    "long long": "CLongLong",
    "unsigned long long" : "CUnsignedLongLong",
    "float": "CFloat",
    "double": "CDouble",

    "void *": "UnsafeMutableRawPointer",

    "uint64_steamid" : "UInt64", // XXX how is this actually defined
    "uint64_gameid" : "UInt64",

    "SteamNetworkingMessage_t *": "OpaquePointer?" // struct not imported plus weird pointer semantics
]

// MARK: SwiftType

/// A Swift type used in the generated interface, derived from a `SteamType`.
struct SwiftType: SwiftTypeUtils, StringFungible {
    let name: String

    init(_ name: String) {
        self.name = name
    }

    var isVoid: Bool {
        name == "Void"
    }

    /// An expression to create a default instance of the type
    ///
    /// Not comprehensive - have to go via `SteamType.swiftTypeInstance` for reasons
    fileprivate var instance: SwiftExpr? {
        if swiftTypesWithoutDefaultValues.contains(self) {
            return nil
        }
        if let instance = swiftTypeDefaultValues[self] {
            return instance
        }
        if isArray {
            return "[]"
        }
        if isInteger {
            return "0"
        }

        // General fallback
        return SwiftExpr("\(name)()")
    }

    var _val: String { name }
}

/// Default values for Swift types.  These just need to compile and
/// be broadly sensible.  Int types handled separately.
private let swiftTypeDefaultValues: [SwiftType : SwiftExpr] = [
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
struct SwiftNativeType: StringFungible, SwiftTypeUtils {
    let name: String

    init(_ name: String) {
        self.name = name
    }

    func instance(_ initWith: SwiftExpr = "") -> SwiftExpr {
        // kludge here, relies on SteamType == SteamNativeType for enums...
        let suffix = Metadata.isEnum(steamType: SteamType(name)) ? "(rawValue: 0)" : "(\(initWith))"
        return SwiftExpr(name + suffix)
    }

    var _val: String { name }
}

/// Helper to share between `SwiftType` and `SwiftNativeType`
protocol SwiftTypeUtils {
    var name: String { get }
}

extension SwiftTypeUtils {
    var isInteger: Bool {
        name.re_isMatch(#"^U?Int\d*$"#) || name.re_isMatch(#"^C(?:Unsigned)?(?:Short|Int|Long(?:Long)?)$"#)
    }

    var isArray: Bool {
        name.re_isMatch(#"^\[.*\]$"#)
    }

    var isOptional: Bool {
        name.hasSuffix("?")
    }
}

// MARK: SwiftExpr

/// A complete Swift expression that could serve as an rvalue
///
/// This is just a wrapper to help type safety and confusion
struct SwiftExpr: StringFungible {
    let expr: String

    init(_ expr: String) {
        self.expr = expr
    }

    /// Swift expression for 'casting' from this string, itself a Swift expression, to the given Swift type
    func asCast(to: (any SwiftTypeUtils)?) -> SwiftExpr {
        guard let to = to else {
            return self
        }
        guard to.isOptional else {
            return SwiftExpr("\(to)(\(self))")
        }
        return SwiftExpr("\(self).map { \(to.name.dropLast())($0) }")
    }

    var _val: String { expr }
}
