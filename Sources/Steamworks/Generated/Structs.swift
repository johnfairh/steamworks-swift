//
//  Structs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks `SteamServersConnected_t`
public struct SteamServersConnected {

}

/// Steamworks `SteamServerConnectFailure_t`
public struct SteamServerConnectFailure {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_bStillRetrying`
    public let _bStillRetrying: Bool
}

/// Steamworks `SteamServersDisconnected_t`
public struct SteamServersDisconnected {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `ClientGameServerDeny_t`
public struct ClientGameServerDeny {
    /// Steamworks `m_uAppID`
    public let _uAppID: Int
    /// Steamworks `m_unGameServerIP`
    public let _unGameServerIP: Int
    /// Steamworks `m_usGameServerPort`
    public let _usGameServerPort: uint16
    /// Steamworks `m_bSecure`
    public let _bSecure: uint16
    /// Steamworks `m_uReason`
    public let _uReason: Int
}

/// Steamworks `IPCFailure_t`
public struct PCFailure {
    /// Steamworks `m_eFailureType`
    public let _eFailureType: uint8
}

/// Steamworks `LicensesUpdated_t`
public struct LicensesUpdated {

}

/// Steamworks `ValidateAuthTicketResponse_t`
public struct ValidateAuthTicketResponse {
    /// Steamworks `m_SteamID`
    public let _steamID: SteamID
    /// Steamworks `m_eAuthSessionResponse`
    public let _eAuthSessionResponse: AuthSessionResponse
    /// Steamworks `m_OwnerSteamID`
    public let _ownerSteamID: SteamID
}

/// Steamworks `MicroTxnAuthorizationResponse_t`
public struct MicroTxnAuthorizationResponse {
    /// Steamworks `m_unAppID`
    public let _unAppID: Int
    /// Steamworks `m_ulOrderID`
    public let _ulOrderID: uint64
    /// Steamworks `m_bAuthorized`
    public let _bAuthorized: uint8
}

/// Steamworks `EncryptedAppTicketResponse_t`
public struct EncryptedAppTicketResponse {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `GetAuthSessionTicketResponse_t`
public struct GetAuthSessionTicketResponse {
    /// Steamworks `m_hAuthTicket`
    public let _hAuthTicket: HAuthTicket
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `GameWebCallback_t`
public struct GameWebCallback {
    /// Steamworks `m_szURL`
    public let _szURL: char [256]
}

/// Steamworks `StoreAuthURLResponse_t`
public struct StoreAuthURLResponse {
    /// Steamworks `m_szURL`
    public let _szURL: char [512]
}

/// Steamworks `MarketEligibilityResponse_t`
public struct MarketEligibilityResponse {
    /// Steamworks `m_bAllowed`
    public let _bAllowed: Bool
    /// Steamworks `m_eNotAllowedReason`
    public let _eNotAllowedReason: MarketNotAllowedReasonFlags
    /// Steamworks `m_rtAllowedAtTime`
    public let _rtAllowedAtTime: RTime32
    /// Steamworks `m_cdaySteamGuardRequiredDays`
    public let _cdaySteamGuardRequiredDays: Int
    /// Steamworks `m_cdayNewDeviceCooldown`
    public let _cdayNewDeviceCooldown: Int
}

/// Steamworks `DurationControl_t`
public struct DurationControl {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_appid`
    public let _appid: AppId
    /// Steamworks `m_bApplicable`
    public let _bApplicable: Bool
    /// Steamworks `m_csecsLast5h`
    public let _csecsLast5h: int32
    /// Steamworks `m_progress`
    public let _progress: DurationControlProgress
    /// Steamworks `m_notification`
    public let _notification: DurationControlNotification
    /// Steamworks `m_csecsToday`
    public let _csecsToday: int32
    /// Steamworks `m_csecsRemaining`
    public let _csecsRemaining: int32
}

/// Steamworks `PersonaStateChange_t`
public struct PersonaStateChange {
    /// Steamworks `m_ulSteamID`
    public let _ulSteamID: uint64
    /// Steamworks `m_nChangeFlags`
    public let _nChangeFlags: Int
}

/// Steamworks `GameOverlayActivated_t`
public struct GameOverlayActivated {
    /// Steamworks `m_bActive`
    public let _bActive: uint8
}

/// Steamworks `GameServerChangeRequested_t`
public struct GameServerChangeRequested {
    /// Steamworks `m_rgchServer`
    public let _rgchServer: char [64]
    /// Steamworks `m_rgchPassword`
    public let _rgchPassword: char [64]
}

/// Steamworks `GameLobbyJoinRequested_t`
public struct GameLobbyJoinRequested {
    /// Steamworks `m_steamIDLobby`
    public let _steamIDLobby: SteamID
    /// Steamworks `m_steamIDFriend`
    public let _steamIDFriend: SteamID
}

/// Steamworks `AvatarImageLoaded_t`
public struct AvatarImageLoaded {
    /// Steamworks `m_steamID`
    public let _steamID: SteamID
    /// Steamworks `m_iImage`
    public let _iImage: Int
    /// Steamworks `m_iWide`
    public let _iWide: Int
    /// Steamworks `m_iTall`
    public let _iTall: Int
}

/// Steamworks `ClanOfficerListResponse_t`
public struct ClanOfficerListResponse {
    /// Steamworks `m_steamIDClan`
    public let _steamIDClan: SteamID
    /// Steamworks `m_cOfficers`
    public let _cOfficers: Int
    /// Steamworks `m_bSuccess`
    public let _bSuccess: uint8
}

/// Steamworks `FriendRichPresenceUpdate_t`
public struct FriendRichPresenceUpdate {
    /// Steamworks `m_steamIDFriend`
    public let _steamIDFriend: SteamID
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
}

/// Steamworks `GameRichPresenceJoinRequested_t`
public struct GameRichPresenceJoinRequested {
    /// Steamworks `m_steamIDFriend`
    public let _steamIDFriend: SteamID
    /// Steamworks `m_rgchConnect`
    public let _rgchConnect: char [256]
}

/// Steamworks `GameConnectedClanChatMsg_t`
public struct GameConnectedClanChatMsg {
    /// Steamworks `m_steamIDClanChat`
    public let _steamIDClanChat: SteamID
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
    /// Steamworks `m_iMessageID`
    public let _iMessageID: Int
}

/// Steamworks `GameConnectedChatJoin_t`
public struct GameConnectedChatJoin {
    /// Steamworks `m_steamIDClanChat`
    public let _steamIDClanChat: SteamID
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
}

/// Steamworks `GameConnectedChatLeave_t`
public struct GameConnectedChatLeave {
    /// Steamworks `m_steamIDClanChat`
    public let _steamIDClanChat: SteamID
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
    /// Steamworks `m_bKicked`
    public let _bKicked: Bool
    /// Steamworks `m_bDropped`
    public let _bDropped: Bool
}

/// Steamworks `DownloadClanActivityCountsResult_t`
public struct DownloadClanActivityCountsResult {
    /// Steamworks `m_bSuccess`
    public let _bSuccess: Bool
}

/// Steamworks `JoinClanChatRoomCompletionResult_t`
public struct JoinClanChatRoomCompletionResult {
    /// Steamworks `m_steamIDClanChat`
    public let _steamIDClanChat: SteamID
    /// Steamworks `m_eChatRoomEnterResponse`
    public let _eChatRoomEnterResponse: ChatRoomEnterResponse
}

/// Steamworks `GameConnectedFriendChatMsg_t`
public struct GameConnectedFriendChatMsg {
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
    /// Steamworks `m_iMessageID`
    public let _iMessageID: Int
}

/// Steamworks `FriendsGetFollowerCount_t`
public struct FriendsGetFollowerCount {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_steamID`
    public let _steamID: SteamID
    /// Steamworks `m_nCount`
    public let _nCount: Int
}

/// Steamworks `FriendsIsFollowing_t`
public struct FriendsIsFollowing {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_steamID`
    public let _steamID: SteamID
    /// Steamworks `m_bIsFollowing`
    public let _bIsFollowing: Bool
}

