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
    public let result: SteamResult
    /// Steamworks `m_bStillRetrying`
    public let stillRetrying: Bool
}

/// Steamworks `SteamServersDisconnected_t`
public struct SteamServersDisconnected {
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `ClientGameServerDeny_t`
public struct ClientGameServerDeny {
    /// Steamworks `m_uAppID`
    public let appID: Int
    /// Steamworks `m_unGameServerIP`
    public let gameServerIP: Int
    /// Steamworks `m_usGameServerPort`
    public let gameServerPort: Int
    /// Steamworks `m_bSecure`
    public let secure: Bool
    /// Steamworks `m_uReason`
    public let reason: Int
}

/// Steamworks `IPCFailure_t`
public struct IPCFailure {
    /// Steamworks `m_eFailureType`
    public let failureType: Int

    /// Steamworks `IPCFailure_t::EFailureType`
    public enum FailureType: UInt32 {
        /// Steamworks `k_EFailureFlushedCallbackQueue`
        case flushedCallbackQueue = 0
        /// Steamworks `k_EFailurePipeFail`
        case pipeFail = 1
        /// Some undocumented value
        case unrepresentedInSwift = 2
    }
}

extension IPCFailure_t.EFailureType: RawConvertible { typealias From = IPCFailure.FailureType }
extension IPCFailure.FailureType: EnumWithUnrepresented { typealias From = IPCFailure_t.EFailureType }

/// Steamworks `LicensesUpdated_t`
public struct LicensesUpdated {
}

/// Steamworks `ValidateAuthTicketResponse_t`
public struct ValidateAuthTicketResponse {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_eAuthSessionResponse`
    public let authSessionResponse: AuthSessionResponse
    /// Steamworks `m_OwnerSteamID`
    public let ownerSteamID: SteamID
}

/// Steamworks `MicroTxnAuthorizationResponse_t`
public struct MicroTxnAuthorizationResponse {
    /// Steamworks `m_unAppID`
    public let appID: Int
    /// Steamworks `m_ulOrderID`
    public let orderID: UInt64
    /// Steamworks `m_bAuthorized`
    public let authorized: Bool
}

/// Steamworks `EncryptedAppTicketResponse_t`
public struct EncryptedAppTicketResponse {
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `GetAuthSessionTicketResponse_t`
public struct GetAuthSessionTicketResponse {
    /// Steamworks `m_hAuthTicket`
    public let authTicket: HAuthTicket
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `GameWebCallback_t`
public struct GameWebCallback {
    /// Steamworks `m_szURL`
    public let url: String
}

/// Steamworks `StoreAuthURLResponse_t`
public struct StoreAuthURLResponse {
    /// Steamworks `m_szURL`
    public let url: String
}

/// Steamworks `MarketEligibilityResponse_t`
public struct MarketEligibilityResponse {
    /// Steamworks `m_bAllowed`
    public let allowed: Bool
    /// Steamworks `m_eNotAllowedReason`
    public let notAllowedReason: MarketNotAllowedReasonFlags
    /// Steamworks `m_rtAllowedAtTime`
    public let allowedAtTime: RTime32
    /// Steamworks `m_cdaySteamGuardRequiredDays`
    public let steamGuardRequiredDays: Int
    /// Steamworks `m_cdayNewDeviceCooldown`
    public let newDeviceCooldown: Int
}

/// Steamworks `DurationControl_t`
public struct DurationControl {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_appid`
    public let appid: AppId
    /// Steamworks `m_bApplicable`
    public let applicable: Bool
    /// Steamworks `m_csecsLast5h`
    public let csecsLast5h: Int
    /// Steamworks `m_progress`
    public let progress: DurationControlProgress
    /// Steamworks `m_notification`
    public let notification: DurationControlNotification
    /// Steamworks `m_csecsToday`
    public let csecsToday: Int
    /// Steamworks `m_csecsRemaining`
    public let csecsRemaining: Int
}

/// Steamworks `PersonaStateChange_t`
public struct PersonaStateChange {
    /// Steamworks `m_ulSteamID`
    public let steamID: SteamID
    /// Steamworks `m_nChangeFlags`
    public let changeFlags: PersonaChange
}

/// Steamworks `GameOverlayActivated_t`
public struct GameOverlayActivated {
    /// Steamworks `m_bActive`
    public let active: Bool
}

/// Steamworks `GameServerChangeRequested_t`
public struct GameServerChangeRequested {
    /// Steamworks `m_rgchServer`
    public let server: String
    /// Steamworks `m_rgchPassword`
    public let password: String
}

/// Steamworks `GameLobbyJoinRequested_t`
public struct GameLobbyJoinRequested {
    /// Steamworks `m_steamIDLobby`
    public let lobby: SteamID
    /// Steamworks `m_steamIDFriend`
    public let friend: SteamID
}

/// Steamworks `AvatarImageLoaded_t`
public struct AvatarImageLoaded {
    /// Steamworks `m_steamID`
    public let steamID: SteamID
    /// Steamworks `m_iImage`
    public let imageIndex: Int
    /// Steamworks `m_iWide`
    public let wideIndex: Int
    /// Steamworks `m_iTall`
    public let tallIndex: Int
}

/// Steamworks `ClanOfficerListResponse_t`
public struct ClanOfficerListResponse {
    /// Steamworks `m_steamIDClan`
    public let clan: SteamID
    /// Steamworks `m_cOfficers`
    public let officers: Int
    /// Steamworks `m_bSuccess`
    public let success: Bool
}

/// Steamworks `FriendRichPresenceUpdate_t`
public struct FriendRichPresenceUpdate {
    /// Steamworks `m_steamIDFriend`
    public let friend: SteamID
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `GameRichPresenceJoinRequested_t`
public struct GameRichPresenceJoinRequested {
    /// Steamworks `m_steamIDFriend`
    public let friend: SteamID
    /// Steamworks `m_rgchConnect`
    public let connect: String
}

/// Steamworks `GameConnectedClanChatMsg_t`
public struct GameConnectedClanChatMsg {
    /// Steamworks `m_steamIDClanChat`
    public let clanChat: SteamID
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
    /// Steamworks `m_iMessageID`
    public let messageIDIndex: Int
}

/// Steamworks `GameConnectedChatJoin_t`
public struct GameConnectedChatJoin {
    /// Steamworks `m_steamIDClanChat`
    public let clanChat: SteamID
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
}

/// Steamworks `GameConnectedChatLeave_t`
public struct GameConnectedChatLeave {
    /// Steamworks `m_steamIDClanChat`
    public let clanChat: SteamID
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
    /// Steamworks `m_bKicked`
    public let kicked: Bool
    /// Steamworks `m_bDropped`
    public let dropped: Bool
}

/// Steamworks `DownloadClanActivityCountsResult_t`
public struct DownloadClanActivityCountsResult {
    /// Steamworks `m_bSuccess`
    public let success: Bool
}

/// Steamworks `JoinClanChatRoomCompletionResult_t`
public struct JoinClanChatRoomCompletionResult {
    /// Steamworks `m_steamIDClanChat`
    public let clanChat: SteamID
    /// Steamworks `m_eChatRoomEnterResponse`
    public let chatRoomEnterResponse: ChatRoomEnterResponse
}

/// Steamworks `GameConnectedFriendChatMsg_t`
public struct GameConnectedFriendChatMsg {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
    /// Steamworks `m_iMessageID`
    public let messageIDIndex: Int
}

/// Steamworks `FriendsGetFollowerCount_t`
public struct FriendsGetFollowerCount {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_steamID`
    public let steamID: SteamID
    /// Steamworks `m_nCount`
    public let count: Int
}

/// Steamworks `FriendsIsFollowing_t`
public struct FriendsIsFollowing {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_steamID`
    public let steamID: SteamID
    /// Steamworks `m_bIsFollowing`
    public let isFollowing: Bool
}

/// Steamworks `FriendsEnumerateFollowingList_t`
public struct FriendsEnumerateFollowingList {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_rgSteamID`
    public let steamID: [SteamID]
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
}

/// Steamworks `SetPersonaNameResponse_t`
public struct SetPersonaNameResponse {
    /// Steamworks `m_bSuccess`
    public let success: Bool
    /// Steamworks `m_bLocalSuccess`
    public let localSuccess: Bool
    /// Steamworks `m_result`
    public let result: SteamResult
}

/// Steamworks `UnreadChatMessagesChanged_t`
public struct UnreadChatMessagesChanged {
}

/// Steamworks `OverlayBrowserProtocolNavigation_t`
public struct OverlayBrowserProtocolNavigation {
    /// Steamworks `rgchURI`
    public let uri: String
}

/// Steamworks `IPCountry_t`
public struct IPCountry {
}

/// Steamworks `LowBatteryPower_t`
public struct LowBatteryPower {
    /// Steamworks `m_nMinutesBatteryLeft`
    public let minutesBatteryLeft: Int
}

/// Steamworks `SteamAPICallCompleted_t`
public struct SteamAPICallCompleted {
    /// Steamworks `m_hAsyncCall`
    public let asyncCall: SteamAPICall
    /// Steamworks `m_iCallback`
    public let callbackIndex: Int
    /// Steamworks `m_cubParam`
    public let param: Int
}

/// Steamworks `SteamShutdown_t`
public struct SteamShutdown {
}

/// Steamworks `CheckFileSignature_t`
public struct CheckFileSignature {
    /// Steamworks `m_eCheckFileSignature`
    public let checkFileSignature: CheckFileSignatureResult
}

/// Steamworks `GamepadTextInputDismissed_t`
public struct GamepadTextInputDismissed {
    /// Steamworks `m_bSubmitted`
    public let submitted: Bool
    /// Steamworks `m_unSubmittedText`
    public let submittedText: Int
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
    public let ip: Int
    /// Steamworks `m_nQueryPort`
    public let queryPort: Int
    /// Steamworks `m_nConnPort`
    public let connPort: Int
    /// Steamworks `m_nAppID`
    public let appID: Int
    /// Steamworks `m_nFlags`
    public let flags: Int
    /// Steamworks `m_bAdd`
    public let add: Bool
    /// Steamworks `m_unAccountId`
    public let accountId: AccountID
}

/// Steamworks `LobbyInvite_t`
public struct LobbyInvite {
    /// Steamworks `m_ulSteamIDUser`
    public let steamIDUser: SteamID
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulGameID`
    public let gameID: GameID
}

/// Steamworks `LobbyEnter_t`
public struct LobbyEnter {
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_rgfChatPermissions`
    public let chatPermissions: Int
    /// Steamworks `m_bLocked`
    public let locked: Bool
    /// Steamworks `m_EChatRoomEnterResponse`
    public let eChatRoomEnterResponse: Int
}

/// Steamworks `LobbyDataUpdate_t`
public struct LobbyDataUpdate {
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulSteamIDMember`
    public let steamIDMember: SteamID
    /// Steamworks `m_bSuccess`
    public let success: Bool
}

/// Steamworks `LobbyChatUpdate_t`
public struct LobbyChatUpdate {
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulSteamIDUserChanged`
    public let steamIDUserChanged: SteamID
    /// Steamworks `m_ulSteamIDMakingChange`
    public let steamIDMakingChange: SteamID
    /// Steamworks `m_rgfChatMemberStateChange`
    public let chatMemberStateChange: Int
}

/// Steamworks `LobbyChatMsg_t`
public struct LobbyChatMsg {
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulSteamIDUser`
    public let steamIDUser: SteamID
    /// Steamworks `m_eChatEntryType`
    public let chatEntryType: Int
    /// Steamworks `m_iChatID`
    public let chatIDIndex: Int
}

/// Steamworks `LobbyGameCreated_t`
public struct LobbyGameCreated {
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulSteamIDGameServer`
    public let steamIDGameServer: SteamID
    /// Steamworks `m_unIP`
    public let ip: Int
    /// Steamworks `m_usPort`
    public let port: Int
}

/// Steamworks `LobbyMatchList_t`
public struct LobbyMatchList {
    /// Steamworks `m_nLobbiesMatching`
    public let lobbiesMatching: Int
}

/// Steamworks `LobbyKicked_t`
public struct LobbyKicked {
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulSteamIDAdmin`
    public let steamIDAdmin: SteamID
    /// Steamworks `m_bKickedDueToDisconnect`
    public let kickedDueToDisconnect: Bool
}

/// Steamworks `LobbyCreated_t`
public struct LobbyCreated {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
}

/// Steamworks `PSNGameBootInviteResult_t`
public struct PSNGameBootInviteResult {
    /// Steamworks `m_bGameBootInviteExists`
    public let gameBootInviteExists: Bool
    /// Steamworks `m_steamIDLobby`
    public let lobby: SteamID
}

/// Steamworks `FavoritesListAccountsUpdated_t`
public struct FavoritesListAccountsUpdated {
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `SearchForGameProgressCallback_t`
public struct SearchForGameProgressCallback {
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_lobbyID`
    public let id: SteamID
    /// Steamworks `m_steamIDEndedSearch`
    public let endedSearch: SteamID
    /// Steamworks `m_nSecondsRemainingEstimate`
    public let secondsRemainingEstimate: Int
    /// Steamworks `m_cPlayersSearching`
    public let playersSearching: Int
}

/// Steamworks `SearchForGameResultCallback_t`
public struct SearchForGameResultCallback {
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nCountPlayersInGame`
    public let countPlayersInGame: Int
    /// Steamworks `m_nCountAcceptedGame`
    public let countAcceptedGame: Int
    /// Steamworks `m_steamIDHost`
    public let host: SteamID
    /// Steamworks `m_bFinalCallback`
    public let finalCallback: Bool
}

/// Steamworks `RequestPlayersForGameProgressCallback_t`
public struct RequestPlayersForGameProgressCallback {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64
}

/// Steamworks `RequestPlayersForGameResultCallback_t`
public struct RequestPlayersForGameResultCallback {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64
    /// Steamworks `m_SteamIDPlayerFound`
    public let playerFound: SteamID
    /// Steamworks `m_SteamIDLobby`
    public let lobby: SteamID
    /// Steamworks `m_ePlayerAcceptState`
    public let playerAcceptState: PlayerAcceptState
    /// Steamworks `m_nPlayerIndex`
    public let playerIndex: Int
    /// Steamworks `m_nTotalPlayersFound`
    public let totalPlayersFound: Int
    /// Steamworks `m_nTotalPlayersAcceptedGame`
    public let totalPlayersAcceptedGame: Int
    /// Steamworks `m_nSuggestedTeamIndex`
    public let suggestedTeamIndex: Int
    /// Steamworks `m_ullUniqueGameID`
    public let uniqueGameID: GameID

