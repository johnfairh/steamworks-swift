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

    func setPersonaName(pchPersonaName: String) async -> SetPersonaNameResponse {
        await withUnsafeContinuation {
            setPersonaName(pchPersonaName: pchPersonaName, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetPersonaState()`
    var personaState: PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetPersonaState(interface))
    }

    /// Steamworks `ISteamFriends::GetFriendCount()`
    func getFriendCount(iFriendFlags: Int) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCount(interface, Int32(iFriendFlags)))
    }

    /// Steamworks `ISteamFriends::GetFriendByIndex()`
    func getFriendByIndex(iFriend: Int, iFriendFlags: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetFriendByIndex(interface, Int32(iFriend), Int32(iFriendFlags)))
    }

    /// Steamworks `ISteamFriends::GetFriendRelationship()`
    func getFriendRelationship(steamIDFriend: SteamID) -> FriendRelationship {
        FriendRelationship(SteamAPI_ISteamFriends_GetFriendRelationship(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaState()`
    func getFriendPersonaState(steamIDFriend: SteamID) -> PersonaState {
        PersonaState(SteamAPI_ISteamFriends_GetFriendPersonaState(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaName()`
    func getFriendPersonaName(steamIDFriend: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetFriendPersonaName(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::GetFriendGamePlayed()`
    func getFriendGamePlayed(steamIDFriend: SteamID, pFriendGameInfo: inout FriendGameInfo) -> Bool {
        var tmp_pFriendGameInfo = FriendGameInfo_t()
        let rc = SteamAPI_ISteamFriends_GetFriendGamePlayed(interface, UInt64(steamIDFriend), &tmp_pFriendGameInfo)
        if rc {
            pFriendGameInfo = FriendGameInfo(tmp_pFriendGameInfo)
        }
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaNameHistory()`
    func getFriendPersonaNameHistory(steamIDFriend: SteamID, iPersonaName: Int) -> String {
        String(SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(interface, UInt64(steamIDFriend), Int32(iPersonaName)))
    }

    /// Steamworks `ISteamFriends::GetFriendSteamLevel()`
    func getFriendSteamLevel(steamIDFriend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendSteamLevel(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::GetPlayerNickname()`
    func getPlayerNickname(steamIDPlayer: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetPlayerNickname(interface, UInt64(steamIDPlayer)))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupCount()`
    var friendsGroupCount: Int {
        Int(SteamAPI_ISteamFriends_GetFriendsGroupCount(interface))
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupIDByIndex()`
    func getFriendsGroupIDByIndex(iFG: Int) -> FriendsGroupID {
        FriendsGroupID(SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex(interface, Int32(iFG)))
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
    func getFriendsGroupMembersList(friendsGroupID: FriendsGroupID, pOutSteamIDMembers: inout [SteamID], nMembersCount: Int) {
        let tmp_pOutSteamIDMembers = UnsafeMutableBufferPointer<CSteamID>.allocate(capacity: nMembersCount)
        defer { tmp_pOutSteamIDMembers.deallocate() }
        SteamAPI_ISteamFriends_GetFriendsGroupMembersList(interface, FriendsGroupID_t(friendsGroupID), tmp_pOutSteamIDMembers.baseAddress, Int32(nMembersCount))
        pOutSteamIDMembers = tmp_pOutSteamIDMembers.map { SteamID($0) }
    }

    /// Steamworks `ISteamFriends::HasFriend()`
    func hasFriend(steamIDFriend: SteamID, iFriendFlags: Int) -> Bool {
        SteamAPI_ISteamFriends_HasFriend(interface, UInt64(steamIDFriend), Int32(iFriendFlags))
    }

    /// Steamworks `ISteamFriends::GetClanCount()`
    var clanCount: Int {
        Int(SteamAPI_ISteamFriends_GetClanCount(interface))
    }

    /// Steamworks `ISteamFriends::GetClanByIndex()`
    func getClanByIndex(iClan: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanByIndex(interface, Int32(iClan)))
    }

    /// Steamworks `ISteamFriends::GetClanName()`
    func getClanName(steamIDClan: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetClanName(interface, UInt64(steamIDClan)))
    }

    /// Steamworks `ISteamFriends::GetClanTag()`
    func getClanTag(steamIDClan: SteamID) -> String {
        String(SteamAPI_ISteamFriends_GetClanTag(interface, UInt64(steamIDClan)))
    }

    /// Steamworks `ISteamFriends::GetClanActivityCounts()`
    func getClanActivityCounts(steamIDClan: SteamID, pnOnline: inout Int, pnInGame: inout Int, pnChatting: inout Int) -> Bool {
        var tmp_pnOnline = Int32()
        var tmp_pnInGame = Int32()
        var tmp_pnChatting = Int32()
        let rc = SteamAPI_ISteamFriends_GetClanActivityCounts(interface, UInt64(steamIDClan), &tmp_pnOnline, &tmp_pnInGame, &tmp_pnChatting)
        pnOnline = Int(tmp_pnOnline)
        pnInGame = Int(tmp_pnInGame)
        pnChatting = Int(tmp_pnChatting)
        return rc
    }

    /// Steamworks `ISteamFriends::DownloadClanActivityCounts()`
    func downloadClanActivityCounts(psteamIDClans: [SteamID], completion: @escaping (DownloadClanActivityCountsResult) -> Void) {
        var tmp_psteamIDClans = psteamIDClans.map { CSteamID($0) }
        let rc = SteamAPI_ISteamFriends_DownloadClanActivityCounts(interface, &tmp_psteamIDClans, Int32(psteamIDClans.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func downloadClanActivityCounts(psteamIDClans: [SteamID]) async -> DownloadClanActivityCountsResult {
        await withUnsafeContinuation {
            downloadClanActivityCounts(psteamIDClans: psteamIDClans, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetFriendCountFromSource()`
    func getFriendCountFromSource(steamIDSource: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCountFromSource(interface, UInt64(steamIDSource)))
    }

    /// Steamworks `ISteamFriends::GetFriendFromSourceByIndex()`
    func getFriendFromSourceByIndex(steamIDSource: SteamID, iFriend: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(interface, UInt64(steamIDSource), Int32(iFriend)))
    }

    /// Steamworks `ISteamFriends::IsUserInSource()`
    func isUserInSource(steamIDUser: SteamID, steamIDSource: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsUserInSource(interface, UInt64(steamIDUser), UInt64(steamIDSource))
    }

    /// Steamworks `ISteamFriends::SetInGameVoiceSpeaking()`
    func setInGameVoiceSpeaking(steamIDUser: SteamID, bSpeaking: Bool) {
        SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(interface, UInt64(steamIDUser), bSpeaking)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlay()`
    func activateGameOverlay(pchDialog: String) {
        SteamAPI_ISteamFriends_ActivateGameOverlay(interface, pchDialog)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToUser()`
    func activateGameOverlayToUser(pchDialog: String, steamID: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToUser(interface, pchDialog, UInt64(steamID))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToWebPage()`
    func activateGameOverlayToWebPage(pchURL: String, eMode: ActivateGameOverlayToWebPageMode) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(interface, pchURL, EActivateGameOverlayToWebPageMode(eMode))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayToStore()`
    func activateGameOverlayToStore(nAppID: AppId, eFlag: OverlayToStoreFlag) {
        SteamAPI_ISteamFriends_ActivateGameOverlayToStore(interface, AppId_t(nAppID), EOverlayToStoreFlag(eFlag))
    }

    /// Steamworks `ISteamFriends::SetPlayedWith()`
    func setPlayedWith(steamIDUserPlayedWith: SteamID) {
        SteamAPI_ISteamFriends_SetPlayedWith(interface, UInt64(steamIDUserPlayedWith))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayInviteDialog()`
    func activateGameOverlayInviteDialog(steamIDLobby: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(interface, UInt64(steamIDLobby))
    }

    /// Steamworks `ISteamFriends::GetSmallFriendAvatar()`
    func getSmallFriendAvatar(steamIDFriend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetSmallFriendAvatar(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::GetMediumFriendAvatar()`
    func getMediumFriendAvatar(steamIDFriend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetMediumFriendAvatar(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::GetLargeFriendAvatar()`
    func getLargeFriendAvatar(steamIDFriend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetLargeFriendAvatar(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::RequestUserInformation()`
    func requestUserInformation(steamIDUser: SteamID, bRequireNameOnly: Bool) -> Bool {
        SteamAPI_ISteamFriends_RequestUserInformation(interface, UInt64(steamIDUser), bRequireNameOnly)
    }

    /// Steamworks `ISteamFriends::RequestClanOfficerList()`
    func requestClanOfficerList(steamIDClan: SteamID, completion: @escaping (ClanOfficerListResponse) -> Void) {
        let rc = SteamAPI_ISteamFriends_RequestClanOfficerList(interface, UInt64(steamIDClan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func requestClanOfficerList(steamIDClan: SteamID) async -> ClanOfficerListResponse {
        await withUnsafeContinuation {
            requestClanOfficerList(steamIDClan: steamIDClan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::GetClanOwner()`
    func getClanOwner(steamIDClan: SteamID) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanOwner(interface, UInt64(steamIDClan)))
    }

    /// Steamworks `ISteamFriends::GetClanOfficerCount()`
    func getClanOfficerCount(steamIDClan: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetClanOfficerCount(interface, UInt64(steamIDClan)))
    }

    /// Steamworks `ISteamFriends::GetClanOfficerByIndex()`
    func getClanOfficerByIndex(steamIDClan: SteamID, iOfficer: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetClanOfficerByIndex(interface, UInt64(steamIDClan), Int32(iOfficer)))
    }

    /// Steamworks `ISteamFriends::GetUserRestrictions()`
    var userRestrictions: UserRestriction {
        UserRestriction(SteamAPI_ISteamFriends_GetUserRestrictions(interface))
    }

    /// Steamworks `ISteamFriends::SetRichPresence()`
    func setRichPresence(pchKey: String, pchValue: String) -> Bool {
        SteamAPI_ISteamFriends_SetRichPresence(interface, pchKey, pchValue)
    }

    /// Steamworks `ISteamFriends::ClearRichPresence()`
    func clearRichPresence() {
        SteamAPI_ISteamFriends_ClearRichPresence(interface)
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresence()`
    func getFriendRichPresence(steamIDFriend: SteamID, pchKey: String) -> String {
        String(SteamAPI_ISteamFriends_GetFriendRichPresence(interface, UInt64(steamIDFriend), pchKey))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyCount()`
    func getFriendRichPresenceKeyCount(steamIDFriend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyByIndex()`
    func getFriendRichPresenceKeyByIndex(steamIDFriend: SteamID, iKey: Int) -> String {
        String(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(interface, UInt64(steamIDFriend), Int32(iKey)))
    }

    /// Steamworks `ISteamFriends::RequestFriendRichPresence()`
    func requestFriendRichPresence(steamIDFriend: SteamID) {
        SteamAPI_ISteamFriends_RequestFriendRichPresence(interface, UInt64(steamIDFriend))
    }

    /// Steamworks `ISteamFriends::InviteUserToGame()`
    func inviteUserToGame(steamIDFriend: SteamID, pchConnectString: String) -> Bool {
        SteamAPI_ISteamFriends_InviteUserToGame(interface, UInt64(steamIDFriend), pchConnectString)
    }

    /// Steamworks `ISteamFriends::GetCoplayFriendCount()`
    var coplayFriendCount: Int {
        Int(SteamAPI_ISteamFriends_GetCoplayFriendCount(interface))
    }

    /// Steamworks `ISteamFriends::GetCoplayFriend()`
    func getCoplayFriend(iCoplayFriend: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetCoplayFriend(interface, Int32(iCoplayFriend)))
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayTime()`
    func getFriendCoplayTime(steamIDFriend: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetFriendCoplayTime(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayGame()`
    func getFriendCoplayGame(steamIDFriend: SteamID) -> AppId {
        AppId(SteamAPI_ISteamFriends_GetFriendCoplayGame(interface, UInt64(steamIDFriend)))
    }

    /// Steamworks `ISteamFriends::JoinClanChatRoom()`
    func joinClanChatRoom(steamIDClan: SteamID, completion: @escaping (JoinClanChatRoomCompletionResult) -> Void) {
        let rc = SteamAPI_ISteamFriends_JoinClanChatRoom(interface, UInt64(steamIDClan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func joinClanChatRoom(steamIDClan: SteamID) async -> JoinClanChatRoomCompletionResult {
        await withUnsafeContinuation {
            joinClanChatRoom(steamIDClan: steamIDClan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::LeaveClanChatRoom()`
    func leaveClanChatRoom(steamIDClan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_LeaveClanChatRoom(interface, UInt64(steamIDClan))
    }

    /// Steamworks `ISteamFriends::GetClanChatMemberCount()`
    func getClanChatMemberCount(steamIDClan: SteamID) -> Int {
        Int(SteamAPI_ISteamFriends_GetClanChatMemberCount(interface, UInt64(steamIDClan)))
    }

    /// Steamworks `ISteamFriends::GetChatMemberByIndex()`
    func getChatMemberByIndex(steamIDClan: SteamID, iUser: Int) -> SteamID {
        SteamID(SteamAPI_ISteamFriends_GetChatMemberByIndex(interface, UInt64(steamIDClan), Int32(iUser)))
    }

    /// Steamworks `ISteamFriends::SendClanChatMessage()`
    func sendClanChatMessage(steamIDClanChat: SteamID, pchText: String) -> Bool {
        SteamAPI_ISteamFriends_SendClanChatMessage(interface, UInt64(steamIDClanChat), pchText)
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

    /// Steamworks `ISteamFriends::IsClanChatAdmin()`
    func isClanChatAdmin(steamIDClanChat: SteamID, steamIDUser: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanChatAdmin(interface, UInt64(steamIDClanChat), UInt64(steamIDUser))
    }

    /// Steamworks `ISteamFriends::IsClanChatWindowOpenInSteam()`
    func isClanChatWindowOpenInSteam(steamIDClanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(interface, UInt64(steamIDClanChat))
    }

    /// Steamworks `ISteamFriends::OpenClanChatWindowInSteam()`
    func openClanChatWindowInSteam(steamIDClanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(interface, UInt64(steamIDClanChat))
    }

    /// Steamworks `ISteamFriends::CloseClanChatWindowInSteam()`
    func closeClanChatWindowInSteam(steamIDClanChat: SteamID) -> Bool {
        SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(interface, UInt64(steamIDClanChat))
    }

    /// Steamworks `ISteamFriends::SetListenForFriendsMessages()`
    func setListenForFriendsMessages(bInterceptEnabled: Bool) -> Bool {
        SteamAPI_ISteamFriends_SetListenForFriendsMessages(interface, bInterceptEnabled)
    }

    /// Steamworks `ISteamFriends::ReplyToFriendMessage()`
    func replyToFriendMessage(steamIDFriend: SteamID, pchMsgToSend: String) -> Bool {
        SteamAPI_ISteamFriends_ReplyToFriendMessage(interface, UInt64(steamIDFriend), pchMsgToSend)
    }

    /// Steamworks `ISteamFriends::GetFriendMessage()`
    func getFriendMessage(steamIDFriend: SteamID, iMessageID: Int, pvData: UnsafeMutableRawPointer, cubData: Int, peChatEntryType: inout ChatEntryType) -> Int {
        var tmp_peChatEntryType = EChatEntryType(rawValue: 0)
        let rc = Int(SteamAPI_ISteamFriends_GetFriendMessage(interface, UInt64(steamIDFriend), Int32(iMessageID), pvData, Int32(cubData), &tmp_peChatEntryType))
        peChatEntryType = ChatEntryType(tmp_peChatEntryType)
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
    func enumerateFollowingList(unStartIndex: Int, completion: @escaping (FriendsEnumerateFollowingList) -> Void) {
        let rc = SteamAPI_ISteamFriends_EnumerateFollowingList(interface, uint32(unStartIndex))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    func enumerateFollowingList(unStartIndex: Int) async -> FriendsEnumerateFollowingList {
        await withUnsafeContinuation {
            enumerateFollowingList(unStartIndex: unStartIndex, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamFriends::IsClanPublic()`
    func isClanPublic(steamIDClan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanPublic(interface, UInt64(steamIDClan))
    }

    /// Steamworks `ISteamFriends::IsClanOfficialGameGroup()`
    func isClanOfficialGameGroup(steamIDClan: SteamID) -> Bool {
        SteamAPI_ISteamFriends_IsClanOfficialGameGroup(interface, UInt64(steamIDClan))
    }

    /// Steamworks `ISteamFriends::GetNumChatsWithUnreadPriorityMessages()`
    var numChatsWithUnreadPriorityMessages: Int {
        Int(SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages(interface))
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayRemotePlayTogetherInviteDialog()`
    func activateGameOverlayRemotePlayTogetherInviteDialog(steamIDLobby: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(interface, UInt64(steamIDLobby))
    }

    /// Steamworks `ISteamFriends::RegisterProtocolInOverlayBrowser()`
    func registerProtocolInOverlayBrowser(pchProtocol: String) -> Bool {
        SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser(interface, pchProtocol)
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayInviteDialogConnectString()`
    func activateGameOverlayInviteDialogConnectString(pchConnectString: String) {
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString(interface, pchConnectString)
    }
}
