//
//  Bringup.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

// MARK: SteamID

public struct SteamID {
    public let steamID: UInt64
    public init(_ steamID: UInt64) {
        self.steamID = steamID
    }
    init(_ steamID: CSteamID) {
        var kludge = steamID
        self.steamID = kludge.ConvertToUint64()
    }
}

extension UInt64 {
    init(_ steamID: SteamID) {
        self = steamID.steamID
    }
}

public struct GameID {
    public let gameID: UInt64
    public init(_ gameID: UInt64) {
        self.gameID = gameID
    }
    init(_ gameID: CGameID) {
        self.gameID = gameID.m_ulGameID
    }
}

// Extremely terrifying extension to a C++ class ...
extension CSteamID {
    init(_ steamID: SteamID) {
        self.init(steamID.steamID)
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