    /// Steamworks `RequestPlayersForGameResultCallback_t::PlayerAcceptState_t`
    public enum PlayerAcceptState: UInt32 {
        /// Steamworks `k_EStateUnknown`
        case unknown = 0
        /// Steamworks `k_EStatePlayerAccepted`
        case playerAccepted = 1
        /// Steamworks `k_EStatePlayerDeclined`
        case playerDeclined = 2
        /// Some undocumented value
        case unrepresentedInSwift = 3
    }
}

extension RequestPlayersForGameResultCallback_t.PlayerAcceptState_t: RawConvertible { typealias From = RequestPlayersForGameResultCallback.PlayerAcceptState }
extension RequestPlayersForGameResultCallback.PlayerAcceptState: EnumWithUnrepresented { typealias From = RequestPlayersForGameResultCallback_t.PlayerAcceptState_t }

/// Steamworks `RequestPlayersForGameFinalResultCallback_t`
public struct RequestPlayersForGameFinalResultCallback {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64
    /// Steamworks `m_ullUniqueGameID`
    public let uniqueGameID: GameID
}

/// Steamworks `SubmitPlayerResultResultCallback_t`
public struct SubmitPlayerResultResultCallback {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `ullUniqueGameID`
    public let uniqueGameID: GameID
    /// Steamworks `steamIDPlayer`
    public let player: SteamID
}

/// Steamworks `EndGameResultCallback_t`
public struct EndGameResultCallback {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `ullUniqueGameID`
    public let uniqueGameID: GameID
}

/// Steamworks `JoinPartyCallback_t`
public struct JoinPartyCallback {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_ulBeaconID`
    public let beaconID: PartyBeaconID
    /// Steamworks `m_SteamIDBeaconOwner`
    public let beaconOwner: SteamID
    /// Steamworks `m_rgchConnectString`
    public let connectString: String
}

/// Steamworks `CreateBeaconCallback_t`
public struct CreateBeaconCallback {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_ulBeaconID`
    public let beaconID: PartyBeaconID
}

/// Steamworks `ReservationNotificationCallback_t`
public struct ReservationNotificationCallback {
    /// Steamworks `m_ulBeaconID`
    public let beaconID: PartyBeaconID
    /// Steamworks `m_steamIDJoiner`
    public let joiner: SteamID
}

/// Steamworks `ChangeNumOpenSlotsCallback_t`
public struct ChangeNumOpenSlotsCallback {
    /// Steamworks `m_eResult`
    public let result: SteamResult
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
    public let result: SteamResult
    /// Steamworks `m_hFile`
    public let file: UGCHandle
    /// Steamworks `m_rgchFilename`
    public let filename: String
}

/// Steamworks `RemoteStoragePublishFileResult_t`
public struct RemoteStoragePublishFileResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let userNeedsToAcceptWorkshopLegalAgreement: Bool
}

/// Steamworks `RemoteStorageDeletePublishedFileResult_t`
public struct RemoteStorageDeletePublishedFileResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
}

/// Steamworks `RemoteStorageEnumerateUserPublishedFilesResult_t`
public struct RemoteStorageEnumerateUserPublishedFilesResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileId]
}

