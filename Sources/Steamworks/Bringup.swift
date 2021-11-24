//
//  Bringup.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

// MARK: Bringup interfaces

public struct SteamUserStats {
    var interface: UnsafeMutablePointer<ISteamUserStats> {
        SteamAPI_SteamUserStats_v012()
    }

    public init() {
    }

    public func requestCurrentStats() -> Bool {
        SteamAPI_ISteamUserStats_RequestCurrentStats(interface)
    }
}