/// Steamworks `FriendsEnumerateFollowingList_t`
public struct FriendsEnumerateFollowingList {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_rgSteamID`
    public let _rgSteamID: SteamID [50]
    /// Steamworks `m_nResultsReturned`
    public let _nResultsReturned: int32
    /// Steamworks `m_nTotalResultCount`
    public let _nTotalResultCount: int32
}

/// Steamworks `SetPersonaNameResponse_t`
public struct SetPersonaNameResponse {
    /// Steamworks `m_bSuccess`
    public let _bSuccess: Bool
    /// Steamworks `m_bLocalSuccess`
    public let _bLocalSuccess: Bool
    /// Steamworks `m_result`
    public let _result: SteamResult
}

/// Steamworks `UnreadChatMessagesChanged_t`
public struct UnreadChatMessagesChanged {

}

/// Steamworks `OverlayBrowserProtocolNavigation_t`
public struct OverlayBrowserProtocolNavigation {
    /// Steamworks `rgchURI`
    public let uri: char [1024]
}

/// Steamworks `IPCountry_t`
public struct PCountry {

}

/// Steamworks `LowBatteryPower_t`
public struct LowBatteryPower {
    /// Steamworks `m_nMinutesBatteryLeft`
    public let _nMinutesBatteryLeft: uint8
}

/// Steamworks `SteamAPICallCompleted_t`
public struct SteamAPICallCompleted {
    /// Steamworks `m_hAsyncCall`
    public let _hAsyncCall: SteamAPICall
    /// Steamworks `m_iCallback`
    public let _iCallback: Int
    /// Steamworks `m_cubParam`
    public let _cubParam: Int
}

/// Steamworks `SteamShutdown_t`
public struct SteamShutdown {

}

/// Steamworks `CheckFileSignature_t`
public struct CheckFileSignature {
    /// Steamworks `m_eCheckFileSignature`
    public let _eCheckFileSignature: CheckFileSignature
}

/// Steamworks `GamepadTextInputDismissed_t`
public struct GamepadTextInputDismissed {
    /// Steamworks `m_bSubmitted`
    public let _bSubmitted: Bool
    /// Steamworks `m_unSubmittedText`
    public let _unSubmittedText: Int
}

/// Steamworks `AppResumingFromSuspend_t`
public struct AppResumingFromSuspend {

}

/// Steamworks `ModalGamepadTextInputDismissed_t`
public struct ModalGamepadTextInputDismissed {

}

/// Steamworks `FavoritesListChanged_t`
public struct FavoritesListChanged {
    /// Steamworks `m_nIP`
    public let _nIP: Int
    /// Steamworks `m_nQueryPort`
    public let _nQueryPort: Int
    /// Steamworks `m_nConnPort`
    public let _nConnPort: Int
    /// Steamworks `m_nAppID`
    public let _nAppID: Int
    /// Steamworks `m_nFlags`
    public let _nFlags: Int
    /// Steamworks `m_bAdd`
    public let _bAdd: Bool
    /// Steamworks `m_unAccountId`
    public let _unAccountId: AccountID
}

/// Steamworks `LobbyInvite_t`
public struct LobbyInvite {
    /// Steamworks `m_ulSteamIDUser`
    public let _ulSteamIDUser: uint64
    /// Steamworks `m_ulSteamIDLobby`
    public let _ulSteamIDLobby: uint64
    /// Steamworks `m_ulGameID`
    public let _ulGameID: uint64
}

/// Steamworks `LobbyEnter_t`
public struct LobbyEnter {
    /// Steamworks `m_ulSteamIDLobby`
    public let _ulSteamIDLobby: uint64
    /// Steamworks `m_rgfChatPermissions`
    public let _rgfChatPermissions: Int
    /// Steamworks `m_bLocked`
    public let _bLocked: Bool
    /// Steamworks `m_EChatRoomEnterResponse`
    public let _eChatRoomEnterResponse: Int
}

/// Steamworks `LobbyDataUpdate_t`
public struct LobbyDataUpdate {
    /// Steamworks `m_ulSteamIDLobby`
    public let _ulSteamIDLobby: uint64
    /// Steamworks `m_ulSteamIDMember`
    public let _ulSteamIDMember: uint64
    /// Steamworks `m_bSuccess`
    public let _bSuccess: uint8
}

/// Steamworks `LobbyChatUpdate_t`
public struct LobbyChatUpdate {
    /// Steamworks `m_ulSteamIDLobby`
    public let _ulSteamIDLobby: uint64
    /// Steamworks `m_ulSteamIDUserChanged`
    public let _ulSteamIDUserChanged: uint64
    /// Steamworks `m_ulSteamIDMakingChange`
    public let _ulSteamIDMakingChange: uint64
    /// Steamworks `m_rgfChatMemberStateChange`
    public let _rgfChatMemberStateChange: Int
}

/// Steamworks `LobbyChatMsg_t`
public struct LobbyChatMsg {
    /// Steamworks `m_ulSteamIDLobby`
    public let _ulSteamIDLobby: uint64
    /// Steamworks `m_ulSteamIDUser`
    public let _ulSteamIDUser: uint64
    /// Steamworks `m_eChatEntryType`
    public let _eChatEntryType: uint8
    /// Steamworks `m_iChatID`
    public let _iChatID: Int
}

/// Steamworks `LobbyGameCreated_t`
public struct LobbyGameCreated {
    /// Steamworks `m_ulSteamIDLobby`
    public let _ulSteamIDLobby: uint64
    /// Steamworks `m_ulSteamIDGameServer`
    public let _ulSteamIDGameServer: uint64
    /// Steamworks `m_unIP`
    public let _unIP: Int
    /// Steamworks `m_usPort`
    public let _usPort: uint16
}

/// Steamworks `LobbyMatchList_t`
public struct LobbyMatchList {
    /// Steamworks `m_nLobbiesMatching`
    public let _nLobbiesMatching: Int
}

/// Steamworks `LobbyKicked_t`
public struct LobbyKicked {
    /// Steamworks `m_ulSteamIDLobby`
    public let _ulSteamIDLobby: uint64
    /// Steamworks `m_ulSteamIDAdmin`
    public let _ulSteamIDAdmin: uint64
    /// Steamworks `m_bKickedDueToDisconnect`
    public let _bKickedDueToDisconnect: uint8
}

/// Steamworks `LobbyCreated_t`
public struct LobbyCreated {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_ulSteamIDLobby`
    public let _ulSteamIDLobby: uint64
}

/// Steamworks `PSNGameBootInviteResult_t`
public struct PSNGameBootInviteResult {
    /// Steamworks `m_bGameBootInviteExists`
    public let _bGameBootInviteExists: Bool
    /// Steamworks `m_steamIDLobby`
    public let _steamIDLobby: SteamID
}

/// Steamworks `FavoritesListAccountsUpdated_t`
public struct FavoritesListAccountsUpdated {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `SearchForGameProgressCallback_t`
public struct SearchForGameProgressCallback {
    /// Steamworks `m_ullSearchID`
    public let _ullSearchID: uint64
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_lobbyID`
    public let _lobbyID: SteamID
    /// Steamworks `m_steamIDEndedSearch`
    public let _steamIDEndedSearch: SteamID
    /// Steamworks `m_nSecondsRemainingEstimate`
    public let _nSecondsRemainingEstimate: int32
    /// Steamworks `m_cPlayersSearching`
    public let _cPlayersSearching: int32
}

/// Steamworks `SearchForGameResultCallback_t`
public struct SearchForGameResultCallback {
    /// Steamworks `m_ullSearchID`
    public let _ullSearchID: uint64
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nCountPlayersInGame`
    public let _nCountPlayersInGame: int32
    /// Steamworks `m_nCountAcceptedGame`
    public let _nCountAcceptedGame: int32
    /// Steamworks `m_steamIDHost`
    public let _steamIDHost: SteamID
    /// Steamworks `m_bFinalCallback`
    public let _bFinalCallback: Bool
}

/// Steamworks `RequestPlayersForGameProgressCallback_t`
public struct RequestPlayersForGameProgressCallback {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_ullSearchID`
    public let _ullSearchID: uint64
}

/// Steamworks `RequestPlayersForGameResultCallback_t`
public struct RequestPlayersForGameResultCallback {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_ullSearchID`
    public let _ullSearchID: uint64
    /// Steamworks `m_SteamIDPlayerFound`
    public let _steamIDPlayerFound: SteamID
    /// Steamworks `m_SteamIDLobby`
    public let _steamIDLobby: SteamID
    /// Steamworks `m_ePlayerAcceptState`
    public let _ePlayerAcceptState: RequestPlayersForGameResultCallback::PlayerAcceptState
    /// Steamworks `m_nPlayerIndex`
    public let _nPlayerIndex: int32
    /// Steamworks `m_nTotalPlayersFound`
    public let _nTotalPlayersFound: int32
    /// Steamworks `m_nTotalPlayersAcceptedGame`
    public let _nTotalPlayersAcceptedGame: int32
    /// Steamworks `m_nSuggestedTeamIndex`
    public let _nSuggestedTeamIndex: int32
    /// Steamworks `m_ullUniqueGameID`
    public let _ullUniqueGameID: uint64
}

/// Steamworks `RequestPlayersForGameFinalResultCallback_t`
public struct RequestPlayersForGameFinalResultCallback {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_ullSearchID`
    public let _ullSearchID: uint64
    /// Steamworks `m_ullUniqueGameID`
    public let _ullUniqueGameID: uint64
}

/// Steamworks `SubmitPlayerResultResultCallback_t`
public struct SubmitPlayerResultResultCallback {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `ullUniqueGameID`
    public let uniqueGameID: uint64
    /// Steamworks `steamIDPlayer`
    public let player: SteamID
}

/// Steamworks `EndGameResultCallback_t`
public struct EndGameResultCallback {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `ullUniqueGameID`
    public let uniqueGameID: uint64
}

/// Steamworks `JoinPartyCallback_t`
public struct JoinPartyCallback {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_ulBeaconID`
    public let _ulBeaconID: PartyBeaconID
    /// Steamworks `m_SteamIDBeaconOwner`
    public let _steamIDBeaconOwner: SteamID
    /// Steamworks `m_rgchConnectString`
    public let _rgchConnectString: char [256]
}

/// Steamworks `CreateBeaconCallback_t`
public struct CreateBeaconCallback {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_ulBeaconID`
    public let _ulBeaconID: PartyBeaconID
}

/// Steamworks `ReservationNotificationCallback_t`
public struct ReservationNotificationCallback {
    /// Steamworks `m_ulBeaconID`
    public let _ulBeaconID: PartyBeaconID
    /// Steamworks `m_steamIDJoiner`
    public let _steamIDJoiner: SteamID
}

/// Steamworks `ChangeNumOpenSlotsCallback_t`
public struct ChangeNumOpenSlotsCallback {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `AvailableBeaconLocationsUpdated_t`
public struct AvailableBeaconLocationsUpdated {

}

/// Steamworks `ActiveBeaconsUpdated_t`
public struct ActiveBeaconsUpdated {

}

/// Steamworks `RemoteStorageFileShareResult_t`
public struct RemoteStorageFileShareResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_hFile`
    public let _hFile: UGCHandle
    /// Steamworks `m_rgchFilename`
    public let _rgchFilename: char [260]
}

/// Steamworks `RemoteStoragePublishFileResult_t`
public struct RemoteStoragePublishFileResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let _bUserNeedsToAcceptWorkshopLegalAgreement: Bool
}