/// Steamworks `RemoteStorageSubscribePublishedFileResult_t`
public struct RemoteStorageSubscribePublishedFileResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
}

/// Steamworks `RemoteStorageEnumerateUserSubscribedFilesResult_t`
public struct RemoteStorageEnumerateUserSubscribedFilesResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileId]
    /// Steamworks `m_rgRTimeSubscribed`
    public let rTimeSubscribed: [Int]
}

/// Steamworks `RemoteStorageUnsubscribePublishedFileResult_t`
public struct RemoteStorageUnsubscribePublishedFileResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
}

/// Steamworks `RemoteStorageUpdatePublishedFileResult_t`
public struct RemoteStorageUpdatePublishedFileResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let userNeedsToAcceptWorkshopLegalAgreement: Bool
}

/// Steamworks `RemoteStorageDownloadUGCResult_t`
public struct RemoteStorageDownloadUGCResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_hFile`
    public let file: UGCHandle
    /// Steamworks `m_nAppID`
    public let appID: AppId
    /// Steamworks `m_nSizeInBytes`
    public let sizeInBytes: Int
    /// Steamworks `m_pchFileName`
    public let fileName: String
    /// Steamworks `m_ulSteamIDOwner`
    public let steamIDOwner: SteamID
}

/// Steamworks `RemoteStorageGetPublishedFileDetailsResult_t`
public struct RemoteStorageGetPublishedFileDetailsResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nCreatorAppID`
    public let creatorAppID: AppId
    /// Steamworks `m_nConsumerAppID`
    public let consumerAppID: AppId
    /// Steamworks `m_rgchTitle`
    public let title: String
    /// Steamworks `m_rgchDescription`
    public let description: String
    /// Steamworks `m_hFile`
    public let file: UGCHandle
    /// Steamworks `m_hPreviewFile`
    public let previewFile: UGCHandle
    /// Steamworks `m_ulSteamIDOwner`
    public let steamIDOwner: SteamID
    /// Steamworks `m_rtimeCreated`
    public let rtimeCreated: Int
    /// Steamworks `m_rtimeUpdated`
    public let rtimeUpdated: Int
    /// Steamworks `m_eVisibility`
    public let visibility: RemoteStoragePublishedFileVisibility
    /// Steamworks `m_bBanned`
    public let banned: Bool
    /// Steamworks `m_rgchTags`
    public let tags: String
    /// Steamworks `m_bTagsTruncated`
    public let tagsTruncated: Bool
    /// Steamworks `m_pchFileName`
    public let fileName: String
    /// Steamworks `m_nFileSize`
    public let fileSize: Int
    /// Steamworks `m_nPreviewFileSize`
    public let previewFileSize: Int
    /// Steamworks `m_rgchURL`
    public let url: String
    /// Steamworks `m_eFileType`
    public let fileType: WorkshopFileType
    /// Steamworks `m_bAcceptedForUse`
    public let acceptedForUse: Bool
}

/// Steamworks `RemoteStorageEnumerateWorkshopFilesResult_t`
public struct RemoteStorageEnumerateWorkshopFilesResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileId]
    /// Steamworks `m_rgScore`
    public let score: [Float]
    /// Steamworks `m_nAppId`
    public let appId: AppId
    /// Steamworks `m_unStartIndex`
    public let startIndex: Int
}

