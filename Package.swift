// swift-tools-version:5.7

import PackageDescription

// Building Swift code importing CSteamworks requires cxx-interop,
// which is incompatible (rn) with Foundation.  So only Steamworks
// has those flags and only Steamworks imports CSteamworks, without
// re-exporting it.  Then clients of Steamworks can freely import
// Foundation.

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
      swiftSettings: [
        .unsafeFlags(["-Xfrontend", "-enable-cxx-interop"])
      ]
    ),
    .target(
      name: "SteamworksEncryptedAppTicket",
      dependencies: [
        "Steamworks",
        "CSteamworksEncryptedAppTicket"
      ],  
      swiftSettings: [
        .unsafeFlags(["-Xfrontend", "-enable-cxx-interop"])
      ]
    ),
    .target(
      name: "SteamworksHelpers",
      dependencies: [
        "Steamworks"
      ]
    ),
    .executableTarget(
        name: "Client",
        dependencies: ["Steamworks", "SteamworksHelpers"]),
    .executableTarget(
        name: "TicketClient",
        dependencies: ["SteamworksEncryptedAppTicket"]),
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
