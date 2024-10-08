// swift-tools-version:6.0

//
// "couldn't find pc file for steamworks-swift" ?
// See https://github.com/johnfairh/steamworks-swift#how-to-use-this-project
//

import PackageDescription

//
// We need the steam headers to build Steamworks and the steam libraries
// to both link and run programs that use it.
//
// SPM doesn't support binary library targets.  Boo.
//
// Offer two ways of working around this:
//
// 1) Install the SDK to /usr/local (or some prefix) so the files are
//    all found via a pkg-config file.
//
//    This is very smooth but means you've done a system installation of
//    stuff that can vary per-steam client app, not ideal.
//
// 2) a) Use "unsafe" flags to point the build at the SDK files inside the
//       package, AND
//
//    b) ...require the end developer to supply the unsafe library flags to
//       their build AND
//
//       [This should be avoidable by making Steamworks a dynamic library,
//        which works fine in SPM but makes Xcode produce one of its classic
//        batshit error messages]
//
//    c) ...require the end developer to copy the steam library into their
//       binary's directory for runtime
//
//    This avoids the system installation but is tough on developers.
//    
// Way (1) is easier in general so document that as the norm.  It also removes
// the 'unsafe' flags so that SemVer is achievable.
//
// Way (2) is supported here and used if pkg-config is not available. One
// concrete thing this allows is a `swift build` of *this* project without any
// other system setup.
//

// To further complicate things, while SPM executes this file in the user's
// environment, Xcode thinks it knows what $PATH ought to be.  Try to spot this
// so that Xcode in SPM mode can depend on Steamworks.

var steamworksSwiftFlags: [SwiftSetting] = [
    .interoperabilityMode(.Cxx),
    .enableExperimentalFeature("AccessLevelOnImport"),
    .enableExperimentalFeature("StrictConcurrency")
]

let pkgConfigSetting = "steamworks-swift"

// Look away now...

var clientLinkerSettings: [LinkerSetting] = []

import Foundation

let pkgConfigPath: String
let pathArgs: [String]

let envPath = Context.environment["PATH"] ?? ""
if envPath.contains("/usr/local/bin") {
    pathArgs = []
} else {
    // Xcode's broken PATH or no standard pkgconfig; make a guess
    pathArgs = ["-P", "\(envPath):/usr/local/bin"]
}

let hasPkgConfig =
  (try? Process.run(URL(fileURLWithPath: "/usr/bin/env"),
                    arguments: pathArgs + ["pkg-config", "steamworks-swift"])).map { p in
    p.waitUntilExit()
    return p.terminationStatus == 0
  } ?? false

if !hasPkgConfig {
  let curdir = Context.packageDirectory
  steamworksSwiftFlags += [
    .unsafeFlags(["-I\(curdir)/sdk/redist/include"])
  ]

  let linkBase = "-L\(curdir)/sdk/redist/lib/"
  let platforms: [(String, Platform)] = [
    ("osx", .macOS),
    ("linux64", .linux),
    ("win64", .windows)
  ]

  clientLinkerSettings += platforms.map {
    .unsafeFlags([linkBase + $0.0], .when(platforms: [$0.1]))
  }
}

// ...safe to look

let package = Package(
  name: "steamworks-swift",
  platforms: [
    .macOS("14.0"),
  ],
  products: [
    .library(
      name: "Steamworks",
      targets: ["Steamworks"]),
    .library(
      name: "SteamworksEncryptedAppTicket",
      targets: ["SteamworksEncryptedAppTicket"]),
    .library(
      name: "SteamworksHelpers",
      targets: ["SteamworksHelpers"]),
    .executable(
      name: "Client",
      targets: ["Client"]),
    .executable(
      name: "TicketClient",
      targets: ["TicketClient"]),  
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-log.git", from: "1.4.2"),
    .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.5"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
    .package(url: "https://github.com/apple/swift-atomics.git", branch: "main"),
  ],
  targets: [
    .systemLibrary(
      name: "CSteamworks",
      pkgConfig: pkgConfigSetting
    ),
    .systemLibrary(
      name: "CSteamworksEncryptedAppTicket",
      pkgConfig: pkgConfigSetting
    ),
    .target(
      name: "Steamworks",
      dependencies: [
        "CSteamworks",
        .product(name: "Logging", package: "swift-log")
      ],
      swiftSettings: steamworksSwiftFlags
    ),
    .target(
      name: "SteamworksEncryptedAppTicket",
      dependencies: [
        "Steamworks",
        "CSteamworksEncryptedAppTicket"
      ],  
      swiftSettings: steamworksSwiftFlags
    ),
    .target(
      name: "SteamworksHelpers",
      dependencies: [
        "Steamworks"
      ],
      swiftSettings: [.interoperabilityMode(.Cxx)] // lies lies lies
    ),
    .target(
      name: "SteamworksConcurrency",
      dependencies: [
        "Steamworks",
        .product(name: "Atomics", package: "swift-atomics",
                 condition: .when(platforms: [.macOS]))
      ],
      swiftSettings: [.interoperabilityMode(.Cxx)] // lies lies lies
    ),
    .executableTarget(
      name: "Client",
      dependencies: ["Steamworks", "SteamworksHelpers"],
      swiftSettings: [.interoperabilityMode(.Cxx)], // lies lies lies
      linkerSettings: clientLinkerSettings
    ),
    .executableTarget(
      name: "TicketClient",
      dependencies: ["SteamworksEncryptedAppTicket", "SteamworksHelpers"],
      swiftSettings: [.interoperabilityMode(.Cxx)], // lies lies lies
      linkerSettings: clientLinkerSettings
    ),
    .executableTarget(
      name: "Generate",
      dependencies: ["LibGenerate"]
    ),
    .target(
      name: "LibGenerate",
      dependencies: ["Yams"],
      resources: [
        .copy("Resources/steam_api_patch.yaml"),
        .copy("Resources/steam_api_extra.json"),
        .copy("Resources/EXPECTED_SDK")
      ]
    ),
    .testTarget(
      name: "SteamworksTests",
      dependencies: [
        .target(name: "Steamworks"),
        .target(name: "SteamworksHelpers"),
        .target(name: "SteamworksConcurrency"),
        .target(name: "LibGenerate",
            condition: .when(platforms: [.macOS])),
      ],
      exclude: ["Fixtures"],
      swiftSettings: [.interoperabilityMode(.Cxx)], // lies lies lies
      linkerSettings: clientLinkerSettings
    )
  ],
  cxxLanguageStandard: .cxx11
)