/// Steamworks `RemoteStorageGetPublishedItemVoteDetailsResult_t`
public struct RemoteStorageGetPublishedItemVoteDetailsResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_unPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nVotesFor`
    public let votesFor: Int
    /// Steamworks `m_nVotesAgainst`
    public let votesAgainst: Int
    /// Steamworks `m_nReports`
    public let reports: Int
    /// Steamworks `m_fScore`
    public let score: Float
}

/// Steamworks `RemoteStoragePublishedFileSubscribed_t`
public struct RemoteStoragePublishedFileSubscribed {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `RemoteStoragePublishedFileUnsubscribed_t`
public struct RemoteStoragePublishedFileUnsubscribed {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `RemoteStoragePublishedFileDeleted_t`
public struct RemoteStoragePublishedFileDeleted {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `RemoteStorageUpdateUserPublishedItemVoteResult_t`
public struct RemoteStorageUpdateUserPublishedItemVoteResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
}

/// Steamworks `RemoteStorageUserVoteDetails_t`
public struct RemoteStorageUserVoteDetails {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_eVote`
    public let vote: WorkshopVote
}

/// Steamworks `RemoteStorageEnumerateUserSharedWorkshopFilesResult_t`
public struct RemoteStorageEnumerateUserSharedWorkshopFilesResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileId]
}

/// Steamworks `RemoteStorageSetUserPublishedFileActionResult_t`
public struct RemoteStorageSetUserPublishedFileActionResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_eAction`
    public let action: WorkshopFileAction
}

/// Steamworks `RemoteStorageEnumeratePublishedFilesByUserActionResult_t`
public struct RemoteStorageEnumeratePublishedFilesByUserActionResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_eAction`
    public let action: WorkshopFileAction
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileId]
    /// Steamworks `m_rgRTimeUpdated`
    public let rTimeUpdated: [Int]
}

/// Steamworks `RemoteStoragePublishFileProgress_t`
public struct RemoteStoragePublishFileProgress {
    /// Steamworks `m_dPercentFile`
    public let percentFile: Double
    /// Steamworks `m_bPreview`
    public let preview: Bool
}

/// Steamworks `RemoteStoragePublishedFileUpdated_t`
public struct RemoteStoragePublishedFileUpdated {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `RemoteStorageFileWriteAsyncComplete_t`
public struct RemoteStorageFileWriteAsyncComplete {
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `RemoteStorageFileReadAsyncComplete_t`
public struct RemoteStorageFileReadAsyncComplete {
    /// Steamworks `m_hFileReadAsync`
    public let fileReadAsync: SteamAPICall
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nOffset`
    public let offset: Int
    /// Steamworks `m_cubRead`
    public let read: Int
}

/// Steamworks `RemoteStorageLocalFileChange_t`
public struct RemoteStorageLocalFileChange {
}

/// Steamworks `UserStatsReceived_t`
public struct UserStatsReceived {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
}

/// Steamworks `UserStatsStored_t`
public struct UserStatsStored {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `UserAchievementStored_t`
public struct UserAchievementStored {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_bGroupAchievement`
    public let groupAchievement: Bool
    /// Steamworks `m_rgchAchievementName`
    public let achievementName: String
    /// Steamworks `m_nCurProgress`
    public let curProgress: Int
    /// Steamworks `m_nMaxProgress`
    public let maxProgress: Int
}

/// Steamworks `LeaderboardFindResult_t`
public struct LeaderboardFindResult {
    /// Steamworks `m_hSteamLeaderboard`
    public let steamLeaderboard: SteamLeaderboard
    /// Steamworks `m_bLeaderboardFound`
    public let leaderboardFound: Bool
}

/// Steamworks `LeaderboardScoresDownloaded_t`
public struct LeaderboardScoresDownloaded {
    /// Steamworks `m_hSteamLeaderboard`
    public let steamLeaderboard: SteamLeaderboard
    /// Steamworks `m_hSteamLeaderboardEntries`
    public let steamLeaderboardEntries: SteamLeaderboardEntries
    /// Steamworks `m_cEntryCount`
    public let entryCount: Int
}

/// Steamworks `LeaderboardScoreUploaded_t`
public struct LeaderboardScoreUploaded {
    /// Steamworks `m_bSuccess`
    public let success: Bool
    /// Steamworks `m_hSteamLeaderboard`
    public let steamLeaderboard: SteamLeaderboard
    /// Steamworks `m_nScore`
    public let score: Int
    /// Steamworks `m_bScoreChanged`
    public let scoreChanged: Bool
    /// Steamworks `m_nGlobalRankNew`
    public let globalRankNew: Int
    /// Steamworks `m_nGlobalRankPrevious`
    public let globalRankPrevious: Int
}

/// Steamworks `NumberOfCurrentPlayers_t`
public struct NumberOfCurrentPlayers {
    /// Steamworks `m_bSuccess`
    public let success: Bool
    /// Steamworks `m_cPlayers`
    public let players: Int
}

/// Steamworks `UserStatsUnloaded_t`
public struct UserStatsUnloaded {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
}

/// Steamworks `UserAchievementIconFetched_t`
public struct UserAchievementIconFetched {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_rgchAchievementName`
    public let achievementName: String
    /// Steamworks `m_bAchieved`
    public let achieved: Bool
    /// Steamworks `m_nIconHandle`
    public let iconHandle: Int
}

/// Steamworks `GlobalAchievementPercentagesReady_t`
public struct GlobalAchievementPercentagesReady {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `LeaderboardUGCSet_t`
public struct LeaderboardUGCSet {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_hSteamLeaderboard`
    public let steamLeaderboard: SteamLeaderboard
}

/// Steamworks `PS3TrophiesInstalled_t`
public struct PS3TrophiesInstalled {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_ulRequiredDiskSpace`
    public let requiredDiskSpace: UInt64
}

/// Steamworks `GlobalStatsReceived_t`
public struct GlobalStatsReceived {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `DlcInstalled_t`
public struct DlcInstalled {
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `RegisterActivationCodeResponse_t`
public struct RegisterActivationCodeResponse {
    /// Steamworks `m_eResult`
    public let result: RegisterActivationCodeResult
    /// Steamworks `m_unPackageRegistered`
    public let packageRegistered: Int
}

/// Steamworks `NewUrlLaunchParameters_t`
public struct NewUrlLaunchParameters {
}

/// Steamworks `AppProofOfPurchaseKeyResponse_t`
public struct AppProofOfPurchaseKeyResponse {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nAppID`
    public let appID: Int
    /// Steamworks `m_cchKeyLength`
    public let keyLength: Int
    /// Steamworks `m_rgchKey`
    public let key: String
}

/// Steamworks `FileDetailsResult_t`
public struct FileDetailsResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_ulFileSize`
    public let fileSize: UInt64
    /// Steamworks `m_FileSHA`
    public let fileSHA: [UInt8]
    /// Steamworks `m_unFlags`
    public let flags: Int
}

/// Steamworks `TimedTrialStatus_t`
public struct TimedTrialStatus {
    /// Steamworks `m_unAppID`
    public let appID: AppId
    /// Steamworks `m_bIsOffline`
    public let isOffline: Bool
    /// Steamworks `m_unSecondsAllowed`
    public let secondsAllowed: Int
    /// Steamworks `m_unSecondsPlayed`
    public let secondsPlayed: Int
}

/// Steamworks `P2PSessionRequest_t`
public struct P2PSessionRequest {
    /// Steamworks `m_steamIDRemote`
    public let remote: SteamID
}

/// Steamworks `P2PSessionConnectFail_t`
public struct P2PSessionConnectFail {
    /// Steamworks `m_steamIDRemote`
    public let remote: SteamID
    /// Steamworks `m_eP2PSessionError`
    public let p2PSessionError: Int
}

/// Steamworks `SocketStatusCallback_t`
public struct SocketStatusCallback {
    /// Steamworks `m_hSocket`
    public let socket: SNetSocket
    /// Steamworks `m_hListenSocket`
    public let listenSocket: SNetListenSocket
    /// Steamworks `m_steamIDRemote`
    public let remote: SteamID
    /// Steamworks `m_eSNetSocketState`
    public let sNetSocketState: Int
}

/// Steamworks `ScreenshotReady_t`
public struct ScreenshotReady {
    /// Steamworks `m_hLocal`
    public let local: ScreenshotHandle
    /// Steamworks `m_eResult`
    public let result: SteamResult
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
    public let newVolume: Float
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
    public let shuffled: Bool
}

/// Steamworks `MusicPlayerWantsLooped_t`
public struct MusicPlayerWantsLooped {
    /// Steamworks `m_bLooped`
    public let looped: Bool
}

/// Steamworks `MusicPlayerWantsVolume_t`
public struct MusicPlayerWantsVolume {
    /// Steamworks `m_flNewVolume`
    public let newVolume: Float
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
    public let playingRepeatStatus: Int
}

/// Steamworks `HTTPRequestCompleted_t`
public struct HTTPRequestCompleted {
    /// Steamworks `m_hRequest`
    public let request: HTTPRequestHandle
    /// Steamworks `m_ulContextValue`
    public let contextValue: UInt64
    /// Steamworks `m_bRequestSuccessful`
    public let requestSuccessful: Bool
    /// Steamworks `m_eStatusCode`
    public let statusCode: HTTPStatusCode
    /// Steamworks `m_unBodySize`
    public let bodySize: Int
}

/// Steamworks `HTTPRequestHeadersReceived_t`
public struct HTTPRequestHeadersReceived {
    /// Steamworks `m_hRequest`
    public let request: HTTPRequestHandle
    /// Steamworks `m_ulContextValue`
    public let contextValue: UInt64
}

/// Steamworks `HTTPRequestDataReceived_t`
public struct HTTPRequestDataReceived {
    /// Steamworks `m_hRequest`
    public let request: HTTPRequestHandle
    /// Steamworks `m_ulContextValue`
    public let contextValue: UInt64
    /// Steamworks `m_cOffset`
    public let offset: Int
    /// Steamworks `m_cBytesReceived`
    public let bytesReceived: Int
}

/// Steamworks `SteamInputDeviceConnected_t`
public struct SteamInputDeviceConnected {
    /// Steamworks `m_ulConnectedDeviceHandle`
    public let connectedDeviceHandle: InputHandle
}

/// Steamworks `SteamInputDeviceDisconnected_t`
public struct SteamInputDeviceDisconnected {
    /// Steamworks `m_ulDisconnectedDeviceHandle`
    public let disconnectedDeviceHandle: InputHandle
}

/// Steamworks `SteamInputConfigurationLoaded_t`
public struct SteamInputConfigurationLoaded {
    /// Steamworks `m_unAppID`
    public let appID: AppId
    /// Steamworks `m_ulDeviceHandle`
    public let deviceHandle: InputHandle
    /// Steamworks `m_ulMappingCreator`
    public let mappingCreator: SteamID
    /// Steamworks `m_unMajorRevision`
    public let majorRevision: Int
    /// Steamworks `m_unMinorRevision`
    public let minorRevision: Int
    /// Steamworks `m_bUsesSteamInputAPI`
    public let usesSteamInputAPI: Bool
    /// Steamworks `m_bUsesGamepadAPI`
    public let usesGamepadAPI: Bool
}

/// Steamworks `SteamUGCQueryCompleted_t`
public struct SteamUGCQueryCompleted {
    /// Steamworks `m_handle`
    public let handle: UGCQueryHandle
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_unNumResultsReturned`
    public let numResultsReturned: Int
    /// Steamworks `m_unTotalMatchingResults`
    public let totalMatchingResults: Int
    /// Steamworks `m_bCachedData`
    public let cachedData: Bool
    /// Steamworks `m_rgchNextCursor`
    public let nextCursor: String
}

/// Steamworks `SteamUGCRequestUGCDetailsResult_t`
public struct SteamUGCRequestUGCDetailsResult {
    /// Steamworks `m_details`
    public let details: SteamUGCDetails
    /// Steamworks `m_bCachedData`
    public let cachedData: Bool
}

/// Steamworks `CreateItemResult_t`
public struct CreateItemResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let userNeedsToAcceptWorkshopLegalAgreement: Bool
}

