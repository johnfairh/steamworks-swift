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
        return re_sub("_t$", with: "")
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
        return steamTypesPassedInStrangely[self] ?? self
    }

    var asSwiftTypeForPassingOutOfSteamworks: String? {
        if steamTypesPassedOutTransparently.contains(self) {
            return nil
        }
        return asSwiftTypeName
    }
}

/// Just what we've seen necessary
private let backtickKeywords = Set<String>([
    "public", "private", "internal", "for", "switch", "case", "default"
])

// How to represent a steam type in the Swift interface, hard-coded mappings
private let steamToSwiftTypes: [String : String] = [
    "const char *" : "String",
    "int" : "Int",
    "bool" : "Bool",
    "uint64_steamid" : "SteamID"
]

// Steam types whose Swift type version is typesafe to pass
// directly (without a cast) to a Steamworks function expecting
// the Steam type.
private let steamTypesPassedInTransparently = Set<String>([
    "bool", "const char *"
])

// Steam types whose Swift type version is typesafe to pass
// directly (without a cast) from a Steamworks function to a
// Swift value expecting the corresponding Swift type.
private let steamTypesPassedOutTransparently = Set<String>([
    "bool", "void",
    "SteamAPICall_t" // bit of a hack, maybe, probably better to special-case in interface-gen
])

// Steam types whose Swift type version needs a non-standard
// cast to pass to a Steamworks function expecting the Steam type.
private let steamTypesPassedInStrangely: [String : String] = [
    "int" : "Int32",
    "uint64_steamid" : "UInt64"
]
