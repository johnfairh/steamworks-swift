//
//  SteamFriends.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

internal import CSteamworks

/// Steamworks [`ISteamFriends`](https://partner.steamgames.com/doc/api/ISteamFriends)
///
/// Access via ``SteamAPI/friends``.
public struct SteamFriends: Sendable {
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
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(interface, CUnsignedLongLong(lobby))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayInviteDialogConnectString()`
    public func activateGameOverlayInviteDialogConnectString(connectString: String) {
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString(interface, connectString)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayRemotePlayTogetherInviteDialog()`
    public func activateGameOverlayRemotePlayTogetherInviteDialog(lobby: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(interface, CUnsignedLongLong(lobby))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToStore()`
    public func activateGameOverlayToStore(appID: AppID, flag: OverlayToStoreFlag) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToStore(interface, AppId_t(appID), EOverlayToStoreFlag(flag))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToUser()`
    public func activateGameOverlayToUser(dialog: String, steamID: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToUser(interface, dialog, CUnsignedLongLong(steamID))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToWebPage()`
    public func activateGameOverlayToWebPage(url: String, mode: ActivateGameOverlayToWebPageMode) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(interface, url, EActivateGameOverlayToWebPageMode(mode))
    }

    /// Steamworks `ISteamFriends::BHasEquippedProfileItem()`
    public func hasEquippedProfileItem(steamID: SteamID, type: CommunityProfileItemType) -> Bool {
        SteamAPI_ISteamFriends_BHasEquippedProfileItem(interface, CUnsignedLongLong(steamID), ECommunityProfileItemType(type))
    }

    /// Steamworks `ISteamFriends::ClearRichPresence()`
    public func clearRichPresence() {
        SteamAPI_ISteamFriends_ClearRichPresence(interface)
    }

    /// Steamworks `ISteamFriends::CloseClanChatWindowInSteam()`
    public func closeClanChatWindowInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(interface, CUnsignedLongLong(clanChat))
    }

    /// Steamworks `ISteamFriends::DownloadClanActivityCounts()`, callback
    public func downloadClanActivityCounts(clans: [SteamID], completion: @Sendable @escaping (sending DownloadClanActivityCountsResult?) -> Void) {
        var tmpClans = clans.map { CSteamID($0) }
        let rc = SteamAPI_ISteamFriends_DownloadClanActivityCounts(interface, &tmpClans, CInt(clans.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::DownloadClanActivityCounts()`, async
    public func downloadClanActivityCounts(isolation: isolated (any Actor)? = #isolation, clans: [SteamID]) async -> DownloadClanActivityCountsResult? {
        await withUnsafeContinuation {
            downloadClanActivityCounts(clans: clans, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::EnumerateFollowingList()`, callback
    public func enumerateFollowingList(startIndex: Int, completion: @Sendable @escaping (sending FriendsEnumerateFollowingList?) -> Void) {
        let rc = SteamAPI_ISteamFriends_EnumerateFollowingList(interface, uint32(startIndex))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::EnumerateFollowingList()`, async
    public func enumerateFollowingList(isolation: isolated (any Actor)? = #isolation, startIndex: Int) async -> FriendsEnumerateFollowingList? {
        await withUnsafeContinuation {
            enumerateFollowingList(startIndex: startIndex, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetChatMemberByIndex()`
    public func getChatMemberByIndex(clan: SteamID, userIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetChatMemberByIndex(interface, CUnsignedLongLong(clan), CInt(userIndex)))
    }

    /// Steamworks `ISteamFriends::GetClanActivityCounts()`
    public func getClanActivityCounts(clan: SteamID) -> (rc: Bool, online: Int, inGame: Int, chatting: Int) {
        var tmpOnline = CInt()
        var tmpInGame = CInt()
        var tmpChatting = CInt()
        let rc = SteamAPI_ISteamFriends_GetClanActivityCounts(interface, CUnsignedLongLong(clan), &tmpOnline, &tmpInGame, &tmpChatting)
        return (rc: rc, online: Int(tmpOnline), inGame: Int(tmpInGame), chatting: Int(tmpChatting))
    }

    /// Steamworks `ISteamFriends::GetClanByIndex()`
    public func getClanByIndex(clanIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanByIndex(interface, CInt(clanIndex)))
    }

    /// Steamworks `ISteamFriends::GetClanChatMemberCount()`
    public func getClanChatMemberCount(clan: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetClanChatMemberCount(interface, CUnsignedLongLong(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanChatMessage()`
    public func getClanChatMessage(clanChat: SteamID, messageIndex: Int, textMaxSize: Int = SteamConstants.chatMetadataMaxSize + 1) -> (rc: Int, text: String, chatEntryType: ChatEntryType, chatter: SteamID) {
        var tmpText = SteamOutString(length: textMaxSize)
        var tmpChatEntryType = EChatEntryType(rawValue: 0)
        var tmpChatter = CSteamID()
        let rc = tmpText.setContent { nstText in
            Int(SteamAPI_ISteamFriends_GetClanChatMessage(interface, CUnsignedLongLong(clanChat), CInt(messageIndex), nstText, CInt(textMaxSize), &tmpChatEntryType, &tmpChatter))
        }
        return (rc: rc, text: tmpText.swiftString, chatEntryType: ChatEntryType(tmpChatEntryType), chatter: SteamID(tmpChatter))
    }

    /// Steamworks `ISteamFriends::GetClanCount()`
    public func getClanCount() -> Int {
        Int(SteamAPI_ISteamFriends_GetClanCount(interface))
    }

    /// Steamworks `ISteamFriends::GetClanName()`
    public func getClanName(clan: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetClanName(interface, CUnsignedLongLong(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanOfficerByIndex()`
    public func getClanOfficerByIndex(clan: SteamID, officerIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanOfficerByIndex(interface, CUnsignedLongLong(clan), CInt(officerIndex)))
    }

    /// Steamworks `ISteamFriends::GetClanOfficerCount()`
    public func getClanOfficerCount(clan: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetClanOfficerCount(interface, CUnsignedLongLong(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanOwner()`
    public func getClanOwner(clan: SteamID) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanOwner(interface, CUnsignedLongLong(clan)))
    }

    /// Steamworks `ISteamFriends::GetClanTag()`
    public func getClanTag(clan: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetClanTag(interface, CUnsignedLongLong(clan)))
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
    public func getFollowerCount(steamID: SteamID, completion: @Sendable @escaping (sending FriendsGetFollowerCount?) -> Void) {
        let rc = SteamAPI_ISteamFriends_GetFollowerCount(interface, CUnsignedLongLong(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::GetFollowerCount()`, async
    public func getFollowerCount(isolation: isolated (any Actor)? = #isolation, steamID: SteamID) async -> FriendsGetFollowerCount? {
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
        AppID(SteamAPI_ISteamFriends_GetFriendCoplayGame(interface, CUnsignedLongLong(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayTime()`
    public func getFriendCoplayTime(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCoplayTime(interface, CUnsignedLongLong(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendCount()`
    public func getFriendCount(friendFlags: FriendFlags) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCount(interface, Int32(friendFlags)))
    }

    /// Steamworks `ISteamFriends::GetFriendCountFromSource()`
    public func getFriendCountFromSource(source: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCountFromSource(interface, CUnsignedLongLong(source)))
    }

    /// Steamworks `ISteamFriends::GetFriendFromSourceByIndex()`
    public func getFriendFromSourceByIndex(source: SteamID, friendIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(interface, CUnsignedLongLong(source), CInt(friendIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendGamePlayed()`
    public func getFriendGamePlayed(friend: SteamID) -> (rc: Bool, friendGameInfo: FriendGameInfo) {
        var tmpFriendGameInfo = FriendGameInfo_t()
        let rc = SteamAPI_ISteamFriends_GetFriendGamePlayed(interface, CUnsignedLongLong(friend), &tmpFriendGameInfo)
        if rc {
            return (rc: rc, friendGameInfo: FriendGameInfo(tmpFriendGameInfo))
        } else {
            return (rc: rc, friendGameInfo: FriendGameInfo())
        }
    }

    /// Steamworks `ISteamFriends::GetFriendMessage()`
    public func getFriendMessage(friend: SteamID, messageIDIndex: Int, dataSize: Int = SteamConstants.chatMetadataMaxSize + 1) -> (rc: Int, data: String, chatEntryType: ChatEntryType) {
        var tmpData = SteamOutString(length: dataSize)
        var tmpChatEntryType = EChatEntryType(rawValue: 0)
        let rc = tmpData.setContent { nstData in
            Int(SteamAPI_ISteamFriends_GetFriendMessage(interface, CUnsignedLongLong(friend), CInt(messageIDIndex), nstData, CInt(dataSize), &tmpChatEntryType))
        }
        return (rc: rc, data: tmpData.swiftString, chatEntryType: ChatEntryType(tmpChatEntryType))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaName()`
    public func getFriendPersonaName(friend: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetFriendPersonaName(interface, CUnsignedLongLong(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaNameHistory()`
    public func getFriendPersonaNameHistory(friend: SteamID, personaNameIndex: Int) -> String {
        String(SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(interface, CUnsignedLongLong(friend), CInt(personaNameIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaState()`
    public func getFriendPersonaState(friend: SteamID) -> PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetFriendPersonaState(interface, CUnsignedLongLong(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendRelationship()`
    public func getFriendRelationship(friend: SteamID) -> FriendRelationship {
        FriendRelationship(SteamAPI_ISteamFriends_GetFriendRelationship(interface, CUnsignedLongLong(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresence()`
    public func getFriendRichPresence(friend: SteamID, key: String) -> String {
        String(SteamAPI_ISteamFriends_GetFriendRichPresence(interface, CUnsignedLongLong(friend), key))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyByIndex()`
    public func getFriendRichPresenceKeyByIndex(friend: SteamID, keyIndex: Int) -> String {
        String(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(interface, CUnsignedLongLong(friend), CInt(keyIndex)))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyCount()`
    public func getFriendRichPresenceKeyCount(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(interface, CUnsignedLongLong(friend)))
    }

    /// Steamworks `ISteamFriends::GetFriendSteamLevel()`
    public func getFriendSteamLevel(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendSteamLevel(interface, CUnsignedLongLong(friend)))
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
        Int(SteamAPI_ISteamFriends_GetLargeFriendAvatar(interface, CUnsignedLongLong(friend)))
    }

    /// Steamworks `ISteamFriends::GetMediumFriendAvatar()`
    public func getMediumFriendAvatar(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetMediumFriendAvatar(interface, CUnsignedLongLong(friend)))
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
        SteamAPI_ISteamFriends_GetPlayerNickname(interface, CUnsignedLongLong(player)).map { String($0) }
    }

    /// Steamworks `ISteamFriends::GetProfileItemPropertyString()`
    public func getProfileItemPropertyString(steamID: SteamID, type: CommunityProfileItemType, prop: CommunityProfileItemProperty) -> String {
        String(SteamAPI_ISteamFriends_GetProfileItemPropertyString(interface, CUnsignedLongLong(steamID), ECommunityProfileItemType(type), ECommunityProfileItemProperty(prop)))
    }

    /// Steamworks `ISteamFriends::GetProfileItemPropertyUint()`
    public func getProfileItemPropertyUint(steamID: SteamID, type: CommunityProfileItemType, prop: CommunityProfileItemProperty) -> Int {
        Int(SteamAPI_ISteamFriends_GetProfileItemPropertyUint(interface, CUnsignedLongLong(steamID), ECommunityProfileItemType(type), ECommunityProfileItemProperty(prop)))
    }

    /// Steamworks `ISteamFriends::GetSmallFriendAvatar()`
    public func getSmallFriendAvatar(friend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetSmallFriendAvatar(interface, CUnsignedLongLong(friend)))
    }

    /// Steamworks `ISteamFriends::GetUserRestrictions()`
    public func getUserRestrictions() -> UserRestriction {
        UserRestriction(SteamAPI_ISteamFriends_GetUserRestrictions(interface))
    }

    /// Steamworks `ISteamFriends::HasFriend()`
    public func hasFriend(friend: SteamID, friendFlags: FriendFlags) -> Bool {
        SteamAPI_ISteamFriends_HasFriend(interface, CUnsignedLongLong(friend), Int32(friendFlags))
    }

    /// Steamworks `ISteamFriends::InviteUserToGame()`
    public func inviteUserToGame(friend: SteamID, connectString: String) -> Bool {
        SteamAPI_ISteamFriends_InviteUserToGame(interface, CUnsignedLongLong(friend), connectString)
    }

    /// Steamworks `ISteamFriends::IsClanChatAdmin()`
    public func isClanChatAdmin(clanChat: SteamID, user: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanChatAdmin(interface, CUnsignedLongLong(clanChat), CUnsignedLongLong(user))
    }

    /// Steamworks `ISteamFriends::IsClanChatWindowOpenInSteam()`
    public func isClanChatWindowOpenInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(interface, CUnsignedLongLong(clanChat))
    }

    /// Steamworks `ISteamFriends::IsClanOfficialGameGroup()`
    public func isClanOfficialGameGroup(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanOfficialGameGroup(interface, CUnsignedLongLong(clan))
    }

    /// Steamworks `ISteamFriends::IsClanPublic()`
    public func isClanPublic(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanPublic(interface, CUnsignedLongLong(clan))
    }

    /// Steamworks `ISteamFriends::IsFollowing()`, callback
    public func isFollowing(steamID: SteamID, completion: @Sendable @escaping (sending FriendsIsFollowing?) -> Void) {
        let rc = SteamAPI_ISteamFriends_IsFollowing(interface, CUnsignedLongLong(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::IsFollowing()`, async
    public func isFollowing(isolation: isolated (any Actor)? = #isolation, steamID: SteamID) async -> FriendsIsFollowing? {
        await withUnsafeContinuation {
            isFollowing(steamID: steamID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::IsUserInSource()`
    public func isUserInSource(user: SteamID, source: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsUserInSource(interface, CUnsignedLongLong(user), CUnsignedLongLong(source))
    }

    /// Steamworks `ISteamFriends::JoinClanChatRoom()`, callback
    public func joinClanChatRoom(clan: SteamID, completion: @Sendable @escaping (sending JoinClanChatRoomCompletionResult?) -> Void) {
        let rc = SteamAPI_ISteamFriends_JoinClanChatRoom(interface, CUnsignedLongLong(clan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::JoinClanChatRoom()`, async
    public func joinClanChatRoom(isolation: isolated (any Actor)? = #isolation, clan: SteamID) async -> JoinClanChatRoomCompletionResult? {
        await withUnsafeContinuation {
            joinClanChatRoom(clan: clan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::LeaveClanChatRoom()`
    public func leaveClanChatRoom(clan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_LeaveClanChatRoom(interface, CUnsignedLongLong(clan))
    }

    /// Steamworks `ISteamFriends::OpenClanChatWindowInSteam()`
    public func openClanChatWindowInSteam(clanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(interface, CUnsignedLongLong(clanChat))
    }

    /// Steamworks `ISteamFriends::RegisterProtocolInOverlayBrowser()`
    public func registerProtocolInOverlayBrowser(`protocol`: String) -> Bool {
        SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser(interface, `protocol`)
    }

    /// Steamworks `ISteamFriends::ReplyToFriendMessage()`
    public func replyToFriendMessage(friend: SteamID, msgToSend: String) -> Bool {
        SteamAPI_ISteamFriends_ReplyToFriendMessage(interface, CUnsignedLongLong(friend), msgToSend)
    }

    /// Steamworks `ISteamFriends::RequestClanOfficerList()`, callback
    public func requestClanOfficerList(clan: SteamID, completion: @Sendable @escaping (sending ClanOfficerListResponse?) -> Void) {
        let rc = SteamAPI_ISteamFriends_RequestClanOfficerList(interface, CUnsignedLongLong(clan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::RequestClanOfficerList()`, async
    public func requestClanOfficerList(isolation: isolated (any Actor)? = #isolation, clan: SteamID) async -> ClanOfficerListResponse? {
        await withUnsafeContinuation {
            requestClanOfficerList(clan: clan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::RequestEquippedProfileItems()`, callback
    public func requestEquippedProfileItems(steamID: SteamID, completion: @Sendable @escaping (sending EquippedProfileItems?) -> Void) {
        let rc = SteamAPI_ISteamFriends_RequestEquippedProfileItems(interface, CUnsignedLongLong(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::RequestEquippedProfileItems()`, async
    public func requestEquippedProfileItems(isolation: isolated (any Actor)? = #isolation, steamID: SteamID) async -> EquippedProfileItems? {
        await withUnsafeContinuation {
            requestEquippedProfileItems(steamID: steamID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::RequestFriendRichPresence()`
    public func requestFriendRichPresence(friend: SteamID) {
        SteamAPI_ISteamFriends_RequestFriendRichPresence(interface, CUnsignedLongLong(friend))
    }

    /// Steamworks `ISteamFriends::RequestUserInformation()`
    public func requestUserInformation(user: SteamID, requireNameOnly: Bool) -> Bool {
        SteamAPI_ISteamFriends_RequestUserInformation(interface, CUnsignedLongLong(user), requireNameOnly)
    }

    /// Steamworks `ISteamFriends::SendClanChatMessage()`
    public func sendClanChatMessage(clanChat: SteamID, text: String) -> Bool {
        SteamAPI_ISteamFriends_SendClanChatMessage(interface, CUnsignedLongLong(clanChat), text)
    }

    /// Steamworks `ISteamFriends::SetInGameVoiceSpeaking()`
    public func setInGameVoiceSpeaking(user: SteamID, speaking: Bool) {
        SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(interface, CUnsignedLongLong(user), speaking)
    }

    /// Steamworks `ISteamFriends::SetListenForFriendsMessages()`
    @discardableResult
    public func setListenForFriendsMessages(interceptEnabled: Bool) -> Bool {
        SteamAPI_ISteamFriends_SetListenForFriendsMessages(interface, interceptEnabled)
    }

    /// Steamworks `ISteamFriends::SetPersonaName()`, callback
    public func setPersonaName(personaName: String, completion: @Sendable @escaping (sending SetPersonaNameResponse?) -> Void) {
        let rc = SteamAPI_ISteamFriends_SetPersonaName(interface, personaName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::SetPersonaName()`, async
    public func setPersonaName(isolation: isolated (any Actor)? = #isolation, personaName: String) async -> SetPersonaNameResponse? {
        await withUnsafeContinuation {
            setPersonaName(personaName: personaName, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::SetPlayedWith()`
    public func setPlayedWith(userPlayedWith: SteamID) {
        SteamAPI_ISteamFriends_SetPlayedWith(interface, CUnsignedLongLong(userPlayedWith))
    }

    /// Steamworks `ISteamFriends::SetRichPresence()`
    @discardableResult
    public func setRichPresence(key: String, value: String?) -> Bool {
        SteamAPI_ISteamFriends_SetRichPresence(interface, key, value)
    }
}