/// Steamworks `RemoteStorageDeletePublishedFileResult_t`
public struct RemoteStorageDeletePublishedFileResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
}

/// Steamworks `RemoteStorageEnumerateUserPublishedFilesResult_t`
public struct RemoteStorageEnumerateUserPublishedFilesResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nResultsReturned`
    public let _nResultsReturned: int32
    /// Steamworks `m_nTotalResultCount`
    public let _nTotalResultCount: int32
    /// Steamworks `m_rgPublishedFileId`
    public let _rgPublishedFileId: PublishedFileId [50]
}

/// Steamworks `RemoteStorageSubscribePublishedFileResult_t`
public struct RemoteStorageSubscribePublishedFileResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
}

/// Steamworks `RemoteStorageEnumerateUserSubscribedFilesResult_t`
public struct RemoteStorageEnumerateUserSubscribedFilesResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nResultsReturned`
    public let _nResultsReturned: int32
    /// Steamworks `m_nTotalResultCount`
    public let _nTotalResultCount: int32
    /// Steamworks `m_rgPublishedFileId`
    public let _rgPublishedFileId: PublishedFileId [50]
    /// Steamworks `m_rgRTimeSubscribed`
    public let _rgRTimeSubscribed: uint32 [50]
}

/// Steamworks `RemoteStorageUnsubscribePublishedFileResult_t`
public struct RemoteStorageUnsubscribePublishedFileResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
}

/// Steamworks `RemoteStorageUpdatePublishedFileResult_t`
public struct RemoteStorageUpdatePublishedFileResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let _bUserNeedsToAcceptWorkshopLegalAgreement: Bool
}

/// Steamworks `RemoteStorageDownloadUGCResult_t`
public struct RemoteStorageDownloadUGCResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_hFile`
    public let _hFile: UGCHandle
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
    /// Steamworks `m_nSizeInBytes`
    public let _nSizeInBytes: int32
    /// Steamworks `m_pchFileName`
    public let _pchFileName: char [260]
    /// Steamworks `m_ulSteamIDOwner`
    public let _ulSteamIDOwner: uint64
}

/// Steamworks `RemoteStorageGetPublishedFileDetailsResult_t`
public struct RemoteStorageGetPublishedFileDetailsResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nCreatorAppID`
    public let _nCreatorAppID: AppId
    /// Steamworks `m_nConsumerAppID`
    public let _nConsumerAppID: AppId
    /// Steamworks `m_rgchTitle`
    public let _rgchTitle: char [129]
    /// Steamworks `m_rgchDescription`
    public let _rgchDescription: char [8000]
    /// Steamworks `m_hFile`
    public let _hFile: UGCHandle
    /// Steamworks `m_hPreviewFile`
    public let _hPreviewFile: UGCHandle
    /// Steamworks `m_ulSteamIDOwner`
    public let _ulSteamIDOwner: uint64
    /// Steamworks `m_rtimeCreated`
    public let _rtimeCreated: Int
    /// Steamworks `m_rtimeUpdated`
    public let _rtimeUpdated: Int
    /// Steamworks `m_eVisibility`
    public let _eVisibility: RemoteStoragePublishedFileVisibility
    /// Steamworks `m_bBanned`
    public let _bBanned: Bool
    /// Steamworks `m_rgchTags`
    public let _rgchTags: char [1025]
    /// Steamworks `m_bTagsTruncated`
    public let _bTagsTruncated: Bool
    /// Steamworks `m_pchFileName`
    public let _pchFileName: char [260]
    /// Steamworks `m_nFileSize`
    public let _nFileSize: int32
    /// Steamworks `m_nPreviewFileSize`
    public let _nPreviewFileSize: int32
    /// Steamworks `m_rgchURL`
    public let _rgchURL: char [256]
    /// Steamworks `m_eFileType`
    public let _eFileType: WorkshopFileType
    /// Steamworks `m_bAcceptedForUse`
    public let _bAcceptedForUse: Bool
}

/// Steamworks `RemoteStorageEnumerateWorkshopFilesResult_t`
public struct RemoteStorageEnumerateWorkshopFilesResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nResultsReturned`
    public let _nResultsReturned: int32
    /// Steamworks `m_nTotalResultCount`
    public let _nTotalResultCount: int32
    /// Steamworks `m_rgPublishedFileId`
    public let _rgPublishedFileId: PublishedFileId [50]
    /// Steamworks `m_rgScore`
    public let _rgScore: float [50]
    /// Steamworks `m_nAppId`
    public let _nAppId: AppId
    /// Steamworks `m_unStartIndex`
    public let _unStartIndex: Int
}

/// Steamworks `RemoteStorageGetPublishedItemVoteDetailsResult_t`
public struct RemoteStorageGetPublishedItemVoteDetailsResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_unPublishedFileId`
    public let _unPublishedFileId: PublishedFileId
    /// Steamworks `m_nVotesFor`
    public let _nVotesFor: int32
    /// Steamworks `m_nVotesAgainst`
    public let _nVotesAgainst: int32
    /// Steamworks `m_nReports`
    public let _nReports: int32
    /// Steamworks `m_fScore`
    public let _fScore: float
}

/// Steamworks `RemoteStoragePublishedFileSubscribed_t`
public struct RemoteStoragePublishedFileSubscribed {
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
}

/// Steamworks `RemoteStoragePublishedFileUnsubscribed_t`
public struct RemoteStoragePublishedFileUnsubscribed {
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
}

/// Steamworks `RemoteStoragePublishedFileDeleted_t`
public struct RemoteStoragePublishedFileDeleted {
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
}

/// Steamworks `RemoteStorageUpdateUserPublishedItemVoteResult_t`
public struct RemoteStorageUpdateUserPublishedItemVoteResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
}

/// Steamworks `RemoteStorageUserVoteDetails_t`
public struct RemoteStorageUserVoteDetails {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_eVote`
    public let _eVote: WorkshopVote
}

/// Steamworks `RemoteStorageEnumerateUserSharedWorkshopFilesResult_t`
public struct RemoteStorageEnumerateUserSharedWorkshopFilesResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nResultsReturned`
    public let _nResultsReturned: int32
    /// Steamworks `m_nTotalResultCount`
    public let _nTotalResultCount: int32
    /// Steamworks `m_rgPublishedFileId`
    public let _rgPublishedFileId: PublishedFileId [50]
}

/// Steamworks `RemoteStorageSetUserPublishedFileActionResult_t`
public struct RemoteStorageSetUserPublishedFileActionResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_eAction`
    public let _eAction: WorkshopFileAction
}

/// Steamworks `RemoteStorageEnumeratePublishedFilesByUserActionResult_t`
public struct RemoteStorageEnumeratePublishedFilesByUserActionResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_eAction`
    public let _eAction: WorkshopFileAction
    /// Steamworks `m_nResultsReturned`
    public let _nResultsReturned: int32
    /// Steamworks `m_nTotalResultCount`
    public let _nTotalResultCount: int32
    /// Steamworks `m_rgPublishedFileId`
    public let _rgPublishedFileId: PublishedFileId [50]
    /// Steamworks `m_rgRTimeUpdated`
    public let _rgRTimeUpdated: uint32 [50]
}

/// Steamworks `RemoteStoragePublishFileProgress_t`
public struct RemoteStoragePublishFileProgress {
    /// Steamworks `m_dPercentFile`
    public let _dPercentFile: double
    /// Steamworks `m_bPreview`
    public let _bPreview: Bool
}

/// Steamworks `RemoteStoragePublishedFileUpdated_t`
public struct RemoteStoragePublishedFileUpdated {
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
    /// Steamworks `m_ulUnused`
    public let _ulUnused: uint64
}

