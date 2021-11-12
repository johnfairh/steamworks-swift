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
    /// Steamworks `ISteamFriends::GetPersonaName()`
    var personaName: String {
        String(SteamAPI_ISteamFriends_GetPersonaName(interface))
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

    /// Steamworks `ISteamFriends::GetFollowerCount()`
    func getFollowerCount(steamID: SteamID, completion: @escaping (FriendsGetFollowerCount) -> Void) {
        let rc = SteamAPI_ISteamFriends_GetFollowerCount(interface, UInt64(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
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
}