/// Steamworks `SubmitItemUpdateResult_t`
public struct SubmitItemUpdateResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let userNeedsToAcceptWorkshopLegalAgreement: Bool
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
}

/// Steamworks `ItemInstalled_t`
public struct ItemInstalled {
    /// Steamworks `m_unAppID`
    public let appID: AppId
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
}

/// Steamworks `DownloadItemResult_t`
public struct DownloadItemResult {
    /// Steamworks `m_unAppID`
    public let appID: AppId
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `UserFavoriteItemsListChanged_t`
public struct UserFavoriteItemsListChanged {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_bWasAddRequest`
    public let wasAddRequest: Bool
}

/// Steamworks `SetUserItemVoteResult_t`
public struct SetUserItemVoteResult {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_bVoteUp`
    public let voteUp: Bool
}

/// Steamworks `GetUserItemVoteResult_t`
public struct GetUserItemVoteResult {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_bVotedUp`
    public let votedUp: Bool
    /// Steamworks `m_bVotedDown`
    public let votedDown: Bool
    /// Steamworks `m_bVoteSkipped`
    public let voteSkipped: Bool
}

/// Steamworks `StartPlaytimeTrackingResult_t`
public struct StartPlaytimeTrackingResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `StopPlaytimeTrackingResult_t`
public struct StopPlaytimeTrackingResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `AddUGCDependencyResult_t`
public struct AddUGCDependencyResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nChildPublishedFileId`
    public let childPublishedFileId: PublishedFileId
}

/// Steamworks `RemoveUGCDependencyResult_t`
public struct RemoveUGCDependencyResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nChildPublishedFileId`
    public let childPublishedFileId: PublishedFileId
}

/// Steamworks `AddAppDependencyResult_t`
public struct AddAppDependencyResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `RemoveAppDependencyResult_t`
public struct RemoveAppDependencyResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `GetAppDependenciesResult_t`
public struct GetAppDependenciesResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_rgAppIDs`
    public let appIDs: [AppId]
    /// Steamworks `m_nNumAppDependencies`
    public let numAppDependencies: Int
    /// Steamworks `m_nTotalNumAppDependencies`
    public let totalNumAppDependencies: Int
}

/// Steamworks `DeleteItemResult_t`
public struct DeleteItemResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileId
}

/// Steamworks `UserSubscribedItemsListChanged_t`
public struct UserSubscribedItemsListChanged {
    /// Steamworks `m_nAppID`
    public let appID: AppId
}

