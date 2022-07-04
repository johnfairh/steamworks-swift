//
//  Names.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// Utilities for converting Steamworks API names to Swift names.
extension String {
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

    /// For method parameters and structure members
    ///
    /// Try to get rid of the hungarian prefix without losing meaning.
    private var asSwiftHungarianName: String {
        // 'steamID' is used as a single hungarian character with various spellings
        if let matches = re_match("^p?(?:Out)?steamID(.+)$", options: .i) {
            return matches[1].asSwiftIdentifier
        }
        // 'i' usually means 'index' into some constant, bit cargo culty though
        if let match = re_match("^i([A-Z].*?)(?:Index)?$") {
            return "\(match[1])Index".asSwiftIdentifier
        }
        // 'cch' special cases, avoid collapsing 'cchFoo' and 'pchFoo' to the same thing
        if let match = re_match("^p?c(?:ch|u?b)([A-Z][a-z]*.*?)(?:Length|Size)?$") {
            return "\(match[1])Size".asSwiftIdentifier
        }
        // Normal - strip lower-case prefix and convert
        let name = re_sub("^[a-z]*(?=[A-Z])") {
            steamParameterNameGoodPrefixes.contains($0) ? $0 : ""
        }.asSwiftIdentifier
        return name
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
        re_sub("^m_", with: "").asSwiftHungarianName
    }

    /// Mix of SHOUTY_C_DEFINE and k_IsForKonstant names
    var asSwiftConstantName: String {
        if !re_isMatch("[a-z]") {
            return self
        }
        return re_sub("^k_", with: "").asSwiftParameterName
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

    /// WBN to have a runtime function for this ...
    var backtickedIfNecessary: String {
        backtickKeywords.contains(self) ? "`\(self)`" : self
    }
}

/// Just what we've seen necessary
private let backtickKeywords = Set<String>([
    "case", "default", "for", "internal", "private", "protocol", "public",
    "switch", "init", "repeat"
])

// Parameter/field hungarian-smelling prefixes that are actually
// parts of the name...
private let steamParameterNameGoodPrefixes = Set<String>([
    "friends", "steam", "csecs", "identity", "addr", "debug",
    "rtime", "src", "preview", "origins", "handles"
])