/// Steamworks `RemoteStorageFileWriteAsyncComplete_t`
public struct RemoteStorageFileWriteAsyncComplete {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `RemoteStorageFileReadAsyncComplete_t`
public struct RemoteStorageFileReadAsyncComplete {
    /// Steamworks `m_hFileReadAsync`
    public let _hFileReadAsync: SteamAPICall
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nOffset`
    public let _nOffset: Int
    /// Steamworks `m_cubRead`
    public let _cubRead: Int
}

/// Steamworks `RemoteStorageLocalFileChange_t`
public struct RemoteStorageLocalFileChange {

}

/// Steamworks `UserStatsReceived_t`
public struct UserStatsReceived {
    /// Steamworks `m_nGameID`
    public let _nGameID: uint64
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
}

/// Steamworks `UserStatsStored_t`
public struct UserStatsStored {
    /// Steamworks `m_nGameID`
    public let _nGameID: uint64
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `UserAchievementStored_t`
public struct UserAchievementStored {
    /// Steamworks `m_nGameID`
    public let _nGameID: uint64
    /// Steamworks `m_bGroupAchievement`
    public let _bGroupAchievement: Bool
    /// Steamworks `m_rgchAchievementName`
    public let _rgchAchievementName: char [128]
    /// Steamworks `m_nCurProgress`
    public let _nCurProgress: Int
    /// Steamworks `m_nMaxProgress`
    public let _nMaxProgress: Int
}

/// Steamworks `LeaderboardFindResult_t`
public struct LeaderboardFindResult {
    /// Steamworks `m_hSteamLeaderboard`
    public let _hSteamLeaderboard: SteamLeaderboard
    /// Steamworks `m_bLeaderboardFound`
    public let _bLeaderboardFound: uint8
}

/// Steamworks `LeaderboardScoresDownloaded_t`
public struct LeaderboardScoresDownloaded {
    /// Steamworks `m_hSteamLeaderboard`
    public let _hSteamLeaderboard: SteamLeaderboard
    /// Steamworks `m_hSteamLeaderboardEntries`
    public let _hSteamLeaderboardEntries: SteamLeaderboardEntries
    /// Steamworks `m_cEntryCount`
    public let _cEntryCount: Int
}

/// Steamworks `LeaderboardScoreUploaded_t`
public struct LeaderboardScoreUploaded {
    /// Steamworks `m_bSuccess`
    public let _bSuccess: uint8
    /// Steamworks `m_hSteamLeaderboard`
    public let _hSteamLeaderboard: SteamLeaderboard
    /// Steamworks `m_nScore`
    public let _nScore: int32
    /// Steamworks `m_bScoreChanged`
    public let _bScoreChanged: uint8
    /// Steamworks `m_nGlobalRankNew`
    public let _nGlobalRankNew: Int
    /// Steamworks `m_nGlobalRankPrevious`
    public let _nGlobalRankPrevious: Int
}

/// Steamworks `NumberOfCurrentPlayers_t`
public struct NumberOfCurrentPlayers {
    /// Steamworks `m_bSuccess`
    public let _bSuccess: uint8
    /// Steamworks `m_cPlayers`
    public let _cPlayers: int32
}

/// Steamworks `UserStatsUnloaded_t`
public struct UserStatsUnloaded {
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
}

/// Steamworks `UserAchievementIconFetched_t`
public struct UserAchievementIconFetched {
    /// Steamworks `m_nGameID`
    public let _nGameID: GameID
    /// Steamworks `m_rgchAchievementName`
    public let _rgchAchievementName: char [128]
    /// Steamworks `m_bAchieved`
    public let _bAchieved: Bool
    /// Steamworks `m_nIconHandle`
    public let _nIconHandle: Int
}

/// Steamworks `GlobalAchievementPercentagesReady_t`
public struct GlobalAchievementPercentagesReady {
    /// Steamworks `m_nGameID`
    public let _nGameID: uint64
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `LeaderboardUGCSet_t`
public struct LeaderboardUGCSet {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_hSteamLeaderboard`
    public let _hSteamLeaderboard: SteamLeaderboard
}

/// Steamworks `PS3TrophiesInstalled_t`
public struct PS3TrophiesInstalled {
    /// Steamworks `m_nGameID`
    public let _nGameID: uint64
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_ulRequiredDiskSpace`
    public let _ulRequiredDiskSpace: uint64
}

/// Steamworks `GlobalStatsReceived_t`
public struct GlobalStatsReceived {
    /// Steamworks `m_nGameID`
    public let _nGameID: uint64
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `DlcInstalled_t`
public struct DlcInstalled {
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
}

/// Steamworks `RegisterActivationCodeResponse_t`
public struct RegisterActivationCodeResponse {
    /// Steamworks `m_eResult`
    public let _eResult: RegisterActivationCodeResult
    /// Steamworks `m_unPackageRegistered`
    public let _unPackageRegistered: Int
}

/// Steamworks `NewUrlLaunchParameters_t`
public struct NewUrlLaunchParameters {

}

/// Steamworks `AppProofOfPurchaseKeyResponse_t`
public struct AppProofOfPurchaseKeyResponse {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nAppID`
    public let _nAppID: Int
    /// Steamworks `m_cchKeyLength`
    public let _cchKeyLength: Int
    /// Steamworks `m_rgchKey`
    public let _rgchKey: char [240]
}

/// Steamworks `FileDetailsResult_t`
public struct FileDetailsResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_ulFileSize`
    public let _ulFileSize: uint64
    /// Steamworks `m_FileSHA`
    public let _fileSHA: uint8 [20]
    /// Steamworks `m_unFlags`
    public let _unFlags: Int
}

/// Steamworks `TimedTrialStatus_t`
public struct TimedTrialStatus {
    /// Steamworks `m_unAppID`
    public let _unAppID: AppId
    /// Steamworks `m_bIsOffline`
    public let _bIsOffline: Bool
    /// Steamworks `m_unSecondsAllowed`
    public let _unSecondsAllowed: Int
    /// Steamworks `m_unSecondsPlayed`
    public let _unSecondsPlayed: Int
}

/// Steamworks `P2PSessionRequest_t`
public struct P2PSessionRequest {
    /// Steamworks `m_steamIDRemote`
    public let _steamIDRemote: SteamID
}

/// Steamworks `P2PSessionConnectFail_t`
public struct P2PSessionConnectFail {
    /// Steamworks `m_steamIDRemote`
    public let _steamIDRemote: SteamID
    /// Steamworks `m_eP2PSessionError`
    public let _eP2PSessionError: uint8
}

/// Steamworks `SocketStatusCallback_t`
public struct SocketStatusCallback {
    /// Steamworks `m_hSocket`
    public let _hSocket: SNetSocket
    /// Steamworks `m_hListenSocket`
    public let _hListenSocket: SNetListenSocket
    /// Steamworks `m_steamIDRemote`
    public let _steamIDRemote: SteamID
    /// Steamworks `m_eSNetSocketState`
    public let _eSNetSocketState: Int
}

/// Steamworks `ScreenshotReady_t`
public struct ScreenshotReady {
    /// Steamworks `m_hLocal`
    public let _hLocal: ScreenshotHandle
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `ScreenshotRequested_t`
public struct ScreenshotRequested {

}

/// Steamworks `PlaybackStatusHasChanged_t`
public struct PlaybackStatusHasChanged {

}

/// Steamworks `VolumeHasChanged_t`
public struct VolumeHasChanged {
    /// Steamworks `m_flNewVolume`
    public let _flNewVolume: float
}

/// Steamworks `MusicPlayerRemoteWillActivate_t`
public struct MusicPlayerRemoteWillActivate {

}

/// Steamworks `MusicPlayerRemoteWillDeactivate_t`
public struct MusicPlayerRemoteWillDeactivate {

}

/// Steamworks `MusicPlayerRemoteToFront_t`
public struct MusicPlayerRemoteToFront {

}

/// Steamworks `MusicPlayerWillQuit_t`
public struct MusicPlayerWillQuit {

}

/// Steamworks `MusicPlayerWantsPlay_t`
public struct MusicPlayerWantsPlay {

}

/// Steamworks `MusicPlayerWantsPause_t`
public struct MusicPlayerWantsPause {

}

/// Steamworks `MusicPlayerWantsPlayPrevious_t`
public struct MusicPlayerWantsPlayPrevious {

}

/// Steamworks `MusicPlayerWantsPlayNext_t`
public struct MusicPlayerWantsPlayNext {

}

/// Steamworks `MusicPlayerWantsShuffled_t`
public struct MusicPlayerWantsShuffled {
    /// Steamworks `m_bShuffled`
    public let _bShuffled: Bool
}

/// Steamworks `MusicPlayerWantsLooped_t`
public struct MusicPlayerWantsLooped {
    /// Steamworks `m_bLooped`
    public let _bLooped: Bool
}

/// Steamworks `MusicPlayerWantsVolume_t`
public struct MusicPlayerWantsVolume {
    /// Steamworks `m_flNewVolume`
    public let _flNewVolume: float
}

/// Steamworks `MusicPlayerSelectsQueueEntry_t`
public struct MusicPlayerSelectsQueueEntry {
    /// Steamworks `nID`
    public let id: Int
}

/// Steamworks `MusicPlayerSelectsPlaylistEntry_t`
public struct MusicPlayerSelectsPlaylistEntry {
    /// Steamworks `nID`
    public let id: Int
}

/// Steamworks `MusicPlayerWantsPlayingRepeatStatus_t`
public struct MusicPlayerWantsPlayingRepeatStatus {
    /// Steamworks `m_nPlayingRepeatStatus`
    public let _nPlayingRepeatStatus: Int
}

/// Steamworks `HTTPRequestCompleted_t`
public struct HTTPRequestCompleted {
    /// Steamworks `m_hRequest`
    public let _hRequest: HTTPRequestHandle
    /// Steamworks `m_ulContextValue`
    public let _ulContextValue: uint64
    /// Steamworks `m_bRequestSuccessful`
    public let _bRequestSuccessful: Bool
    /// Steamworks `m_eStatusCode`
    public let _eStatusCode: HTTPStatusCode
    /// Steamworks `m_unBodySize`
    public let _unBodySize: Int
}

/// Steamworks `HTTPRequestHeadersReceived_t`
public struct HTTPRequestHeadersReceived {
    /// Steamworks `m_hRequest`
    public let _hRequest: HTTPRequestHandle
    /// Steamworks `m_ulContextValue`
    public let _ulContextValue: uint64
}

/// Steamworks `HTTPRequestDataReceived_t`
public struct HTTPRequestDataReceived {
    /// Steamworks `m_hRequest`
    public let _hRequest: HTTPRequestHandle
    /// Steamworks `m_ulContextValue`
    public let _ulContextValue: uint64
    /// Steamworks `m_cOffset`
    public let _cOffset: Int
    /// Steamworks `m_cBytesReceived`
    public let _cBytesReceived: Int
}

/// Steamworks `SteamInputDeviceConnected_t`
public struct SteamInputDeviceConnected {
    /// Steamworks `m_ulConnectedDeviceHandle`
    public let _ulConnectedDeviceHandle: InputHandle
}

/// Steamworks `SteamInputDeviceDisconnected_t`
public struct SteamInputDeviceDisconnected {
    /// Steamworks `m_ulDisconnectedDeviceHandle`
    public let _ulDisconnectedDeviceHandle: InputHandle
}

/// Steamworks `SteamInputConfigurationLoaded_t`
public struct SteamInputConfigurationLoaded {
    /// Steamworks `m_unAppID`
    public let _unAppID: AppId
    /// Steamworks `m_ulDeviceHandle`
    public let _ulDeviceHandle: InputHandle
    /// Steamworks `m_ulMappingCreator`
    public let _ulMappingCreator: SteamID
    /// Steamworks `m_unMajorRevision`
    public let _unMajorRevision: Int
    /// Steamworks `m_unMinorRevision`
    public let _unMinorRevision: Int
    /// Steamworks `m_bUsesSteamInputAPI`
    public let _bUsesSteamInputAPI: Bool
    /// Steamworks `m_bUsesGamepadAPI`
    public let _bUsesGamepadAPI: Bool
}

/// Steamworks `SteamUGCQueryCompleted_t`
public struct SteamUGCQueryCompleted {
    /// Steamworks `m_handle`
    public let _handle: UGCQueryHandle
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_unNumResultsReturned`
    public let _unNumResultsReturned: Int
    /// Steamworks `m_unTotalMatchingResults`
    public let _unTotalMatchingResults: Int
    /// Steamworks `m_bCachedData`
    public let _bCachedData: Bool
    /// Steamworks `m_rgchNextCursor`
    public let _rgchNextCursor: char [256]
}

