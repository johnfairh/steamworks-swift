//
//  Version.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

struct Version {
    let io: IO

    init(io: IO) {
        self.io = io
    }

    /// Generate `SteamBaseAPI.steamworksVersion` by parsing the readme file.
    ///
    /// Readme file is a windows text file that swift + foundation utterly fail to figure out how
    /// to manage without explicit instructions.
    ///
    /// How long can I go without dropping in the regex library...
    func generate() throws {
        let readme = try String(contentsOf: io.readmeURL, encoding: .windowsCP1252)

        guard let versionLine = readme
            .split(separator: "\r\n")
            .first(where: { $0.hasPrefix("v") }) else {
            throw Failed("Couldn't parse version line from readme \(io.readmeURL.path)")
        }


        let tokens = versionLine.split(separator: " ")
        guard !tokens.isEmpty else {
            throw Failed("Couldn't parse version from readme \(versionLine)")
        }
        let version = tokens[0].dropFirst()

        let contents = """
        // MARK: SDK Version

        extension SteamBaseAPI {
            /// The version string of the Steamworks SDK that the Steamworks
            /// module was generated from, for example. "1.52".
            public static var steamworksVersion: String {
                "\(version)"
            }
        }
        """
        try io.write(fileName: "SteamBaseAPI+Version.swift", contents: contents)
    }
}
