//
//  Names.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// Utilities for converting Steamworks API names to Swift names.
extension String {
    /// * Convert arrays
    /// * Drop unwanted suffixes
    /// * Drop leading capital E/I/C - used in SDK for enums/interfaces/classes (but not for structs...)
    var asSwiftTypeName: String {
        if let match = re_match(#"^(.*) +\[.*\]"#) {
            if let special = steamArrayElementTypeToSwiftArrayTypes[match[1]] {
                return special
            }
            return "[\(match[1].asSwiftTypeName)]"
        }
        if let mapped = steamToSwiftTypes[self] {
            return mapped
        }
        var name = re_sub("_t\\b", with: "")
            .re_sub("^.*::", with: "")
            .re_sub("Id\\b", with: "ID")
        if !Metadata.isStruct(steamType: self) {
            name = name.re_sub("^[CEI](?=[A-Z])", with: "")
        }
        return name.replacingOccurrences(of: "_", with: "")
    }

    /// Given a canonical C++ type name, convert it to how Swift sees it
    var asSwiftNameForSteamType: String {
        replacingOccurrences(of: "::", with: ".")
    }

    /// Swift expression for 'casting' from this string, itself a Swift expression, to the given type
    func asCast(to: String?) -> String {
        guard let to = to else {
            return self
        }
        guard to.hasSuffix("?") else {
            return "\(to)(\(self))"
        }
        return "\(self).map { \(to.dropLast())($0) }"
    }