/// Steamworks `SteamUGCRequestUGCDetailsResult_t`
public struct SteamUGCRequestUGCDetailsResult {
    /// Steamworks `m_details`
    public let _details: SteamUGCDetails
    /// Steamworks `m_bCachedData`
    public let _bCachedData: Bool
}

/// Steamworks `CreateItemResult_t`
public struct CreateItemResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let _bUserNeedsToAcceptWorkshopLegalAgreement: Bool
}

/// Steamworks `SubmitItemUpdateResult_t`
public struct SubmitItemUpdateResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let _bUserNeedsToAcceptWorkshopLegalAgreement: Bool
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
}

/// Steamworks `ItemInstalled_t`
public struct ItemInstalled {
    /// Steamworks `m_unAppID`
    public let _unAppID: AppId
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
}

/// Steamworks `DownloadItemResult_t`
public struct DownloadItemResult {
    /// Steamworks `m_unAppID`
    public let _unAppID: AppId
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `UserFavoriteItemsListChanged_t`
public struct UserFavoriteItemsListChanged {
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_bWasAddRequest`
    public let _bWasAddRequest: Bool
}

/// Steamworks `SetUserItemVoteResult_t`
public struct SetUserItemVoteResult {
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_bVoteUp`
    public let _bVoteUp: Bool
}

/// Steamworks `GetUserItemVoteResult_t`
public struct GetUserItemVoteResult {
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_bVotedUp`
    public let _bVotedUp: Bool
    /// Steamworks `m_bVotedDown`
    public let _bVotedDown: Bool
    /// Steamworks `m_bVoteSkipped`
    public let _bVoteSkipped: Bool
}

/// Steamworks `StartPlaytimeTrackingResult_t`
public struct StartPlaytimeTrackingResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `StopPlaytimeTrackingResult_t`
public struct StopPlaytimeTrackingResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `AddUGCDependencyResult_t`
public struct AddUGCDependencyResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nChildPublishedFileId`
    public let _nChildPublishedFileId: PublishedFileId
}

/// Steamworks `RemoveUGCDependencyResult_t`
public struct RemoveUGCDependencyResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nChildPublishedFileId`
    public let _nChildPublishedFileId: PublishedFileId
}

/// Steamworks `AddAppDependencyResult_t`
public struct AddAppDependencyResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
}

/// Steamworks `RemoveAppDependencyResult_t`
public struct RemoveAppDependencyResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
}

/// Steamworks `GetAppDependenciesResult_t`
public struct GetAppDependenciesResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_rgAppIDs`
    public let _rgAppIDs: AppId [32]
    /// Steamworks `m_nNumAppDependencies`
    public let _nNumAppDependencies: Int
    /// Steamworks `m_nTotalNumAppDependencies`
    public let _nTotalNumAppDependencies: Int
}

/// Steamworks `DeleteItemResult_t`
public struct DeleteItemResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
}

/// Steamworks `UserSubscribedItemsListChanged_t`
public struct UserSubscribedItemsListChanged {
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
}

/// Steamworks `WorkshopEULAStatus_t`
public struct WorkshopEULAStatus {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
    /// Steamworks `m_unVersion`
    public let _unVersion: Int
    /// Steamworks `m_rtAction`
    public let _rtAction: RTime32
    /// Steamworks `m_bAccepted`
    public let _bAccepted: Bool
    /// Steamworks `m_bNeedsAction`
    public let _bNeedsAction: Bool
}

/// Steamworks `SteamAppInstalled_t`
public struct SteamAppInstalled {
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
    /// Steamworks `m_iInstallFolderIndex`
    public let _iInstallFolderIndex: Int
}

/// Steamworks `SteamAppUninstalled_t`
public struct SteamAppUninstalled {
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
    /// Steamworks `m_iInstallFolderIndex`
    public let _iInstallFolderIndex: Int
}

/// Steamworks `HTML_BrowserReady_t`
public struct HTMLBrowserReady {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
}

/// Steamworks `HTML_NeedsPaint_t`
public struct HTMLNeedsPaint {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pBGRA`
    public let bgra: String
    /// Steamworks `unWide`
    public let wide: Int
    /// Steamworks `unTall`
    public let tall: Int
    /// Steamworks `unUpdateX`
    public let updateX: Int
    /// Steamworks `unUpdateY`
    public let updateY: Int
    /// Steamworks `unUpdateWide`
    public let updateWide: Int
    /// Steamworks `unUpdateTall`
    public let updateTall: Int
    /// Steamworks `unScrollX`
    public let scrollX: Int
    /// Steamworks `unScrollY`
    public let scrollY: Int
    /// Steamworks `flPageScale`
    public let pageScale: float
    /// Steamworks `unPageSerial`
    public let pageSerial: Int
}

/// Steamworks `HTML_StartRequest_t`
public struct HTMLStartRequest {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchURL`
    public let url: String
    /// Steamworks `pchTarget`
    public let target: String
    /// Steamworks `pchPostData`
    public let postData: String
    /// Steamworks `bIsRedirect`
    public let isRedirect: Bool
}

/// Steamworks `HTML_CloseBrowser_t`
public struct HTMLCloseBrowser {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
}

/// Steamworks `HTML_URLChanged_t`
public struct HTMLURLChanged {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchURL`
    public let url: String
    /// Steamworks `pchPostData`
    public let postData: String
    /// Steamworks `bIsRedirect`
    public let isRedirect: Bool
    /// Steamworks `pchPageTitle`
    public let pageTitle: String
    /// Steamworks `bNewNavigation`
    public let newNavigation: Bool
}

/// Steamworks `HTML_FinishedRequest_t`
public struct HTMLFinishedRequest {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchURL`
    public let url: String
    /// Steamworks `pchPageTitle`
    public let pageTitle: String
}