/// Steamworks `WorkshopEULAStatus_t`
public struct WorkshopEULAStatus {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nAppID`
    public let appID: AppId
    /// Steamworks `m_unVersion`
    public let version: Int
    /// Steamworks `m_rtAction`
    public let action: RTime32
    /// Steamworks `m_bAccepted`
    public let accepted: Bool
    /// Steamworks `m_bNeedsAction`
    public let needsAction: Bool
}

/// Steamworks `SteamAppInstalled_t`
public struct SteamAppInstalled {
    /// Steamworks `m_nAppID`
    public let appID: AppId
    /// Steamworks `m_iInstallFolderIndex`
    public let installFolderIndex: Int
}

/// Steamworks `SteamAppUninstalled_t`
public struct SteamAppUninstalled {
    /// Steamworks `m_nAppID`
    public let appID: AppId
    /// Steamworks `m_iInstallFolderIndex`
    public let installFolderIndex: Int
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
    public let pageScale: Float
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
    public let pageScale: Float
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
    public let pageScale: Float
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
    public let x: Int
    /// Steamworks `y`
    public let y: Int
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
    public let handle: SteamInventoryResult
    /// Steamworks `m_result`
    public let result: SteamResult
}

/// Steamworks `SteamInventoryFullUpdate_t`
public struct SteamInventoryFullUpdate {
    /// Steamworks `m_handle`
    public let handle: SteamInventoryResult
}

/// Steamworks `SteamInventoryDefinitionUpdate_t`
public struct SteamInventoryDefinitionUpdate {
}

/// Steamworks `SteamInventoryEligiblePromoItemDefIDs_t`
public struct SteamInventoryEligiblePromoItemDefIDs {
    /// Steamworks `m_result`
    public let result: SteamResult
    /// Steamworks `m_steamID`
    public let steamID: SteamID
    /// Steamworks `m_numEligiblePromoItemDefs`
    public let eligiblePromoItemDefs: Int
    /// Steamworks `m_bCachedData`
    public let cachedData: Bool
}

/// Steamworks `SteamInventoryStartPurchaseResult_t`
public struct SteamInventoryStartPurchaseResult {
    /// Steamworks `m_result`
    public let result: SteamResult
    /// Steamworks `m_ulOrderID`
    public let orderID: UInt64
    /// Steamworks `m_ulTransID`
    public let transID: UInt64
}

/// Steamworks `SteamInventoryRequestPricesResult_t`
public struct SteamInventoryRequestPricesResult {
    /// Steamworks `m_result`
    public let result: SteamResult
    /// Steamworks `m_rgchCurrency`
    public let currency: String
}

/// Steamworks `GetVideoURLResult_t`
public struct GetVideoURLResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_unVideoAppID`
    public let videoAppID: AppId
    /// Steamworks `m_rgchURL`
    public let url: String
}

/// Steamworks `GetOPFSettingsResult_t`
public struct GetOPFSettingsResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_unVideoAppID`
    public let videoAppID: AppId
}

/// Steamworks `SteamParentalSettingsChanged_t`
public struct SteamParentalSettingsChanged {
}

/// Steamworks `SteamRemotePlaySessionConnected_t`
public struct SteamRemotePlaySessionConnected {
    /// Steamworks `m_unSessionID`
    public let sessionID: RemotePlaySessionID
}

/// Steamworks `SteamRemotePlaySessionDisconnected_t`
public struct SteamRemotePlaySessionDisconnected {
    /// Steamworks `m_unSessionID`
    public let sessionID: RemotePlaySessionID
}

/// Steamworks `SteamNetworkingMessagesSessionRequest_t`
public struct SteamNetworkingMessagesSessionRequest {
    /// Steamworks `m_identityRemote`
    public let identityRemote: SteamNetworkingIdentity
}

/// Steamworks `SteamNetworkingMessagesSessionFailed_t`
public struct SteamNetworkingMessagesSessionFailed {
    /// Steamworks `m_info`
    public let info: SteamNetConnectionInfo
}

/// Steamworks `SteamNetConnectionStatusChangedCallback_t`
public struct SteamNetConnectionStatusChangedCallback {
    /// Steamworks `m_hConn`
    public let conn: HSteamNetConnection
    /// Steamworks `m_info`
    public let info: SteamNetConnectionInfo
    /// Steamworks `m_eOldState`
    public let oldState: SteamNetworkingConnectionState
}

/// Steamworks `SteamNetAuthenticationStatus_t`
public struct SteamNetAuthenticationStatus {
    /// Steamworks `m_eAvail`
    public let avail: SteamNetworkingAvailability
    /// Steamworks `m_debugMsg`
    public let debugMsg: String
}

/// Steamworks `SteamRelayNetworkStatus_t`
public struct SteamRelayNetworkStatus {
    /// Steamworks `m_eAvail`
    public let avail: SteamNetworkingAvailability
    /// Steamworks `m_bPingMeasurementInProgress`
    public let pingMeasurementInProgress: Bool
    /// Steamworks `m_eAvailNetworkConfig`
    public let availNetworkConfig: SteamNetworkingAvailability
    /// Steamworks `m_eAvailAnyRelay`
    public let availAnyRelay: SteamNetworkingAvailability
    /// Steamworks `m_debugMsg`
    public let debugMsg: String
}

/// Steamworks `GSClientApprove_t`
public struct GSClientApprove {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_OwnerSteamID`
    public let ownerSteamID: SteamID
}

/// Steamworks `GSClientDeny_t`
public struct GSClientDeny {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_eDenyReason`
    public let denyReason: DenyReason
    /// Steamworks `m_rgchOptionalText`
    public let optionalText: String
}

/// Steamworks `GSClientKick_t`
public struct GSClientKick {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_eDenyReason`
    public let denyReason: DenyReason
}

/// Steamworks `GSClientAchievementStatus_t`
public struct GSClientAchievementStatus {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_pchAchievement`
    public let achievement: String
    /// Steamworks `m_bUnlocked`
    public let unlocked: Bool
}

/// Steamworks `GSPolicyResponse_t`
public struct GSPolicyResponse {
    /// Steamworks `m_bSecure`
    public let secure: Bool
}

/// Steamworks `GSGameplayStats_t`
public struct GSGameplayStats {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_nRank`
    public let rank: Int
    /// Steamworks `m_unTotalConnects`
    public let totalConnects: Int
    /// Steamworks `m_unTotalMinutesPlayed`
    public let totalMinutesPlayed: Int
}

/// Steamworks `GSClientGroupStatus_t`
public struct GSClientGroupStatus {
    /// Steamworks `m_SteamIDUser`
    public let user: SteamID
    /// Steamworks `m_SteamIDGroup`
    public let group: SteamID
    /// Steamworks `m_bMember`
    public let member: Bool
    /// Steamworks `m_bOfficer`
    public let officer: Bool
}

