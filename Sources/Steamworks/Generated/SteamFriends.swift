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

    /// Steamworks `ISteamFriends::ActivateGameOverlay()`
    public func activateGameOverlay(dialog: String) {
        SteamAPI_ISteamFriends_ActivateGameOverlay(interface, dialog)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayInviteDialog()`
    public func activateGameOverlayInviteDialog(lobby: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(interface, UInt64(lobby))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayInviteDialogConnectString()`
    public func activateGameOverlayInviteDialogConnectString(connectString: String) {
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString(interface, connectString)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayRemotePlayTogetherInviteDialog()`
    public func activateGameOverlayRemotePlayTogetherInviteDialog(lobby: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(interface, UInt64(lobby))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToStore()`
    public func activateGameOverlayToStore(appID: AppID, flag: OverlayToStoreFlag) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToStore(interface, AppId_t(appID), EOverlayToStoreFlag(flag))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToUser()`
    public func activateGameOverlayToUser(dialog: String, steamID: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToUser(interface, dialog, UInt64(steamID))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToWebPage()`
    public func activateGameOverlayToWebPage(url: String, mode: ActivateGameOverlayToWebPageMode) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(interface, url, EActivateGameOverlayToWebPageMode(mode))
    }

    /// Steamworks `ISteamFriends::ClearRichPresence()`
    public func clearRichPresence() {
        SteamAPI_ISteamFriends_ClearRichPresence(interface)
    }

    /// Steamworks `ISteamFriends::CloseClanChatWindowInSteam()`
    public func closeClanChatWindowInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(interface, UInt64(clanChat))
    }

    /// Steamworks `ISteamFriends::DownloadClanActivityCounts()`, callback
    public func downloadClanActivityCounts(clans: [SteamID], completion: @escaping (DownloadClanActivityCountsResult?) -> Void) {
        var tmpClans = clans.map { CSteamID($0) }
        let rc = SteamAPI_ISteamFriends_DownloadClanActivityCounts(interface, &tmpClans, CInt(clans.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::DownloadClanActivityCounts()`, async
    public func downloadClanActivityCounts(clans: [SteamID]) async -> DownloadClanActivityCountsResult? {
        await withUnsafeContinuation {
            downloadClanActivityCounts(clans: clans, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::EnumerateFollowingList()`, callback
    public func enumerateFollowingList(startIndex: Int, completion: @escaping (FriendsEnumerateFollowingList?) -> Void) {
        let rc = SteamAPI_ISteamFriends_EnumerateFollowingList(interface, uint32(startIndex))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::EnumerateFollowingList()`, async
    public func enumerateFollowingList(startIndex: Int) async -> FriendsEnumerateFollowingList? {
        await withUnsafeContinuation {
            enumerateFollowingList(startIndex: startIndex, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetChatMemberByIndex()`
    public func getChatMemberByIndex(clan: SteamID, userIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetChatMemberByIndex(interface, UInt64(clan), CInt(userIndex)))
    }

    /// Steamworks `ISteamFriends::GetClanActivityCounts()`
    public func getClanActivityCounts(clan: SteamID) -> (rc: Bool, online: Int, inGame: Int, chatting: Int) {
        var tmpOnline = CInt()
        var tmpInGame = CInt()
        var tmpChatting = CInt()
        let rc = SteamAPI_ISteamFriends_GetClanActivityCounts(interface, UInt64(clan), &tmpOnline, &tmpInGame, &tmpChatting)
        return (rc: rc, online: Int(tmpOnline), inGame: Int(tmpInGame), chatting: Int(tmpChatting))
    }

    /// Steamworks `ISteamFriends::GetClanByIndex()`
    public func getClanByIndex(clanIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanByIndex(interface, CInt(clanIndex)))
    }

    /// Steamworks `ISteamFriends::GetClanChatMemberCount()`
    public func getClanChatMemberCount(clan: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetClanChatMemberCount(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanChatMessage()`
    public func getClanChatMessage(clanChat: SteamID, messageIndex: Int, text: UnsafeMutableRawPointer, textMaxSize: Int) -> (rc: Int, chatEntryType: ChatEntryType, chatter: SteamID) {
        var tmpChatEntryType = EChatEntryType(rawValue: 0)
        var tmpChatter = CSteamID()
        let rc = Int(SteamAPI_ISteamFriends_GetClanChatMessage(interface, UInt64(clanChat), CInt(messageIndex), text, CInt(textMaxSize), &tmpChatEntryType, &tmpChatter))
        return (rc: rc, chatEntryType: ChatEntryType(tmpChatEntryType), chatter: SteamID(tmpChatter))
    }

    /// Steamworks `ISteamFriends::GetClanCount()`
    public func getClanCount() -> Int {
        Int(SteamAPI_ISteamFriends_GetClanCount(interface))
    }

    /// Steamworks `ISteamFriends::GetClanName()`
    public func getClanName(clan: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetClanName(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanOfficerByIndex()`
    public func getClanOfficerByIndex(clan: SteamID, officerIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanOfficerByIndex(interface, UInt64(clan), CInt(officerIndex)))
    }

    /// Steamworks `ISteamFriends::GetClanOfficerCount()`
    public func getClanOfficerCount(clan: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetClanOfficerCount(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanOwner()`
    public func getClanOwner(clan: SteamID) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanOwner(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanTag()`
    public func getClanTag(clan: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetClanTag(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetCoplayFriend()`
    public func getCoplayFriend(coplayFriendIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetCoplayFriend(interface, CInt(coplayFriendIndex)))
    }

    /// Steamworks `ISteamFriends::GetCoplayFriendCount()`
    public func getCoplayFriendCount() -> Int {
        Int(SteamAPI_ISteamFriends_GetCoplayFriendCount(interface))
    }

    /// Steamworks `ISteamFriends::GetFollowerCount()`, callback
    public func getFollowerCount(steamID: SteamID, completion: @escaping (FriendsGetFollowerCount?) -> Void) {
        let rc = SteamAPI_ISteamFriends_GetFollowerCount(interface, UInt64(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::GetFollowerCount()`, async
    public func getFollowerCount(steamID: SteamID) async -> FriendsGetFollowerCount? {
        await withUnsafeContinuation {
            getFollowerCount(steamID: steamID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetFriendByIndex()`
    public func getFriendByIndex(friendIndex: Int, friendFlags: FriendFlags) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetFriendByIndex(interface, CInt(friendIndex), Int32(friendFlags)))
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayGame()`
    public func getFriendCoplayGame(friend: SteamID) -> AppID {
        AppID(SteamAPI_ISteamFriends_GetFriendCoplayGame(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayTime()`
    public func getFriendCoplayTime(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCoplayTime(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendCount()`
    public func getFriendCount(friendFlags: FriendFlags) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCount(interface, Int32(friendFlags)))
    }

    /// Steamworks `ISteamFriends::GetFriendCountFromSource()`
    public func getFriendCountFromSource(source: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCountFromSource(interface, UInt64(source)))
    }

    /// Steamworks `ISteamFriends::GetFriendFromSourceByIndex()`
    public func getFriendFromSourceByIndex(source: SteamID, friendIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(interface, UInt64(source), CInt(friendIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendGamePlayed()`
    public func getFriendGamePlayed(friend: SteamID) -> (rc: Bool, friendGameInfo: FriendGameInfo) {
        var tmpFriendGameInfo = FriendGameInfo_t()
        let rc = SteamAPI_ISteamFriends_GetFriendGamePlayed(interface, UInt64(friend), &tmpFriendGameInfo)
        if rc {
            return (rc: rc, friendGameInfo: FriendGameInfo(tmpFriendGameInfo))
        } else {
            return (rc: rc, friendGameInfo: FriendGameInfo())
        }
    }

    /// Steamworks `ISteamFriends::GetFriendMessage()`
    public func getFriendMessage(friend: SteamID, messageIDIndex: Int, data: UnsafeMutableRawPointer, dataSize: Int) -> (rc: Int, chatEntryType: ChatEntryType) {
        var tmpChatEntryType = EChatEntryType(rawValue: 0)
        let rc = Int(SteamAPI_ISteamFriends_GetFriendMessage(interface, UInt64(friend), CInt(messageIDIndex), data, CInt(dataSize), &tmpChatEntryType))
        return (rc: rc, chatEntryType: ChatEntryType(tmpChatEntryType))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaName()`
    public func getFriendPersonaName(friend: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetFriendPersonaName(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaNameHistory()`
    public func getFriendPersonaNameHistory(friend: SteamID, personaNameIndex: Int) -> String {
        String(SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(interface, UInt64(friend), CInt(personaNameIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaState()`
    public func getFriendPersonaState(friend: SteamID) -> PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetFriendPersonaState(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendRelationship()`
    public func getFriendRelationship(friend: SteamID) -> FriendRelationship {
        FriendRelationship(SteamAPI_ISteamFriends_GetFriendRelationship(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresence()`
    public func getFriendRichPresence(friend: SteamID, key: String) -> String {
        String(SteamAPI_ISteamFriends_GetFriendRichPresence(interface, UInt64(friend), key))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyByIndex()`
    public func getFriendRichPresenceKeyByIndex(friend: SteamID, keyIndex: Int) -> String {
        String(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(interface, UInt64(friend), CInt(keyIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyCount()`
    public func getFriendRichPresenceKeyCount(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendSteamLevel()`
    public func getFriendSteamLevel(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendSteamLevel(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupCount()`
    public func getFriendsGroupCount() -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendsGroupCount(interface))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupIDByIndex()`
    public func getFriendsGroupIDByIndex(fgIndex: Int) -> FriendsGroupID {
        FriendsGroupID(SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex(interface, CInt(fgIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersCount()`
    public func getFriendsGroupMembersCount(friendsGroupID: FriendsGroupID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendsGroupMembersCount(interface, FriendsGroupID_t(friendsGroupID)))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersList()`
    public func getFriendsGroupMembersList(friendsGroupID: FriendsGroupID, membersCount: Int) -> [SteamID] {
        let tmpMembers = SteamOutArray<CSteamID>(membersCount)
        SteamAPI_ISteamFriends_GetFriendsGroupMembersList(interface, FriendsGroupID_t(friendsGroupID), tmpMembers.steamArray, CInt(membersCount))
        return tmpMembers.swiftArray()
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupName()`
    public func getFriendsGroupName(friendsGroupID: FriendsGroupID) -> String? {
        SteamAPI_ISteamFriends_GetFriendsGroupName(interface, FriendsGroupID_t(friendsGroupID)).map { String($0) }
    }

    /// Steamworks `ISteamFriends::GetLargeFriendAvatar()`
    public func getLargeFriendAvatar(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetLargeFriendAvatar(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetMediumFriendAvatar()`
    public func getMediumFriendAvatar(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetMediumFriendAvatar(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetNumChatsWithUnreadPriorityMessages()`
    public func getNumChatsWithUnreadPriorityMessages() -> Int {
        Int(SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages(interface))
    }

    /// Steamworks `ISteamFriends::GetPersonaName()`
    public func getPersonaName() -> String {
        String(SteamAPI_ISteamFriends_GetPersonaName(interface))
    }

    /// Steamworks `ISteamFriends::GetPersonaState()`
    public func getPersonaState() -> PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetPersonaState(interface))
    }

    /// Steamworks `ISteamFriends::GetPlayerNickname()`
    public func getPlayerNickname(player: SteamID) -> String? {
        SteamAPI_ISteamFriends_GetPlayerNickname(interface, UInt64(player)).map { String($0) }
    }

    /// Steamworks `ISteamFriends::GetSmallFriendAvatar()`
    public func getSmallFriendAvatar(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetSmallFriendAvatar(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetUserRestrictions()`
    public func getUserRestrictions() -> UserRestriction {
        UserRestriction(SteamAPI_ISteamFriends_GetUserRestrictions(interface))
    }

    /// Steamworks `ISteamFriends::HasFriend()`
    public func hasFriend(friend: SteamID, friendFlags: FriendFlags) -> Bool {
        SteamAPI_ISteamFriends_HasFriend(interface, UInt64(friend), Int32(friendFlags))
    }

    /// Steamworks `ISteamFriends::InviteUserToGame()`
    public func inviteUserToGame(friend: SteamID, connectString: String) -> Bool {
        SteamAPI_ISteamFriends_InviteUserToGame(interface, UInt64(friend), connectString)
    }

    /// Steamworks `ISteamFriends::IsClanChatAdmin()`
    public func isClanChatAdmin(clanChat: SteamID, user: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanChatAdmin(interface, UInt64(clanChat), UInt64(user))
    }

    /// Steamworks `ISteamFriends::IsClanChatWindowOpenInSteam()`
    public func isClanChatWindowOpenInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(interface, UInt64(clanChat))
    }

    /// Steamworks `ISteamFriends::IsClanOfficialGameGroup()`
    public func isClanOfficialGameGroup(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanOfficialGameGroup(interface, UInt64(clan))
    }

    /// Steamworks `ISteamFriends::IsClanPublic()`
    public func isClanPublic(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanPublic(interface, UInt64(clan))
    }

    /// Steamworks `ISteamFriends::IsFollowing()`, callback
    public func isFollowing(steamID: SteamID, completion: @escaping (FriendsIsFollowing?) -> Void) {
        let rc = SteamAPI_ISteamFriends_IsFollowing(interface, UInt64(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::IsFollowing()`, async
    public func isFollowing(steamID: SteamID) async -> FriendsIsFollowing? {
        await withUnsafeContinuation {
            isFollowing(steamID: steamID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::IsUserInSource()`
    public func isUserInSource(user: SteamID, source: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsUserInSource(interface, UInt64(user), UInt64(source))
    }

    /// Steamworks `ISteamFriends::JoinClanChatRoom()`, callback
    public func joinClanChatRoom(clan: SteamID, completion: @escaping (JoinClanChatRoomCompletionResult?) -> Void) {
        let rc = SteamAPI_ISteamFriends_JoinClanChatRoom(interface, UInt64(clan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::JoinClanChatRoom()`, async
    public func joinClanChatRoom(clan: SteamID) async -> JoinClanChatRoomCompletionResult? {
        await withUnsafeContinuation {
            joinClanChatRoom(clan: clan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::LeaveClanChatRoom()`
    public func leaveClanChatRoom(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_LeaveClanChatRoom(interface, UInt64(clan))
    }

    /// Steamworks `ISteamFriends::OpenClanChatWindowInSteam()`
    public func openClanChatWindowInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(interface, UInt64(clanChat))
    }

    /// Steamworks `ISteamFriends::RegisterProtocolInOverlayBrowser()`
    public func registerProtocolInOverlayBrowser(`protocol`: String) -> Bool {
        SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser(interface, `protocol`)
    }

    /// Steamworks `ISteamFriends::ReplyToFriendMessage()`
    public func replyToFriendMessage(friend: SteamID, msgToSend: String) -> Bool {
        SteamAPI_ISteamFriends_ReplyToFriendMessage(interface, UInt64(friend), msgToSend)
    }

    /// Steamworks `ISteamFriends::RequestClanOfficerList()`, callback
    public func requestClanOfficerList(clan: SteamID, completion: @escaping (ClanOfficerListResponse?) -> Void) {
        let rc = SteamAPI_ISteamFriends_RequestClanOfficerList(interface, UInt64(clan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::RequestClanOfficerList()`, async
    public func requestClanOfficerList(clan: SteamID) async -> ClanOfficerListResponse? {
        await withUnsafeContinuation {
            requestClanOfficerList(clan: clan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::RequestFriendRichPresence()`
    public func requestFriendRichPresence(friend: SteamID) {
        SteamAPI_ISteamFriends_RequestFriendRichPresence(interface, UInt64(friend))
    }

    /// Steamworks `ISteamFriends::RequestUserInformation()`
    public func requestUserInformation(user: SteamID, requireNameOnly: Bool) -> Bool {
        SteamAPI_ISteamFriends_RequestUserInformation(interface, UInt64(user), requireNameOnly)
    }

    /// Steamworks `ISteamFriends::SendClanChatMessage()`
    public func sendClanChatMessage(clanChat: SteamID, text: String) -> Bool {
        SteamAPI_ISteamFriends_SendClanChatMessage(interface, UInt64(clanChat), text)
    }

    /// Steamworks `ISteamFriends::SetInGameVoiceSpeaking()`
    public func setInGameVoiceSpeaking(user: SteamID, speaking: Bool) {
        SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(interface, UInt64(user), speaking)
    }

    /// Steamworks `ISteamFriends::SetListenForFriendsMessages()`
    @discardableResult
    public func setListenForFriendsMessages(interceptEnabled: Bool) -> Bool {
        SteamAPI_ISteamFriends_SetListenForFriendsMessages(interface, interceptEnabled)
    }

    /// Steamworks `ISteamFriends::SetPersonaName()`, callback
    public func setPersonaName(personaName: String, completion: @escaping (SetPersonaNameResponse?) -> Void) {
        let rc = SteamAPI_ISteamFriends_SetPersonaName(interface, personaName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::SetPersonaName()`, async
    public func setPersonaName(personaName: String) async -> SetPersonaNameResponse? {
        await withUnsafeContinuation {
            setPersonaName(personaName: personaName, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::SetPlayedWith()`
    public func setPlayedWith(userPlayedWith: SteamID) {
        SteamAPI_ISteamFriends_SetPlayedWith(interface, UInt64(userPlayedWith))
    }

    /// Steamworks `ISteamFriends::SetRichPresence()`
    public func setRichPresence(key: String, value: String) -> Bool {
        SteamAPI_ISteamFriends_SetRichPresence(interface, key, value)
    }
}