/// Steamworks `HTML_OpenLinkInNewTab_t`
public struct HTMLOpenLinkInNewTab {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchURL`
    public let url: String
}

/// Steamworks `HTML_ChangedTitle_t`
public struct HTMLChangedTitle {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchTitle`
    public let title: String
}

/// Steamworks `HTML_SearchResults_t`
public struct HTMLSearchResults {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `unResults`
    public let results: Int
    /// Steamworks `unCurrentMatch`
    public let currentMatch: Int
}

/// Steamworks `HTML_CanGoBackAndForward_t`
public struct HTMLCanGoBackAndForward {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `bCanGoBack`
    public let canGoBack: Bool
    /// Steamworks `bCanGoForward`
    public let canGoForward: Bool
}

/// Steamworks `HTML_HorizontalScroll_t`
public struct HTMLHorizontalScroll {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `unScrollMax`
    public let scrollMax: Int
    /// Steamworks `unScrollCurrent`
    public let scrollCurrent: Int
    /// Steamworks `flPageScale`
    public let pageScale: float
    /// Steamworks `bVisible`
    public let visible: Bool
    /// Steamworks `unPageSize`
    public let pageSize: Int
}

/// Steamworks `HTML_VerticalScroll_t`
public struct HTMLVerticalScroll {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `unScrollMax`
    public let scrollMax: Int
    /// Steamworks `unScrollCurrent`
    public let scrollCurrent: Int
    /// Steamworks `flPageScale`
    public let pageScale: float
    /// Steamworks `bVisible`
    public let visible: Bool
    /// Steamworks `unPageSize`
    public let pageSize: Int
}

/// Steamworks `HTML_LinkAtPosition_t`
public struct HTMLLinkAtPosition {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `x`
    public let : Int
    /// Steamworks `y`
    public let : Int
    /// Steamworks `pchURL`
    public let url: String
    /// Steamworks `bInput`
    public let input: Bool
    /// Steamworks `bLiveLink`
    public let liveLink: Bool
}

/// Steamworks `HTML_JSAlert_t`
public struct HTMLJSAlert {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMessage`
    public let message: String
}

/// Steamworks `HTML_JSConfirm_t`
public struct HTMLJSConfirm {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMessage`
    public let message: String
}

/// Steamworks `HTML_FileOpenDialog_t`
public struct HTMLFileOpenDialog {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchTitle`
    public let title: String
    /// Steamworks `pchInitialFile`
    public let initialFile: String
}

/// Steamworks `HTML_NewWindow_t`
public struct HTMLNewWindow {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchURL`
    public let url: String
    /// Steamworks `unX`
    public let x: Int
    /// Steamworks `unY`
    public let y: Int
    /// Steamworks `unWide`
    public let wide: Int
    /// Steamworks `unTall`
    public let tall: Int
    /// Steamworks `unNewWindow_BrowserHandle_IGNORE`
    public let newWindowBrowserHandleIGNORE: HHTMLBrowser
}

/// Steamworks `HTML_SetCursor_t`
public struct HTMLSetCursor {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `eMouseCursor`
    public let mouseCursor: Int
}

/// Steamworks `HTML_StatusText_t`
public struct HTMLStatusText {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMsg`
    public let msg: String
}

/// Steamworks `HTML_ShowToolTip_t`
public struct HTMLShowToolTip {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMsg`
    public let msg: String
}

/// Steamworks `HTML_UpdateToolTip_t`
public struct HTMLUpdateToolTip {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMsg`
    public let msg: String
}

/// Steamworks `HTML_HideToolTip_t`
public struct HTMLHideToolTip {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
}

/// Steamworks `HTML_BrowserRestarted_t`
public struct HTMLBrowserRestarted {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `unOldBrowserHandle`
    public let oldBrowserHandle: HHTMLBrowser
}

/// Steamworks `SteamInventoryResultReady_t`
public struct SteamInventoryResultReady {
    /// Steamworks `m_handle`
    public let _handle: SteamInventoryResult
    /// Steamworks `m_result`
    public let _result: SteamResult
}

/// Steamworks `SteamInventoryFullUpdate_t`
public struct SteamInventoryFullUpdate {
    /// Steamworks `m_handle`
    public let _handle: SteamInventoryResult
}

/// Steamworks `SteamInventoryDefinitionUpdate_t`
public struct SteamInventoryDefinitionUpdate {

}

/// Steamworks `SteamInventoryEligiblePromoItemDefIDs_t`
public struct SteamInventoryEligiblePromoItemDefIDs {
    /// Steamworks `m_result`
    public let _result: SteamResult
    /// Steamworks `m_steamID`
    public let _steamID: SteamID
    /// Steamworks `m_numEligiblePromoItemDefs`
    public let _numEligiblePromoItemDefs: Int
    /// Steamworks `m_bCachedData`
    public let _bCachedData: Bool
}

/// Steamworks `SteamInventoryStartPurchaseResult_t`
public struct SteamInventoryStartPurchaseResult {
    /// Steamworks `m_result`
    public let _result: SteamResult
    /// Steamworks `m_ulOrderID`
    public let _ulOrderID: uint64
    /// Steamworks `m_ulTransID`
    public let _ulTransID: uint64
}

/// Steamworks `SteamInventoryRequestPricesResult_t`
public struct SteamInventoryRequestPricesResult {
    /// Steamworks `m_result`
    public let _result: SteamResult
    /// Steamworks `m_rgchCurrency`
    public let _rgchCurrency: char [4]
}

/// Steamworks `GetVideoURLResult_t`
public struct GetVideoURLResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_unVideoAppID`
    public let _unVideoAppID: AppId
    /// Steamworks `m_rgchURL`
    public let _rgchURL: char [256]
}

/// Steamworks `GetOPFSettingsResult_t`
public struct GetOPFSettingsResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_unVideoAppID`
    public let _unVideoAppID: AppId
}

/// Steamworks `SteamParentalSettingsChanged_t`
public struct SteamParentalSettingsChanged {

}

/// Steamworks `SteamRemotePlaySessionConnected_t`
public struct SteamRemotePlaySessionConnected {
    /// Steamworks `m_unSessionID`
    public let _unSessionID: RemotePlaySessionID
}

/// Steamworks `SteamRemotePlaySessionDisconnected_t`
public struct SteamRemotePlaySessionDisconnected {
    /// Steamworks `m_unSessionID`
    public let _unSessionID: RemotePlaySessionID
}

/// Steamworks `SteamNetworkingMessagesSessionRequest_t`
public struct SteamNetworkingMessagesSessionRequest {
    /// Steamworks `m_identityRemote`
    public let _identityRemote: SteamNetworkingIdentity
}

/// Steamworks `SteamNetworkingMessagesSessionFailed_t`
public struct SteamNetworkingMessagesSessionFailed {
    /// Steamworks `m_info`
    public let _info: SteamNetConnectionInfo
}

/// Steamworks `SteamNetConnectionStatusChangedCallback_t`
public struct SteamNetConnectionStatusChangedCallback {
    /// Steamworks `m_hConn`
    public let _hConn: HSteamNetConnection
    /// Steamworks `m_info`
    public let _info: SteamNetConnectionInfo
    /// Steamworks `m_eOldState`
    public let _eOldState: SteamNetworkingConnectionState
}

/// Steamworks `SteamNetAuthenticationStatus_t`
public struct SteamNetAuthenticationStatus {
    /// Steamworks `m_eAvail`
    public let _eAvail: SteamNetworkingAvailability
    /// Steamworks `m_debugMsg`
    public let _debugMsg: char [256]
}

/// Steamworks `SteamRelayNetworkStatus_t`
public struct SteamRelayNetworkStatus {
    /// Steamworks `m_eAvail`
    public let _eAvail: SteamNetworkingAvailability
    /// Steamworks `m_bPingMeasurementInProgress`
    public let _bPingMeasurementInProgress: Int
    /// Steamworks `m_eAvailNetworkConfig`
    public let _eAvailNetworkConfig: SteamNetworkingAvailability
    /// Steamworks `m_eAvailAnyRelay`
    public let _eAvailAnyRelay: SteamNetworkingAvailability
    /// Steamworks `m_debugMsg`
    public let _debugMsg: char [256]
}

/// Steamworks `GSClientApprove_t`
public struct GSClientApprove {
    /// Steamworks `m_SteamID`
    public let _steamID: SteamID
    /// Steamworks `m_OwnerSteamID`
    public let _ownerSteamID: SteamID
}

/// Steamworks `GSClientDeny_t`
public struct GSClientDeny {
    /// Steamworks `m_SteamID`
    public let _steamID: SteamID
    /// Steamworks `m_eDenyReason`
    public let _eDenyReason: DenyReason
    /// Steamworks `m_rgchOptionalText`
    public let _rgchOptionalText: char [128]
}

/// Steamworks `GSClientKick_t`
public struct GSClientKick {
    /// Steamworks `m_SteamID`
    public let _steamID: SteamID
    /// Steamworks `m_eDenyReason`
    public let _eDenyReason: DenyReason
}

/// Steamworks `GSClientAchievementStatus_t`
public struct GSClientAchievementStatus {
    /// Steamworks `m_SteamID`
    public let _steamID: uint64
    /// Steamworks `m_pchAchievement`
    public let _pchAchievement: char [128]
    /// Steamworks `m_bUnlocked`
    public let _bUnlocked: Bool
}

/// Steamworks `GSPolicyResponse_t`
public struct GSPolicyResponse {
    /// Steamworks `m_bSecure`
    public let _bSecure: uint8
}

/// Steamworks `GSGameplayStats_t`
public struct GSGameplayStats {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_nRank`
    public let _nRank: int32
    /// Steamworks `m_unTotalConnects`
    public let _unTotalConnects: Int
    /// Steamworks `m_unTotalMinutesPlayed`
    public let _unTotalMinutesPlayed: Int
}

