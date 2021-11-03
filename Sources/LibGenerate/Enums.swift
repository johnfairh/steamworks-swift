//
//  Enums.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

// Code gen the steamworks enums
struct Enums {
    let io: IO
    let json: JSON

    init(io: IO, json: JSON) {
        self.io = io
        self.json = json
    }

    func generate() throws {
        let contents = json.api.enums.map(\.generated).joined(separator: "\n")
        try io.write(fileName: "Enums.swift", contents: contents)
    }
}

extension SteamAPI.Enum {
    /// The Swift declaration for the enum
    var generated: String {
        """
        /// Steamworks \(enumname)
        public enum \(enumname.asSwiftTypeName): Int {
        \(values.map { generate(value: $0) }.joined(separator: "\n"))
        }

        """
    }

    /// The Swift declaration for the enum case
    func generate(value: Value) -> String {
        """
            /// Steamworks \(value.name)
            case \(map(valueName: value.name)) = \(value.value)
        """
    }

    /// The prefix used by steamworks for values in this enum that we will
    /// remove because Swift has different namespacing rules
    var valuePrefix: String {
        "k_\(enumname)"
    }

    /// Convert the steamworks member name of this enum to Swift
    func map(valueName: String) -> String {
        valueName
            .re_sub("^\(valuePrefix)_?", with: "")
            .asSwiftIdentifier
    }
}

extension String {
    /// Drop unwanted suffixes
    var asSwiftTypeName: String {
        re_sub("_t$", with: "")
    }

    /// Camel-case-with-leading-caps -> Swift casing with backticks if there's a keyword clash
    var asSwiftIdentifier: String {
        re_sub("^[A-Z]+?(?=$|[a-z]|[A-Z][a-z])", replacer: \.asLowerCase)
            .backtickedIfNecessary
    }

    var asLowerCase: String {
        map { $0.lowercased() }.joined()
    }

    var backtickedIfNecessary: String {
        backtickKeywords.contains(self) ? "`\(self)`" : self
    }
}

/// Just what we've seen necessary
private let backtickKeywords = Set<String>([
    "public", "private", "internal", "for", "switch", "case", "default"
])
