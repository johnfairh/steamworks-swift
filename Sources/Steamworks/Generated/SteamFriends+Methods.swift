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
    func setPersonaName(personaName: String, completion: @escaping (SetPersonaNameResponse) -> Void) {
        let rc = SteamAPI_ISteamFriends_SetPersonaName(interface, personaName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func setPersonaName(personaName: String) async -> SetPersonaNameResponse {
        await withUnsafeContinuation {
            setPersonaName(personaName: personaName, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetPersonaState()`
    var personaState: PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetPersonaState(interface))
    }

    /// Steamworks `ISteamFriends::GetFriendCount()`
    func getFriendCount(friendFlags: Int) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCount(interface, Int32(friendFlags)))
    }

    /// Steamworks `ISteamFriends::GetFriendByIndex()`
    func getFriendByIndex(friendIndex: Int, friendFlags: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetFriendByIndex(interface, Int32(friendIndex), Int32(friendFlags)))
    }

    /// Steamworks `ISteamFriends::GetFriendRelationship()`
    func getFriendRelationship(friend: SteamID) -> FriendRelationship {
        FriendRelationship(SteamAPI_ISteamFriends_GetFriendRelationship(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaState()`
    func getFriendPersonaState(friend: SteamID) -> PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetFriendPersonaState(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaName()`
    func getFriendPersonaName(friend: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetFriendPersonaName(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendGamePlayed()`
    func getFriendGamePlayed(friend: SteamID, friendGameInfo: inout FriendGameInfo) -> Bool {
        var tmp_friendGameInfo = FriendGameInfo_t()
        let rc = SteamAPI_ISteamFriends_GetFriendGamePlayed(interface, UInt64(friend), &tmp_friendGameInfo)
        if rc {
            friendGameInfo = FriendGameInfo(tmp_friendGameInfo)
        }
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaNameHistory()`
    func getFriendPersonaNameHistory(friend: SteamID, personaNameIndex: Int) -> String {
        String(SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(interface, UInt64(friend), Int32(personaNameIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendSteamLevel()`
    func getFriendSteamLevel(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendSteamLevel(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetPlayerNickname()`
    func getPlayerNickname(player: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetPlayerNickname(interface, UInt64(player)))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupCount()`
    var friendsGroupCount: Int {
        Int(SteamAPI_ISteamFriends_GetFriendsGroupCount(interface))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupIDByIndex()`
    func getFriendsGroupIDByIndex(fgIndex: Int) -> FriendsGroupID {
        FriendsGroupID(SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex(interface, Int32(fgIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupName()`
    func getFriendsGroupName(friendsGroupID: FriendsGroupID) -> String {
        String(SteamAPI_ISteamFriends_GetFriendsGroupName(interface, FriendsGroupID_t(friendsGroupID)))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersCount()`
    func getFriendsGroupMembersCount(friendsGroupID: FriendsGroupID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendsGroupMembersCount(interface, FriendsGroupID_t(friendsGroupID)))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersList()`
    func getFriendsGroupMembersList(friendsGroupID: FriendsGroupID, members: inout [SteamID], membersCount: Int) {
        let tmp_members = UnsafeMutableBufferPointer<CSteamID>.allocate(capacity: membersCount)
        defer { tmp_members.deallocate() }
        SteamAPI_ISteamFriends_GetFriendsGroupMembersList(interface, FriendsGroupID_t(friendsGroupID), tmp_members.baseAddress, Int32(membersCount))
        members = tmp_members.map { SteamID($0) }
    }

    /// Steamworks `ISteamFriends::HasFriend()`
    func hasFriend(friend: SteamID, friendFlags: Int) -> Bool {
        SteamAPI_ISteamFriends_HasFriend(interface, UInt64(friend), Int32(friendFlags))
    }

    /// Steamworks `ISteamFriends::GetClanCount()`
    var clanCount: Int {
        Int(SteamAPI_ISteamFriends_GetClanCount(interface))
    }

    /// Steamworks `ISteamFriends::GetClanByIndex()`
    func getClanByIndex(clanIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanByIndex(interface, Int32(clanIndex)))
    }

    /// Steamworks `ISteamFriends::GetClanName()`
    func getClanName(clan: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetClanName(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanTag()`
    func getClanTag(clan: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetClanTag(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanActivityCounts()`
    func getClanActivityCounts(clan: SteamID, online: inout Int, inGame: inout Int, chatting: inout Int) -> Bool {
        var tmp_online = Int32()
        var tmp_inGame = Int32()
        var tmp_chatting = Int32()
        let rc = SteamAPI_ISteamFriends_GetClanActivityCounts(interface, UInt64(clan), &tmp_online, &tmp_inGame, &tmp_chatting)
        online = Int(tmp_online)
        inGame = Int(tmp_inGame)
        chatting = Int(tmp_chatting)
        return rc
    }

    /// Steamworks `ISteamFriends::DownloadClanActivityCounts()`
    func downloadClanActivityCounts(clans: [SteamID], completion: @escaping (DownloadClanActivityCountsResult) -> Void) {
        var tmp_clans = clans.map { CSteamID($0) }
        let rc = SteamAPI_ISteamFriends_DownloadClanActivityCounts(interface, &tmp_clans, Int32(clans.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func downloadClanActivityCounts(clans: [SteamID]) async -> DownloadClanActivityCountsResult {
        await withUnsafeContinuation {
            downloadClanActivityCounts(clans: clans, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetFriendCountFromSource()`
    func getFriendCountFromSource(source: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCountFromSource(interface, UInt64(source)))
    }

    /// Steamworks `ISteamFriends::GetFriendFromSourceByIndex()`
    func getFriendFromSourceByIndex(source: SteamID, friendIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(interface, UInt64(source), Int32(friendIndex)))
    }

    /// Steamworks `ISteamFriends::IsUserInSource()`
    func isUserInSource(user: SteamID, source: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsUserInSource(interface, UInt64(user), UInt64(source))
    }

    /// Steamworks `ISteamFriends::SetInGameVoiceSpeaking()`
    func setInGameVoiceSpeaking(user: SteamID, speaking: Bool) {
        SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(interface, UInt64(user), speaking)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlay()`
    func activateGameOverlay(dialog: String) {
        SteamAPI_ISteamFriends_ActivateGameOverlay(interface, dialog)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToUser()`
    func activateGameOverlayToUser(dialog: String, steamID: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToUser(interface, dialog, UInt64(steamID))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToWebPage()`
    func activateGameOverlayToWebPage(url: String, mode: ActivateGameOverlayToWebPageMode) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(interface, url, EActivateGameOverlayToWebPageMode(mode))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToStore()`
    func activateGameOverlayToStore(appID: AppId, flag: OverlayToStoreFlag) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToStore(interface, AppId_t(appID), EOverlayToStoreFlag(flag))
    }

    /// Steamworks `ISteamFriends::SetPlayedWith()`
    func setPlayedWith(userPlayedWith: SteamID) {
        SteamAPI_ISteamFriends_SetPlayedWith(interface, UInt64(userPlayedWith))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayInviteDialog()`
    func activateGameOverlayInviteDialog(lobby: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(interface, UInt64(lobby))
    }

    /// Steamworks `ISteamFriends::GetSmallFriendAvatar()`
    func getSmallFriendAvatar(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetSmallFriendAvatar(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetMediumFriendAvatar()`
    func getMediumFriendAvatar(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetMediumFriendAvatar(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetLargeFriendAvatar()`
    func getLargeFriendAvatar(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetLargeFriendAvatar(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::RequestUserInformation()`
    func requestUserInformation(user: SteamID, requireNameOnly: Bool) -> Bool {
        SteamAPI_ISteamFriends_RequestUserInformation(interface, UInt64(user), requireNameOnly)
    }

    /// Steamworks `ISteamFriends::RequestClanOfficerList()`
    func requestClanOfficerList(clan: SteamID, completion: @escaping (ClanOfficerListResponse) -> Void) {
        let rc = SteamAPI_ISteamFriends_RequestClanOfficerList(interface, UInt64(clan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func requestClanOfficerList(clan: SteamID) async -> ClanOfficerListResponse {
        await withUnsafeContinuation {
            requestClanOfficerList(clan: clan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetClanOwner()`
    func getClanOwner(clan: SteamID) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanOwner(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanOfficerCount()`
    func getClanOfficerCount(clan: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetClanOfficerCount(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanOfficerByIndex()`
    func getClanOfficerByIndex(clan: SteamID, officerIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanOfficerByIndex(interface, UInt64(clan), Int32(officerIndex)))
    }

    /// Steamworks `ISteamFriends::GetUserRestrictions()`
    var userRestrictions: UserRestriction {
        UserRestriction(SteamAPI_ISteamFriends_GetUserRestrictions(interface))
    }

    /// Steamworks `ISteamFriends::SetRichPresence()`
    func setRichPresence(key: String, value: String) -> Bool {
        SteamAPI_ISteamFriends_SetRichPresence(interface, key, value)
    }

    /// Steamworks `ISteamFriends::ClearRichPresence()`
    func clearRichPresence() {
        SteamAPI_ISteamFriends_ClearRichPresence(interface)
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresence()`
    func getFriendRichPresence(friend: SteamID, key: String) -> String {
        String(SteamAPI_ISteamFriends_GetFriendRichPresence(interface, UInt64(friend), key))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyCount()`
    func getFriendRichPresenceKeyCount(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyByIndex()`
    func getFriendRichPresenceKeyByIndex(friend: SteamID, keyIndex: Int) -> String {
        String(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(interface, UInt64(friend), Int32(keyIndex)))
    }

    /// Steamworks `ISteamFriends::RequestFriendRichPresence()`
    func requestFriendRichPresence(friend: SteamID) {
        SteamAPI_ISteamFriends_RequestFriendRichPresence(interface, UInt64(friend))
    }

    /// Steamworks `ISteamFriends::InviteUserToGame()`
    func inviteUserToGame(friend: SteamID, connectString: String) -> Bool {
        SteamAPI_ISteamFriends_InviteUserToGame(interface, UInt64(friend), connectString)
    }

    /// Steamworks `ISteamFriends::GetCoplayFriendCount()`
    var coplayFriendCount: Int {
        Int(SteamAPI_ISteamFriends_GetCoplayFriendCount(interface))
    }

    /// Steamworks `ISteamFriends::GetCoplayFriend()`
    func getCoplayFriend(coplayFriendIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetCoplayFriend(interface, Int32(coplayFriendIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayTime()`
    func getFriendCoplayTime(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCoplayTime(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayGame()`
    func getFriendCoplayGame(friend: SteamID) -> AppId {
        AppId(SteamAPI_ISteamFriends_GetFriendCoplayGame(interface, UInt64(friend)))
    }

    /// Steamworks `ISteamFriends::JoinClanChatRoom()`
    func joinClanChatRoom(clan: SteamID, completion: @escaping (JoinClanChatRoomCompletionResult) -> Void) {
        let rc = SteamAPI_ISteamFriends_JoinClanChatRoom(interface, UInt64(clan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func joinClanChatRoom(clan: SteamID) async -> JoinClanChatRoomCompletionResult {
        await withUnsafeContinuation {
            joinClanChatRoom(clan: clan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::LeaveClanChatRoom()`
    func leaveClanChatRoom(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_LeaveClanChatRoom(interface, UInt64(clan))
    }

    /// Steamworks `ISteamFriends::GetClanChatMemberCount()`
    func getClanChatMemberCount(clan: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetClanChatMemberCount(interface, UInt64(clan)))
    }

    /// Steamworks `ISteamFriends::GetChatMemberByIndex()`
    func getChatMemberByIndex(clan: SteamID, userIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetChatMemberByIndex(interface, UInt64(clan), Int32(userIndex)))
    }

    /// Steamworks `ISteamFriends::SendClanChatMessage()`
    func sendClanChatMessage(clanChat: SteamID, text: String) -> Bool {
        SteamAPI_ISteamFriends_SendClanChatMessage(interface, UInt64(clanChat), text)
    }

    /// Steamworks `ISteamFriends::GetClanChatMessage()`
    func getClanChatMessage(clanChat: SteamID, messageIndex: Int, text: UnsafeMutableRawPointer, textMax: Int, chatEntryType: inout ChatEntryType, chatter: inout SteamID) -> Int {
        var tmp_chatEntryType = EChatEntryType(rawValue: 0)
        var tmp_chatter = CSteamID()
        let rc = Int(SteamAPI_ISteamFriends_GetClanChatMessage(interface, UInt64(clanChat), Int32(messageIndex), text, Int32(textMax), &tmp_chatEntryType, &tmp_chatter))
        chatEntryType = ChatEntryType(tmp_chatEntryType)
        chatter = SteamID(tmp_chatter)
        return rc
    }

    /// Steamworks `ISteamFriends::IsClanChatAdmin()`
    func isClanChatAdmin(clanChat: SteamID, user: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanChatAdmin(interface, UInt64(clanChat), UInt64(user))
    }

    /// Steamworks `ISteamFriends::IsClanChatWindowOpenInSteam()`
    func isClanChatWindowOpenInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(interface, UInt64(clanChat))
    }

    /// Steamworks `ISteamFriends::OpenClanChatWindowInSteam()`
    func openClanChatWindowInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(interface, UInt64(clanChat))
    }

    /// Steamworks `ISteamFriends::CloseClanChatWindowInSteam()`
    func closeClanChatWindowInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(interface, UInt64(clanChat))
    }

    /// Steamworks `ISteamFriends::SetListenForFriendsMessages()`
    func setListenForFriendsMessages(interceptEnabled: Bool) -> Bool {
        SteamAPI_ISteamFriends_SetListenForFriendsMessages(interface, interceptEnabled)
    }

    /// Steamworks `ISteamFriends::ReplyToFriendMessage()`
    func replyToFriendMessage(friend: SteamID, msgToSend: String) -> Bool {
        SteamAPI_ISteamFriends_ReplyToFriendMessage(interface, UInt64(friend), msgToSend)
    }

    /// Steamworks `ISteamFriends::GetFriendMessage()`
    func getFriendMessage(friend: SteamID, messageIDIndex: Int, data: UnsafeMutableRawPointer, dataSize: Int, chatEntryType: inout ChatEntryType) -> Int {
        var tmp_chatEntryType = EChatEntryType(rawValue: 0)
        let rc = Int(SteamAPI_ISteamFriends_GetFriendMessage(interface, UInt64(friend), Int32(messageIDIndex), data, Int32(dataSize), &tmp_chatEntryType))
        chatEntryType = ChatEntryType(tmp_chatEntryType)
        return rc
    }

    /// Steamworks `ISteamFriends::GetFollowerCount()`
    func getFollowerCount(steamID: SteamID, completion: @escaping (FriendsGetFollowerCount) -> Void) {
        let rc = SteamAPI_ISteamFriends_GetFollowerCount(interface, UInt64(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func getFollowerCount(steamID: SteamID) async -> FriendsGetFollowerCount {
        await withUnsafeContinuation {
            getFollowerCount(steamID: steamID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::IsFollowing()`
    func isFollowing(steamID: SteamID, completion: @escaping (FriendsIsFollowing) -> Void) {
        let rc = SteamAPI_ISteamFriends_IsFollowing(interface, UInt64(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func isFollowing(steamID: SteamID) async -> FriendsIsFollowing {
        await withUnsafeContinuation {
            isFollowing(steamID: steamID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::EnumerateFollowingList()`
    func enumerateFollowingList(startIndex: Int, completion: @escaping (FriendsEnumerateFollowingList) -> Void) {
        let rc = SteamAPI_ISteamFriends_EnumerateFollowingList(interface, uint32(startIndex))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func enumerateFollowingList(startIndex: Int) async -> FriendsEnumerateFollowingList {
        await withUnsafeContinuation {
            enumerateFollowingList(startIndex: startIndex, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::IsClanPublic()`
    func isClanPublic(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanPublic(interface, UInt64(clan))
    }

    /// Steamworks `ISteamFriends::IsClanOfficialGameGroup()`
    func isClanOfficialGameGroup(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanOfficialGameGroup(interface, UInt64(clan))
    }

    /// Steamworks `ISteamFriends::GetNumChatsWithUnreadPriorityMessages()`
    var numChatsWithUnreadPriorityMessages: Int {
        Int(SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages(interface))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayRemotePlayTogetherInviteDialog()`
    func activateGameOverlayRemotePlayTogetherInviteDialog(lobby: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(interface, UInt64(lobby))
    }

    /// Steamworks `ISteamFriends::RegisterProtocolInOverlayBrowser()`
    func registerProtocolInOverlayBrowser(`protocol`: String) -> Bool {
        SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser(interface, `protocol`)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayInviteDialogConnectString()`
    func activateGameOverlayInviteDialogConnectString(connectString: String) {
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString(interface, connectString)
    }
}