    /// Decompose a C fixed-size array into its pieces
    var parseCArray: (String, Int)? {
        re_match(#"^(.*) \[(.+)\]$"#).flatMap { ($0[1], Int($0[2])!) }
    }

    /// * get rid of 'BIsBShortForBool'
    /// * to lowerCamelCase
    /// * keep one leading underscore, erase all others
    /// * backticks if accidentally a Swift keyword
    /// * special cases to taste...
    var asSwiftIdentifier: String {
        switch self {
        case "IPv4", "IPv6": return self.lowercased()
        default:
            return re_sub("^B(?=[A-Z].*[a-z])", with: "")
                .re_sub("^[A-Z]+?(?=$|[^A-Z]|[A-Z][a-z])") { $0.lowercased() }
                .re_sub("(?<!^)_", with: "")
                .backtickedIfNecessary
        }
    }

    /// For method parameters and (derivedly) structure members
    ///
    /// Try to get rid of the hungarian prefix without losing meaning.
    var asSwiftParameterName: String {
        if let exception = steamParameterNamesExceptions[self] {
            return exception
        }
        // 'steamID' is used as a single hungarian character with various spellings
        if let matches = re_match("^p?(?:Out)?steamID(.+)$", options: .i) {
            return matches[1].asSwiftIdentifier
        }
        // 'i' usually means 'index' into some constant, bit cargo culty though
        if let match = re_match("^i([A-Z].*?)(?:Index)?$") {
            return "\(match[1])Index".asSwiftIdentifier
        }
        // 'cch' special cases, avoid collapsing 'cchFoo' and 'pchFoo' to the same thing
        if let match = re_match("^c(?:ch|ub)([A-Z][a-z]+)$") {
            return "\(match[1])Count".asSwiftIdentifier
        }
        // Ultimate fallback - strip lower-case prefix and convert
        return re_sub("^[a-z]*(?=[A-Z])") {
            steamParameterNameGoodPrefixes.contains($0) ? $0 : ""
        }.asSwiftIdentifier
    }

    /// 99+% of them start with "m_" which I vaguely remember is a MSVC++ meme, then the r-hung. stuff
    var asSwiftStructFieldName: String {
        re_sub("^m_", with: "").asSwiftParameterName
    }

    /// Mix of SHOUTY_C_DEFINE and k_IsForKonstant names
    var asSwiftConstantName: String {
        if !re_isMatch("[a-z]") {
            return self
        }
        return re_sub("^k_", with: "").asSwiftParameterName
    }

    /// Tuned specifically for the subset used to define constants
    var asSwiftValue: String {
        re_sub(#"\(.*?\) *"#, with: "")     // drop weird cast
            .re_sub("(?<=^-|~) ", with: "") // no spacing for unary operators ...
            .re_sub("ull$", with: "")       // no int-length suffix
    }

    /// WBN to have a runtime function for this ...
    var backtickedIfNecessary: String {
        backtickKeywords.contains(self) ? "`\(self)`" : self
    }

    /// `self` is a a steam-declared (C++) type, represented in the Swift interface
    /// as `asSwiftTypeName`.  What Swift type is required to pass this to the
    /// steamworks interface?   This is normally `self`, the type itself, but there
    /// are special cases thanks to things like the Swift Clang Importer magicking
    /// strings and our usage of `Int` upstream.  `OptionSet` enums are
    /// confusing again - see `EnumConvertible` discussion.
    var asSwiftTypeForPassingIntoSteamworks: String? {
        if steamTypesPassedInTransparently.contains(self) {
            return nil
        }
        if Metadata.isOptionSetEnum(steamType: self) {
            return "Int32"
        }
        return asExplicitSwiftTypeForPassingIntoSteamworks
    }

    /// As above but with explicit types, not used calling a C function with clang importer magic
    var asExplicitSwiftTypeForPassingIntoSteamworks: String {
        steamTypesPassedInStrangely[self] ?? self
    }

    /// For constructing a temporary instance, in Swift, to pass by ref to Steamworks
    /// and then to be copied back out to the Swift type.
    var asExplicitSwiftInstanceForPassingIntoSteamworks: String {
        let typename = asExplicitSwiftTypeForPassingIntoSteamworks
        let suffix = Metadata.isEnum(steamType: self) ? "(rawValue: 0)" : "()"
        return typename + suffix
    }

    /// Can a steam type be used transparently as an out param in Swift.
    /// Probably never be anything more than Bool!
    var isTransparentOutType: Bool {
        self == "bool"
    }

    var asSwiftTypeForPassingOutOfSteamworks: String? {
        if steamTypesPassedOutTransparently.contains(self) {
            return nil
        }
        return asSwiftTypeName
    }

    /// Drop one layer of C pointers from a type
    var depointered: String {
        re_sub(" *\\*$", with: "")
    }
}

/// Just what we've seen necessary
private let backtickKeywords = Set<String>([
    "case", "default", "for", "internal", "private", "protocol", "public", "switch"
])

// How to represent a steam type in the Swift interface, special cases
private let steamToSwiftTypes: [String : String] = [
    // Base types
    "const char *" : "String",
    "int" : "Int",
    "uint8" : "Int",
    "uint16" : "Int",
    "uint32" : "Int",
    "int32" : "Int",
    "int64" : "Int",
    "int64_t" : "Int", // steamnetworking == disaster
    "uint64": "UInt64",
    "bool" : "Bool",
    "float" : "Float",
    "double" : "Double",
    "void *" : "UnsafeMutableRawPointer",
    "uint8 *" : "UnsafeMutablePointer<UInt8>",
    "uint64_steamid" : "SteamID",

    // Misc
    "SteamParamStringArray_t" : "[String]", // weirdness, tbd
    "unsigned int": "Int", // temp workaround for dumb CSteamID constants, to delete

    // Names that end up duplicated after removing their initial letter
    "ECheckFileSignature": "CheckFileSignatureResult",
    "ERemoteStorageLocalFileChange" : "RemoteStorageLocalFileChangeType",
    "ESteamNetworkingConfigValue" : "SteamNetworkingConfigValueSetting"
]

// How to represent an array of steam types (in a struct field,) special cases
private let steamArrayElementTypeToSwiftArrayTypes: [String : String] = [
    "char" : "String",
    "uint8" : "[UInt8]" // Should be Data but can't use Foundation inside Steamworks because C++!
]

// Steam types whose Swift type version is typesafe to pass
// directly (without a cast) to a Steamworks function expecting
// the Steam type.
private let steamTypesPassedInTransparently = Set<String>([
    "bool", "const char *", "void *", "uint8 *"
])

// Steam types whose Swift type version is typesafe to pass
// directly (without a cast) from a Steamworks function to a
// Swift value expecting the corresponding Swift type.
private let steamTypesPassedOutTransparently = Set<String>([
    "bool", "void"
])

// Steam types whose Swift type version needs a non-standard
// cast to pass to a Steamworks function expecting the Steam type.
private let steamTypesPassedInStrangely: [String : String] = [
    "int" : "Int32",
    "bool" : "Bool",
    "uint64_steamid" : "UInt64"
]

// Parameter/field names where no rules are followed and we
// have to hard-code something acceptable
private let steamParameterNamesExceptions: [String : String] = [
    "cubData" : "dataSize",
    "iFriendFlags" : "friendFlags"
]

// Parameter/field hungarian-smelling prefixes that are actually
// parts of the name...
private let steamParameterNameGoodPrefixes = Set<String>([
    "friends", "steam", "csecs", "identity", "addr", "debug", "rtime"
])

extension String {
    func indented(_ level: Int) -> String {
        guard !isEmpty else {
            return self
        }
        return String(repeating: "    ", count: level) + self
    }
}

extension Sequence where Element == String {
    func indented(_ level: Int) -> [String] {
        map { $0.indented(level) }
    }
}
