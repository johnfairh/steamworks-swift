//
//  Enums.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

/// Code gen the steamworks enums
///
/// `Enums`is responsible for the top-level enums.  Some structures have nested enums defined in
/// them -- we honour that structure (although it's probably a style bug) and have them generated from
/// the corresponding Struct definition.
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
        /// Steamworks `\(enumname)`
        public enum \(enumname.asSwiftTypeName): Int {
        \(values.map { generate(value: $0) }.joined(separator: "\n"))
        }

        """
    }

    /// The Swift declaration for the enum case
    func generate(value: Value) -> String {
        """
            /// Steamworks `\(value.name)`
            case \(generate(valueName: value.name)) = \(value.value)
        """
    }

    /// The prefix used by steamworks for values in this enum that we will
    /// remove because Swift has different namespacing rules
    var valuePrefix: String {
        "k_\(enumname)"
    }

    /// Convert the steamworks member name of this enum to Swift
    func generate(valueName: String) -> String {
        valueName
            .re_sub("^\(valuePrefix)_?", with: "")
            .asSwiftIdentifier
    }
}
