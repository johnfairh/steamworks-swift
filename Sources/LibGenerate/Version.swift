//
//  Version.swift
//  Generate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

struct Version {
    let io: IO

    init(io: IO) {
        self.io = io
    }

    /// Generate `SteamBaseAPI.steamworksVersion` by parsing the readme file.
    func generate() throws {
        let readme = try io.loadReadme()
        let version = try parseVersion(readme: readme)
        io.checkSDKVersion(version)

        let contents = """
        // MARK: SDK version

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

    /// Grab version number from the file
    ///
    /// Format is like:
    /// ```
    /// ----------------------------------------------------------------
    /// v1.52b 14th September 2021
    /// ----------------------------------------------------------------
    /// ```
    func parseVersion(readme: String) throws -> String {
        guard let match = readme.re_match("^v(.*?) ", options: .m) else {
            throw Failed("Couldn't parse version line from readme \(io.readmeURL.path)")
        }
        return match[1]
    }
}
