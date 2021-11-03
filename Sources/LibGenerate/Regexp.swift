//
//  Regexp.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

// Dumping this whole thing in for now, trim when we're done

// A concise wrapper of regular expression string operators based on perl etc.
// Routines return `String`s rather than native `Substring`s because >90% of
// users were immediately doing the conversion.

/// Provide concise aliases for regexp options
extension NSRegularExpression.Options {
    /// Case insensitive
    static let i = Self.caseInsensitive
    /// Comments
    static let x = Self.allowCommentsAndWhitespace
    /// Dot matches line endings
    static let s = Self.dotMatchesLineSeparators
    /// ^ $ match lines not text
    static let m = Self.anchorsMatchLines
    /// unicode-correct \b -- maybe this should always be on?
    static let w = Self.useUnicodeWordBoundaries
}

extension String {
    /// Split using a regular expression.
    ///
    /// Returns the pieces of the string, not including separators.  Zero-length pieces are not returned.
    ///
    /// - Parameter on: regexp to split on
    /// - Parameter options: regexp options
    func re_split(_ separator: String,
                  options: NSRegularExpression.Options = []) -> [String] {
        let re = try! NSRegularExpression(pattern: separator, options: options)

        // Find separator spans
        let sepRanges = re.matches(in: self, range: nsRange).map { Range($0.range, in: self)! }

        var nextIndex = startIndex
        var itemRanges = [Range<Index>]()

        // Add the range before each separator
        sepRanges.forEach { separator in
            itemRanges.append(nextIndex..<separator.lowerBound)
            nextIndex = separator.upperBound
        }
        // Add the range between final separator and end-of-string
        itemRanges.append(nextIndex..<endIndex)

        return itemRanges.filter({ !$0.isEmpty }).map { String(self[$0]) }
    }

    /// Search & replace using a regular expression
    ///
    /// - Parameter searchPattern: pattern to search for
    /// - Parameter template: template to replace with ($n for capture groups)
    /// - Parameter options: regex options
    func re_sub(_ searchPattern: String,
                with template: String,
                options: NSRegularExpression.Options = []) -> String {
        let re = try! NSRegularExpression(pattern: searchPattern, options: options)
        return re.stringByReplacingMatches(in: self, range: nsRange, withTemplate: template)
    }

    /// Search & replace using a regular expression and a closure to provide replacements
    ///
    /// - Parameter searchPattern: pattern to search for
    /// - Parameter options: regex options
    /// - Parameter replacer: callback to provide the replacement for each match
    func re_sub(_ searchPattern: String,
                options: NSRegularExpression.Options = [],
                replacer: (String) -> String) -> String {

        let re = try! NSRegularExpression(pattern: searchPattern, options: options)
        let matches = re.matches(in: self, range: nsRange).map { Range($0.range, in: self)! }

        var nextIndex = startIndex
        var output = ""

        // Handle each match and the unmatched portion preceding it
        matches.forEach { match in
            output += self[nextIndex..<match.lowerBound]
            output += replacer(String(self[match.lowerBound..<match.upperBound]))
            nextIndex = match.upperBound
        }
        // Stuff after the final match
        return output + self[nextIndex..<endIndex]
    }

    /// Check if the string matches a regular expression.
    ///
    /// See `String.re_match` to find out what is in the match.
    ///
    /// - Parameter pattern: pattern to match against
    /// - Parameter options: regex options
    func re_isMatch(_ pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        re_match(pattern, options: options) != nil
    }

    /// Regex match result data
    ///
    /// This is more than an array of strings because of named capture groups
    struct ReMatchResult {
        private let string: String
        private let textCheckingResult: NSTextCheckingResult

        fileprivate init(string: String, textCheckingResult: NSTextCheckingResult) {
            self.string = string
            self.textCheckingResult = textCheckingResult
        }

        /// Get the capture group contents.  Index 0 is the entire match.
        /// Returns the empty string for optional capture groups that were not matched.
        public subscript(rangeIndex: Int) -> String {
            let nsRange = textCheckingResult.range(at: rangeIndex)
            return String(string.from(nsRange: nsRange) ?? "")
        }

        /// Get the contents of a named capture group
        public subscript(captureGroupName: String) -> String {
            let nsRange = textCheckingResult.range(withName: captureGroupName)
            return String(string.from(nsRange: nsRange) ?? "")
        }
    }

    /// Match the regular expression against the string and return info about the first match
    ///
    /// - parameter pattern: pattern to match against
    /// - parameter options: regex options
    /// - returns: `ReMatchResult` object that can be queried for capture groups, or `nil` if there is no match
    func re_match(_ pattern: String,
                  options: NSRegularExpression.Options = []) -> ReMatchResult? {
        let re = try! NSRegularExpression(pattern: pattern, options: options)
        guard let match = re.firstMatch(in: self, range: nsRange) else {
            return nil
        }
        return ReMatchResult(string: self, textCheckingResult: match)
    }

    /// Match the regular expression against the string and return info about all matches
    ///
    /// - parameter pattern: pattern to match against
    /// - parameter options: regex options
    /// - returns: `ReMatchResult` objects, one per match.
    func re_matches(_ pattern: String,
                  options: NSRegularExpression.Options = []) -> [ReMatchResult] {
        let re = try! NSRegularExpression(pattern: pattern, options: options)
        return re.matches(in: self, range: nsRange).map {
            ReMatchResult(string: self, textCheckingResult: $0)
        }
    }

    /// Feel like this exists somewhere already...
    private var nsRange: NSRange {
        NSRange(startIndex..<endIndex, in: self)
    }

    /// And this too...
    private func from(nsRange: NSRange) -> Substring? {
        Range(nsRange, in: self).flatMap { self[$0] }
    }

    /// A version of the string escaped to retain its literal value when used in a pattern
    var re_escapedPattern: String {
        NSRegularExpression.escapedPattern(for: self)
    }
}
