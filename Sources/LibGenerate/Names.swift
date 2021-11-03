//
//  Names.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// Utilities for converting Steamworks API names to Swift names.
extension String {
    /// * Drop unwanted suffixes
    /// * Drop leading capital E - used in SDK for enums
    var asSwiftTypeName: String {
        re_sub("_t$", with: "")
            .re_sub("^E(?=[A-Z])", with: "")
    }

    /// * to lowerCamelCase
    /// * backticks if accidentally a Swift keyword
    /// * special cases to taste...
    var asSwiftIdentifier: String {
        switch self {
        case "IPv4", "IPv6": return self.lowercased()
        default:
            return re_sub("^[A-Z]+?(?=$|[^A-Z]|[A-Z][a-z])") { $0.lowercased() }
                .backtickedIfNecessary
        }
    }

    /// WBN to have a runtime function for this ...
    var backtickedIfNecessary: String {
        backtickKeywords.contains(self) ? "`\(self)`" : self
    }
}

/// Just what we've seen necessary
private let backtickKeywords = Set<String>([
    "public", "private", "internal", "for", "switch", "case", "default"
])