/// Steamworks `GSReputation_t`
public struct GSReputation {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_unReputationScore`
    public let reputationScore: Int
    /// Steamworks `m_bBanned`
    public let banned: Bool
    /// Steamworks `m_unBannedIP`
    public let bannedIP: Int
    /// Steamworks `m_usBannedPort`
    public let bannedPort: Int
    /// Steamworks `m_ulBannedGameID`
    public let bannedGameID: GameID
    /// Steamworks `m_unBanExpires`
    public let banExpires: Int
}

/// Steamworks `AssociateWithClanResult_t`
public struct AssociateWithClanResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
}

/// Steamworks `ComputeNewPlayerCompatibilityResult_t`
public struct ComputeNewPlayerCompatibilityResult {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_cPlayersThatDontLikeCandidate`
    public let playersThatDontLikeCandidate: Int
    /// Steamworks `m_cPlayersThatCandidateDoesntLike`
    public let playersThatCandidateDoesntLike: Int
    /// Steamworks `m_cClanPlayersThatDontLikeCandidate`
    public let clanPlayersThatDontLikeCandidate: Int
    /// Steamworks `m_SteamIDCandidate`
    public let candidate: SteamID
}

/// Steamworks `GSStatsReceived_t`
public struct GSStatsReceived {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
}

/// Steamworks `GSStatsStored_t`
public struct GSStatsStored {
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
}

/// Steamworks `GSStatsUnloaded_t`
public struct GSStatsUnloaded {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
}

/// Steamworks `SteamIPAddress_t`
public struct SteamIPAddress {
    /// Steamworks `m_rgubIPv6`
    public let ipv6: [UInt8]
    /// Steamworks `m_eType`
    public let type: SteamIPType
}

/// Steamworks `FriendGameInfo_t`
public struct FriendGameInfo {
    /// Steamworks `m_gameID`
    public let id: GameID
    /// Steamworks `m_unGameIP`
    public let gameIP: Int
    /// Steamworks `m_usGamePort`
    public let gamePort: Int
    /// Steamworks `m_usQueryPort`
    public let queryPort: Int
    /// Steamworks `m_steamIDLobby`
    public let lobby: SteamID
}

/// Steamworks `MatchMakingKeyValuePair_t`
public struct MatchMakingKeyValuePair {
    /// Steamworks `m_szKey`
    public let key: String
    /// Steamworks `m_szValue`
    public let value: String
}

/// Steamworks `servernetadr_t`
public struct servernetadr {
    /// Steamworks `m_usConnectionPort`
    public let connectionPort: Int
    /// Steamworks `m_usQueryPort`
    public let queryPort: Int
    /// Steamworks `m_unIP`
    public let ip: Int
}

/// Steamworks `gameserveritem_t`
public struct gameserveritem {
    /// Steamworks `m_NetAdr`
    public let netAdr: servernetadr
    /// Steamworks `m_nPing`
    public let ping: Int
    /// Steamworks `m_bHadSuccessfulResponse`
    public let hadSuccessfulResponse: Bool
    /// Steamworks `m_bDoNotRefresh`
    public let doNotRefresh: Bool
    /// Steamworks `m_szGameDir`
    public let gameDir: String
    /// Steamworks `m_szMap`
    public let map: String
    /// Steamworks `m_szGameDescription`
    public let gameDescription: String
    /// Steamworks `m_nAppID`
    public let appID: Int
    /// Steamworks `m_nPlayers`
    public let players: Int
    /// Steamworks `m_nMaxPlayers`
    public let maxPlayers: Int
    /// Steamworks `m_nBotPlayers`
    public let botPlayers: Int
    /// Steamworks `m_bPassword`
    public let password: Bool
    /// Steamworks `m_bSecure`
    public let secure: Bool
    /// Steamworks `m_ulTimeLastPlayed`
    public let timeLastPlayed: Int
    /// Steamworks `m_nServerVersion`
    public let serverVersion: Int
    /// Steamworks `m_szServerName`
    public let serverName: String
    /// Steamworks `m_szGameTags`
    public let gameTags: String
    /// Steamworks `m_steamID`
    public let steamID: SteamID
}

/// Steamworks `SteamPartyBeaconLocation_t`
public struct SteamPartyBeaconLocation {
    /// Steamworks `m_eType`
    public let type: SteamPartyBeaconLocationType
    /// Steamworks `m_ulLocationID`
    public let locationID: UInt64
}

/// Steamworks `SteamParamStringArray_t`
public struct SteamParamStringArray {
    /// Steamworks `m_ppStrings`
    public let strings: [String]
    /// Steamworks `m_nNumStrings`
    public let numStrings: Int
}

/// Steamworks `LeaderboardEntry_t`
public struct LeaderboardEntry {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
    /// Steamworks `m_nGlobalRank`
    public let globalRank: Int
    /// Steamworks `m_nScore`
    public let score: Int
    /// Steamworks `m_cDetails`
    public let details: Int
    /// Steamworks `m_hUGC`
    public let ugc: UGCHandle
}

/// Steamworks `P2PSessionState_t`
public struct P2PSessionState {
    /// Steamworks `m_bConnectionActive`
    public let connectionActive: Bool
    /// Steamworks `m_bConnecting`
    public let connecting: Bool
    /// Steamworks `m_eP2PSessionError`
    public let p2PSessionError: Int
    /// Steamworks `m_bUsingRelay`
    public let usingRelay: Bool
    /// Steamworks `m_nBytesQueuedForSend`
    public let bytesQueuedForSend: Int
    /// Steamworks `m_nPacketsQueuedForSend`
    public let packetsQueuedForSend: Int
    /// Steamworks `m_nRemoteIP`
    public let remoteIP: Int
    /// Steamworks `m_nRemotePort`
    public let remotePort: Int
}

/// Steamworks `InputAnalogActionData_t`
public struct InputAnalogActionData {
    /// Steamworks `eMode`
    public let mode: InputSourceMode
    /// Steamworks `x`
    public let x: Float
    /// Steamworks `y`
    public let y: Float
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
    public let quatX: Float
    /// Steamworks `rotQuatY`
    public let quatY: Float
    /// Steamworks `rotQuatZ`
    public let quatZ: Float
    /// Steamworks `rotQuatW`
    public let quatW: Float
    /// Steamworks `posAccelX`
    public let accelX: Float
    /// Steamworks `posAccelY`
    public let accelY: Float
    /// Steamworks `posAccelZ`
    public let accelZ: Float
    /// Steamworks `rotVelX`
    public let velX: Float
    /// Steamworks `rotVelY`
    public let velY: Float
    /// Steamworks `rotVelZ`
    public let velZ: Float
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
    public let publishedFileId: PublishedFileId
    /// Steamworks `m_eResult`
    public let result: SteamResult
    /// Steamworks `m_eFileType`
    public let fileType: WorkshopFileType
    /// Steamworks `m_nCreatorAppID`
    public let creatorAppID: AppId
    /// Steamworks `m_nConsumerAppID`
    public let consumerAppID: AppId
    /// Steamworks `m_rgchTitle`
    public let title: String
    /// Steamworks `m_rgchDescription`
    public let description: String
    /// Steamworks `m_ulSteamIDOwner`
    public let steamIDOwner: SteamID
    /// Steamworks `m_rtimeCreated`
    public let rtimeCreated: Int
    /// Steamworks `m_rtimeUpdated`
    public let rtimeUpdated: Int
    /// Steamworks `m_rtimeAddedToUserList`
    public let rtimeAddedToUserList: Int
    /// Steamworks `m_eVisibility`
    public let visibility: RemoteStoragePublishedFileVisibility
    /// Steamworks `m_bBanned`
    public let banned: Bool
    /// Steamworks `m_bAcceptedForUse`
    public let acceptedForUse: Bool
    /// Steamworks `m_bTagsTruncated`
    public let tagsTruncated: Bool
    /// Steamworks `m_rgchTags`
    public let tags: String
    /// Steamworks `m_hFile`
    public let file: UGCHandle
    /// Steamworks `m_hPreviewFile`
    public let previewFile: UGCHandle
    /// Steamworks `m_pchFileName`
    public let fileName: String
    /// Steamworks `m_nFileSize`
    public let fileSize: Int
    /// Steamworks `m_nPreviewFileSize`
    public let previewFileSize: Int
    /// Steamworks `m_rgchURL`
    public let url: String
    /// Steamworks `m_unVotesUp`
    public let votesUp: Int
    /// Steamworks `m_unVotesDown`
    public let votesDown: Int
    /// Steamworks `m_flScore`
    public let score: Float
    /// Steamworks `m_unNumChildren`
    public let numChildren: Int
}

