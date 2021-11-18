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

    /// Decompose a C fixed-size array into its pieces
    var parseCArray: (String, Int)? {
        re_match(#"^(.*) \[(.+)\]$"#).flatMap { ($0[1], Int($0[2])!) }
    }

    /// * to lowerCamelCase
    /// * keep one leading underscore, erase all others
    /// * backticks if accidentally a Swift keyword
    /// * special cases to taste...
    var asSwiftIdentifier: String {
        switch self {
        case "IPv4", "IPv6": return self.lowercased()
        default:
            return re_sub("^_?[A-Z]+?(?=$|[^A-Z]|[A-Z][a-z])") { $0.lowercased() }
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
        // Ultimate fallback - strip lower-case prefix and convert
        return re_sub("^[a-z]*(?=[A-Z])") {
            steamParameterNameGoodPrefixes.contains($0) ? $0 : ""
        }.asSwiftIdentifier
    }

    /// 99+% of them start with "m_" which I vaguely remember is a MSVC++ meme, then the r-hung. stuff
    var asSwiftStructFieldName: String {
        re_sub("^m_", with: "").asSwiftParameterName
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

    var asExplicitSwiftTypeForPassingIntoSteamworks: String {
        steamTypesPassedInStrangely[self] ?? self
    }

    var asExplicitSwiftInstanceForPassingIntoSteamworks: String {
        let typename = asExplicitSwiftTypeForPassingIntoSteamworks
        let suffix = Metadata.isEnum(steamType: self) ? "(rawValue: 0)" : "()"
        return typename + suffix
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
    "uint64_steamid" : "SteamID",

    // Misc
    "EResult" : "SteamResult", // avoid clashing with Swift.Result -- review??
    "SteamParamStringArray_t" : "[String]", // weirdness, tbd

    // Names that end up duplicated after removing their initial letter
    "ECheckFileSignature": "CheckFileSignatureResult",
    "ERemoteStorageLocalFileChange" : "RemoteStorageLocalFileChangeType",
    "ESteamNetworkingConfigValue" : "SteamNetworkingConfigValueSetting"
]

// How to represent an array of steam types, special cases
private let steamArrayElementTypeToSwiftArrayTypes: [String : String] = [
    "char" : "String",
    "uint8" : "[UInt8]" // Should be Data but can't use Foundation inside Steamworks because C++!
]

// Steam types whose Swift type version is typesafe to pass
// directly (without a cast) to a Steamworks function expecting
// the Steam type.
private let steamTypesPassedInTransparently = Set<String>([
    "bool", "const char *", "void *"
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
