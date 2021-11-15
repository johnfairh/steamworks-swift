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

// MARK: Bringup structs

extension SteamServersConnected: SteamCreatable {
    init(_ steam: SteamServersConnected_t) {
    }
}

extension PersonaStateChange: SteamCreatable {
    init(_ steam: PersonaStateChange_t) {
        steamID = SteamID(steam.m_ulSteamID)
        changeFlags = PersonaChange(rawValue: UInt32(steam.m_nChangeFlags))
    }
}

extension FriendsGetFollowerCount: SteamCreatable {
    init(_ steam: FriendsGetFollowerCount_t) {
        result = SteamResult(steam.m_eResult)
        steamID = SteamID(steam.m_steamID)
        count = Int(steam.m_nCount)
    }
}

extension SetPersonaNameResponse: SteamCreatable {
    init(_ steam: SetPersonaNameResponse_t) {
    }
}

extension DownloadClanActivityCountsResult: SteamCreatable {
    init(_ steam: DownloadClanActivityCountsResult_t) {
    }
}

extension ClanOfficerListResponse: SteamCreatable {
    init(_ steam: ClanOfficerListResponse_t) {
    }
}

extension JoinClanChatRoomCompletionResult: SteamCreatable {
    init(_ steam: JoinClanChatRoomCompletionResult_t) {
    }
}

extension FriendsIsFollowing: SteamCreatable {
    init(_ steam: FriendsIsFollowing_t) {
    }
}

extension FriendsEnumerateFollowingList: SteamCreatable {
    init(_ steam: FriendsEnumerateFollowingList_t) {
    }
}

extension FriendGameInfo: SteamCreatable {
    init(_ steam: FriendGameInfo_t) {
    }
}

extension UserStatsReceived: SteamCreatable {
    init(_ steam: UserStatsReceived_t) {
        gameID = UInt64(steam.m_nGameID)
        result = SteamResult(steam.m_eResult)
        user = SteamID(steam.m_steamIDUser)
    }
}
