// swift-tools-version:5.7

import PackageDescription

// We need the steam headers to build Steamworks and the steam libraries
// to link (and run) programs that use it.
//
// SPM doesn't support binary targets for libraries so we fake it by
// providing those files and injecting the search paths here using
// UnsafeFlags.  Moved to this from requiring outer-level `-Xswiftc`
// things to make `swift build` work out of the box: we already need to
// provide UnsafeFlags to enable C++ interop so that is no great loss.
//
// If C++ interop becomes part of real Swift then will need revision to
// enable clients to depend on tags: something like only injecting the
// unsafe search-path flags if they're not set already.

import class Foundation.FileManager
let curdir = FileManager.default.currentDirectoryPath

let steamworksSwiftFlags: [SwiftSetting] = [
    .unsafeFlags([
      "-Xfrontend", "-enable-cxx-interop",
      "-I\(curdir)/redist/include"
    ])
]

let linkBase = "-L\(curdir)/redist/lib/"
let platforms: [(String, Platform)] = [
    ("osx", .macOS),
    ("linux64", .linux),
    ("win64", .windows)
]

let clientLinkerFlags = platforms.map {
    LinkerSetting.unsafeFlags([linkBase + $0.0], .when(platforms: [$0.1]))
}

let package = Package(
  name: "steamworks-swift",
  platforms: [
    .macOS("11.0"),
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
    .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.6")
  ],
  targets: [
    .systemLibrary(name: "CSteamworks"),
    .systemLibrary(name: "CSteamworksEncryptedAppTicket"),
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
      ]
    ),
    .executableTarget(
        name: "Client",
        dependencies: ["Steamworks", "SteamworksHelpers"],
        linkerSettings: clientLinkerFlags
    ),
    .executableTarget(
        name: "TicketClient",
        dependencies: ["SteamworksEncryptedAppTicket", "SteamworksHelpers"],
        linkerSettings: clientLinkerFlags
    ),
    .executableTarget(
        name: "Generate",
        dependencies: ["LibGenerate"]),
    .target(
        name: "LibGenerate",
        dependencies: [
        "Yams"
        ],
        resources: [
          .copy("Resources/steam_api_patch.yaml"),
          .copy("Resources/steam_api_extra.json"),
          .copy("Resources/EXPECTED_SDK")
        ]),
    .testTarget(
        name: "SteamworksTests",
        dependencies: ["Steamworks", "SteamworksHelpers", "LibGenerate"],
        exclude: ["Fixtures"])
  ],
  cxxLanguageStandard: .cxx11
)
