//
//  Errors.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

struct Failed: Error, CustomStringConvertible {
    let description: String
    init(_ description: String) {
        self.description = description
    }
}
