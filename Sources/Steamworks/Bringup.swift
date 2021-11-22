//
//  Bringup.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

public struct GameID {
    public let gameID: UInt64
    public init(_ gameID: UInt64) {
        self.gameID = gameID
    }
    init(_ gameID: CGameID) {
        self.gameID = gameID.m_ulGameID
    }
}

// MARK: Bringup interfaces

public struct SteamUser {
    var interface: UnsafeMutablePointer<ISteamUser> {
        SteamAPI_SteamUser_v021()
    }

    public init() {
    }

    public var steamID: SteamID {
        SteamID(SteamAPI_ISteamUser_GetSteamID(interface))
    }
}

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
