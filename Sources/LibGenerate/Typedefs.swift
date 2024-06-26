//
//  Typedefs.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
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
    let generated: Generated

    init(io: IO, metadata: Metadata, generated: Generated) {
        self.io = io
        self.metadata = metadata
        self.generated = generated
    }

    func generate() throws {
        let contents = metadata.db.typedefs.values
            .filter(\.shouldGenerate)
            .sorted(by: { $0.typedef < $1.typedef })
            .map { generated.add(type: $0.typedef.swiftType, kind: .typedef); return $0 }
            .map(\.generate)
            .joined(separator: "\n\n")
        try io.write(fileName: "Typedefs.swift", contents: contents)
    }
}

// MARK: Typedef generation

extension MetadataDB.Typedef {
    /// Skip integer typedefs like 'int64', we handle these separately
    var shouldGenerate: Bool {
        typedef.name.first!.isUppercase
    }

    var generate: String {
        type.isFunctionPointer ? generateFunction : generateBox
    }

    /// Normal case - integer/string boxed type
    var generateBox: String {
        let swiftNativeType = type.swiftNativeType
        let swiftType = typedef.swiftType
        var decl = """
                   /// Steamworks `\(typedef)`
                   public struct \(swiftType): Hashable, Sendable {

                   """
        if swiftNativeType.isSendable {
            decl += """
                        public let value: \(swiftNativeType)
                        public init(_ value: \(swiftNativeType)) { self.value = value }
                    }
                    """
        } else {
            decl += """
                        private let _value: Steam\(swiftNativeType)
                        public var value: \(swiftNativeType) { _value.base }
                        public init(_ value: \(swiftNativeType)) { self._value = .init(value) }
                    }
                    """
        }
        decl += """


                extension \(swiftType): SteamTypeAlias, SteamCreatable {}
                """

        if swiftNativeType.isInteger {
            decl += """

                    extension \(swiftType): ExpressibleByIntegerLiteral {
                        public init(integerLiteral value: \(swiftNativeType)) { self.init(value) }
                    }
                    """
        }

        return decl
    }

    /// Function pointer types - not common
    var generateFunction: String {
        """
        /// Steamworks `\(typedef)`
        public typealias \(typedef.swiftType) = \(type.swiftTypeForFunctionPointer)
        """
    }
}

/// Private helpers for function-pointer decoding, pretty janky & not general
private extension SteamType {
    /// Is this a function pointer type?
    var isFunctionPointer: Bool {
        name.re_isMatch(#"\(\*[ _a-zA-Z]*\)"#)
    }

    /// Generate the Swift API type
    var swiftTypeForFunctionPointer: SwiftType {
        guard let matches = name.re_match(#"\(([^*].*)\)"#) else {
            preconditionFailure("Can't extract arguments for function-pointer typedef \(self)")
        }
        let args = matches[1].components(separatedBy: ", ")
            .map { SteamType($0).asParameterType.swiftType.name }
            .joined(separator: ", ")
        // rn these all return void so don't bother converting
        return "(\(args)) -> Void"
    }
}
