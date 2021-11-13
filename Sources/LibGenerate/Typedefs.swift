//
//  Typedefs.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

/// Code gen the steamworks typedefs
///
/// We use simple boxed types to help getting them confused.  These types are all created by Steamworks
/// and returned by the API as handles for passing to other APIs, their values are opaque to users.
///
/// Looked at using typealiases to a generic box type with a phantom type cookie but is clumsier, still end
/// up with the same number of types really - and all the code here should be optimized away to nothing.
/// Needs `newtype` really.
struct Typedefs {
    let io: IO
    let metadata: Metadata

    init(io: IO, metadata: Metadata) {
        self.io = io
        self.metadata = metadata
    }

    func generate() throws {
        let contents = metadata.db.typedefs.values
            .filter(\.shouldGenerate)
            .map(\.generate)
            .joined(separator: "\n\n")
        try io.write(fileName: "Typedefs.swift", contents: contents)
    }
}

/// This is the only file that deals with raw C types, everything else
/// is in terms of these typealiases.
private extension String {
    static let cToSwiftTypeMap: [String : String] = [
        "unsigned int" : "UInt32",
        "unsigned long long" : "UInt64",
        "int" : "Int32",
        "short": "Int16",
    ]

    var asSwiftBaseType: String {
        guard let type = Self.cToSwiftTypeMap[self] else {
            preconditionFailure("Unknown typealias base type \(self)")
        }
        return type
    }
}

// MARK: Typedef generation

extension MetadataDB.Typedef {
    /// Skip integer typedefs like 'int64', we handle these separately
    var shouldGenerate: Bool {
        typedef.first!.isUppercase && Self.includeList.contains(typedef)
    }

    /// Bringup - opt-in just things we actually need for now
    static let includeList: Set<String> = [
        "FriendsGroupID_t",
        "AppId_t"
    ]

    var generate: String {
        let swiftType = type.asSwiftBaseType
        return """
               /// Steamworks `\(typedef)`
               public struct \(typedef.asSwiftTypeName) {
                   public let value: \(swiftType)
                   public init(_ value: \(swiftType)) { self.value = value }
               }

               extension \(typedef.asSwiftTypeName): SteamTypeAlias {}
               """
    }
}
