//
//  SteamFriends+Methods.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

// MARK: Interface methods
public extension SteamFriends {
    /// Steamworks `ISteamFriends::GetUserRestrictions()`
    var userRestrictions: UserRestriction {
        UserRestriction(SteamAPI_ISteamFriends_GetUserRestrictions(interface))
    }

    /// Steamworks `ISteamFriends::ClearRichPresence()`
    func clearRichPresence() {
        SteamAPI_ISteamFriends_ClearRichPresence(interface)
    }

    /// Steamworks `ISteamFriends::SetPersonaName()`
    func setPersonaName(pchPersonaName: String, completion: @escaping (SetPersonaNameResponse) -> Void) {
        let rc = SteamAPI_ISteamFriends_SetPersonaName(interface, pchPersonaName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::GetPersonaState()`
    var personaState: PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetPersonaState(interface))
    }

    /// Steamworks `ISteamFriends::GetClanChatMessage()`
    func getClanChatMessage(steamIDClanChat: SteamID, iMessage: Int, prgchText: UnsafeMutableRawPointer, cchTextMax: Int, peChatEntryType: inout ChatEntryType, psteamidChatter: inout SteamID) -> Int {
        var tmp_peChatEntryType = EChatEntryType(rawValue: 0)
        var tmp_psteamidChatter = CSteamID()
        let rc = Int(SteamAPI_ISteamFriends_GetClanChatMessage(interface, UInt64(steamIDClanChat), Int32(iMessage), prgchText, Int32(cchTextMax), &tmp_peChatEntryType, &tmp_psteamidChatter))
        peChatEntryType = ChatEntryType(tmp_peChatEntryType)
        psteamidChatter = SteamID(tmp_psteamidChatter)
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersListF()`
    func getFriendsGroupMembersListF(friendsGroupID: FriendsGroupID, pOutSteamIDMembers: inout [SteamID], nMembersCount: Int, pSomeInts: [Int]) -> Int {
        let tmp_pOutSteamIDMembers = UnsafeMutableBufferPointer<CSteamID>.allocate(capacity: nMembersCount)
        defer { tmp_pOutSteamIDMembers.deallocate() }
        var tmp_pSomeInts = pSomeInts.map { Int32($0) }
        let rc = Int(SteamAPI_ISteamFriends_GetFriendsGroupMembersListF(interface, FriendsGroupID_t(friendsGroupID), tmp_pOutSteamIDMembers.baseAddress, Int32(nMembersCount), &tmp_pSomeInts, Int32(pSomeInts.count)))
        if rc == 5 {
            pOutSteamIDMembers = tmp_pOutSteamIDMembers.map { SteamID($0) }
        }
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersListR()`
    func getFriendsGroupMembersListR(friendsGroupID: FriendsGroupID, pSomeInts: [Int]) -> Bool {
        var tmp_pSomeInts = pSomeInts.map { Int32($0) }
        return SteamAPI_ISteamFriends_GetFriendsGroupMembersListR(interface, FriendsGroupID_t(friendsGroupID), &tmp_pSomeInts, Int32(pSomeInts.count))
    }
}
