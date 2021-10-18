// swift-tools-version:5.5

import PackageDescription

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
            name: "Demo",
            targets: ["Demo"])
    ],
    dependencies: [
    ],
    targets: [
        .systemLibrary(name: "CSteamworks"),
        .target(
            name: "Steamworks",
            dependencies: []),
        .executableTarget(
            name: "Demo",
            dependencies: ["CSteamworks"]),
        .testTarget(
            name: "SteamworksTests",
            dependencies: ["Steamworks"])
    ],
    cxxLanguageStandard: .cxx11
)
