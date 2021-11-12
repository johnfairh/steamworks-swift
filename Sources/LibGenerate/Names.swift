//
//  Names.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// Utilities for converting Steamworks API names to Swift names.
extension String {
    /// * Drop unwanted suffixes
    /// * Drop leading capital E/I/C - used in SDK for enums/interfaces/classes
    var asSwiftTypeName: String {
        if let mapped = steamToSwiftTypes[self] {
            return mapped
        }
        return re_sub("_t\\b", with: "")
            .re_sub("^[CEI](?=[A-Z])", with: "")
            .replacingOccurrences(of: "_", with: "")
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
        if steamParameterNamesUnchanged.contains(self) {
            return self
        }
        if let exception = steamParameterNamesExceptions[self] {
            return exception
        }
        // 'steamID' is used a single hungarian character with various spellings
        if let matches = re_match("^p?(?:Out)?steamID(.+)$", options: .i) {
            return matches[1].asSwiftIdentifier
        }
        // 'i' usually means 'index' into some constant - see exceptions though
        if re_isMatch("^i[A-Z]") {
            return "\(dropFirst())Index".asSwiftIdentifier
        }
        // Ultimate fallback - strip lower-case prefix and convert
        return re_sub("^[a-z]*", with: "").asSwiftIdentifier
    }

    /// WBN to have a runtime function for this ...
    var backtickedIfNecessary: String {
        backtickKeywords.contains(self) ? "`\(self)`" : self
    }

    /// `self` is a a steam-declared (C++) type, represented in the Swift interface
    /// as `asSwiftTypeName`.  What Swift type is required to pass this to the
    /// steamworks interface?   This is normally `self`, the type itself, but there
    /// are special cases thanks to things like the Swift Clang Importer magicking
    /// strings and our usage of `Int` upstream.
    var asSwiftTypeForPassingIntoSteamworks: String? {
        if steamTypesPassedInTransparently.contains(self) {
            return nil
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

// How to represent a steam type in the Swift interface, hard-coded mappings
private let steamToSwiftTypes: [String : String] = [
    "const char *" : "String",
    "int" : "Int",
    "uint32" : "Int",
    "bool" : "Bool",
    "uint64_steamid" : "SteamID",
    "void *": "UnsafeMutableRawPointer"
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

// Parameter/field names to just pass straight through
private let steamParameterNamesUnchanged = Set<String>([
    "friendsGroupID", "steamID"
])

// Parameter/field names where no rules are followed and we
// have to hard-code
private let steamParameterNamesExceptions: [String : String] = [
    "cubData" : "dataSize",
    "iFriendFlags" : "friendFlags"
]

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
