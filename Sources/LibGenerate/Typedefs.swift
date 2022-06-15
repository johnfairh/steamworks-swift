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
            .sorted(by: { $0.typedef < $1.typedef })
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
        "long long": "Int64",
        "int" : "Int32",
        "short": "Int16",
        "void *": "UnsafeMutableRawPointer", // living on the edge isteammatchmaking
        "char [1024]": "String", // guess, networking stuff is wild
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
        typedef.first!.isUppercase
    }

    var isFunctionPointer: Bool {
        type.contains("(*)")
    }

    var generate: String {
        isFunctionPointer ? generateFunction : generateBox
    }

    /// Normal case - integer/string boxed type
    var generateBox: String {
        let swiftRawType = type.asSwiftBaseType
        let swiftTypeName = typedef.asSwiftTypeName
        var decl = """
                   /// Steamworks `\(typedef)`
                   public struct \(swiftTypeName): Hashable {
                       public let value: \(swiftRawType)
                       public init(_ value: \(swiftRawType)) { self.value = value }
                   }

                   extension \(swiftTypeName): SteamTypeAlias, SteamCreatable {}
                   """
        if swiftRawType.isSwiftIntegerType {
            decl += """

                    extension \(swiftTypeName): ExpressibleByIntegerLiteral {
                        public init(integerLiteral value: \(swiftRawType)) { self.init(value) }
                    }
                    """
        }

        return decl
    }

    /// Function pointer types - guess for now, not sure how will actually handle at call site
    var generateFunction: String {
        guard let matches = type.re_match(#"\(([^*].*)\)"#) else {
            preconditionFailure("Can't extract arguments for function typedef \(self)")
        }
        let args = matches[1].components(separatedBy: ", ")
            .map(\.asSwiftTypeName)
            .map { $0.hasSuffix("*") ? $0.re_sub(" +\\*$", with: "").asSwiftTypeName : $0 }
            .joined(separator: ", ")
        // rn these all return void so don't bother converting
        return """
               /// Steamworks `\(typedef)`
               public typealias \(typedef.asSwiftTypeName) = (\(args)) -> Void
               """
    }
}
