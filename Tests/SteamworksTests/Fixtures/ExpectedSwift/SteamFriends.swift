//
//  SteamFriends.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamFriends`](https://partner.steamgames.com/doc/api/ISteamFriends)
///
/// Access via `SteamAPI.friends`.
public struct SteamFriends {
    var interface: UnsafeMutablePointer<ISteamFriends> {
        SteamAPI_SteamFriends_v017()
    }

    init() {
    }

    /// Steamworks `ISteamFriends::ClearRichPresence()`
    public func clearRichPresence() {
        SteamAPI_ISteamFriends_ClearRichPresence(interface)
    }

    /// Steamworks `ISteamFriends::GetClanChatMessage()`
    public func getClanChatMessage(clanChat: SteamID, messageIndex: Int, text: UnsafeMutableRawPointer, textMaxSize: Int, chatEntryType: inout ChatEntryType, chatter: inout SteamID) -> Int {
        var tmp_chatEntryType = EChatEntryType(rawValue: 0)
        var tmp_chatter = CSteamID()
        let rc = Int(SteamAPI_ISteamFriends_GetClanChatMessage(interface, UInt64(clanChat), Int32(messageIndex), text, Int32(textMaxSize), &tmp_chatEntryType, &tmp_chatter))
        chatEntryType = ChatEntryType(tmp_chatEntryType)
        chatter = SteamID(tmp_chatter)
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersListF()`
    public func getFriendsGroupMembersListF(friendsGroupID: FriendsGroupID, members: inout [SteamID], membersCount: Int, someInts: [Int]) -> Int {
        let tmp_members = UnsafeMutableBufferPointer<CSteamID>.allocate(capacity: membersCount)
        defer { tmp_members.deallocate() }
        var tmp_someInts = someInts.map { Int32($0) }
        let rc = Int(SteamAPI_ISteamFriends_GetFriendsGroupMembersListF(interface, FriendsGroupID_t(friendsGroupID), tmp_members.baseAddress, Int32(membersCount), &tmp_someInts, Int32(someInts.count)))
        if rc == 5 {
            members = tmp_members.map { SteamID($0) }
        }
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersListR()`
    public func getFriendsGroupMembersListR(friendsGroupID: FriendsGroupID, someInts: [Int]) -> Bool {
        var tmp_someInts = someInts.map { Int32($0) }
        return SteamAPI_ISteamFriends_GetFriendsGroupMembersListR(interface, FriendsGroupID_t(friendsGroupID), &tmp_someInts, Int32(someInts.count))
    }

    /// Steamworks `ISteamFriends::GetPersonaState()`
    public func getPersonaState() -> PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetPersonaState(interface))
    }

    /// Steamworks `ISteamFriends::GetUserRestrictions()`
    public func getUserRestrictions() -> UserRestriction {
        UserRestriction(SteamAPI_ISteamFriends_GetUserRestrictions(interface))
    }

    /// Steamworks `ISteamFriends::SetPersonaName()`, callback
    public func setPersonaName(personaName: String, completion: @escaping (SetPersonaNameResponse?) -> Void) {
        let rc = SteamAPI_ISteamFriends_SetPersonaName(interface, personaName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::SetPersonaName()`, async
    func setPersonaName(personaName: String) async -> SetPersonaNameResponse? {
        await withUnsafeContinuation {
            setPersonaName(personaName: personaName, completion: $0.resume)
        }
    }
}
