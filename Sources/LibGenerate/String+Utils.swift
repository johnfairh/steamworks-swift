//
//  String+Utils.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

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

protocol StringFungible: CustomStringConvertible, Hashable, ExpressibleByStringInterpolation, Comparable {
    init(_ val: String)
    var _val: String { get }
}

extension StringFungible {
    public init(stringLiteral value: String) {
        self.init(value)
    }

    public var description: String { _val }

    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs._val < rhs._val
    }
}