/// Steamworks `SteamItemDetails_t`
public struct SteamItemDetails {
    /// Steamworks `m_itemId`
    public let id: SteamItemInstanceID
    /// Steamworks `m_iDefinition`
    public let definitionIndex: SteamItemDef
    /// Steamworks `m_unQuantity`
    public let quantity: Int
    /// Steamworks `m_unFlags`
    public let flags: Int
}

/// Steamworks `SteamNetworkingIPAddr`
public struct SteamNetworkingIPAddr {
    /// Steamworks `m_ipv6`
    public let ipv6: [UInt8]
    /// Steamworks `m_port`
    public let port: Int
}

/// Steamworks `SteamNetworkingIdentity`
public struct SteamNetworkingIdentity {
    /// Steamworks `m_eType`
    public let type: SteamNetworkingIdentityType
    /// Steamworks `m_cbSize`
    public let size: Int
    /// Steamworks `m_szUnknownRawString`
    public let unknownRawString: String
}

/// Steamworks `SteamNetConnectionInfo_t`
public struct SteamNetConnectionInfo {
    /// Steamworks `m_identityRemote`
    public let identityRemote: SteamNetworkingIdentity
    /// Steamworks `m_nUserData`
    public let userData: Int
    /// Steamworks `m_hListenSocket`
    public let listenSocket: HSteamListenSocket
    /// Steamworks `m_addrRemote`
    public let addrRemote: SteamNetworkingIPAddr
    /// Steamworks `m_idPOPRemote`
    public let popRemote: SteamNetworkingPOPID
    /// Steamworks `m_idPOPRelay`
    public let popRelay: SteamNetworkingPOPID
    /// Steamworks `m_eState`
    public let state: SteamNetworkingConnectionState
    /// Steamworks `m_eEndReason`
    public let endReason: Int
    /// Steamworks `m_szEndDebug`
    public let endDebug: String
    /// Steamworks `m_szConnectionDescription`
    public let connectionDescription: String
    /// Steamworks `m_nFlags`
    public let flags: Int
}

/// Steamworks `SteamNetworkingQuickConnectionStatus`
public struct SteamNetworkingQuickConnectionStatus {
    /// Steamworks `m_eState`
    public let state: SteamNetworkingConnectionState
    /// Steamworks `m_nPing`
    public let ping: Int
    /// Steamworks `m_flConnectionQualityLocal`
    public let connectionQualityLocal: Float
    /// Steamworks `m_flConnectionQualityRemote`
    public let connectionQualityRemote: Float
    /// Steamworks `m_flOutPacketsPerSec`
    public let outPacketsPerSec: Float
    /// Steamworks `m_flOutBytesPerSec`
    public let outBytesPerSec: Float
    /// Steamworks `m_flInPacketsPerSec`
    public let inPacketsPerSec: Float
    /// Steamworks `m_flInBytesPerSec`
    public let inBytesPerSec: Float
    /// Steamworks `m_nSendRateBytesPerSecond`
    public let sendRateBytesPerSecond: Int
    /// Steamworks `m_cbPendingUnreliable`
    public let pendingUnreliable: Int
    /// Steamworks `m_cbPendingReliable`
    public let pendingReliable: Int
    /// Steamworks `m_cbSentUnackedReliable`
    public let sentUnackedReliable: Int
    /// Steamworks `m_usecQueueTime`
    public let queueTime: SteamNetworkingMicroseconds
}

/// Steamworks `SteamNetworkingMessage_t`
public struct SteamNetworkingMessage {
    /// Steamworks `m_pData`
    public let data: UnsafeMutableRawPointer
    /// Steamworks `m_cbSize`
    public let size: Int
    /// Steamworks `m_conn`
    public let conn: HSteamNetConnection
    /// Steamworks `m_identityPeer`
    public let identityPeer: SteamNetworkingIdentity
    /// Steamworks `m_nConnUserData`
    public let connUserData: Int
    /// Steamworks `m_usecTimeReceived`
    public let timeReceived: SteamNetworkingMicroseconds
    /// Steamworks `m_nMessageNumber`
    public let messageNumber: Int
    /// Steamworks `m_pfnFreeData`
    public let freeData: () -> Void
    /// Steamworks `m_pfnRelease`
    public let release: () -> Void
    /// Steamworks `m_nChannel`
    public let channel: Int
    /// Steamworks `m_nFlags`
    public let flags: Int
    /// Steamworks `m_nUserData`
    public let userData: Int
}

/// Steamworks `SteamNetworkPingLocation_t`
public struct SteamNetworkPingLocation {
    /// Steamworks `m_data`
    public let data: [UInt8]
}

/// Steamworks `SteamNetworkingConfigValue_t`
public struct SteamNetworkingConfigValue {
    /// Steamworks `m_eValue`
    public let value: SteamNetworkingConfigValueSetting
    /// Steamworks `m_eDataType`
    public let dataType: SteamNetworkingConfigDataType
    /// Steamworks `m_int64`
    public let int64: Int
}

/// Steamworks `SteamNetworkingPOPIDRender`
public struct SteamNetworkingPOPIDRender {
    /// Steamworks `buf`
    public let buf: String
}

/// Steamworks `SteamNetworkingIdentityRender`
public struct SteamNetworkingIdentityRender {
    /// Steamworks `buf`
    public let buf: String
}

/// Steamworks `SteamNetworkingIPAddrRender`
public struct SteamNetworkingIPAddrRender {
    /// Steamworks `buf`
    public let buf: String
}

/// Steamworks `SteamDatagramHostedAddress`
public struct SteamDatagramHostedAddress {
    /// Steamworks `m_cbSize`
    public let size: Int
    /// Steamworks `m_data`
    public let data: String
}

/// Steamworks `SteamDatagramGameCoordinatorServerLogin`
public struct SteamDatagramGameCoordinatorServerLogin {
    /// Steamworks `m_identity`
    public let identity: SteamNetworkingIdentity
    /// Steamworks `m_routing`
    public let routing: SteamDatagramHostedAddress
    /// Steamworks `m_nAppID`
    public let appID: AppId
    /// Steamworks `m_rtime`
    public let rtime: RTime32
    /// Steamworks `m_cbAppData`
    public let appData: Int
    /// Steamworks `m_appData`
    public let data: String
}
