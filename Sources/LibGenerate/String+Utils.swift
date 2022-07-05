//
//  String+Utils.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// General string utils, content-agnostic

// MARK: Indentation

extension String {
    func indented(_ level: Int) -> String {
        guard !isEmpty else {
            return self
        }
        return String(repeating: "    ", count: level) + self
    }

    func commaAppend(_ string: String) -> String {
        isEmpty ? string : "\(self), \(string)"
    }
}

extension Sequence where Element == String {
    func indented(_ level: Int) -> [String] {
        map { $0.indented(level) }
    }

    var commaJoined: String {
        joined(separator: ", ")
    }
}

// MARK: Strongly-typed string-builder

protocol StringFungible: CustomStringConvertible, Hashable, ExpressibleByStringInterpolation, Comparable {
    init(_ val: String)
    init(_ val: Substring)
    init(_ val: any StringFungible)
    var _val: String { get }
}

extension StringFungible {
    init(_ val: Substring) {
        self.init(String(val))
    }
    init(_ val: any StringFungible) {
        self.init(val._val)
    }
    public init(stringLiteral value: String) {
        self.init(value)
    }

    public var description: String { _val }

    var isEmpty: Bool {
        _val.isEmpty
    }

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs._val < rhs._val
    }
}
