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
        let rc = String(SteamAPI_ISteamFriends_GetPersonaName(interface))
        return rc
    }

    /// Steamworks `ISteamFriends::SetPersonaName()`
    func setPersonaName(pchPersonaName: String, completion: @escaping (SetPersonaNameResponse) -> Void) {
        let rc = SteamAPI_ISteamFriends_SetPersonaName(interface, pchPersonaName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::GetPersonaState()`
    var personaState: PersonaState {
        let rc = PersonaState(SteamAPI_ISteamFriends_GetPersonaState(interface))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendCount()`
    func getFriendCount(iFriendFlags: Int) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetFriendCount(interface, Int32(iFriendFlags)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendByIndex()`
    func getFriendByIndex(iFriend: Int, iFriendFlags: Int) -> SteamID {
        let rc = SteamID(SteamAPI_ISteamFriends_GetFriendByIndex(interface, Int32(iFriend), Int32(iFriendFlags)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendRelationship()`
    func getFriendRelationship(steamIDFriend: SteamID) -> FriendRelationship {
        let rc = FriendRelationship(SteamAPI_ISteamFriends_GetFriendRelationship(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaState()`
    func getFriendPersonaState(steamIDFriend: SteamID) -> PersonaState {
        let rc = PersonaState(SteamAPI_ISteamFriends_GetFriendPersonaState(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaName()`
    func getFriendPersonaName(steamIDFriend: SteamID) -> String {
        let rc = String(SteamAPI_ISteamFriends_GetFriendPersonaName(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendGamePlayed()`
    func getFriendGamePlayed(steamIDFriend: SteamID, pFriendGameInfo: FriendGameInfot *) -> Bool {
        let rc = SteamAPI_ISteamFriends_GetFriendGamePlayed(interface, UInt64(steamIDFriend), FriendGameInfo_t *(pFriendGameInfo))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendPersonaNameHistory()`
    func getFriendPersonaNameHistory(steamIDFriend: SteamID, iPersonaName: Int) -> String {
        let rc = String(SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(interface, UInt64(steamIDFriend), Int32(iPersonaName)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendSteamLevel()`
    func getFriendSteamLevel(steamIDFriend: SteamID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetFriendSteamLevel(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetPlayerNickname()`
    func getPlayerNickname(steamIDPlayer: SteamID) -> String {
        let rc = String(SteamAPI_ISteamFriends_GetPlayerNickname(interface, UInt64(steamIDPlayer)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupCount()`
    var friendsGroupCount: Int {
        let rc = Int(SteamAPI_ISteamFriends_GetFriendsGroupCount(interface))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupIDByIndex()`
    func getFriendsGroupIDByIndex(iFG: Int) -> FriendsGroupID {
        let rc = FriendsGroupID(SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex(interface, Int32(iFG)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupName()`
    func getFriendsGroupName(friendsGroupID: FriendsGroupID) -> String {
        let rc = String(SteamAPI_ISteamFriends_GetFriendsGroupName(interface, FriendsGroupID_t(friendsGroupID)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersCount()`
    func getFriendsGroupMembersCount(friendsGroupID: FriendsGroupID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetFriendsGroupMembersCount(interface, FriendsGroupID_t(friendsGroupID)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendsGroupMembersList()`
    func getFriendsGroupMembersList(friendsGroupID: FriendsGroupID, pOutSteamIDMembers: SteamID *, nMembersCount: Int) {
        SteamAPI_ISteamFriends_GetFriendsGroupMembersList(interface, FriendsGroupID_t(friendsGroupID), CSteamID *(pOutSteamIDMembers), Int32(nMembersCount))
    }

    /// Steamworks `ISteamFriends::HasFriend()`
    func hasFriend(steamIDFriend: SteamID, iFriendFlags: Int) -> Bool {
        let rc = SteamAPI_ISteamFriends_HasFriend(interface, UInt64(steamIDFriend), Int32(iFriendFlags))
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanCount()`
    var clanCount: Int {
        let rc = Int(SteamAPI_ISteamFriends_GetClanCount(interface))
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanByIndex()`
    func getClanByIndex(iClan: Int) -> SteamID {
        let rc = SteamID(SteamAPI_ISteamFriends_GetClanByIndex(interface, Int32(iClan)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanName()`
    func getClanName(steamIDClan: SteamID) -> String {
        let rc = String(SteamAPI_ISteamFriends_GetClanName(interface, UInt64(steamIDClan)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanTag()`
    func getClanTag(steamIDClan: SteamID) -> String {
        let rc = String(SteamAPI_ISteamFriends_GetClanTag(interface, UInt64(steamIDClan)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanActivityCounts()`
    func getClanActivityCounts(steamIDClan: SteamID, pnOnline: int *, pnInGame: int *, pnChatting: int *) -> Bool {
        let rc = SteamAPI_ISteamFriends_GetClanActivityCounts(interface, UInt64(steamIDClan), int *(pnOnline), int *(pnInGame), int *(pnChatting))
        return rc
    }

    /// Steamworks `ISteamFriends::DownloadClanActivityCounts()`
    func downloadClanActivityCounts(psteamIDClans: SteamID *, cClansToRequest: Int, completion: @escaping (DownloadClanActivityCountsResult) -> Void) {
        let rc = SteamAPI_ISteamFriends_DownloadClanActivityCounts(interface, CSteamID *(psteamIDClans), Int32(cClansToRequest))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::GetFriendCountFromSource()`
    func getFriendCountFromSource(steamIDSource: SteamID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetFriendCountFromSource(interface, UInt64(steamIDSource)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendFromSourceByIndex()`
    func getFriendFromSourceByIndex(steamIDSource: SteamID, iFriend: Int) -> SteamID {
        let rc = SteamID(SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(interface, UInt64(steamIDSource), Int32(iFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::IsUserInSource()`
    func isUserInSource(steamIDUser: SteamID, steamIDSource: SteamID) -> Bool {
        let rc = SteamAPI_ISteamFriends_IsUserInSource(interface, UInt64(steamIDUser), UInt64(steamIDSource))
        return rc
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
        let rc = Int(SteamAPI_ISteamFriends_GetSmallFriendAvatar(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetMediumFriendAvatar()`
    func getMediumFriendAvatar(steamIDFriend: SteamID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetMediumFriendAvatar(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetLargeFriendAvatar()`
    func getLargeFriendAvatar(steamIDFriend: SteamID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetLargeFriendAvatar(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::RequestUserInformation()`
    func requestUserInformation(steamIDUser: SteamID, bRequireNameOnly: Bool) -> Bool {
        let rc = SteamAPI_ISteamFriends_RequestUserInformation(interface, UInt64(steamIDUser), bRequireNameOnly)
        return rc
    }

    /// Steamworks `ISteamFriends::RequestClanOfficerList()`
    func requestClanOfficerList(steamIDClan: SteamID, completion: @escaping (ClanOfficerListResponse) -> Void) {
        let rc = SteamAPI_ISteamFriends_RequestClanOfficerList(interface, UInt64(steamIDClan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::GetClanOwner()`
    func getClanOwner(steamIDClan: SteamID) -> SteamID {
        let rc = SteamID(SteamAPI_ISteamFriends_GetClanOwner(interface, UInt64(steamIDClan)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanOfficerCount()`
    func getClanOfficerCount(steamIDClan: SteamID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetClanOfficerCount(interface, UInt64(steamIDClan)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanOfficerByIndex()`
    func getClanOfficerByIndex(steamIDClan: SteamID, iOfficer: Int) -> SteamID {
        let rc = SteamID(SteamAPI_ISteamFriends_GetClanOfficerByIndex(interface, UInt64(steamIDClan), Int32(iOfficer)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetUserRestrictions()`
    var userRestrictions: uint32 {
        let rc = uint32(SteamAPI_ISteamFriends_GetUserRestrictions(interface))
        return rc
    }

    /// Steamworks `ISteamFriends::SetRichPresence()`
    func setRichPresence(pchKey: String, pchValue: String) -> Bool {
        let rc = SteamAPI_ISteamFriends_SetRichPresence(interface, pchKey, pchValue)
        return rc
    }

    /// Steamworks `ISteamFriends::ClearRichPresence()`
    func clearRichPresence() {
        SteamAPI_ISteamFriends_ClearRichPresence(interface)
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresence()`
    func getFriendRichPresence(steamIDFriend: SteamID, pchKey: String) -> String {
        let rc = String(SteamAPI_ISteamFriends_GetFriendRichPresence(interface, UInt64(steamIDFriend), pchKey))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyCount()`
    func getFriendRichPresenceKeyCount(steamIDFriend: SteamID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendRichPresenceKeyByIndex()`
    func getFriendRichPresenceKeyByIndex(steamIDFriend: SteamID, iKey: Int) -> String {
        let rc = String(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(interface, UInt64(steamIDFriend), Int32(iKey)))
        return rc
    }

    /// Steamworks `ISteamFriends::RequestFriendRichPresence()`
    func requestFriendRichPresence(steamIDFriend: SteamID) {
        SteamAPI_ISteamFriends_RequestFriendRichPresence(interface, UInt64(steamIDFriend))
    }

    /// Steamworks `ISteamFriends::InviteUserToGame()`
    func inviteUserToGame(steamIDFriend: SteamID, pchConnectString: String) -> Bool {
        let rc = SteamAPI_ISteamFriends_InviteUserToGame(interface, UInt64(steamIDFriend), pchConnectString)
        return rc
    }

    /// Steamworks `ISteamFriends::GetCoplayFriendCount()`
    var coplayFriendCount: Int {
        let rc = Int(SteamAPI_ISteamFriends_GetCoplayFriendCount(interface))
        return rc
    }

    /// Steamworks `ISteamFriends::GetCoplayFriend()`
    func getCoplayFriend(iCoplayFriend: Int) -> SteamID {
        let rc = SteamID(SteamAPI_ISteamFriends_GetCoplayFriend(interface, Int32(iCoplayFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayTime()`
    func getFriendCoplayTime(steamIDFriend: SteamID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetFriendCoplayTime(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendCoplayGame()`
    func getFriendCoplayGame(steamIDFriend: SteamID) -> AppId {
        let rc = AppId(SteamAPI_ISteamFriends_GetFriendCoplayGame(interface, UInt64(steamIDFriend)))
        return rc
    }

    /// Steamworks `ISteamFriends::JoinClanChatRoom()`
    func joinClanChatRoom(steamIDClan: SteamID, completion: @escaping (JoinClanChatRoomCompletionResult) -> Void) {
        let rc = SteamAPI_ISteamFriends_JoinClanChatRoom(interface, UInt64(steamIDClan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::LeaveClanChatRoom()`
    func leaveClanChatRoom(steamIDClan: SteamID) -> Bool {
        let rc = SteamAPI_ISteamFriends_LeaveClanChatRoom(interface, UInt64(steamIDClan))
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanChatMemberCount()`
    func getClanChatMemberCount(steamIDClan: SteamID) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetClanChatMemberCount(interface, UInt64(steamIDClan)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetChatMemberByIndex()`
    func getChatMemberByIndex(steamIDClan: SteamID, iUser: Int) -> SteamID {
        let rc = SteamID(SteamAPI_ISteamFriends_GetChatMemberByIndex(interface, UInt64(steamIDClan), Int32(iUser)))
        return rc
    }

    /// Steamworks `ISteamFriends::SendClanChatMessage()`
    func sendClanChatMessage(steamIDClanChat: SteamID, pchText: String) -> Bool {
        let rc = SteamAPI_ISteamFriends_SendClanChatMessage(interface, UInt64(steamIDClanChat), pchText)
        return rc
    }

    /// Steamworks `ISteamFriends::GetClanChatMessage()`
    func getClanChatMessage(steamIDClanChat: SteamID, iMessage: Int, prgchText: void *, cchTextMax: Int, peChatEntryType: ChatEntryType *, psteamidChatter: SteamID *) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetClanChatMessage(interface, UInt64(steamIDClanChat), Int32(iMessage), void *(prgchText), Int32(cchTextMax), EChatEntryType *(peChatEntryType), CSteamID *(psteamidChatter)))
        return rc
    }

    /// Steamworks `ISteamFriends::IsClanChatAdmin()`
    func isClanChatAdmin(steamIDClanChat: SteamID, steamIDUser: SteamID) -> Bool {
        let rc = SteamAPI_ISteamFriends_IsClanChatAdmin(interface, UInt64(steamIDClanChat), UInt64(steamIDUser))
        return rc
    }

    /// Steamworks `ISteamFriends::IsClanChatWindowOpenInSteam()`
    func isClanChatWindowOpenInSteam(steamIDClanChat: SteamID) -> Bool {
        let rc = SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(interface, UInt64(steamIDClanChat))
        return rc
    }

    /// Steamworks `ISteamFriends::OpenClanChatWindowInSteam()`
    func openClanChatWindowInSteam(steamIDClanChat: SteamID) -> Bool {
        let rc = SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(interface, UInt64(steamIDClanChat))
        return rc
    }

    /// Steamworks `ISteamFriends::CloseClanChatWindowInSteam()`
    func closeClanChatWindowInSteam(steamIDClanChat: SteamID) -> Bool {
        let rc = SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(interface, UInt64(steamIDClanChat))
        return rc
    }

    /// Steamworks `ISteamFriends::SetListenForFriendsMessages()`
    func setListenForFriendsMessages(bInterceptEnabled: Bool) -> Bool {
        let rc = SteamAPI_ISteamFriends_SetListenForFriendsMessages(interface, bInterceptEnabled)
        return rc
    }

    /// Steamworks `ISteamFriends::ReplyToFriendMessage()`
    func replyToFriendMessage(steamIDFriend: SteamID, pchMsgToSend: String) -> Bool {
        let rc = SteamAPI_ISteamFriends_ReplyToFriendMessage(interface, UInt64(steamIDFriend), pchMsgToSend)
        return rc
    }

    /// Steamworks `ISteamFriends::GetFriendMessage()`
    func getFriendMessage(steamIDFriend: SteamID, iMessageID: Int, pvData: void *, cubData: Int, peChatEntryType: ChatEntryType *) -> Int {
        let rc = Int(SteamAPI_ISteamFriends_GetFriendMessage(interface, UInt64(steamIDFriend), Int32(iMessageID), void *(pvData), Int32(cubData), EChatEntryType *(peChatEntryType)))
        return rc
    }

    /// Steamworks `ISteamFriends::GetFollowerCount()`
    func getFollowerCount(steamID: SteamID, completion: @escaping (FriendsGetFollowerCount) -> Void) {
        let rc = SteamAPI_ISteamFriends_GetFollowerCount(interface, UInt64(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::IsFollowing()`
    func isFollowing(steamID: SteamID, completion: @escaping (FriendsIsFollowing) -> Void) {
        let rc = SteamAPI_ISteamFriends_IsFollowing(interface, UInt64(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::EnumerateFollowingList()`
    func enumerateFollowingList(unStartIndex: uint32, completion: @escaping (FriendsEnumerateFollowingList) -> Void) {
        let rc = SteamAPI_ISteamFriends_EnumerateFollowingList(interface, uint32(unStartIndex))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamFriends::IsClanPublic()`
    func isClanPublic(steamIDClan: SteamID) -> Bool {
        let rc = SteamAPI_ISteamFriends_IsClanPublic(interface, UInt64(steamIDClan))
        return rc
    }

    /// Steamworks `ISteamFriends::IsClanOfficialGameGroup()`
    func isClanOfficialGameGroup(steamIDClan: SteamID) -> Bool {
        let rc = SteamAPI_ISteamFriends_IsClanOfficialGameGroup(interface, UInt64(steamIDClan))
        return rc
    }

    /// Steamworks `ISteamFriends::GetNumChatsWithUnreadPriorityMessages()`
    var numChatsWithUnreadPriorityMessages: Int {
        let rc = Int(SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages(interface))
        return rc
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayRemotePlayTogetherInviteDialog()`
    func activateGameOverlayRemotePlayTogetherInviteDialog(steamIDLobby: SteamID) {
        SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(interface, UInt64(steamIDLobby))
    }

    /// Steamworks `ISteamFriends::RegisterProtocolInOverlayBrowser()`
    func registerProtocolInOverlayBrowser(pchProtocol: String) -> Bool {
        let rc = SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser(interface, pchProtocol)
        return rc
    }

    /// Steamworks `ISteamFriends::ActivateGameOverlayInviteDialogConnectString()`
    func activateGameOverlayInviteDialogConnectString(pchConnectString: String) {
        SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString(interface, pchConnectString)
    }
}