/// Steamworks `GSClientGroupStatus_t`
public struct GSClientGroupStatus {
    /// Steamworks `m_SteamIDUser`
    public let _steamIDUser: SteamID
    /// Steamworks `m_SteamIDGroup`
    public let _steamIDGroup: SteamID
    /// Steamworks `m_bMember`
    public let _bMember: Bool
    /// Steamworks `m_bOfficer`
    public let _bOfficer: Bool
}

/// Steamworks `GSReputation_t`
public struct GSReputation {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_unReputationScore`
    public let _unReputationScore: Int
    /// Steamworks `m_bBanned`
    public let _bBanned: Bool
    /// Steamworks `m_unBannedIP`
    public let _unBannedIP: Int
    /// Steamworks `m_usBannedPort`
    public let _usBannedPort: uint16
    /// Steamworks `m_ulBannedGameID`
    public let _ulBannedGameID: uint64
    /// Steamworks `m_unBanExpires`
    public let _unBanExpires: Int
}

/// Steamworks `AssociateWithClanResult_t`
public struct AssociateWithClanResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
}

/// Steamworks `ComputeNewPlayerCompatibilityResult_t`
public struct ComputeNewPlayerCompatibilityResult {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_cPlayersThatDontLikeCandidate`
    public let _cPlayersThatDontLikeCandidate: Int
    /// Steamworks `m_cPlayersThatCandidateDoesntLike`
    public let _cPlayersThatCandidateDoesntLike: Int
    /// Steamworks `m_cClanPlayersThatDontLikeCandidate`
    public let _cClanPlayersThatDontLikeCandidate: Int
    /// Steamworks `m_SteamIDCandidate`
    public let _steamIDCandidate: SteamID
}

/// Steamworks `GSStatsReceived_t`
public struct GSStatsReceived {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
}

/// Steamworks `GSStatsStored_t`
public struct GSStatsStored {
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
}

/// Steamworks `GSStatsUnloaded_t`
public struct GSStatsUnloaded {
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
}

/// Steamworks `SteamIPAddress_t`
public struct SteamIPAddress {
    /// Steamworks `m_rgubIPv6`
    public let _rgubIPv6: uint8 [16]
    /// Steamworks `m_eType`
    public let _eType: SteamIPType
}

/// Steamworks `FriendGameInfo_t`
public struct FriendGameInfo {
    /// Steamworks `m_gameID`
    public let _gameID: GameID
    /// Steamworks `m_unGameIP`
    public let _unGameIP: Int
    /// Steamworks `m_usGamePort`
    public let _usGamePort: uint16
    /// Steamworks `m_usQueryPort`
    public let _usQueryPort: uint16
    /// Steamworks `m_steamIDLobby`
    public let _steamIDLobby: SteamID
}

/// Steamworks `MatchMakingKeyValuePair_t`
public struct MatchMakingKeyValuePair {
    /// Steamworks `m_szKey`
    public let _szKey: char [256]
    /// Steamworks `m_szValue`
    public let _szValue: char [256]
}

/// Steamworks `servernetadr_t`
public struct servernetadr {
    /// Steamworks `m_usConnectionPort`
    public let _usConnectionPort: uint16
    /// Steamworks `m_usQueryPort`
    public let _usQueryPort: uint16
    /// Steamworks `m_unIP`
    public let _unIP: Int
}

/// Steamworks `gameserveritem_t`
public struct gameserveritem {
    /// Steamworks `m_NetAdr`
    public let _netAdr: servernetadr
    /// Steamworks `m_nPing`
    public let _nPing: Int
    /// Steamworks `m_bHadSuccessfulResponse`
    public let _bHadSuccessfulResponse: Bool
    /// Steamworks `m_bDoNotRefresh`
    public let _bDoNotRefresh: Bool
    /// Steamworks `m_szGameDir`
    public let _szGameDir: char [32]
    /// Steamworks `m_szMap`
    public let _szMap: char [32]
    /// Steamworks `m_szGameDescription`
    public let _szGameDescription: char [64]
    /// Steamworks `m_nAppID`
    public let _nAppID: Int
    /// Steamworks `m_nPlayers`
    public let _nPlayers: Int
    /// Steamworks `m_nMaxPlayers`
    public let _nMaxPlayers: Int
    /// Steamworks `m_nBotPlayers`
    public let _nBotPlayers: Int
    /// Steamworks `m_bPassword`
    public let _bPassword: Bool
    /// Steamworks `m_bSecure`
    public let _bSecure: Bool
    /// Steamworks `m_ulTimeLastPlayed`
    public let _ulTimeLastPlayed: Int
    /// Steamworks `m_nServerVersion`
    public let _nServerVersion: Int
    /// Steamworks `m_szServerName`
    public let _szServerName: char [64]
    /// Steamworks `m_szGameTags`
    public let _szGameTags: char [128]
    /// Steamworks `m_steamID`
    public let _steamID: SteamID
}

/// Steamworks `SteamPartyBeaconLocation_t`
public struct SteamPartyBeaconLocation {
    /// Steamworks `m_eType`
    public let _eType: SteamPartyBeaconLocationType
    /// Steamworks `m_ulLocationID`
    public let _ulLocationID: uint64
}

/// Steamworks `SteamParamStringArray_t`
public struct SteamParamStringArray {
    /// Steamworks `m_ppStrings`
    public let _ppStrings: const char **
    /// Steamworks `m_nNumStrings`
    public let _nNumStrings: int32
}

/// Steamworks `LeaderboardEntry_t`
public struct LeaderboardEntry {
    /// Steamworks `m_steamIDUser`
    public let _steamIDUser: SteamID
    /// Steamworks `m_nGlobalRank`
    public let _nGlobalRank: int32
    /// Steamworks `m_nScore`
    public let _nScore: int32
    /// Steamworks `m_cDetails`
    public let _cDetails: int32
    /// Steamworks `m_hUGC`
    public let _hUGC: UGCHandle
}

/// Steamworks `P2PSessionState_t`
public struct P2PSessionState {
    /// Steamworks `m_bConnectionActive`
    public let _bConnectionActive: uint8
    /// Steamworks `m_bConnecting`
    public let _bConnecting: uint8
    /// Steamworks `m_eP2PSessionError`
    public let _eP2PSessionError: uint8
    /// Steamworks `m_bUsingRelay`
    public let _bUsingRelay: uint8
    /// Steamworks `m_nBytesQueuedForSend`
    public let _nBytesQueuedForSend: int32
    /// Steamworks `m_nPacketsQueuedForSend`
    public let _nPacketsQueuedForSend: int32
    /// Steamworks `m_nRemoteIP`
    public let _nRemoteIP: Int
    /// Steamworks `m_nRemotePort`
    public let _nRemotePort: uint16
}

/// Steamworks `InputAnalogActionData_t`
public struct InputAnalogActionData {
    /// Steamworks `eMode`
    public let mode: InputSourceMode
    /// Steamworks `x`
    public let : float
    /// Steamworks `y`
    public let : float
    /// Steamworks `bActive`
    public let active: Bool
}

/// Steamworks `InputDigitalActionData_t`
public struct InputDigitalActionData {
    /// Steamworks `bState`
    public let state: Bool
    /// Steamworks `bActive`
    public let active: Bool
}

/// Steamworks `InputMotionData_t`
public struct InputMotionData {
    /// Steamworks `rotQuatX`
    public let quatX: float
    /// Steamworks `rotQuatY`
    public let quatY: float
    /// Steamworks `rotQuatZ`
    public let quatZ: float
    /// Steamworks `rotQuatW`
    public let quatW: float
    /// Steamworks `posAccelX`
    public let accelX: float
    /// Steamworks `posAccelY`
    public let accelY: float
    /// Steamworks `posAccelZ`
    public let accelZ: float
    /// Steamworks `rotVelX`
    public let velX: float
    /// Steamworks `rotVelY`
    public let velY: float
    /// Steamworks `rotVelZ`
    public let velZ: float
}

/// Steamworks `SteamInputActionEvent_t`
public struct SteamInputActionEvent {
    /// Steamworks `controllerHandle`
    public let handle: InputHandle
    /// Steamworks `eEventType`
    public let eventType: SteamInputActionEventType
    /// Steamworks `analogAction_actionHandle`
    public let actionactionHandle: InputAnalogActionHandle
    /// Steamworks `analogAction_analogActionData`
    public let actionanalogActionData: InputAnalogActionData
}

