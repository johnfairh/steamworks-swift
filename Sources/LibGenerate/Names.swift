//
//  Names.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//


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
    var swiftName: String {
        switch name {
        case "IPv4", "IPv6":
            return name.lowercased()
        default:
            return name.re_sub("^B(?=[A-Z].*[a-z])", with: "")
                .re_sub("^[A-Z]+?(?=$|[^A-Z]|[A-Z][a-z])") { $0.lowercased() }
                .re_sub("(?<!^)_", with: "")
                .backtickedIfNecessary
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
        "switch", "init", "repeat"
    ])
}

/// Utilities for converting Steamworks API names to Swift names.
extension String {
    /// For method parameters and structure members and constant names
    ///
    /// Try to get rid of the hungarian prefix without losing meaning.
    private var asSwiftHungarianName: String {
        // All upper-case -> SHOUTY_NAME which happens sometimes
        if !re_isMatch("[a-z]") {
            return self
        }
        // 'm_' etc. prefix just drop and recurse, what follows is hungarian
        if let match = re_match("^[a-z]_(.*)$") {
            return match[1].asSwiftHungarianName
        }
        // 'steamID' is used as a single hungarian character with various spellings
        if let matches = re_match("^p?(?:Out)?steamID(.+)$", options: .i) {
            return SteamName(matches[1]).swiftName
        }
        // 'i' usually means 'index' into some constant, bit cargo culty though
        if let match = re_match("^i([A-Z].*?)(?:Index)?$") {
            return SteamName("\(match[1])Index").swiftName
        }
        // 'cch' special cases, avoid collapsing 'cchFoo' and 'pchFoo' to the same thing
        if let match = re_match("^p?c(?:ch|u?b)([A-Z][a-z]*.*?)(?:Length|Size)?$") {
            return SteamName("\(match[1])Size").swiftName
        }
        // Normal - strip lower-case prefix and convert
        return SteamName(re_sub("^[a-z]*(?=[A-Z])") {
            steamParameterNameGoodPrefixes.contains($0) ? $0 : ""
        }).swiftName
    }

    /// Parameters - special behaviour for 'out' ness that we don't want
    var asSwiftParameterName: String {
        let name = asSwiftHungarianName
        if name.re_isMatch("^out[A-Z]") {
            return name.asSwiftHungarianName
        }
        if name.hasSuffix("TimedOut") {
            return name
        }
        return name.re_sub("(?<=[a-z])Out$", with: "")
    }

    /// 99+% of them start with "m_" which I vaguely remember is a MSVC++ meme, then the r-hung. stuff
    var asSwiftStructFieldName: String {
        asSwiftHungarianName
    }

    /// Mix of SHOUTY_C_DEFINE and k_IsForKonstant names
    var asSwiftConstantName: String {
        return asSwiftHungarianName
    }

    /// Some kind of sizing arithmetic expression involving parameter names
    var asSwiftParameterExpression: String {
        self.split(separator: " ")
            .map { String($0).asSwiftParameterName }
            .joined(separator: " ")
    }

    /// Tuned specifically for the subset used to define constants
    var asSwiftValue: String {
        re_sub(#"\(.*?\) *"#, with: "")     // drop weird cast
            .re_sub("(?<=^-|~) ", with: "") // no spacing for unary operators ...
            .re_sub("ull$", with: "")       // no int-length suffix
    }
}

// Parameter/field hungarian-smelling prefixes that are actually
// parts of the name...
private let steamParameterNameGoodPrefixes = Set<String>([
    "friends", "steam", "csecs", "identity", "addr", "debug",
    "rtime", "src", "preview", "origins", "handles"
])
