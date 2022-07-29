//
//  Names.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

// MARK: SteamName

/// A 'Regular' steam name, that is one that does not involve hungarian notation
///
/// So typically PascalCase, with random internal underscores.
/// The only bit of hungarian that creeps in is a leading 'B' for predicates...
struct SteamName: StringFungible {
    let name: String
    init(_ name: String) { self.name = name }
    var _val: String { name }

    /// * get rid of 'BIsBShortForBool'
    /// * to lowerCamelCase
    /// * keep one leading underscore, erase all others
    /// * backticks if accidentally a Swift keyword
    /// * special cases to taste...
    var swiftName: SwiftExpr {
        switch name {
        case "IPv4", "IPv6":
            return SwiftExpr(name.lowercased())
        default:
            return SwiftExpr(name.re_sub("^B(?=[A-Z].*[a-z])", with: "")
                                 .re_sub("^[A-Z]+?(?=$|[^A-Z]|[A-Z][a-z])") { $0.lowercased() }
                                 .re_sub("(?<!^)_", with: "")
                                 .backtickedIfNecessary)
        }
    }

    /// Get a C++ 'flat' steamworks API function -- if we shim it then it has a leading "C"
    var normalizedApiName: SteamName {
        SteamName(name.drop(while: { $0 == "C" }))
    }
}

private extension String {
    /// WBN to have a runtime function for this ...
    var backtickedIfNecessary: String {
        Self.backtickKeywords.contains(self) ? "`\(self)`" : self
    }

    /// Just what we've seen necessary
    static let backtickKeywords = Set<String>([
        "case", "default", "for", "internal", "private", "protocol", "public",
        "switch", "init", "repeat", "class"
    ])
}

// MARK: SteamHungarianName

/// For method parameters and structure members and constant names
///
/// These have a hungarian prefix and then a `SteamName` thing.
/// Try to get rid of the hungarian prefix without losing meaning.
///
/// Annoyingly `SHOUTY_CAPS_NAMES` are mixed into this same space
/// so we have to cope with them too.
struct SteamHungarianName: StringFungible {
    let name: String
    init(_ name: String) { self.name = name }
    var _val: String { name }

    var swiftName: SwiftExpr {
        // All upper-case -> SHOUTY_NAME which happens for those constants that
        // are not hungarian.  Don't blame me.
        if !name.re_isMatch("[a-z]") {
            return SwiftExpr(name)
        }
        // 'm_' etc. prefix just drop and recurse, what follows is hungarian
        if let match = name.re_match("^[a-z]_(.*)$") {
            return SteamHungarianName(match[1]).swiftName
        }
        // 'steamID' is used as a single hungarian character with various spellings
        if let matches = name.re_match("^p?(?:Out)?steamID(.+)$", options: .i) {
            return SteamName(matches[1]).swiftName
        }
        // 'i' usually means 'index' into some constant, bit cargo culty though
        if let match = name.re_match("^i([A-Z].*?)(?:Index)?$") {
            return SteamName("\(match[1])Index").swiftName
        }
        // 'cch' special cases, avoid collapsing 'cchFoo' and 'pchFoo' to the same thing
        if let match = name.re_match("^p?c(?:ch|u?b)([A-Z][a-z]*.*?)(?:Length|Size)?$") {
            return SteamName("\(match[1])Size").swiftName
        }
        // Normal - strip lower-case prefix and convert
        return SteamName(name.re_sub("^[a-z]*(?=[A-Z])") {
            Self.goodPrefixes.contains($0) ? $0 : ""
        }).swiftName
    }

    // Parameter/field hungarian-smelling prefixes that are actually
    // parts of the name...
    private static let goodPrefixes = Set<String>([
        "friends", "steam", "csecs", "identity", "addr", "debug",
        "rtime", "src", "preview", "origins", "handles"
    ])
}