/// Steamworks `SteamUGCDetails_t`
public struct SteamUGCDetails {
    /// Steamworks `m_nPublishedFileId`
    public let _nPublishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let _eResult: SteamResult
    /// Steamworks `m_eFileType`
    public let _eFileType: WorkshopFileType
    /// Steamworks `m_nCreatorAppID`
    public let _nCreatorAppID: AppId
    /// Steamworks `m_nConsumerAppID`
    public let _nConsumerAppID: AppId
    /// Steamworks `m_rgchTitle`
    public let _rgchTitle: char [129]
    /// Steamworks `m_rgchDescription`
    public let _rgchDescription: char [8000]
    /// Steamworks `m_ulSteamIDOwner`
    public let _ulSteamIDOwner: uint64
    /// Steamworks `m_rtimeCreated`
    public let _rtimeCreated: Int
    /// Steamworks `m_rtimeUpdated`
    public let _rtimeUpdated: Int
    /// Steamworks `m_rtimeAddedToUserList`
    public let _rtimeAddedToUserList: Int
    /// Steamworks `m_eVisibility`
    public let _eVisibility: RemoteStoragePublishedFileVisibility
    /// Steamworks `m_bBanned`
    public let _bBanned: Bool
    /// Steamworks `m_bAcceptedForUse`
    public let _bAcceptedForUse: Bool
    /// Steamworks `m_bTagsTruncated`
    public let _bTagsTruncated: Bool
    /// Steamworks `m_rgchTags`
    public let _rgchTags: char [1025]
    /// Steamworks `m_hFile`
    public let _hFile: UGCHandle
    /// Steamworks `m_hPreviewFile`
    public let _hPreviewFile: UGCHandle
    /// Steamworks `m_pchFileName`
    public let _pchFileName: char [260]
    /// Steamworks `m_nFileSize`
    public let _nFileSize: int32
    /// Steamworks `m_nPreviewFileSize`
    public let _nPreviewFileSize: int32
    /// Steamworks `m_rgchURL`
    public let _rgchURL: char [256]
    /// Steamworks `m_unVotesUp`
    public let _unVotesUp: Int
    /// Steamworks `m_unVotesDown`
    public let _unVotesDown: Int
    /// Steamworks `m_flScore`
    public let _flScore: float
    /// Steamworks `m_unNumChildren`
    public let _unNumChildren: Int
}

/// Steamworks `SteamItemDetails_t`
public struct SteamItemDetails {
    /// Steamworks `m_itemId`
    public let _itemId: SteamItemInstanceID
    /// Steamworks `m_iDefinition`
    public let _iDefinition: SteamItemDef
    /// Steamworks `m_unQuantity`
    public let _unQuantity: uint16
    /// Steamworks `m_unFlags`
    public let _unFlags: uint16
}

/// Steamworks `SteamNetworkingIPAddr`
public struct SteamNetworkingIPAddr {
    /// Steamworks `m_ipv6`
    public let _ipv6: uint8 [16]
    /// Steamworks `m_port`
    public let _port: uint16
}

/// Steamworks `SteamNetworkingIdentity`
public struct SteamNetworkingIdentity {
    /// Steamworks `m_eType`
    public let _eType: SteamNetworkingIdentityType
    /// Steamworks `m_cbSize`
    public let _cbSize: Int
    /// Steamworks `m_szUnknownRawString`
    public let _szUnknownRawString: char [128]
}

/// Steamworks `SteamNetConnectionInfo_t`
public struct SteamNetConnectionInfo {
    /// Steamworks `m_identityRemote`
    public let _identityRemote: SteamNetworkingIdentity
    /// Steamworks `m_nUserData`
    public let _nUserData: int64
    /// Steamworks `m_hListenSocket`
    public let _hListenSocket: HSteamListenSocket
    /// Steamworks `m_addrRemote`
    public let _addrRemote: SteamNetworkingIPAddr
    /// Steamworks `m__pad1`
    public let _pad1: uint16
    /// Steamworks `m_idPOPRemote`
    public let _idPOPRemote: SteamNetworkingPOPID
    /// Steamworks `m_idPOPRelay`
    public let _idPOPRelay: SteamNetworkingPOPID
    /// Steamworks `m_eState`
    public let _eState: SteamNetworkingConnectionState
    /// Steamworks `m_eEndReason`
    public let _eEndReason: Int
    /// Steamworks `m_szEndDebug`
    public let _szEndDebug: char [128]
    /// Steamworks `m_szConnectionDescription`
    public let _szConnectionDescription: char [128]
    /// Steamworks `m_nFlags`
    public let _nFlags: Int
    /// Steamworks `reserved`
    public let : uint32 [63]
}

/// Steamworks `SteamNetworkingQuickConnectionStatus`
public struct SteamNetworkingQuickConnectionStatus {
    /// Steamworks `m_eState`
    public let _eState: SteamNetworkingConnectionState
    /// Steamworks `m_nPing`
    public let _nPing: Int
    /// Steamworks `m_flConnectionQualityLocal`
    public let _flConnectionQualityLocal: float
    /// Steamworks `m_flConnectionQualityRemote`
    public let _flConnectionQualityRemote: float
    /// Steamworks `m_flOutPacketsPerSec`
    public let _flOutPacketsPerSec: float
    /// Steamworks `m_flOutBytesPerSec`
    public let _flOutBytesPerSec: float
    /// Steamworks `m_flInPacketsPerSec`
    public let _flInPacketsPerSec: float
    /// Steamworks `m_flInBytesPerSec`
    public let _flInBytesPerSec: float
    /// Steamworks `m_nSendRateBytesPerSecond`
    public let _nSendRateBytesPerSecond: Int
    /// Steamworks `m_cbPendingUnreliable`
    public let _cbPendingUnreliable: Int
    /// Steamworks `m_cbPendingReliable`
    public let _cbPendingReliable: Int
    /// Steamworks `m_cbSentUnackedReliable`
    public let _cbSentUnackedReliable: Int
    /// Steamworks `m_usecQueueTime`
    public let _usecQueueTime: SteamNetworkingMicroseconds
    /// Steamworks `reserved`
    public let : uint32 [16]
}

/// Steamworks `SteamNetworkingMessage_t`
public struct SteamNetworkingMessage {
    /// Steamworks `m_pData`
    public let _pData: UnsafeMutableRawPointer
    /// Steamworks `m_cbSize`
    public let _cbSize: Int
    /// Steamworks `m_conn`
    public let _conn: HSteamNetConnection
    /// Steamworks `m_identityPeer`
    public let _identityPeer: SteamNetworkingIdentity
    /// Steamworks `m_nConnUserData`
    public let _nConnUserData: int64
    /// Steamworks `m_usecTimeReceived`
    public let _usecTimeReceived: SteamNetworkingMicroseconds
    /// Steamworks `m_nMessageNumber`
    public let _nMessageNumber: int64
    /// Steamworks `m_pfnFreeData`
    public let _pfnFreeData: void (*)(SteamNetworkingMessage *)
    /// Steamworks `m_pfnRelease`
    public let _pfnRelease: void (*)(SteamNetworkingMessage *)
    /// Steamworks `m_nChannel`
    public let _nChannel: Int
    /// Steamworks `m_nFlags`
    public let _nFlags: Int
    /// Steamworks `m_nUserData`
    public let _nUserData: int64
}

/// Steamworks `SteamNetworkPingLocation_t`
public struct SteamNetworkPingLocation {
    /// Steamworks `m_data`
    public let _data: uint8 [512]
}

/// Steamworks `SteamNetworkingConfigValue_t`
public struct SteamNetworkingConfigValue {
    /// Steamworks `m_eValue`
    public let _eValue: SteamNetworkingConfigValue
    /// Steamworks `m_eDataType`
    public let _eDataType: SteamNetworkingConfigDataType
    /// Steamworks `m_int64`
    public let _int64: int64
}

/// Steamworks `SteamNetworkingPOPIDRender`
public struct SteamNetworkingPOPIDRender {
    /// Steamworks `buf`
    public let : char [8]
}

/// Steamworks `SteamNetworkingIdentityRender`
public struct SteamNetworkingIdentityRender {
    /// Steamworks `buf`
    public let : char [128]
}

/// Steamworks `SteamNetworkingIPAddrRender`
public struct SteamNetworkingIPAddrRender {
    /// Steamworks `buf`
    public let : char [48]
}

/// Steamworks `SteamDatagramHostedAddress`
public struct SteamDatagramHostedAddress {
    /// Steamworks `m_cbSize`
    public let _cbSize: Int
    /// Steamworks `m_data`
    public let _data: char [128]
}

/// Steamworks `SteamDatagramGameCoordinatorServerLogin`
public struct SteamDatagramGameCoordinatorServerLogin {
    /// Steamworks `m_identity`
    public let _identity: SteamNetworkingIdentity
    /// Steamworks `m_routing`
    public let _routing: SteamDatagramHostedAddress
    /// Steamworks `m_nAppID`
    public let _nAppID: AppId
    /// Steamworks `m_rtime`
    public let _rtime: RTime32
    /// Steamworks `m_cbAppData`
    public let _cbAppData: Int
    /// Steamworks `m_appData`
    public let _appData: char [2048]
}
