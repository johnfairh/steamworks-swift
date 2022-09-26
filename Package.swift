// swift-tools-version:5.7

// pkg-config error?  See https://github.com/johnfairh/steamworks-swift-sdk

import PackageDescription

// We need the steam headers to build Steamworks and the steam libraries
// to link (and run) programs that use it.
//
// SPM doesn't support binary targets for libraries so we provide a very
// unofficial and dubious installation of the Steamworks SDK along with a
// pkgconfig setup.
//
// We need to provide UnsafeFlags to enable C++ interop.
//
// If C++ interop becomes part of real Swift then this can go away and clients
// will be able to depend on tags
//

let steamworksSwiftFlags: [SwiftSetting] = [
    .unsafeFlags([
      "-Xfrontend", "-enable-cxx-interop",
    ])
]

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
    .systemLibrary(
      name: "CSteamworks",
      pkgConfig: "steamworks-swift"
    ),
    .systemLibrary(
      name: "CSteamworksEncryptedAppTicket",
      pkgConfig: "steamworks-swift"
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
      ]
    ),
    .executableTarget(
      name: "Client",
      dependencies: ["Steamworks", "SteamworksHelpers"]
    ),
    .executableTarget(
      name: "TicketClient",
      dependencies: ["SteamworksEncryptedAppTicket", "SteamworksHelpers"]
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
      dependencies: ["Steamworks", "SteamworksHelpers", "LibGenerate"],
      exclude: ["Fixtures"]
    )
  ],
  cxxLanguageStandard: .cxx11
)
