//
//  Errors.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation

struct Failed: Error, CustomStringConvertible {
    let description: String
    init(_ description: String) {
        self.description = description
    }
}
