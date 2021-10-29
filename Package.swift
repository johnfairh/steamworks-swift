// swift-tools-version:5.5

import PackageDescription

// Building Swift code importing CSteamworks requires cxx-interop,
// which is incompatible (rn) with Foundation.  So only Steamworks
// has those flags and only Steamworks imports CSteamworks, without
// re-exporting it.  Then clients of Steamworks can freely import
// Foundation.

let package = Package(
  name: "swift-steamworks",
  platforms: [
    .macOS("11.0"),
  ],
  products: [
    .library(
      name: "Steamworks",
      targets: ["Steamworks"]),
    .executable(
      name: "Client",
      targets: ["Client"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-log.git", from: "1.4.2")
  ],
  targets: [
    .systemLibrary(name: "CSteamworks"),
    .target(
        name: "Steamworks",
        dependencies: [
          "CSteamworks",
          .product(name: "Logging", package: "swift-log")
        ],
        swiftSettings: [
          .unsafeFlags(["-Xfrontend", "-enable-cxx-interop"])
        ]),
    .executableTarget(
        name: "Client",
        dependencies: ["Steamworks"]),
    .testTarget(
        name: "SteamworksTests",
        dependencies: ["Steamworks"])
    ],
    cxxLanguageStandard: .cxx11
)
