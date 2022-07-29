//
//  Constants.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
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
            .sorted(by: { $0.name.swiftName < $1.name.swiftName })
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

/// Tuned specifically for the subset used to define constants
struct SteamConstantExpr: StringFungible {
    let name: String
    init(_ name: String) { self.name = name }
    var _val: String { name }

    var swiftExpr: SwiftExpr {
        SwiftExpr(name.re_sub(#"\(.*?\) *"#, with: "") // drop weird cast
                      .re_sub("(?<=^-|~) ", with: "")  // no spacing for unary operators ...
                      .re_sub("ull$", with: ""))       // no int-length suffix
    }
}

extension MetadataDB.Const {
    /// Spot constants that are invalid values of some typedef type
    var isNestedTypeDefValue: Bool {
        Metadata.isTypedef(steamType: type) &&
            (name.name.re_isMatch("invalid", options: .i) || nestedName != nil)
    }

    var nestedTypeDefDeclLines: String {
        nestedTypeDefDeclLines(fieldName: nestedName ?? "invalid")
    }

    private func nestedTypeDefDeclLines(fieldName: SwiftExpr) -> String {
        let swiftType = type.swiftType
        return """
               extension \(swiftType) {
                   /// Steamworks `\(name)`
                   public static let \(fieldName) = \(swiftType)(\(value.swiftExpr))
               }
               """
    }

    /// Fallback to a regular constant
    var flatDeclLines: String {
        """
            /// Steamworks `\(name)`
            public static let \(name.swiftName) = \(type.swiftType)(\(value.swiftExpr))
        """
    }
}
