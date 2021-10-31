//
//  Generator.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation
struct Generator {
    let io: IO

    init(packageRootPath: String) throws {
        try io = IO(packageRootURL: URL(fileURLWithPath: packageRootPath))
    }

    func report() {
        print("Input JSON: \(io.jsonURL.path)")
        print("Output directory: \(io.outputDirURL.path)")
    }
}
