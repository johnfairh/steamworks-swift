//
//  Structs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

public struct SteamServersConnected: SteamCreatable {
    init(_ steam: SteamServersConnected_t) {
    }
}

public struct PersonaStateChange: SteamCreatable {
    public let steamID: UInt64
    public let changeFlags: Int32

    init(_ steam: PersonaStateChange_t) {
        steamID = steam.m_ulSteamID
        changeFlags = steam.m_nChangeFlags
    }
}

public struct FriendsGetFollowerCount: SteamCreatable {
    public let result: UInt32
    public let steamID: UInt64
    public let count: Int32

    init(_ steam: FriendsGetFollowerCount_t) {
        result = steam.m_eResult.rawValue
        var kludge = steam.m_steamID /* y u no const mf */
        steamID = kludge.ConvertToUint64()
        count = steam.m_nCount
    }
}
