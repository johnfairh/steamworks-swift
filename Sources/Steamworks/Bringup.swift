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

// MARK: Bringup typedefs

public struct SteamInputActionEvent {}
public struct SteamNetConnectionStatusChangedCallback {}
public struct SteamNetAuthenticationStatus {}
public struct SteamRelayNetworkStatus {}
public struct SteamNetworkingMessagesSessionRequest {}
public struct SteamNetworkingMessagesSessionFailed {}

public struct SteamServersConnected: SteamCreatable {
    init(_ steam: SteamServersConnected_t) {
    }
}

public struct PersonaStateChange: SteamCreatable {
    public let steamID: SteamID
    public let changeFlags: PersonaChange

    init(_ steam: PersonaStateChange_t) {
        steamID = SteamID(steam.m_ulSteamID)
        changeFlags = PersonaChange(rawValue: UInt32(steam.m_nChangeFlags))
    }
}

public struct FriendsGetFollowerCount: SteamCreatable {
    public let result: SteamResult
    public let steamID: SteamID
    public let count: Int

    init(_ steam: FriendsGetFollowerCount_t) {
        result = SteamResult(steam.m_eResult)
        steamID = SteamID(steam.m_steamID)
        count = Int(steam.m_nCount)
    }
}

public struct SetPersonaNameResponse: SteamCreatable {
    init(_ steam: SetPersonaNameResponse_t) {
    }
}

public struct DownloadClanActivityCountsResult: SteamCreatable {
    init(_ steam: DownloadClanActivityCountsResult_t) {
    }
}

public struct ClanOfficerListResponse: SteamCreatable {
    init(_ steam: ClanOfficerListResponse_t) {
    }
}

public struct JoinClanChatRoomCompletionResult: SteamCreatable {
    init(_ steam: JoinClanChatRoomCompletionResult_t) {
    }
}

public struct FriendsIsFollowing: SteamCreatable {
    init(_ steam: FriendsIsFollowing_t) {
    }
}

public struct FriendsEnumerateFollowingList: SteamCreatable {
    init(_ steam: FriendsEnumerateFollowingList_t) {
    }
}

public struct FriendGameInfo: SteamCreatable {
    init(_ steam: FriendGameInfo_t) {
    }
}

public struct UserStatsReceived: SteamCreatable {
    public let gameID: UInt64
    public let result: SteamResult
    public let user: SteamID

    init(_ steam: UserStatsReceived_t) {
        gameID = UInt64(steam.m_nGameID)
        result = SteamResult(steam.m_eResult)
        user = SteamID(steam.m_steamIDUser)
    }
}
