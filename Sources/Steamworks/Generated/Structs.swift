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
    public let steamID: SteamID
    public let changeFlags: PersonaChange

    init(_ steam: PersonaStateChange_t) {
        steamID = SteamID(steam.m_ulSteamID)
        changeFlags = PersonaChange(rawValue: UInt32(steam.m_nChangeFlags))
    }
}

public struct FriendsGetFollowerCount: SteamCreatable {
    public let result: Result
    public let steamID: SteamID
    public let count: Int

    init(_ steam: FriendsGetFollowerCount_t) {
        result = Result(steam.m_eResult)
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
