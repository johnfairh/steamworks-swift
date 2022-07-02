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
    /// * Get rid of C++ nesting - everything top-level in Swift
    /// * Drop leading capital E/I/C - used in SDK for enums/interfaces/classes (but not for structs...)
    var asSwiftTypeName: String {
        if let arrayMatch = parseCArray {
            if let special = steamArrayElementTypeToSwiftArrayTypes[arrayMatch.element] {
                return special
            }
            return "[\(arrayMatch.element.asSwiftTypeName)]"
        }
        if let mapped = steamToSwiftTypes[self] ?? Metadata.steamToSwiftTypeName(self) {
            return mapped
        }
        if let constMatch = re_match("^const (.*)$") {
            return constMatch[1].asSwiftTypeName
        }
        var name = re_sub("_t\\b", with: "")
            .re_sub("^.*::", with: "")
            .re_sub("Id\\b", with: "ID")
        if !Metadata.isStruct(steamType: self) {
            name = name.re_sub("^[CEI](?=[A-Z])", with: "")
        }
        return name.replacingOccurrences(of: "_", with: "")
    }

    /// Swift expression for 'casting' from this string, itself a Swift expression, to the given Swift type
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
    var parseCArray: (element: String, size: Int)? {
        re_match(#"^(.*) \[(.+)\]$"#).flatMap { (element: $0[1], size: Int($0[2])!) }
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

    /// Drop one layer of C pointer/reference from a type
    var desuffixed: String {
        re_sub(" *(\\*|&)$", with: "")
    }

    var isSwiftIntegerType: Bool {
        re_isMatch(#"^U?Int\d*$"#) || re_isMatch(#"^C(?:Unsigned)?(?:Short|Int|Long|LongLong)$"#)
    }

    var isSwiftArrayType: Bool {
        re_isMatch(#"^\[.*\]$"#)
    }
}

/// Just what we've seen necessary
private let backtickKeywords = Set<String>([
    "case", "default", "for", "internal", "private", "protocol", "public",
    "switch", "init", "repeat"
])

// How to represent a steam type in the Swift interface, special cases
private let steamToSwiftTypes: [String : String] = [
    // Base types
    "const char *" : "String",
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

// How to represent an array of steam types (in a struct field,) special cases
private let steamArrayElementTypeToSwiftArrayTypes: [String : String] = [
    "char" : "String",
    "uint8" : "[UInt8]" // Should be Data (?) but can't use Foundation inside Steamworks because C++!
]

// Parameter/field hungarian-smelling prefixes that are actually
// parts of the name...
private let steamParameterNameGoodPrefixes = Set<String>([
    "friends", "steam", "csecs", "identity", "addr", "debug",
    "rtime", "src", "preview", "origins", "handles"
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
