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
        let contents = """
                       /// Namespace for Steamworks top-level constants
                       public enum SteamConstants {
                       \(metadata.db.consts.values.map(\.flatDeclLine).joined(separator: "\n\n"))
                       }
                       """

        try io.write(fileName: "Constants.swift", contents: contents)
    }
}

extension MetadataDB.Const {
    var flatDeclLine: String {
        """
            /// Steamworks `\(name)`
            public static let \(name.asSwiftConstantName) = \(type.asSwiftTypeName)(\(value.asSwiftValue))
        """
    }
}
