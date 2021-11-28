//
//  Constants.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

/// Code gen stuff from the 'consts' section.
///
/// This is a grab bag of stuff that is useful, nonsense in Swift, incomprehensible, and misplaced enums.
/// We'll figure it out as we go through the modules and hopefully get rid of the namespace in the end.
struct Constants {
    let io: IO
    let metadata: Metadata

    init(io: IO, metadata: Metadata) {
        self.io = io
        self.metadata = metadata
    }

    func generate() throws {
        var flatLines: [String] = []
        var invalidLines: [String] = []

        metadata.db.consts.values
            .sorted(by: { $0.name.asSwiftConstantName < $1.name.asSwiftConstantName })
            .forEach { c in
                if c.isNestedTypeDefValue {
                    invalidLines.append(c.nestedTypeDefDeclLines)
                } else {
                    flatLines.append(c.flatDeclLines)
                }
            }

        let contents = """
                       /// Namespace for Steamworks top-level constants
                       public enum SteamConstants {
                       \(flatLines.joined(separator: "\n\n"))
                       }

                       \(invalidLines.joined(separator: "\n\n"))
                       """

        try io.write(fileName: "Constants.swift", contents: contents)
    }
}

extension MetadataDB.Const {
    /// Spot constants that are invalid values of some typedef type
    var isNestedTypeDefValue: Bool {
        Metadata.isTypedef(steamType: type) &&
          (name.re_isMatch("invalid", options: .i) || nestedName != nil)
    }

    var nestedTypeDefDeclLines: String {
        nestedTypeDefDeclLines(fieldName: nestedName ?? "invalid")
    }

    private func nestedTypeDefDeclLines(fieldName: String) -> String {
        """
        extension \(type.asSwiftTypeName) {
            /// Steamworks `\(name)`
            public static let \(fieldName) = \(type.asSwiftTypeName)(\(value.asSwiftValue))
        }
        """
    }

    /// Fallback to a regular constant
    var flatDeclLines: String {
        """
            /// Steamworks `\(name)`
            public static let \(name.asSwiftConstantName) = \(type.asSwiftTypeName)(\(value.asSwiftValue))
        """
    }
}
