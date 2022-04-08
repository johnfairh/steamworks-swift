//
//  Structs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks `ActiveBeaconsUpdated_t`
public struct ActiveBeaconsUpdated {
    /// Create a customized `ActiveBeaconsUpdated`
    public init() {
    }
}

extension ActiveBeaconsUpdated: SteamCreatable {
    typealias SteamType = CSteamworks.ActiveBeaconsUpdated_t
    init(_ steam: CSteamworks.ActiveBeaconsUpdated_t) {
    }
}

/// Steamworks `AddAppDependencyResult_t`
public struct AddAppDependencyResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `AddAppDependencyResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, appID: AppID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.appID = appID
    }
}

extension AddAppDependencyResult: SteamCreatable {
    typealias SteamType = CSteamworks.AddAppDependencyResult_t
    init(_ steam: CSteamworks.AddAppDependencyResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `AddUGCDependencyResult_t`
public struct AddUGCDependencyResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nChildPublishedFileId`
    public let childPublishedFileId: PublishedFileID

    /// Create a customized `AddUGCDependencyResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, childPublishedFileId: PublishedFileID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.childPublishedFileId = childPublishedFileId
    }
}

extension AddUGCDependencyResult: SteamCreatable {
    typealias SteamType = CSteamworks.AddUGCDependencyResult_t
    init(_ steam: CSteamworks.AddUGCDependencyResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        childPublishedFileId = .init(steam.m_nChildPublishedFileId)
    }
}

/// Steamworks `AppProofOfPurchaseKeyResponse_t`
public struct AppProofOfPurchaseKeyResponse {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nAppID`
    public let appID: AppID
    /// Steamworks `m_cchKeyLength`
    public let keySize: Int
    /// Steamworks `m_rgchKey`
    public let key: String

    /// Create a customized `AppProofOfPurchaseKeyResponse`
    public init(result: Result = .none, appID: AppID = 0, keySize: Int = 0, key: String = "") {
        self.result = result
        self.appID = appID
        self.keySize = keySize
        self.key = key
    }
}

extension AppProofOfPurchaseKeyResponse: SteamCreatable {
    typealias SteamType = CSteamworks.AppProofOfPurchaseKeyResponse_t
    init(_ steam: CSteamworks.AppProofOfPurchaseKeyResponse_t) {
        result = .init(steam.m_eResult)
        appID = .init(steam.m_nAppID)
        keySize = .init(steam.m_cchKeyLength)
        key = .init(steam.m_rgchKey_ptr)
    }
}

/// Steamworks `AppResumingFromSuspend_t`
public struct AppResumingFromSuspend {
    /// Create a customized `AppResumingFromSuspend`
    public init() {
    }
}

extension AppResumingFromSuspend: SteamCreatable {
    typealias SteamType = CSteamworks.AppResumingFromSuspend_t
    init(_ steam: CSteamworks.AppResumingFromSuspend_t) {
    }
}

/// Steamworks `AssociateWithClanResult_t`
public struct AssociateWithClanResult {
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `AssociateWithClanResult`
    public init(result: Result = .none) {
        self.result = result
    }
}

extension AssociateWithClanResult: SteamCreatable {
    typealias SteamType = CSteamworks.AssociateWithClanResult_t
    init(_ steam: CSteamworks.AssociateWithClanResult_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `AvailableBeaconLocationsUpdated_t`
public struct AvailableBeaconLocationsUpdated {
    /// Create a customized `AvailableBeaconLocationsUpdated`
    public init() {
    }
}

extension AvailableBeaconLocationsUpdated: SteamCreatable {
    typealias SteamType = CSteamworks.AvailableBeaconLocationsUpdated_t
    init(_ steam: CSteamworks.AvailableBeaconLocationsUpdated_t) {
    }
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

    /// Create a customized `AvatarImageLoaded`
    public init(steamID: SteamID = SteamID(), imageIndex: Int = 0, wideIndex: Int = 0, tallIndex: Int = 0) {
        self.steamID = steamID
        self.imageIndex = imageIndex
        self.wideIndex = wideIndex
        self.tallIndex = tallIndex
    }
}

extension AvatarImageLoaded: SteamCreatable {
    typealias SteamType = CSteamworks.AvatarImageLoaded_t
    init(_ steam: CSteamworks.AvatarImageLoaded_t) {
        steamID = .init(steam.m_steamID)
        imageIndex = .init(steam.m_iImage)
        wideIndex = .init(steam.m_iWide)
        tallIndex = .init(steam.m_iTall)
    }
}

/// Steamworks `ChangeNumOpenSlotsCallback_t`
public struct ChangeNumOpenSlotsCallback {
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `ChangeNumOpenSlotsCallback`
    public init(result: Result = .none) {
        self.result = result
    }
}

extension ChangeNumOpenSlotsCallback: SteamCreatable {
    typealias SteamType = CSteamworks.ChangeNumOpenSlotsCallback_t
    init(_ steam: CSteamworks.ChangeNumOpenSlotsCallback_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `CheckFileSignature_t`
public struct CheckFileSignature {
    /// Steamworks `m_eCheckFileSignature`
    public let checkFileSignature: CheckFileSignatureResult

    /// Create a customized `CheckFileSignature`
    public init(checkFileSignature: CheckFileSignatureResult = .invalidSignature) {
        self.checkFileSignature = checkFileSignature
    }
}

extension CheckFileSignature: SteamCreatable {
    typealias SteamType = CSteamworks.CheckFileSignature_t
    init(_ steam: CSteamworks.CheckFileSignature_t) {
        checkFileSignature = .init(steam.m_eCheckFileSignature)
    }
}

/// Steamworks `ClanOfficerListResponse_t`
public struct ClanOfficerListResponse {
    /// Steamworks `m_steamIDClan`
    public let clan: SteamID
    /// Steamworks `m_cOfficers`
    public let officers: Int
    /// Steamworks `m_bSuccess`
    public let success: Bool

    /// Create a customized `ClanOfficerListResponse`
    public init(clan: SteamID = SteamID(), officers: Int = 0, success: Bool = false) {
        self.clan = clan
        self.officers = officers
        self.success = success
    }
}

extension ClanOfficerListResponse: SteamCreatable {
    typealias SteamType = CSteamworks.ClanOfficerListResponse_t
    init(_ steam: CSteamworks.ClanOfficerListResponse_t) {
        clan = .init(steam.m_steamIDClan)
        officers = .init(steam.m_cOfficers)
        success = .init(steam.m_bSuccess)
    }
}

/// Steamworks `ClientGameServerDeny_t`
public struct ClientGameServerDeny {
    /// Steamworks `m_uAppID`
    public let appID: AppID
    /// Steamworks `m_unGameServerIP`
    public let gameServerIP: Int
    /// Steamworks `m_usGameServerPort`
    public let gameServerPort: Int
    /// Steamworks `m_bSecure`
    public let secure: Bool
    /// Steamworks `m_uReason`
    public let reason: Int

    /// Create a customized `ClientGameServerDeny`
    public init(appID: AppID = 0, gameServerIP: Int = 0, gameServerPort: Int = 0, secure: Bool = false, reason: Int = 0) {
        self.appID = appID
        self.gameServerIP = gameServerIP
        self.gameServerPort = gameServerPort
        self.secure = secure
        self.reason = reason
    }
}

extension ClientGameServerDeny: SteamCreatable {
    typealias SteamType = CSteamworks.ClientGameServerDeny_t
    init(_ steam: CSteamworks.ClientGameServerDeny_t) {
        appID = .init(steam.m_uAppID)
        gameServerIP = .init(steam.m_unGameServerIP)
        gameServerPort = .init(steam.m_usGameServerPort)
        secure = .init(steam.m_bSecure)
        reason = .init(steam.m_uReason)
    }
}

/// Steamworks `ComputeNewPlayerCompatibilityResult_t`
public struct ComputeNewPlayerCompatibilityResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_cPlayersThatDontLikeCandidate`
    public let playersThatDontLikeCandidate: Int
    /// Steamworks `m_cPlayersThatCandidateDoesntLike`
    public let playersThatCandidateDoesntLike: Int
    /// Steamworks `m_cClanPlayersThatDontLikeCandidate`
    public let clanPlayersThatDontLikeCandidate: Int
    /// Steamworks `m_SteamIDCandidate`
    public let candidate: SteamID

    /// Create a customized `ComputeNewPlayerCompatibilityResult`
    public init(result: Result = .none, playersThatDontLikeCandidate: Int = 0, playersThatCandidateDoesntLike: Int = 0, clanPlayersThatDontLikeCandidate: Int = 0, candidate: SteamID = SteamID()) {
        self.result = result
        self.playersThatDontLikeCandidate = playersThatDontLikeCandidate
        self.playersThatCandidateDoesntLike = playersThatCandidateDoesntLike
        self.clanPlayersThatDontLikeCandidate = clanPlayersThatDontLikeCandidate
        self.candidate = candidate
    }
}

extension ComputeNewPlayerCompatibilityResult: SteamCreatable {
    typealias SteamType = CSteamworks.ComputeNewPlayerCompatibilityResult_t
    init(_ steam: CSteamworks.ComputeNewPlayerCompatibilityResult_t) {
        result = .init(steam.m_eResult)
        playersThatDontLikeCandidate = .init(steam.m_cPlayersThatDontLikeCandidate)
        playersThatCandidateDoesntLike = .init(steam.m_cPlayersThatCandidateDoesntLike)
        clanPlayersThatDontLikeCandidate = .init(steam.m_cClanPlayersThatDontLikeCandidate)
        candidate = .init(steam.m_SteamIDCandidate)
    }
}

/// Steamworks `CreateBeaconCallback_t`
public struct CreateBeaconCallback {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_ulBeaconID`
    public let beaconID: PartyBeaconID

    /// Create a customized `CreateBeaconCallback`
    public init(result: Result = .none, beaconID: PartyBeaconID = 0) {
        self.result = result
        self.beaconID = beaconID
    }
}

extension CreateBeaconCallback: SteamCreatable {
    typealias SteamType = CSteamworks.CreateBeaconCallback_t
    init(_ steam: CSteamworks.CreateBeaconCallback_t) {
        result = .init(steam.m_eResult)
        beaconID = .init(steam.m_ulBeaconID)
    }
}

/// Steamworks `CreateItemResult_t`
public struct CreateItemResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let userNeedsToAcceptWorkshopLegalAgreement: Bool

    /// Create a customized `CreateItemResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, userNeedsToAcceptWorkshopLegalAgreement: Bool = false) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.userNeedsToAcceptWorkshopLegalAgreement = userNeedsToAcceptWorkshopLegalAgreement
    }
}

extension CreateItemResult: SteamCreatable {
    typealias SteamType = CSteamworks.CreateItemResult_t
    init(_ steam: CSteamworks.CreateItemResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        userNeedsToAcceptWorkshopLegalAgreement = .init(steam.m_bUserNeedsToAcceptWorkshopLegalAgreement)
    }
}

/// Steamworks `DeleteItemResult_t`
public struct DeleteItemResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID

    /// Create a customized `DeleteItemResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
    }
}

extension DeleteItemResult: SteamCreatable {
    typealias SteamType = CSteamworks.DeleteItemResult_t
    init(_ steam: CSteamworks.DeleteItemResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
    }
}

/// Steamworks `DlcInstalled_t`
public struct DlcInstalled {
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `DlcInstalled`
    public init(appID: AppID = 0) {
        self.appID = appID
    }
}

extension DlcInstalled: SteamCreatable {
    typealias SteamType = CSteamworks.DlcInstalled_t
    init(_ steam: CSteamworks.DlcInstalled_t) {
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `DownloadClanActivityCountsResult_t`
public struct DownloadClanActivityCountsResult {
    /// Steamworks `m_bSuccess`
    public let success: Bool

    /// Create a customized `DownloadClanActivityCountsResult`
    public init(success: Bool = false) {
        self.success = success
    }
}

extension DownloadClanActivityCountsResult: SteamCreatable {
    typealias SteamType = CSteamworks.DownloadClanActivityCountsResult_t
    init(_ steam: CSteamworks.DownloadClanActivityCountsResult_t) {
        success = .init(steam.m_bSuccess)
    }
}

/// Steamworks `DownloadItemResult_t`
public struct DownloadItemResult {
    /// Steamworks `m_unAppID`
    public let appID: AppID
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `DownloadItemResult`
    public init(appID: AppID = 0, publishedFileId: PublishedFileID = 0, result: Result = .none) {
        self.appID = appID
        self.publishedFileId = publishedFileId
        self.result = result
    }
}

extension DownloadItemResult: SteamCreatable {
    typealias SteamType = CSteamworks.DownloadItemResult_t
    init(_ steam: CSteamworks.DownloadItemResult_t) {
        appID = .init(steam.m_unAppID)
        publishedFileId = .init(steam.m_nPublishedFileId)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `DurationControl_t`
public struct DurationControl {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_appid`
    public let appid: AppID
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

    /// Create a customized `DurationControl`
    public init(result: Result = .none, appid: AppID = 0, applicable: Bool = false, csecsLast5h: Int = 0, progress: DurationControlProgress = .full, notification: DurationControlNotification = .none, csecsToday: Int = 0, csecsRemaining: Int = 0) {
        self.result = result
        self.appid = appid
        self.applicable = applicable
        self.csecsLast5h = csecsLast5h
        self.progress = progress
        self.notification = notification
        self.csecsToday = csecsToday
        self.csecsRemaining = csecsRemaining
    }
}

extension DurationControl: SteamCreatable {
    typealias SteamType = CSteamworks.DurationControl_t
    init(_ steam: CSteamworks.DurationControl_t) {
        result = .init(steam.m_eResult)
        appid = .init(steam.m_appid)
        applicable = .init(steam.m_bApplicable)
        csecsLast5h = .init(steam.m_csecsLast5h)
        progress = .init(steam.m_progress)
        notification = .init(steam.m_notification)
        csecsToday = .init(steam.m_csecsToday)
        csecsRemaining = .init(steam.m_csecsRemaining)
    }
}

/// Steamworks `EncryptedAppTicketResponse_t`
public struct EncryptedAppTicketResponse {
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `EncryptedAppTicketResponse`
    public init(result: Result = .none) {
        self.result = result
    }
}

extension EncryptedAppTicketResponse: SteamCreatable {
    typealias SteamType = CSteamworks.EncryptedAppTicketResponse_t
    init(_ steam: CSteamworks.EncryptedAppTicketResponse_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `EndGameResultCallback_t`
public struct EndGameResultCallback {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `ullUniqueGameID`
    public let uniqueGameID: GameID

    /// Create a customized `EndGameResultCallback`
    public init(result: Result = .none, uniqueGameID: GameID = GameID()) {
        self.result = result
        self.uniqueGameID = uniqueGameID
    }
}

extension EndGameResultCallback: SteamCreatable {
    typealias SteamType = CSteamworks.EndGameResultCallback_t
    init(_ steam: CSteamworks.EndGameResultCallback_t) {
        result = .init(steam.m_eResult)
        uniqueGameID = .init(steam.ullUniqueGameID)
    }
}

/// Steamworks `FavoritesListAccountsUpdated_t`
public struct FavoritesListAccountsUpdated {
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `FavoritesListAccountsUpdated`
    public init(result: Result = .none) {
        self.result = result
    }
}

extension FavoritesListAccountsUpdated: SteamCreatable {
    typealias SteamType = CSteamworks.FavoritesListAccountsUpdated_t
    init(_ steam: CSteamworks.FavoritesListAccountsUpdated_t) {
        result = .init(steam.m_eResult)
    }
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

    /// Create a customized `FavoritesListChanged`
    public init(ip: Int = 0, queryPort: Int = 0, connPort: Int = 0, appID: Int = 0, flags: Int = 0, add: Bool = false, accountId: AccountID = 0) {
        self.ip = ip
        self.queryPort = queryPort
        self.connPort = connPort
        self.appID = appID
        self.flags = flags
        self.add = add
        self.accountId = accountId
    }
}

extension FavoritesListChanged: SteamCreatable {
    typealias SteamType = CSteamworks.FavoritesListChanged_t
    init(_ steam: CSteamworks.FavoritesListChanged_t) {
        ip = .init(steam.m_nIP)
        queryPort = .init(steam.m_nQueryPort)
        connPort = .init(steam.m_nConnPort)
        appID = .init(steam.m_nAppID)
        flags = .init(steam.m_nFlags)
        add = .init(steam.m_bAdd)
        accountId = .init(steam.m_unAccountId)
    }
}

/// Steamworks `FileDetailsResult_t`
public struct FileDetailsResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_ulFileSize`
    public let fileSize: UInt64
    /// Steamworks `m_FileSHA`
    public let fileSHA: [UInt8]
    /// Steamworks `m_unFlags`
    public let flags: Int

    /// Create a customized `FileDetailsResult`
    public init(result: Result = .none, fileSize: UInt64 = 0, fileSHA: [UInt8] = [], flags: Int = 0) {
        self.result = result
        self.fileSize = fileSize
        self.fileSHA = fileSHA
        self.flags = flags
    }
}

extension FileDetailsResult: SteamCreatable {
    typealias SteamType = CSteamworks.FileDetailsResult_t
    init(_ steam: CSteamworks.FileDetailsResult_t) {
        result = .init(steam.m_eResult)
        fileSize = .init(steam.m_ulFileSize)
        fileSHA = .init(steam.m_FileSHA_ptr, 20)
        flags = .init(steam.m_unFlags)
    }
}

/// Steamworks `FloatingGamepadTextInputDismissed_t`
public struct FloatingGamepadTextInputDismissed {
    /// Create a customized `FloatingGamepadTextInputDismissed`
    public init() {
    }
}

extension FloatingGamepadTextInputDismissed: SteamCreatable {
    typealias SteamType = CSteamworks.FloatingGamepadTextInputDismissed_t
    init(_ steam: CSteamworks.FloatingGamepadTextInputDismissed_t) {
    }
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

    /// Create a customized `FriendGameInfo`
    public init(id: GameID = GameID(), gameIP: Int = 0, gamePort: Int = 0, queryPort: Int = 0, lobby: SteamID = SteamID()) {
        self.id = id
        self.gameIP = gameIP
        self.gamePort = gamePort
        self.queryPort = queryPort
        self.lobby = lobby
    }
}

extension FriendGameInfo: SteamCreatable {
    typealias SteamType = CSteamworks.FriendGameInfo_t
    init(_ steam: CSteamworks.FriendGameInfo_t) {
        id = .init(steam.m_gameID)
        gameIP = .init(steam.m_unGameIP)
        gamePort = .init(steam.m_usGamePort)
        queryPort = .init(steam.m_usQueryPort)
        lobby = .init(steam.m_steamIDLobby)
    }
}

/// Steamworks `FriendRichPresenceUpdate_t`
public struct FriendRichPresenceUpdate {
    /// Steamworks `m_steamIDFriend`
    public let friend: SteamID
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `FriendRichPresenceUpdate`
    public init(friend: SteamID = SteamID(), appID: AppID = 0) {
        self.friend = friend
        self.appID = appID
    }
}

extension FriendRichPresenceUpdate: SteamCreatable {
    typealias SteamType = CSteamworks.FriendRichPresenceUpdate_t
    init(_ steam: CSteamworks.FriendRichPresenceUpdate_t) {
        friend = .init(steam.m_steamIDFriend)
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `FriendsEnumerateFollowingList_t`
public struct FriendsEnumerateFollowingList {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_rgSteamID`
    public let steamID: [SteamID]
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int

    /// Create a customized `FriendsEnumerateFollowingList`
    public init(result: Result = .none, steamID: [SteamID] = [], resultsReturned: Int = 0, totalResultCount: Int = 0) {
        self.result = result
        self.steamID = steamID
        self.resultsReturned = resultsReturned
        self.totalResultCount = totalResultCount
    }
}

extension FriendsEnumerateFollowingList: SteamCreatable {
    typealias SteamType = CSteamworks.FriendsEnumerateFollowingList_t
    init(_ steam: CSteamworks.FriendsEnumerateFollowingList_t) {
        result = .init(steam.m_eResult)
        steamID = .init(steam.m_rgSteamID_ptr, 50) { .init($0) }
        resultsReturned = .init(steam.m_nResultsReturned)
        totalResultCount = .init(steam.m_nTotalResultCount)
    }
}

/// Steamworks `FriendsGetFollowerCount_t`
public struct FriendsGetFollowerCount {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_steamID`
    public let steamID: SteamID
    /// Steamworks `m_nCount`
    public let count: Int

    /// Create a customized `FriendsGetFollowerCount`
    public init(result: Result = .none, steamID: SteamID = SteamID(), count: Int = 0) {
        self.result = result
        self.steamID = steamID
        self.count = count
    }
}

extension FriendsGetFollowerCount: SteamCreatable {
    typealias SteamType = CSteamworks.FriendsGetFollowerCount_t
    init(_ steam: CSteamworks.FriendsGetFollowerCount_t) {
        result = .init(steam.m_eResult)
        steamID = .init(steam.m_steamID)
        count = .init(steam.m_nCount)
    }
}

/// Steamworks `FriendsIsFollowing_t`
public struct FriendsIsFollowing {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_steamID`
    public let steamID: SteamID
    /// Steamworks `m_bIsFollowing`
    public let isFollowing: Bool

    /// Create a customized `FriendsIsFollowing`
    public init(result: Result = .none, steamID: SteamID = SteamID(), isFollowing: Bool = false) {
        self.result = result
        self.steamID = steamID
        self.isFollowing = isFollowing
    }
}

extension FriendsIsFollowing: SteamCreatable {
    typealias SteamType = CSteamworks.FriendsIsFollowing_t
    init(_ steam: CSteamworks.FriendsIsFollowing_t) {
        result = .init(steam.m_eResult)
        steamID = .init(steam.m_steamID)
        isFollowing = .init(steam.m_bIsFollowing)
    }
}

/// Steamworks `GSClientAchievementStatus_t`
public struct GSClientAchievementStatus {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_pchAchievement`
    public let achievement: String
    /// Steamworks `m_bUnlocked`
    public let unlocked: Bool

    /// Create a customized `GSClientAchievementStatus`
    public init(steamID: SteamID = SteamID(), achievement: String = "", unlocked: Bool = false) {
        self.steamID = steamID
        self.achievement = achievement
        self.unlocked = unlocked
    }
}

extension GSClientAchievementStatus: SteamCreatable {
    typealias SteamType = CSteamworks.GSClientAchievementStatus_t
    init(_ steam: CSteamworks.GSClientAchievementStatus_t) {
        steamID = .init(steam.m_SteamID)
        achievement = .init(steam.m_pchAchievement_ptr)
        unlocked = .init(steam.m_bUnlocked)
    }
}

/// Steamworks `GSClientApprove_t`
public struct GSClientApprove {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_OwnerSteamID`
    public let ownerSteamID: SteamID

    /// Create a customized `GSClientApprove`
    public init(steamID: SteamID = SteamID(), ownerSteamID: SteamID = SteamID()) {
        self.steamID = steamID
        self.ownerSteamID = ownerSteamID
    }
}

extension GSClientApprove: SteamCreatable {
    typealias SteamType = CSteamworks.GSClientApprove_t
    init(_ steam: CSteamworks.GSClientApprove_t) {
        steamID = .init(steam.m_SteamID)
        ownerSteamID = .init(steam.m_OwnerSteamID)
    }
}

/// Steamworks `GSClientDeny_t`
public struct GSClientDeny {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_eDenyReason`
    public let denyReason: DenyReason
    /// Steamworks `m_rgchOptionalText`
    public let optionalText: String

    /// Create a customized `GSClientDeny`
    public init(steamID: SteamID = SteamID(), denyReason: DenyReason = .invalid, optionalText: String = "") {
        self.steamID = steamID
        self.denyReason = denyReason
        self.optionalText = optionalText
    }
}

extension GSClientDeny: SteamCreatable {
    typealias SteamType = CSteamworks.GSClientDeny_t
    init(_ steam: CSteamworks.GSClientDeny_t) {
        steamID = .init(steam.m_SteamID)
        denyReason = .init(steam.m_eDenyReason)
        optionalText = .init(steam.m_rgchOptionalText_ptr)
    }
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

    /// Create a customized `GSClientGroupStatus`
    public init(user: SteamID = SteamID(), group: SteamID = SteamID(), member: Bool = false, officer: Bool = false) {
        self.user = user
        self.group = group
        self.member = member
        self.officer = officer
    }
}

extension GSClientGroupStatus: SteamCreatable {
    typealias SteamType = CSteamworks.GSClientGroupStatus_t
    init(_ steam: CSteamworks.GSClientGroupStatus_t) {
        user = .init(steam.m_SteamIDUser)
        group = .init(steam.m_SteamIDGroup)
        member = .init(steam.m_bMember)
        officer = .init(steam.m_bOfficer)
    }
}

/// Steamworks `GSClientKick_t`
public struct GSClientKick {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_eDenyReason`
    public let denyReason: DenyReason

    /// Create a customized `GSClientKick`
    public init(steamID: SteamID = SteamID(), denyReason: DenyReason = .invalid) {
        self.steamID = steamID
        self.denyReason = denyReason
    }
}

extension GSClientKick: SteamCreatable {
    typealias SteamType = CSteamworks.GSClientKick_t
    init(_ steam: CSteamworks.GSClientKick_t) {
        steamID = .init(steam.m_SteamID)
        denyReason = .init(steam.m_eDenyReason)
    }
}

/// Steamworks `GSGameplayStats_t`
public struct GSGameplayStats {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nRank`
    public let rank: Int
    /// Steamworks `m_unTotalConnects`
    public let totalConnects: Int
    /// Steamworks `m_unTotalMinutesPlayed`
    public let totalMinutesPlayed: Int

    /// Create a customized `GSGameplayStats`
    public init(result: Result = .none, rank: Int = 0, totalConnects: Int = 0, totalMinutesPlayed: Int = 0) {
        self.result = result
        self.rank = rank
        self.totalConnects = totalConnects
        self.totalMinutesPlayed = totalMinutesPlayed
    }
}

extension GSGameplayStats: SteamCreatable {
    typealias SteamType = CSteamworks.GSGameplayStats_t
    init(_ steam: CSteamworks.GSGameplayStats_t) {
        result = .init(steam.m_eResult)
        rank = .init(steam.m_nRank)
        totalConnects = .init(steam.m_unTotalConnects)
        totalMinutesPlayed = .init(steam.m_unTotalMinutesPlayed)
    }
}

/// Steamworks `GSPolicyResponse_t`
public struct GSPolicyResponse {
    /// Steamworks `m_bSecure`
    public let secure: Bool

    /// Create a customized `GSPolicyResponse`
    public init(secure: Bool = false) {
        self.secure = secure
    }
}

extension GSPolicyResponse: SteamCreatable {
    typealias SteamType = CSteamworks.GSPolicyResponse_t
    init(_ steam: CSteamworks.GSPolicyResponse_t) {
        secure = .init(steam.m_bSecure)
    }
}

/// Steamworks `GSReputation_t`
public struct GSReputation {
    /// Steamworks `m_eResult`
    public let result: Result
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
    public let banExpires: RTime32

    /// Create a customized `GSReputation`
    public init(result: Result = .none, reputationScore: Int = 0, banned: Bool = false, bannedIP: Int = 0, bannedPort: Int = 0, bannedGameID: GameID = GameID(), banExpires: RTime32 = 0) {
        self.result = result
        self.reputationScore = reputationScore
        self.banned = banned
        self.bannedIP = bannedIP
        self.bannedPort = bannedPort
        self.bannedGameID = bannedGameID
        self.banExpires = banExpires
    }
}

extension GSReputation: SteamCreatable {
    typealias SteamType = CSteamworks.GSReputation_t
    init(_ steam: CSteamworks.GSReputation_t) {
        result = .init(steam.m_eResult)
        reputationScore = .init(steam.m_unReputationScore)
        banned = .init(steam.m_bBanned)
        bannedIP = .init(steam.m_unBannedIP)
        bannedPort = .init(steam.m_usBannedPort)
        bannedGameID = .init(steam.m_ulBannedGameID)
        banExpires = .init(steam.m_unBanExpires)
    }
}

/// Steamworks `GSStatsReceived_t`
public struct GSStatsReceived {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_steamIDUser`
    public let user: SteamID

    /// Create a customized `GSStatsReceived`
    public init(result: Result = .none, user: SteamID = SteamID()) {
        self.result = result
        self.user = user
    }
}

extension GSStatsReceived: SteamCreatable {
    typealias SteamType = CSteamworks.GSStatsReceived_t
    init(_ steam: CSteamworks.GSStatsReceived_t) {
        result = .init(steam.m_eResult)
        user = .init(steam.m_steamIDUser)
    }
}

/// Steamworks `GSStatsStored_t`
public struct GSStatsStored {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_steamIDUser`
    public let user: SteamID

    /// Create a customized `GSStatsStored`
    public init(result: Result = .none, user: SteamID = SteamID()) {
        self.result = result
        self.user = user
    }
}

extension GSStatsStored: SteamCreatable {
    typealias SteamType = CSteamworks.GSStatsStored_t
    init(_ steam: CSteamworks.GSStatsStored_t) {
        result = .init(steam.m_eResult)
        user = .init(steam.m_steamIDUser)
    }
}

/// Steamworks `GSStatsUnloaded_t`
public struct GSStatsUnloaded {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID

    /// Create a customized `GSStatsUnloaded`
    public init(user: SteamID = SteamID()) {
        self.user = user
    }
}

extension GSStatsUnloaded: SteamCreatable {
    typealias SteamType = CSteamworks.GSStatsUnloaded_t
    init(_ steam: CSteamworks.GSStatsUnloaded_t) {
        user = .init(steam.m_steamIDUser)
    }
}

/// Steamworks `GameConnectedChatJoin_t`
public struct GameConnectedChatJoin {
    /// Steamworks `m_steamIDClanChat`
    public let clanChat: SteamID
    /// Steamworks `m_steamIDUser`
    public let user: SteamID

    /// Create a customized `GameConnectedChatJoin`
    public init(clanChat: SteamID = SteamID(), user: SteamID = SteamID()) {
        self.clanChat = clanChat
        self.user = user
    }
}

extension GameConnectedChatJoin: SteamCreatable {
    typealias SteamType = CSteamworks.GameConnectedChatJoin_t
    init(_ steam: CSteamworks.GameConnectedChatJoin_t) {
        clanChat = .init(steam.m_steamIDClanChat)
        user = .init(steam.m_steamIDUser)
    }
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

    /// Create a customized `GameConnectedChatLeave`
    public init(clanChat: SteamID = SteamID(), user: SteamID = SteamID(), kicked: Bool = false, dropped: Bool = false) {
        self.clanChat = clanChat
        self.user = user
        self.kicked = kicked
        self.dropped = dropped
    }
}

extension GameConnectedChatLeave: SteamCreatable {
    typealias SteamType = CSteamworks.GameConnectedChatLeave_t
    init(_ steam: CSteamworks.GameConnectedChatLeave_t) {
        clanChat = .init(steam.m_steamIDClanChat)
        user = .init(steam.m_steamIDUser)
        kicked = .init(steam.m_bKicked)
        dropped = .init(steam.m_bDropped)
    }
}

/// Steamworks `GameConnectedClanChatMsg_t`
public struct GameConnectedClanChatMsg {
    /// Steamworks `m_steamIDClanChat`
    public let clanChat: SteamID
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
    /// Steamworks `m_iMessageID`
    public let messageIDIndex: Int

    /// Create a customized `GameConnectedClanChatMsg`
    public init(clanChat: SteamID = SteamID(), user: SteamID = SteamID(), messageIDIndex: Int = 0) {
        self.clanChat = clanChat
        self.user = user
        self.messageIDIndex = messageIDIndex
    }
}

extension GameConnectedClanChatMsg: SteamCreatable {
    typealias SteamType = CSteamworks.GameConnectedClanChatMsg_t
    init(_ steam: CSteamworks.GameConnectedClanChatMsg_t) {
        clanChat = .init(steam.m_steamIDClanChat)
        user = .init(steam.m_steamIDUser)
        messageIDIndex = .init(steam.m_iMessageID)
    }
}

/// Steamworks `GameConnectedFriendChatMsg_t`
public struct GameConnectedFriendChatMsg {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
    /// Steamworks `m_iMessageID`
    public let messageIDIndex: Int

    /// Create a customized `GameConnectedFriendChatMsg`
    public init(user: SteamID = SteamID(), messageIDIndex: Int = 0) {
        self.user = user
        self.messageIDIndex = messageIDIndex
    }
}

extension GameConnectedFriendChatMsg: SteamCreatable {
    typealias SteamType = CSteamworks.GameConnectedFriendChatMsg_t
    init(_ steam: CSteamworks.GameConnectedFriendChatMsg_t) {
        user = .init(steam.m_steamIDUser)
        messageIDIndex = .init(steam.m_iMessageID)
    }
}

/// Steamworks `GameLobbyJoinRequested_t`
public struct GameLobbyJoinRequested {
    /// Steamworks `m_steamIDLobby`
    public let lobby: SteamID
    /// Steamworks `m_steamIDFriend`
    public let friend: SteamID

    /// Create a customized `GameLobbyJoinRequested`
    public init(lobby: SteamID = SteamID(), friend: SteamID = SteamID()) {
        self.lobby = lobby
        self.friend = friend
    }
}

extension GameLobbyJoinRequested: SteamCreatable {
    typealias SteamType = CSteamworks.GameLobbyJoinRequested_t
    init(_ steam: CSteamworks.GameLobbyJoinRequested_t) {
        lobby = .init(steam.m_steamIDLobby)
        friend = .init(steam.m_steamIDFriend)
    }
}

/// Steamworks `GameOverlayActivated_t`
public struct GameOverlayActivated {
    /// Steamworks `m_bActive`
    public let active: Bool

    /// Create a customized `GameOverlayActivated`
    public init(active: Bool = false) {
        self.active = active
    }
}

extension GameOverlayActivated: SteamCreatable {
    typealias SteamType = CSteamworks.GameOverlayActivated_t
    init(_ steam: CSteamworks.GameOverlayActivated_t) {
        active = .init(steam.m_bActive)
    }
}

/// Steamworks `GameRichPresenceJoinRequested_t`
public struct GameRichPresenceJoinRequested {
    /// Steamworks `m_steamIDFriend`
    public let friend: SteamID
    /// Steamworks `m_rgchConnect`
    public let connect: String

    /// Create a customized `GameRichPresenceJoinRequested`
    public init(friend: SteamID = SteamID(), connect: String = "") {
        self.friend = friend
        self.connect = connect
    }
}

extension GameRichPresenceJoinRequested: SteamCreatable {
    typealias SteamType = CSteamworks.GameRichPresenceJoinRequested_t
    init(_ steam: CSteamworks.GameRichPresenceJoinRequested_t) {
        friend = .init(steam.m_steamIDFriend)
        connect = .init(steam.m_rgchConnect_ptr)
    }
}

/// Steamworks `GameServerChangeRequested_t`
public struct GameServerChangeRequested {
    /// Steamworks `m_rgchServer`
    public let server: String
    /// Steamworks `m_rgchPassword`
    public let password: String

    /// Create a customized `GameServerChangeRequested`
    public init(server: String = "", password: String = "") {
        self.server = server
        self.password = password
    }
}

extension GameServerChangeRequested: SteamCreatable {
    typealias SteamType = CSteamworks.GameServerChangeRequested_t
    init(_ steam: CSteamworks.GameServerChangeRequested_t) {
        server = .init(steam.m_rgchServer_ptr)
        password = .init(steam.m_rgchPassword_ptr)
    }
}

/// Steamworks `GameWebCallback_t`
public struct GameWebCallback {
    /// Steamworks `m_szURL`
    public let url: String

    /// Create a customized `GameWebCallback`
    public init(url: String = "") {
        self.url = url
    }
}

extension GameWebCallback: SteamCreatable {
    typealias SteamType = CSteamworks.GameWebCallback_t
    init(_ steam: CSteamworks.GameWebCallback_t) {
        url = .init(steam.m_szURL_ptr)
    }
}

/// Steamworks `GamepadTextInputDismissed_t`
public struct GamepadTextInputDismissed {
    /// Steamworks `m_bSubmitted`
    public let submitted: Bool
    /// Steamworks `m_unSubmittedText`
    public let submittedText: Int

    /// Create a customized `GamepadTextInputDismissed`
    public init(submitted: Bool = false, submittedText: Int = 0) {
        self.submitted = submitted
        self.submittedText = submittedText
    }
}

extension GamepadTextInputDismissed: SteamCreatable {
    typealias SteamType = CSteamworks.GamepadTextInputDismissed_t
    init(_ steam: CSteamworks.GamepadTextInputDismissed_t) {
        submitted = .init(steam.m_bSubmitted)
        submittedText = .init(steam.m_unSubmittedText)
    }
}

/// Steamworks `GetAppDependenciesResult_t`
public struct GetAppDependenciesResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_rgAppIDs`
    public let appIDs: [AppID]
    /// Steamworks `m_nNumAppDependencies`
    public let numAppDependencies: Int
    /// Steamworks `m_nTotalNumAppDependencies`
    public let totalNumAppDependencies: Int

    /// Create a customized `GetAppDependenciesResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, appIDs: [AppID] = [], numAppDependencies: Int = 0, totalNumAppDependencies: Int = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.appIDs = appIDs
        self.numAppDependencies = numAppDependencies
        self.totalNumAppDependencies = totalNumAppDependencies
    }
}

extension GetAppDependenciesResult: SteamCreatable {
    typealias SteamType = CSteamworks.GetAppDependenciesResult_t
    init(_ steam: CSteamworks.GetAppDependenciesResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        appIDs = .init(steam.m_rgAppIDs_ptr, 32) { .init($0) }
        numAppDependencies = .init(steam.m_nNumAppDependencies)
        totalNumAppDependencies = .init(steam.m_nTotalNumAppDependencies)
    }
}

/// Steamworks `GetAuthSessionTicketResponse_t`
public struct GetAuthSessionTicketResponse {
    /// Steamworks `m_hAuthTicket`
    public let authTicket: HAuthTicket
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `GetAuthSessionTicketResponse`
    public init(authTicket: HAuthTicket = 0, result: Result = .none) {
        self.authTicket = authTicket
        self.result = result
    }
}

extension GetAuthSessionTicketResponse: SteamCreatable {
    typealias SteamType = CSteamworks.GetAuthSessionTicketResponse_t
    init(_ steam: CSteamworks.GetAuthSessionTicketResponse_t) {
        authTicket = .init(steam.m_hAuthTicket)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `GetOPFSettingsResult_t`
public struct GetOPFSettingsResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_unVideoAppID`
    public let videoAppID: AppID

    /// Create a customized `GetOPFSettingsResult`
    public init(result: Result = .none, videoAppID: AppID = 0) {
        self.result = result
        self.videoAppID = videoAppID
    }
}

extension GetOPFSettingsResult: SteamCreatable {
    typealias SteamType = CSteamworks.GetOPFSettingsResult_t
    init(_ steam: CSteamworks.GetOPFSettingsResult_t) {
        result = .init(steam.m_eResult)
        videoAppID = .init(steam.m_unVideoAppID)
    }
}

/// Steamworks `GetUserItemVoteResult_t`
public struct GetUserItemVoteResult {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_bVotedUp`
    public let votedUp: Bool
    /// Steamworks `m_bVotedDown`
    public let votedDown: Bool
    /// Steamworks `m_bVoteSkipped`
    public let voteSkipped: Bool

    /// Create a customized `GetUserItemVoteResult`
    public init(publishedFileId: PublishedFileID = 0, result: Result = .none, votedUp: Bool = false, votedDown: Bool = false, voteSkipped: Bool = false) {
        self.publishedFileId = publishedFileId
        self.result = result
        self.votedUp = votedUp
        self.votedDown = votedDown
        self.voteSkipped = voteSkipped
    }
}

extension GetUserItemVoteResult: SteamCreatable {
    typealias SteamType = CSteamworks.GetUserItemVoteResult_t
    init(_ steam: CSteamworks.GetUserItemVoteResult_t) {
        publishedFileId = .init(steam.m_nPublishedFileId)
        result = .init(steam.m_eResult)
        votedUp = .init(steam.m_bVotedUp)
        votedDown = .init(steam.m_bVotedDown)
        voteSkipped = .init(steam.m_bVoteSkipped)
    }
}

/// Steamworks `GetVideoURLResult_t`
public struct GetVideoURLResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_unVideoAppID`
    public let videoAppID: AppID
    /// Steamworks `m_rgchURL`
    public let url: String

    /// Create a customized `GetVideoURLResult`
    public init(result: Result = .none, videoAppID: AppID = 0, url: String = "") {
        self.result = result
        self.videoAppID = videoAppID
        self.url = url
    }
}

extension GetVideoURLResult: SteamCreatable {
    typealias SteamType = CSteamworks.GetVideoURLResult_t
    init(_ steam: CSteamworks.GetVideoURLResult_t) {
        result = .init(steam.m_eResult)
        videoAppID = .init(steam.m_unVideoAppID)
        url = .init(steam.m_rgchURL_ptr)
    }
}

/// Steamworks `GlobalAchievementPercentagesReady_t`
public struct GlobalAchievementPercentagesReady {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `GlobalAchievementPercentagesReady`
    public init(gameID: GameID = GameID(), result: Result = .none) {
        self.gameID = gameID
        self.result = result
    }
}

extension GlobalAchievementPercentagesReady: SteamCreatable {
    typealias SteamType = CSteamworks.GlobalAchievementPercentagesReady_t
    init(_ steam: CSteamworks.GlobalAchievementPercentagesReady_t) {
        gameID = .init(steam.m_nGameID)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `GlobalStatsReceived_t`
public struct GlobalStatsReceived {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `GlobalStatsReceived`
    public init(gameID: GameID = GameID(), result: Result = .none) {
        self.gameID = gameID
        self.result = result
    }
}

extension GlobalStatsReceived: SteamCreatable {
    typealias SteamType = CSteamworks.GlobalStatsReceived_t
    init(_ steam: CSteamworks.GlobalStatsReceived_t) {
        gameID = .init(steam.m_nGameID)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `HTML_BrowserReady_t`
public struct HTMLBrowserReady {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser

    /// Create a customized `HTMLBrowserReady`
    public init(browserHandle: HHTMLBrowser = 0) {
        self.browserHandle = browserHandle
    }
}

extension HTMLBrowserReady: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_BrowserReady_t
    init(_ steam: CSteamworks.HTML_BrowserReady_t) {
        browserHandle = .init(steam.unBrowserHandle)
    }
}

/// Steamworks `HTML_BrowserRestarted_t`
public struct HTMLBrowserRestarted {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `unOldBrowserHandle`
    public let oldBrowserHandle: HHTMLBrowser

    /// Create a customized `HTMLBrowserRestarted`
    public init(browserHandle: HHTMLBrowser = 0, oldBrowserHandle: HHTMLBrowser = 0) {
        self.browserHandle = browserHandle
        self.oldBrowserHandle = oldBrowserHandle
    }
}

extension HTMLBrowserRestarted: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_BrowserRestarted_t
    init(_ steam: CSteamworks.HTML_BrowserRestarted_t) {
        browserHandle = .init(steam.unBrowserHandle)
        oldBrowserHandle = .init(steam.unOldBrowserHandle)
    }
}

/// Steamworks `HTML_CanGoBackAndForward_t`
public struct HTMLCanGoBackAndForward {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `bCanGoBack`
    public let canGoBack: Bool
    /// Steamworks `bCanGoForward`
    public let canGoForward: Bool

    /// Create a customized `HTMLCanGoBackAndForward`
    public init(browserHandle: HHTMLBrowser = 0, canGoBack: Bool = false, canGoForward: Bool = false) {
        self.browserHandle = browserHandle
        self.canGoBack = canGoBack
        self.canGoForward = canGoForward
    }
}

extension HTMLCanGoBackAndForward: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_CanGoBackAndForward_t
    init(_ steam: CSteamworks.HTML_CanGoBackAndForward_t) {
        browserHandle = .init(steam.unBrowserHandle)
        canGoBack = .init(steam.bCanGoBack)
        canGoForward = .init(steam.bCanGoForward)
    }
}

/// Steamworks `HTML_ChangedTitle_t`
public struct HTMLChangedTitle {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchTitle`
    public let title: String

    /// Create a customized `HTMLChangedTitle`
    public init(browserHandle: HHTMLBrowser = 0, title: String = "") {
        self.browserHandle = browserHandle
        self.title = title
    }
}

extension HTMLChangedTitle: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_ChangedTitle_t
    init(_ steam: CSteamworks.HTML_ChangedTitle_t) {
        browserHandle = .init(steam.unBrowserHandle)
        title = .init(steam.pchTitle)
    }
}

/// Steamworks `HTML_CloseBrowser_t`
public struct HTMLCloseBrowser {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser

    /// Create a customized `HTMLCloseBrowser`
    public init(browserHandle: HHTMLBrowser = 0) {
        self.browserHandle = browserHandle
    }
}

extension HTMLCloseBrowser: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_CloseBrowser_t
    init(_ steam: CSteamworks.HTML_CloseBrowser_t) {
        browserHandle = .init(steam.unBrowserHandle)
    }
}

/// Steamworks `HTML_FileOpenDialog_t`
public struct HTMLFileOpenDialog {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchTitle`
    public let title: String
    /// Steamworks `pchInitialFile`
    public let initialFile: String

    /// Create a customized `HTMLFileOpenDialog`
    public init(browserHandle: HHTMLBrowser = 0, title: String = "", initialFile: String = "") {
        self.browserHandle = browserHandle
        self.title = title
        self.initialFile = initialFile
    }
}

extension HTMLFileOpenDialog: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_FileOpenDialog_t
    init(_ steam: CSteamworks.HTML_FileOpenDialog_t) {
        browserHandle = .init(steam.unBrowserHandle)
        title = .init(steam.pchTitle)
        initialFile = .init(steam.pchInitialFile)
    }
}

/// Steamworks `HTML_FinishedRequest_t`
public struct HTMLFinishedRequest {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchURL`
    public let url: String
    /// Steamworks `pchPageTitle`
    public let pageTitle: String

    /// Create a customized `HTMLFinishedRequest`
    public init(browserHandle: HHTMLBrowser = 0, url: String = "", pageTitle: String = "") {
        self.browserHandle = browserHandle
        self.url = url
        self.pageTitle = pageTitle
    }
}

extension HTMLFinishedRequest: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_FinishedRequest_t
    init(_ steam: CSteamworks.HTML_FinishedRequest_t) {
        browserHandle = .init(steam.unBrowserHandle)
        url = .init(steam.pchURL)
        pageTitle = .init(steam.pchPageTitle)
    }
}

/// Steamworks `HTML_HideToolTip_t`
public struct HTMLHideToolTip {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser

    /// Create a customized `HTMLHideToolTip`
    public init(browserHandle: HHTMLBrowser = 0) {
        self.browserHandle = browserHandle
    }
}

extension HTMLHideToolTip: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_HideToolTip_t
    init(_ steam: CSteamworks.HTML_HideToolTip_t) {
        browserHandle = .init(steam.unBrowserHandle)
    }
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

    /// Create a customized `HTMLHorizontalScroll`
    public init(browserHandle: HHTMLBrowser = 0, scrollMax: Int = 0, scrollCurrent: Int = 0, pageScale: Float = 0, visible: Bool = false, pageSize: Int = 0) {
        self.browserHandle = browserHandle
        self.scrollMax = scrollMax
        self.scrollCurrent = scrollCurrent
        self.pageScale = pageScale
        self.visible = visible
        self.pageSize = pageSize
    }
}

extension HTMLHorizontalScroll: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_HorizontalScroll_t
    init(_ steam: CSteamworks.HTML_HorizontalScroll_t) {
        browserHandle = .init(steam.unBrowserHandle)
        scrollMax = .init(steam.unScrollMax)
        scrollCurrent = .init(steam.unScrollCurrent)
        pageScale = .init(steam.flPageScale)
        visible = .init(steam.bVisible)
        pageSize = .init(steam.unPageSize)
    }
}

/// Steamworks `HTML_JSAlert_t`
public struct HTMLJSAlert {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMessage`
    public let message: String

    /// Create a customized `HTMLJSAlert`
    public init(browserHandle: HHTMLBrowser = 0, message: String = "") {
        self.browserHandle = browserHandle
        self.message = message
    }
}

extension HTMLJSAlert: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_JSAlert_t
    init(_ steam: CSteamworks.HTML_JSAlert_t) {
        browserHandle = .init(steam.unBrowserHandle)
        message = .init(steam.pchMessage)
    }
}

/// Steamworks `HTML_JSConfirm_t`
public struct HTMLJSConfirm {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMessage`
    public let message: String

    /// Create a customized `HTMLJSConfirm`
    public init(browserHandle: HHTMLBrowser = 0, message: String = "") {
        self.browserHandle = browserHandle
        self.message = message
    }
}

extension HTMLJSConfirm: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_JSConfirm_t
    init(_ steam: CSteamworks.HTML_JSConfirm_t) {
        browserHandle = .init(steam.unBrowserHandle)
        message = .init(steam.pchMessage)
    }
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

    /// Create a customized `HTMLLinkAtPosition`
    public init(browserHandle: HHTMLBrowser = 0, x: Int = 0, y: Int = 0, url: String = "", input: Bool = false, liveLink: Bool = false) {
        self.browserHandle = browserHandle
        self.x = x
        self.y = y
        self.url = url
        self.input = input
        self.liveLink = liveLink
    }
}

extension HTMLLinkAtPosition: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_LinkAtPosition_t
    init(_ steam: CSteamworks.HTML_LinkAtPosition_t) {
        browserHandle = .init(steam.unBrowserHandle)
        x = .init(steam.x)
        y = .init(steam.y)
        url = .init(steam.pchURL)
        input = .init(steam.bInput)
        liveLink = .init(steam.bLiveLink)
    }
}

/// Steamworks `HTML_NeedsPaint_t`
public struct HTMLNeedsPaint {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pBGRA`
    public let bgra: UnsafeRawPointer
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

    /// Create a customized `HTMLNeedsPaint`
    public init(browserHandle: HHTMLBrowser = 0, bgra: UnsafeRawPointer, wide: Int = 0, tall: Int = 0, updateX: Int = 0, updateY: Int = 0, updateWide: Int = 0, updateTall: Int = 0, scrollX: Int = 0, scrollY: Int = 0, pageScale: Float = 0, pageSerial: Int = 0) {
        self.browserHandle = browserHandle
        self.bgra = bgra
        self.wide = wide
        self.tall = tall
        self.updateX = updateX
        self.updateY = updateY
        self.updateWide = updateWide
        self.updateTall = updateTall
        self.scrollX = scrollX
        self.scrollY = scrollY
        self.pageScale = pageScale
        self.pageSerial = pageSerial
    }
}

extension HTMLNeedsPaint: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_NeedsPaint_t
    init(_ steam: CSteamworks.HTML_NeedsPaint_t) {
        browserHandle = .init(steam.unBrowserHandle)
        bgra = .init(steam.pBGRA)
        wide = .init(steam.unWide)
        tall = .init(steam.unTall)
        updateX = .init(steam.unUpdateX)
        updateY = .init(steam.unUpdateY)
        updateWide = .init(steam.unUpdateWide)
        updateTall = .init(steam.unUpdateTall)
        scrollX = .init(steam.unScrollX)
        scrollY = .init(steam.unScrollY)
        pageScale = .init(steam.flPageScale)
        pageSerial = .init(steam.unPageSerial)
    }
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

    /// Create a customized `HTMLNewWindow`
    public init(browserHandle: HHTMLBrowser = 0, url: String = "", x: Int = 0, y: Int = 0, wide: Int = 0, tall: Int = 0, newWindowBrowserHandleIGNORE: HHTMLBrowser = 0) {
        self.browserHandle = browserHandle
        self.url = url
        self.x = x
        self.y = y
        self.wide = wide
        self.tall = tall
        self.newWindowBrowserHandleIGNORE = newWindowBrowserHandleIGNORE
    }
}

extension HTMLNewWindow: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_NewWindow_t
    init(_ steam: CSteamworks.HTML_NewWindow_t) {
        browserHandle = .init(steam.unBrowserHandle)
        url = .init(steam.pchURL)
        x = .init(steam.unX)
        y = .init(steam.unY)
        wide = .init(steam.unWide)
        tall = .init(steam.unTall)
        newWindowBrowserHandleIGNORE = .init(steam.unNewWindow_BrowserHandle_IGNORE)
    }
}

/// Steamworks `HTML_OpenLinkInNewTab_t`
public struct HTMLOpenLinkInNewTab {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchURL`
    public let url: String

    /// Create a customized `HTMLOpenLinkInNewTab`
    public init(browserHandle: HHTMLBrowser = 0, url: String = "") {
        self.browserHandle = browserHandle
        self.url = url
    }
}

extension HTMLOpenLinkInNewTab: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_OpenLinkInNewTab_t
    init(_ steam: CSteamworks.HTML_OpenLinkInNewTab_t) {
        browserHandle = .init(steam.unBrowserHandle)
        url = .init(steam.pchURL)
    }
}

/// Steamworks `HTML_SearchResults_t`
public struct HTMLSearchResults {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `unResults`
    public let results: Int
    /// Steamworks `unCurrentMatch`
    public let currentMatch: Int

    /// Create a customized `HTMLSearchResults`
    public init(browserHandle: HHTMLBrowser = 0, results: Int = 0, currentMatch: Int = 0) {
        self.browserHandle = browserHandle
        self.results = results
        self.currentMatch = currentMatch
    }
}

extension HTMLSearchResults: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_SearchResults_t
    init(_ steam: CSteamworks.HTML_SearchResults_t) {
        browserHandle = .init(steam.unBrowserHandle)
        results = .init(steam.unResults)
        currentMatch = .init(steam.unCurrentMatch)
    }
}

/// Steamworks `HTML_SetCursor_t`
public struct HTMLSetCursor {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `eMouseCursor`
    public let mouseCursor: HTMLMouseCursor

    /// Create a customized `HTMLSetCursor`
    public init(browserHandle: HHTMLBrowser = 0, mouseCursor: HTMLMouseCursor = .user) {
        self.browserHandle = browserHandle
        self.mouseCursor = mouseCursor
    }
}

extension HTMLSetCursor: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_SetCursor_t
    init(_ steam: CSteamworks.HTML_SetCursor_t) {
        browserHandle = .init(steam.unBrowserHandle)
        mouseCursor = .init(steam.eMouseCursor)
    }
}

/// Steamworks `HTML_ShowToolTip_t`
public struct HTMLShowToolTip {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMsg`
    public let msg: String

    /// Create a customized `HTMLShowToolTip`
    public init(browserHandle: HHTMLBrowser = 0, msg: String = "") {
        self.browserHandle = browserHandle
        self.msg = msg
    }
}

extension HTMLShowToolTip: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_ShowToolTip_t
    init(_ steam: CSteamworks.HTML_ShowToolTip_t) {
        browserHandle = .init(steam.unBrowserHandle)
        msg = .init(steam.pchMsg)
    }
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

    /// Create a customized `HTMLStartRequest`
    public init(browserHandle: HHTMLBrowser = 0, url: String = "", target: String = "", postData: String = "", isRedirect: Bool = false) {
        self.browserHandle = browserHandle
        self.url = url
        self.target = target
        self.postData = postData
        self.isRedirect = isRedirect
    }
}

extension HTMLStartRequest: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_StartRequest_t
    init(_ steam: CSteamworks.HTML_StartRequest_t) {
        browserHandle = .init(steam.unBrowserHandle)
        url = .init(steam.pchURL)
        target = .init(steam.pchTarget)
        postData = .init(steam.pchPostData)
        isRedirect = .init(steam.bIsRedirect)
    }
}

/// Steamworks `HTML_StatusText_t`
public struct HTMLStatusText {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMsg`
    public let msg: String

    /// Create a customized `HTMLStatusText`
    public init(browserHandle: HHTMLBrowser = 0, msg: String = "") {
        self.browserHandle = browserHandle
        self.msg = msg
    }
}

extension HTMLStatusText: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_StatusText_t
    init(_ steam: CSteamworks.HTML_StatusText_t) {
        browserHandle = .init(steam.unBrowserHandle)
        msg = .init(steam.pchMsg)
    }
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

    /// Create a customized `HTMLURLChanged`
    public init(browserHandle: HHTMLBrowser = 0, url: String = "", postData: String = "", isRedirect: Bool = false, pageTitle: String = "", newNavigation: Bool = false) {
        self.browserHandle = browserHandle
        self.url = url
        self.postData = postData
        self.isRedirect = isRedirect
        self.pageTitle = pageTitle
        self.newNavigation = newNavigation
    }
}

extension HTMLURLChanged: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_URLChanged_t
    init(_ steam: CSteamworks.HTML_URLChanged_t) {
        browserHandle = .init(steam.unBrowserHandle)
        url = .init(steam.pchURL)
        postData = .init(steam.pchPostData)
        isRedirect = .init(steam.bIsRedirect)
        pageTitle = .init(steam.pchPageTitle)
        newNavigation = .init(steam.bNewNavigation)
    }
}

/// Steamworks `HTML_UpdateToolTip_t`
public struct HTMLUpdateToolTip {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
    /// Steamworks `pchMsg`
    public let msg: String

    /// Create a customized `HTMLUpdateToolTip`
    public init(browserHandle: HHTMLBrowser = 0, msg: String = "") {
        self.browserHandle = browserHandle
        self.msg = msg
    }
}

extension HTMLUpdateToolTip: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_UpdateToolTip_t
    init(_ steam: CSteamworks.HTML_UpdateToolTip_t) {
        browserHandle = .init(steam.unBrowserHandle)
        msg = .init(steam.pchMsg)
    }
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

    /// Create a customized `HTMLVerticalScroll`
    public init(browserHandle: HHTMLBrowser = 0, scrollMax: Int = 0, scrollCurrent: Int = 0, pageScale: Float = 0, visible: Bool = false, pageSize: Int = 0) {
        self.browserHandle = browserHandle
        self.scrollMax = scrollMax
        self.scrollCurrent = scrollCurrent
        self.pageScale = pageScale
        self.visible = visible
        self.pageSize = pageSize
    }
}

extension HTMLVerticalScroll: SteamCreatable {
    typealias SteamType = CSteamworks.HTML_VerticalScroll_t
    init(_ steam: CSteamworks.HTML_VerticalScroll_t) {
        browserHandle = .init(steam.unBrowserHandle)
        scrollMax = .init(steam.unScrollMax)
        scrollCurrent = .init(steam.unScrollCurrent)
        pageScale = .init(steam.flPageScale)
        visible = .init(steam.bVisible)
        pageSize = .init(steam.unPageSize)
    }
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

    /// Create a customized `HTTPRequestCompleted`
    public init(request: HTTPRequestHandle = 0, contextValue: UInt64 = 0, requestSuccessful: Bool = false, statusCode: HTTPStatusCode = .invalid, bodySize: Int = 0) {
        self.request = request
        self.contextValue = contextValue
        self.requestSuccessful = requestSuccessful
        self.statusCode = statusCode
        self.bodySize = bodySize
    }
}

extension HTTPRequestCompleted: SteamCreatable {
    typealias SteamType = CSteamworks.HTTPRequestCompleted_t
    init(_ steam: CSteamworks.HTTPRequestCompleted_t) {
        request = .init(steam.m_hRequest)
        contextValue = .init(steam.m_ulContextValue)
        requestSuccessful = .init(steam.m_bRequestSuccessful)
        statusCode = .init(steam.m_eStatusCode)
        bodySize = .init(steam.m_unBodySize)
    }
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

    /// Create a customized `HTTPRequestDataReceived`
    public init(request: HTTPRequestHandle = 0, contextValue: UInt64 = 0, offset: Int = 0, bytesReceived: Int = 0) {
        self.request = request
        self.contextValue = contextValue
        self.offset = offset
        self.bytesReceived = bytesReceived
    }
}

extension HTTPRequestDataReceived: SteamCreatable {
    typealias SteamType = CSteamworks.HTTPRequestDataReceived_t
    init(_ steam: CSteamworks.HTTPRequestDataReceived_t) {
        request = .init(steam.m_hRequest)
        contextValue = .init(steam.m_ulContextValue)
        offset = .init(steam.m_cOffset)
        bytesReceived = .init(steam.m_cBytesReceived)
    }
}

/// Steamworks `HTTPRequestHeadersReceived_t`
public struct HTTPRequestHeadersReceived {
    /// Steamworks `m_hRequest`
    public let request: HTTPRequestHandle
    /// Steamworks `m_ulContextValue`
    public let contextValue: UInt64

    /// Create a customized `HTTPRequestHeadersReceived`
    public init(request: HTTPRequestHandle = 0, contextValue: UInt64 = 0) {
        self.request = request
        self.contextValue = contextValue
    }
}

extension HTTPRequestHeadersReceived: SteamCreatable {
    typealias SteamType = CSteamworks.HTTPRequestHeadersReceived_t
    init(_ steam: CSteamworks.HTTPRequestHeadersReceived_t) {
        request = .init(steam.m_hRequest)
        contextValue = .init(steam.m_ulContextValue)
    }
}

/// Steamworks `IPCFailure_t`
public struct IPCFailure {
    /// Steamworks `m_eFailureType`
    public let failureType: IPCFailureType

    /// Create a customized `IPCFailure`
    public init(failureType: IPCFailureType = .flushedCallbackQueue) {
        self.failureType = failureType
    }
}

extension IPCFailure: SteamCreatable {
    typealias SteamType = CSteamworks.IPCFailure_t
    init(_ steam: CSteamworks.IPCFailure_t) {
        failureType = .init(steam.m_eFailureType)
    }
}

/// Steamworks `IPCountry_t`
public struct IPCountry {
    /// Create a customized `IPCountry`
    public init() {
    }
}

extension IPCountry: SteamCreatable {
    typealias SteamType = CSteamworks.IPCountry_t
    init(_ steam: CSteamworks.IPCountry_t) {
    }
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

    /// Create a customized `InputAnalogActionData`
    public init(mode: InputSourceMode = .none, x: Float = 0, y: Float = 0, active: Bool = false) {
        self.mode = mode
        self.x = x
        self.y = y
        self.active = active
    }
}

extension InputAnalogActionData: SteamCreatable {
    typealias SteamType = CSteamworks.InputAnalogActionData_t
    init(_ steam: CSteamworks.InputAnalogActionData_t) {
        mode = .init(steam.eMode)
        x = .init(steam.x)
        y = .init(steam.y)
        active = .init(steam.bActive)
    }
}

/// Steamworks `InputDigitalActionData_t`
public struct InputDigitalActionData {
    /// Steamworks `bState`
    public let state: Bool
    /// Steamworks `bActive`
    public let active: Bool

    /// Create a customized `InputDigitalActionData`
    public init(state: Bool = false, active: Bool = false) {
        self.state = state
        self.active = active
    }
}

extension InputDigitalActionData: SteamCreatable {
    typealias SteamType = CSteamworks.InputDigitalActionData_t
    init(_ steam: CSteamworks.InputDigitalActionData_t) {
        state = .init(steam.bState)
        active = .init(steam.bActive)
    }
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

    /// Create a customized `InputMotionData`
    public init(quatX: Float = 0, quatY: Float = 0, quatZ: Float = 0, quatW: Float = 0, accelX: Float = 0, accelY: Float = 0, accelZ: Float = 0, velX: Float = 0, velY: Float = 0, velZ: Float = 0) {
        self.quatX = quatX
        self.quatY = quatY
        self.quatZ = quatZ
        self.quatW = quatW
        self.accelX = accelX
        self.accelY = accelY
        self.accelZ = accelZ
        self.velX = velX
        self.velY = velY
        self.velZ = velZ
    }
}

extension InputMotionData: SteamCreatable {
    typealias SteamType = CSteamworks.InputMotionData_t
    init(_ steam: CSteamworks.InputMotionData_t) {
        quatX = .init(steam.rotQuatX)
        quatY = .init(steam.rotQuatY)
        quatZ = .init(steam.rotQuatZ)
        quatW = .init(steam.rotQuatW)
        accelX = .init(steam.posAccelX)
        accelY = .init(steam.posAccelY)
        accelZ = .init(steam.posAccelZ)
        velX = .init(steam.rotVelX)
        velY = .init(steam.rotVelY)
        velZ = .init(steam.rotVelZ)
    }
}

/// Steamworks `ItemInstalled_t`
public struct ItemInstalled {
    /// Steamworks `m_unAppID`
    public let appID: AppID
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID

    /// Create a customized `ItemInstalled`
    public init(appID: AppID = 0, publishedFileId: PublishedFileID = 0) {
        self.appID = appID
        self.publishedFileId = publishedFileId
    }
}

extension ItemInstalled: SteamCreatable {
    typealias SteamType = CSteamworks.ItemInstalled_t
    init(_ steam: CSteamworks.ItemInstalled_t) {
        appID = .init(steam.m_unAppID)
        publishedFileId = .init(steam.m_nPublishedFileId)
    }
}

/// Steamworks `JoinClanChatRoomCompletionResult_t`
public struct JoinClanChatRoomCompletionResult {
    /// Steamworks `m_steamIDClanChat`
    public let clanChat: SteamID
    /// Steamworks `m_eChatRoomEnterResponse`
    public let chatRoomEnterResponse: ChatRoomEnterResponse

    /// Create a customized `JoinClanChatRoomCompletionResult`
    public init(clanChat: SteamID = SteamID(), chatRoomEnterResponse: ChatRoomEnterResponse = .success) {
        self.clanChat = clanChat
        self.chatRoomEnterResponse = chatRoomEnterResponse
    }
}

extension JoinClanChatRoomCompletionResult: SteamCreatable {
    typealias SteamType = CSteamworks.JoinClanChatRoomCompletionResult_t
    init(_ steam: CSteamworks.JoinClanChatRoomCompletionResult_t) {
        clanChat = .init(steam.m_steamIDClanChat)
        chatRoomEnterResponse = .init(steam.m_eChatRoomEnterResponse)
    }
}

/// Steamworks `JoinPartyCallback_t`
public struct JoinPartyCallback {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_ulBeaconID`
    public let beaconID: PartyBeaconID
    /// Steamworks `m_SteamIDBeaconOwner`
    public let beaconOwner: SteamID
    /// Steamworks `m_rgchConnectString`
    public let connectString: String

    /// Create a customized `JoinPartyCallback`
    public init(result: Result = .none, beaconID: PartyBeaconID = 0, beaconOwner: SteamID = SteamID(), connectString: String = "") {
        self.result = result
        self.beaconID = beaconID
        self.beaconOwner = beaconOwner
        self.connectString = connectString
    }
}

extension JoinPartyCallback: SteamCreatable {
    typealias SteamType = CSteamworks.JoinPartyCallback_t
    init(_ steam: CSteamworks.JoinPartyCallback_t) {
        result = .init(steam.m_eResult)
        beaconID = .init(steam.m_ulBeaconID)
        beaconOwner = .init(steam.m_SteamIDBeaconOwner)
        connectString = .init(steam.m_rgchConnectString_ptr)
    }
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

    /// Create a customized `LeaderboardEntry`
    public init(user: SteamID = SteamID(), globalRank: Int = 0, score: Int = 0, details: Int = 0, ugc: UGCHandle = 0) {
        self.user = user
        self.globalRank = globalRank
        self.score = score
        self.details = details
        self.ugc = ugc
    }
}

extension LeaderboardEntry: SteamCreatable {
    typealias SteamType = CSteamworks.LeaderboardEntry_t
    init(_ steam: CSteamworks.LeaderboardEntry_t) {
        user = .init(steam.m_steamIDUser)
        globalRank = .init(steam.m_nGlobalRank)
        score = .init(steam.m_nScore)
        details = .init(steam.m_cDetails)
        ugc = .init(steam.m_hUGC)
    }
}

/// Steamworks `LeaderboardFindResult_t`
public struct LeaderboardFindResult {
    /// Steamworks `m_hSteamLeaderboard`
    public let steamLeaderboard: SteamLeaderboard
    /// Steamworks `m_bLeaderboardFound`
    public let leaderboardFound: Bool

    /// Create a customized `LeaderboardFindResult`
    public init(steamLeaderboard: SteamLeaderboard = 0, leaderboardFound: Bool = false) {
        self.steamLeaderboard = steamLeaderboard
        self.leaderboardFound = leaderboardFound
    }
}

extension LeaderboardFindResult: SteamCreatable {
    typealias SteamType = CSteamworks.LeaderboardFindResult_t
    init(_ steam: CSteamworks.LeaderboardFindResult_t) {
        steamLeaderboard = .init(steam.m_hSteamLeaderboard)
        leaderboardFound = .init(steam.m_bLeaderboardFound)
    }
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

    /// Create a customized `LeaderboardScoreUploaded`
    public init(success: Bool = false, steamLeaderboard: SteamLeaderboard = 0, score: Int = 0, scoreChanged: Bool = false, globalRankNew: Int = 0, globalRankPrevious: Int = 0) {
        self.success = success
        self.steamLeaderboard = steamLeaderboard
        self.score = score
        self.scoreChanged = scoreChanged
        self.globalRankNew = globalRankNew
        self.globalRankPrevious = globalRankPrevious
    }
}

extension LeaderboardScoreUploaded: SteamCreatable {
    typealias SteamType = CSteamworks.LeaderboardScoreUploaded_t
    init(_ steam: CSteamworks.LeaderboardScoreUploaded_t) {
        success = .init(steam.m_bSuccess)
        steamLeaderboard = .init(steam.m_hSteamLeaderboard)
        score = .init(steam.m_nScore)
        scoreChanged = .init(steam.m_bScoreChanged)
        globalRankNew = .init(steam.m_nGlobalRankNew)
        globalRankPrevious = .init(steam.m_nGlobalRankPrevious)
    }
}

/// Steamworks `LeaderboardScoresDownloaded_t`
public struct LeaderboardScoresDownloaded {
    /// Steamworks `m_hSteamLeaderboard`
    public let steamLeaderboard: SteamLeaderboard
    /// Steamworks `m_hSteamLeaderboardEntries`
    public let steamLeaderboardEntries: SteamLeaderboardEntries
    /// Steamworks `m_cEntryCount`
    public let entryCount: Int

    /// Create a customized `LeaderboardScoresDownloaded`
    public init(steamLeaderboard: SteamLeaderboard = 0, steamLeaderboardEntries: SteamLeaderboardEntries = 0, entryCount: Int = 0) {
        self.steamLeaderboard = steamLeaderboard
        self.steamLeaderboardEntries = steamLeaderboardEntries
        self.entryCount = entryCount
    }
}

extension LeaderboardScoresDownloaded: SteamCreatable {
    typealias SteamType = CSteamworks.LeaderboardScoresDownloaded_t
    init(_ steam: CSteamworks.LeaderboardScoresDownloaded_t) {
        steamLeaderboard = .init(steam.m_hSteamLeaderboard)
        steamLeaderboardEntries = .init(steam.m_hSteamLeaderboardEntries)
        entryCount = .init(steam.m_cEntryCount)
    }
}

/// Steamworks `LeaderboardUGCSet_t`
public struct LeaderboardUGCSet {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_hSteamLeaderboard`
    public let steamLeaderboard: SteamLeaderboard

    /// Create a customized `LeaderboardUGCSet`
    public init(result: Result = .none, steamLeaderboard: SteamLeaderboard = 0) {
        self.result = result
        self.steamLeaderboard = steamLeaderboard
    }
}

extension LeaderboardUGCSet: SteamCreatable {
    typealias SteamType = CSteamworks.LeaderboardUGCSet_t
    init(_ steam: CSteamworks.LeaderboardUGCSet_t) {
        result = .init(steam.m_eResult)
        steamLeaderboard = .init(steam.m_hSteamLeaderboard)
    }
}

/// Steamworks `LicensesUpdated_t`
public struct LicensesUpdated {
    /// Create a customized `LicensesUpdated`
    public init() {
    }
}

extension LicensesUpdated: SteamCreatable {
    typealias SteamType = CSteamworks.LicensesUpdated_t
    init(_ steam: CSteamworks.LicensesUpdated_t) {
    }
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

    /// Create a customized `LobbyChatMsg`
    public init(steamIDLobby: SteamID = SteamID(), steamIDUser: SteamID = SteamID(), chatEntryType: Int = 0, chatIDIndex: Int = 0) {
        self.steamIDLobby = steamIDLobby
        self.steamIDUser = steamIDUser
        self.chatEntryType = chatEntryType
        self.chatIDIndex = chatIDIndex
    }
}

extension LobbyChatMsg: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyChatMsg_t
    init(_ steam: CSteamworks.LobbyChatMsg_t) {
        steamIDLobby = .init(steam.m_ulSteamIDLobby)
        steamIDUser = .init(steam.m_ulSteamIDUser)
        chatEntryType = .init(steam.m_eChatEntryType)
        chatIDIndex = .init(steam.m_iChatID)
    }
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

    /// Create a customized `LobbyChatUpdate`
    public init(steamIDLobby: SteamID = SteamID(), steamIDUserChanged: SteamID = SteamID(), steamIDMakingChange: SteamID = SteamID(), chatMemberStateChange: Int = 0) {
        self.steamIDLobby = steamIDLobby
        self.steamIDUserChanged = steamIDUserChanged
        self.steamIDMakingChange = steamIDMakingChange
        self.chatMemberStateChange = chatMemberStateChange
    }
}

extension LobbyChatUpdate: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyChatUpdate_t
    init(_ steam: CSteamworks.LobbyChatUpdate_t) {
        steamIDLobby = .init(steam.m_ulSteamIDLobby)
        steamIDUserChanged = .init(steam.m_ulSteamIDUserChanged)
        steamIDMakingChange = .init(steam.m_ulSteamIDMakingChange)
        chatMemberStateChange = .init(steam.m_rgfChatMemberStateChange)
    }
}

/// Steamworks `LobbyCreated_t`
public struct LobbyCreated {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID

    /// Create a customized `LobbyCreated`
    public init(result: Result = .none, steamIDLobby: SteamID = SteamID()) {
        self.result = result
        self.steamIDLobby = steamIDLobby
    }
}

extension LobbyCreated: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyCreated_t
    init(_ steam: CSteamworks.LobbyCreated_t) {
        result = .init(steam.m_eResult)
        steamIDLobby = .init(steam.m_ulSteamIDLobby)
    }
}

/// Steamworks `LobbyDataUpdate_t`
public struct LobbyDataUpdate {
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulSteamIDMember`
    public let steamIDMember: SteamID
    /// Steamworks `m_bSuccess`
    public let success: Bool

    /// Create a customized `LobbyDataUpdate`
    public init(steamIDLobby: SteamID = SteamID(), steamIDMember: SteamID = SteamID(), success: Bool = false) {
        self.steamIDLobby = steamIDLobby
        self.steamIDMember = steamIDMember
        self.success = success
    }
}

extension LobbyDataUpdate: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyDataUpdate_t
    init(_ steam: CSteamworks.LobbyDataUpdate_t) {
        steamIDLobby = .init(steam.m_ulSteamIDLobby)
        steamIDMember = .init(steam.m_ulSteamIDMember)
        success = .init(steam.m_bSuccess)
    }
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

    /// Create a customized `LobbyEnter`
    public init(steamIDLobby: SteamID = SteamID(), chatPermissions: Int = 0, locked: Bool = false, eChatRoomEnterResponse: Int = 0) {
        self.steamIDLobby = steamIDLobby
        self.chatPermissions = chatPermissions
        self.locked = locked
        self.eChatRoomEnterResponse = eChatRoomEnterResponse
    }
}

extension LobbyEnter: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyEnter_t
    init(_ steam: CSteamworks.LobbyEnter_t) {
        steamIDLobby = .init(steam.m_ulSteamIDLobby)
        chatPermissions = .init(steam.m_rgfChatPermissions)
        locked = .init(steam.m_bLocked)
        eChatRoomEnterResponse = .init(steam.m_EChatRoomEnterResponse)
    }
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

    /// Create a customized `LobbyGameCreated`
    public init(steamIDLobby: SteamID = SteamID(), steamIDGameServer: SteamID = SteamID(), ip: Int = 0, port: Int = 0) {
        self.steamIDLobby = steamIDLobby
        self.steamIDGameServer = steamIDGameServer
        self.ip = ip
        self.port = port
    }
}

extension LobbyGameCreated: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyGameCreated_t
    init(_ steam: CSteamworks.LobbyGameCreated_t) {
        steamIDLobby = .init(steam.m_ulSteamIDLobby)
        steamIDGameServer = .init(steam.m_ulSteamIDGameServer)
        ip = .init(steam.m_unIP)
        port = .init(steam.m_usPort)
    }
}

/// Steamworks `LobbyInvite_t`
public struct LobbyInvite {
    /// Steamworks `m_ulSteamIDUser`
    public let steamIDUser: SteamID
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulGameID`
    public let gameID: GameID

    /// Create a customized `LobbyInvite`
    public init(steamIDUser: SteamID = SteamID(), steamIDLobby: SteamID = SteamID(), gameID: GameID = GameID()) {
        self.steamIDUser = steamIDUser
        self.steamIDLobby = steamIDLobby
        self.gameID = gameID
    }
}

extension LobbyInvite: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyInvite_t
    init(_ steam: CSteamworks.LobbyInvite_t) {
        steamIDUser = .init(steam.m_ulSteamIDUser)
        steamIDLobby = .init(steam.m_ulSteamIDLobby)
        gameID = .init(steam.m_ulGameID)
    }
}

/// Steamworks `LobbyKicked_t`
public struct LobbyKicked {
    /// Steamworks `m_ulSteamIDLobby`
    public let steamIDLobby: SteamID
    /// Steamworks `m_ulSteamIDAdmin`
    public let steamIDAdmin: SteamID
    /// Steamworks `m_bKickedDueToDisconnect`
    public let kickedDueToDisconnect: Bool

    /// Create a customized `LobbyKicked`
    public init(steamIDLobby: SteamID = SteamID(), steamIDAdmin: SteamID = SteamID(), kickedDueToDisconnect: Bool = false) {
        self.steamIDLobby = steamIDLobby
        self.steamIDAdmin = steamIDAdmin
        self.kickedDueToDisconnect = kickedDueToDisconnect
    }
}

extension LobbyKicked: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyKicked_t
    init(_ steam: CSteamworks.LobbyKicked_t) {
        steamIDLobby = .init(steam.m_ulSteamIDLobby)
        steamIDAdmin = .init(steam.m_ulSteamIDAdmin)
        kickedDueToDisconnect = .init(steam.m_bKickedDueToDisconnect)
    }
}

/// Steamworks `LobbyMatchList_t`
public struct LobbyMatchList {
    /// Steamworks `m_nLobbiesMatching`
    public let lobbiesMatching: Int

    /// Create a customized `LobbyMatchList`
    public init(lobbiesMatching: Int = 0) {
        self.lobbiesMatching = lobbiesMatching
    }
}

extension LobbyMatchList: SteamCreatable {
    typealias SteamType = CSteamworks.LobbyMatchList_t
    init(_ steam: CSteamworks.LobbyMatchList_t) {
        lobbiesMatching = .init(steam.m_nLobbiesMatching)
    }
}

/// Steamworks `LowBatteryPower_t`
public struct LowBatteryPower {
    /// Steamworks `m_nMinutesBatteryLeft`
    public let minutesBatteryLeft: Int

    /// Create a customized `LowBatteryPower`
    public init(minutesBatteryLeft: Int = 0) {
        self.minutesBatteryLeft = minutesBatteryLeft
    }
}

extension LowBatteryPower: SteamCreatable {
    typealias SteamType = CSteamworks.LowBatteryPower_t
    init(_ steam: CSteamworks.LowBatteryPower_t) {
        minutesBatteryLeft = .init(steam.m_nMinutesBatteryLeft)
    }
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

    /// Create a customized `MarketEligibilityResponse`
    public init(allowed: Bool = false, notAllowedReason: MarketNotAllowedReasonFlags = [], allowedAtTime: RTime32 = 0, steamGuardRequiredDays: Int = 0, newDeviceCooldown: Int = 0) {
        self.allowed = allowed
        self.notAllowedReason = notAllowedReason
        self.allowedAtTime = allowedAtTime
        self.steamGuardRequiredDays = steamGuardRequiredDays
        self.newDeviceCooldown = newDeviceCooldown
    }
}

extension MarketEligibilityResponse: SteamCreatable {
    typealias SteamType = CSteamworks.MarketEligibilityResponse_t
    init(_ steam: CSteamworks.MarketEligibilityResponse_t) {
        allowed = .init(steam.m_bAllowed)
        notAllowedReason = .init(steam.m_eNotAllowedReason)
        allowedAtTime = .init(steam.m_rtAllowedAtTime)
        steamGuardRequiredDays = .init(steam.m_cdaySteamGuardRequiredDays)
        newDeviceCooldown = .init(steam.m_cdayNewDeviceCooldown)
    }
}

/// Steamworks `MatchMakingKeyValuePair_t`
public struct MatchMakingKeyValuePair {
    /// Steamworks `m_szKey`
    public let key: String
    /// Steamworks `m_szValue`
    public let value: String

    /// Create a customized `MatchMakingKeyValuePair`
    public init(key: String = "", value: String = "") {
        self.key = key
        self.value = value
    }
}

extension MatchMakingKeyValuePair: SteamCreatable {
    typealias SteamType = CSteamworks.MatchMakingKeyValuePair_t
    init(_ steam: CSteamworks.MatchMakingKeyValuePair_t) {
        key = .init(steam.m_szKey_ptr)
        value = .init(steam.m_szValue_ptr)
    }
}

/// Steamworks `MicroTxnAuthorizationResponse_t`
public struct MicroTxnAuthorizationResponse {
    /// Steamworks `m_unAppID`
    public let appID: AppID
    /// Steamworks `m_ulOrderID`
    public let orderID: UInt64
    /// Steamworks `m_bAuthorized`
    public let authorized: Bool

    /// Create a customized `MicroTxnAuthorizationResponse`
    public init(appID: AppID = 0, orderID: UInt64 = 0, authorized: Bool = false) {
        self.appID = appID
        self.orderID = orderID
        self.authorized = authorized
    }
}

extension MicroTxnAuthorizationResponse: SteamCreatable {
    typealias SteamType = CSteamworks.MicroTxnAuthorizationResponse_t
    init(_ steam: CSteamworks.MicroTxnAuthorizationResponse_t) {
        appID = .init(steam.m_unAppID)
        orderID = .init(steam.m_ulOrderID)
        authorized = .init(steam.m_bAuthorized)
    }
}

/// Steamworks `MusicPlayerRemoteToFront_t`
public struct MusicPlayerRemoteToFront {
    /// Create a customized `MusicPlayerRemoteToFront`
    public init() {
    }
}

extension MusicPlayerRemoteToFront: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerRemoteToFront_t
    init(_ steam: CSteamworks.MusicPlayerRemoteToFront_t) {
    }
}

/// Steamworks `MusicPlayerRemoteWillActivate_t`
public struct MusicPlayerRemoteWillActivate {
    /// Create a customized `MusicPlayerRemoteWillActivate`
    public init() {
    }
}

extension MusicPlayerRemoteWillActivate: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerRemoteWillActivate_t
    init(_ steam: CSteamworks.MusicPlayerRemoteWillActivate_t) {
    }
}

/// Steamworks `MusicPlayerRemoteWillDeactivate_t`
public struct MusicPlayerRemoteWillDeactivate {
    /// Create a customized `MusicPlayerRemoteWillDeactivate`
    public init() {
    }
}

extension MusicPlayerRemoteWillDeactivate: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerRemoteWillDeactivate_t
    init(_ steam: CSteamworks.MusicPlayerRemoteWillDeactivate_t) {
    }
}

/// Steamworks `MusicPlayerSelectsPlaylistEntry_t`
public struct MusicPlayerSelectsPlaylistEntry {
    /// Steamworks `nID`
    public let id: Int

    /// Create a customized `MusicPlayerSelectsPlaylistEntry`
    public init(id: Int = 0) {
        self.id = id
    }
}

extension MusicPlayerSelectsPlaylistEntry: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerSelectsPlaylistEntry_t
    init(_ steam: CSteamworks.MusicPlayerSelectsPlaylistEntry_t) {
        id = .init(steam.nID)
    }
}

/// Steamworks `MusicPlayerSelectsQueueEntry_t`
public struct MusicPlayerSelectsQueueEntry {
    /// Steamworks `nID`
    public let id: Int

    /// Create a customized `MusicPlayerSelectsQueueEntry`
    public init(id: Int = 0) {
        self.id = id
    }
}

extension MusicPlayerSelectsQueueEntry: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerSelectsQueueEntry_t
    init(_ steam: CSteamworks.MusicPlayerSelectsQueueEntry_t) {
        id = .init(steam.nID)
    }
}

/// Steamworks `MusicPlayerWantsLooped_t`
public struct MusicPlayerWantsLooped {
    /// Steamworks `m_bLooped`
    public let looped: Bool

    /// Create a customized `MusicPlayerWantsLooped`
    public init(looped: Bool = false) {
        self.looped = looped
    }
}

extension MusicPlayerWantsLooped: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWantsLooped_t
    init(_ steam: CSteamworks.MusicPlayerWantsLooped_t) {
        looped = .init(steam.m_bLooped)
    }
}

/// Steamworks `MusicPlayerWantsPause_t`
public struct MusicPlayerWantsPause {
    /// Create a customized `MusicPlayerWantsPause`
    public init() {
    }
}

extension MusicPlayerWantsPause: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWantsPause_t
    init(_ steam: CSteamworks.MusicPlayerWantsPause_t) {
    }
}

/// Steamworks `MusicPlayerWantsPlayNext_t`
public struct MusicPlayerWantsPlayNext {
    /// Create a customized `MusicPlayerWantsPlayNext`
    public init() {
    }
}

extension MusicPlayerWantsPlayNext: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWantsPlayNext_t
    init(_ steam: CSteamworks.MusicPlayerWantsPlayNext_t) {
    }
}

/// Steamworks `MusicPlayerWantsPlayPrevious_t`
public struct MusicPlayerWantsPlayPrevious {
    /// Create a customized `MusicPlayerWantsPlayPrevious`
    public init() {
    }
}

extension MusicPlayerWantsPlayPrevious: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWantsPlayPrevious_t
    init(_ steam: CSteamworks.MusicPlayerWantsPlayPrevious_t) {
    }
}

/// Steamworks `MusicPlayerWantsPlay_t`
public struct MusicPlayerWantsPlay {
    /// Create a customized `MusicPlayerWantsPlay`
    public init() {
    }
}

extension MusicPlayerWantsPlay: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWantsPlay_t
    init(_ steam: CSteamworks.MusicPlayerWantsPlay_t) {
    }
}

/// Steamworks `MusicPlayerWantsPlayingRepeatStatus_t`
public struct MusicPlayerWantsPlayingRepeatStatus {
    /// Steamworks `m_nPlayingRepeatStatus`
    public let playingRepeatStatus: Int

    /// Create a customized `MusicPlayerWantsPlayingRepeatStatus`
    public init(playingRepeatStatus: Int = 0) {
        self.playingRepeatStatus = playingRepeatStatus
    }
}

extension MusicPlayerWantsPlayingRepeatStatus: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWantsPlayingRepeatStatus_t
    init(_ steam: CSteamworks.MusicPlayerWantsPlayingRepeatStatus_t) {
        playingRepeatStatus = .init(steam.m_nPlayingRepeatStatus)
    }
}

/// Steamworks `MusicPlayerWantsShuffled_t`
public struct MusicPlayerWantsShuffled {
    /// Steamworks `m_bShuffled`
    public let shuffled: Bool

    /// Create a customized `MusicPlayerWantsShuffled`
    public init(shuffled: Bool = false) {
        self.shuffled = shuffled
    }
}

extension MusicPlayerWantsShuffled: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWantsShuffled_t
    init(_ steam: CSteamworks.MusicPlayerWantsShuffled_t) {
        shuffled = .init(steam.m_bShuffled)
    }
}

/// Steamworks `MusicPlayerWantsVolume_t`
public struct MusicPlayerWantsVolume {
    /// Steamworks `m_flNewVolume`
    public let newVolume: Float

    /// Create a customized `MusicPlayerWantsVolume`
    public init(newVolume: Float = 0) {
        self.newVolume = newVolume
    }
}

extension MusicPlayerWantsVolume: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWantsVolume_t
    init(_ steam: CSteamworks.MusicPlayerWantsVolume_t) {
        newVolume = .init(steam.m_flNewVolume)
    }
}

/// Steamworks `MusicPlayerWillQuit_t`
public struct MusicPlayerWillQuit {
    /// Create a customized `MusicPlayerWillQuit`
    public init() {
    }
}

extension MusicPlayerWillQuit: SteamCreatable {
    typealias SteamType = CSteamworks.MusicPlayerWillQuit_t
    init(_ steam: CSteamworks.MusicPlayerWillQuit_t) {
    }
}

/// Steamworks `NewUrlLaunchParameters_t`
public struct NewUrlLaunchParameters {
    /// Create a customized `NewUrlLaunchParameters`
    public init() {
    }
}

extension NewUrlLaunchParameters: SteamCreatable {
    typealias SteamType = CSteamworks.NewUrlLaunchParameters_t
    init(_ steam: CSteamworks.NewUrlLaunchParameters_t) {
    }
}

/// Steamworks `NumberOfCurrentPlayers_t`
public struct NumberOfCurrentPlayers {
    /// Steamworks `m_bSuccess`
    public let success: Bool
    /// Steamworks `m_cPlayers`
    public let players: Int

    /// Create a customized `NumberOfCurrentPlayers`
    public init(success: Bool = false, players: Int = 0) {
        self.success = success
        self.players = players
    }
}

extension NumberOfCurrentPlayers: SteamCreatable {
    typealias SteamType = CSteamworks.NumberOfCurrentPlayers_t
    init(_ steam: CSteamworks.NumberOfCurrentPlayers_t) {
        success = .init(steam.m_bSuccess)
        players = .init(steam.m_cPlayers)
    }
}

/// Steamworks `OverlayBrowserProtocolNavigation_t`
public struct OverlayBrowserProtocolNavigation {
    /// Steamworks `rgchURI`
    public let uri: String

    /// Create a customized `OverlayBrowserProtocolNavigation`
    public init(uri: String = "") {
        self.uri = uri
    }
}

extension OverlayBrowserProtocolNavigation: SteamCreatable {
    typealias SteamType = CSteamworks.OverlayBrowserProtocolNavigation_t
    init(_ steam: CSteamworks.OverlayBrowserProtocolNavigation_t) {
        uri = .init(steam.rgchURI_ptr)
    }
}

/// Steamworks `P2PSessionConnectFail_t`
public struct P2PSessionConnectFail {
    /// Steamworks `m_steamIDRemote`
    public let remote: SteamID
    /// Steamworks `m_eP2PSessionError`
    public let p2PSessionError: Int

    /// Create a customized `P2PSessionConnectFail`
    public init(remote: SteamID = SteamID(), p2PSessionError: Int = 0) {
        self.remote = remote
        self.p2PSessionError = p2PSessionError
    }
}

extension P2PSessionConnectFail: SteamCreatable {
    typealias SteamType = CSteamworks.P2PSessionConnectFail_t
    init(_ steam: CSteamworks.P2PSessionConnectFail_t) {
        remote = .init(steam.m_steamIDRemote)
        p2PSessionError = .init(steam.m_eP2PSessionError)
    }
}

/// Steamworks `P2PSessionRequest_t`
public struct P2PSessionRequest {
    /// Steamworks `m_steamIDRemote`
    public let remote: SteamID

    /// Create a customized `P2PSessionRequest`
    public init(remote: SteamID = SteamID()) {
        self.remote = remote
    }
}

extension P2PSessionRequest: SteamCreatable {
    typealias SteamType = CSteamworks.P2PSessionRequest_t
    init(_ steam: CSteamworks.P2PSessionRequest_t) {
        remote = .init(steam.m_steamIDRemote)
    }
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

    /// Create a customized `P2PSessionState`
    public init(connectionActive: Bool = false, connecting: Bool = false, p2PSessionError: Int = 0, usingRelay: Bool = false, bytesQueuedForSend: Int = 0, packetsQueuedForSend: Int = 0, remoteIP: Int = 0, remotePort: Int = 0) {
        self.connectionActive = connectionActive
        self.connecting = connecting
        self.p2PSessionError = p2PSessionError
        self.usingRelay = usingRelay
        self.bytesQueuedForSend = bytesQueuedForSend
        self.packetsQueuedForSend = packetsQueuedForSend
        self.remoteIP = remoteIP
        self.remotePort = remotePort
    }
}

extension P2PSessionState: SteamCreatable {
    typealias SteamType = CSteamworks.P2PSessionState_t
    init(_ steam: CSteamworks.P2PSessionState_t) {
        connectionActive = .init(steam.m_bConnectionActive)
        connecting = .init(steam.m_bConnecting)
        p2PSessionError = .init(steam.m_eP2PSessionError)
        usingRelay = .init(steam.m_bUsingRelay)
        bytesQueuedForSend = .init(steam.m_nBytesQueuedForSend)
        packetsQueuedForSend = .init(steam.m_nPacketsQueuedForSend)
        remoteIP = .init(steam.m_nRemoteIP)
        remotePort = .init(steam.m_nRemotePort)
    }
}

/// Steamworks `PS3TrophiesInstalled_t`
public struct PS3TrophiesInstalled {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_ulRequiredDiskSpace`
    public let requiredDiskSpace: UInt64

    /// Create a customized `PS3TrophiesInstalled`
    public init(gameID: GameID = GameID(), result: Result = .none, requiredDiskSpace: UInt64 = 0) {
        self.gameID = gameID
        self.result = result
        self.requiredDiskSpace = requiredDiskSpace
    }
}

extension PS3TrophiesInstalled: SteamCreatable {
    typealias SteamType = CSteamworks.PS3TrophiesInstalled_t
    init(_ steam: CSteamworks.PS3TrophiesInstalled_t) {
        gameID = .init(steam.m_nGameID)
        result = .init(steam.m_eResult)
        requiredDiskSpace = .init(steam.m_ulRequiredDiskSpace)
    }
}

/// Steamworks `PSNGameBootInviteResult_t`
public struct PSNGameBootInviteResult {
    /// Steamworks `m_bGameBootInviteExists`
    public let gameBootInviteExists: Bool
    /// Steamworks `m_steamIDLobby`
    public let lobby: SteamID

    /// Create a customized `PSNGameBootInviteResult`
    public init(gameBootInviteExists: Bool = false, lobby: SteamID = SteamID()) {
        self.gameBootInviteExists = gameBootInviteExists
        self.lobby = lobby
    }
}

extension PSNGameBootInviteResult: SteamCreatable {
    typealias SteamType = CSteamworks.PSNGameBootInviteResult_t
    init(_ steam: CSteamworks.PSNGameBootInviteResult_t) {
        gameBootInviteExists = .init(steam.m_bGameBootInviteExists)
        lobby = .init(steam.m_steamIDLobby)
    }
}

/// Steamworks `PersonaStateChange_t`
public struct PersonaStateChange {
    /// Steamworks `m_ulSteamID`
    public let steamID: SteamID
    /// Steamworks `m_nChangeFlags`
    public let changeFlags: PersonaChange

    /// Create a customized `PersonaStateChange`
    public init(steamID: SteamID = SteamID(), changeFlags: PersonaChange = []) {
        self.steamID = steamID
        self.changeFlags = changeFlags
    }
}

extension PersonaStateChange: SteamCreatable {
    typealias SteamType = CSteamworks.PersonaStateChange_t
    init(_ steam: CSteamworks.PersonaStateChange_t) {
        steamID = .init(steam.m_ulSteamID)
        changeFlags = .init(steam.m_nChangeFlags)
    }
}

/// Steamworks `PlaybackStatusHasChanged_t`
public struct PlaybackStatusHasChanged {
    /// Create a customized `PlaybackStatusHasChanged`
    public init() {
    }
}

extension PlaybackStatusHasChanged: SteamCreatable {
    typealias SteamType = CSteamworks.PlaybackStatusHasChanged_t
    init(_ steam: CSteamworks.PlaybackStatusHasChanged_t) {
    }
}

/// Steamworks `RegisterActivationCodeResponse_t`
public struct RegisterActivationCodeResponse {
    /// Steamworks `m_eResult`
    public let result: RegisterActivationCodeResult
    /// Steamworks `m_unPackageRegistered`
    public let packageRegistered: Int

    /// Create a customized `RegisterActivationCodeResponse`
    public init(result: RegisterActivationCodeResult = .ok, packageRegistered: Int = 0) {
        self.result = result
        self.packageRegistered = packageRegistered
    }
}

extension RegisterActivationCodeResponse: SteamCreatable {
    typealias SteamType = CSteamworks.RegisterActivationCodeResponse_t
    init(_ steam: CSteamworks.RegisterActivationCodeResponse_t) {
        result = .init(steam.m_eResult)
        packageRegistered = .init(steam.m_unPackageRegistered)
    }
}

/// Steamworks `RemoteStorageDeletePublishedFileResult_t`
public struct RemoteStorageDeletePublishedFileResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID

    /// Create a customized `RemoteStorageDeletePublishedFileResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
    }
}

extension RemoteStorageDeletePublishedFileResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageDeletePublishedFileResult_t
    init(_ steam: CSteamworks.RemoteStorageDeletePublishedFileResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
    }
}

/// Steamworks `RemoteStorageDownloadUGCResult_t`
public struct RemoteStorageDownloadUGCResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_hFile`
    public let file: UGCHandle
    /// Steamworks `m_nAppID`
    public let appID: AppID
    /// Steamworks `m_nSizeInBytes`
    public let sizeInBytes: Int
    /// Steamworks `m_pchFileName`
    public let fileName: String
    /// Steamworks `m_ulSteamIDOwner`
    public let steamIDOwner: SteamID

    /// Create a customized `RemoteStorageDownloadUGCResult`
    public init(result: Result = .none, file: UGCHandle = 0, appID: AppID = 0, sizeInBytes: Int = 0, fileName: String = "", steamIDOwner: SteamID = SteamID()) {
        self.result = result
        self.file = file
        self.appID = appID
        self.sizeInBytes = sizeInBytes
        self.fileName = fileName
        self.steamIDOwner = steamIDOwner
    }
}

extension RemoteStorageDownloadUGCResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageDownloadUGCResult_t
    init(_ steam: CSteamworks.RemoteStorageDownloadUGCResult_t) {
        result = .init(steam.m_eResult)
        file = .init(steam.m_hFile)
        appID = .init(steam.m_nAppID)
        sizeInBytes = .init(steam.m_nSizeInBytes)
        fileName = .init(steam.m_pchFileName_ptr)
        steamIDOwner = .init(steam.m_ulSteamIDOwner)
    }
}

/// Steamworks `RemoteStorageEnumeratePublishedFilesByUserActionResult_t`
public struct RemoteStorageEnumeratePublishedFilesByUserActionResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_eAction`
    public let action: WorkshopFileAction
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileID]
    /// Steamworks `m_rgRTimeUpdated`
    public let rTimeUpdated: [RTime32]

    /// Create a customized `RemoteStorageEnumeratePublishedFilesByUserActionResult`
    public init(result: Result = .none, action: WorkshopFileAction = .played, resultsReturned: Int = 0, totalResultCount: Int = 0, publishedFileId: [PublishedFileID] = [], rTimeUpdated: [RTime32] = []) {
        self.result = result
        self.action = action
        self.resultsReturned = resultsReturned
        self.totalResultCount = totalResultCount
        self.publishedFileId = publishedFileId
        self.rTimeUpdated = rTimeUpdated
    }
}

extension RemoteStorageEnumeratePublishedFilesByUserActionResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageEnumeratePublishedFilesByUserActionResult_t
    init(_ steam: CSteamworks.RemoteStorageEnumeratePublishedFilesByUserActionResult_t) {
        result = .init(steam.m_eResult)
        action = .init(steam.m_eAction)
        resultsReturned = .init(steam.m_nResultsReturned)
        totalResultCount = .init(steam.m_nTotalResultCount)
        publishedFileId = .init(steam.m_rgPublishedFileId_ptr, 50) { .init($0) }
        rTimeUpdated = .init(steam.m_rgRTimeUpdated_ptr, 50) { .init($0) }
    }
}

/// Steamworks `RemoteStorageEnumerateUserPublishedFilesResult_t`
public struct RemoteStorageEnumerateUserPublishedFilesResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileID]

    /// Create a customized `RemoteStorageEnumerateUserPublishedFilesResult`
    public init(result: Result = .none, resultsReturned: Int = 0, totalResultCount: Int = 0, publishedFileId: [PublishedFileID] = []) {
        self.result = result
        self.resultsReturned = resultsReturned
        self.totalResultCount = totalResultCount
        self.publishedFileId = publishedFileId
    }
}

extension RemoteStorageEnumerateUserPublishedFilesResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageEnumerateUserPublishedFilesResult_t
    init(_ steam: CSteamworks.RemoteStorageEnumerateUserPublishedFilesResult_t) {
        result = .init(steam.m_eResult)
        resultsReturned = .init(steam.m_nResultsReturned)
        totalResultCount = .init(steam.m_nTotalResultCount)
        publishedFileId = .init(steam.m_rgPublishedFileId_ptr, 50) { .init($0) }
    }
}

/// Steamworks `RemoteStorageEnumerateUserSharedWorkshopFilesResult_t`
public struct RemoteStorageEnumerateUserSharedWorkshopFilesResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileID]

    /// Create a customized `RemoteStorageEnumerateUserSharedWorkshopFilesResult`
    public init(result: Result = .none, resultsReturned: Int = 0, totalResultCount: Int = 0, publishedFileId: [PublishedFileID] = []) {
        self.result = result
        self.resultsReturned = resultsReturned
        self.totalResultCount = totalResultCount
        self.publishedFileId = publishedFileId
    }
}

extension RemoteStorageEnumerateUserSharedWorkshopFilesResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageEnumerateUserSharedWorkshopFilesResult_t
    init(_ steam: CSteamworks.RemoteStorageEnumerateUserSharedWorkshopFilesResult_t) {
        result = .init(steam.m_eResult)
        resultsReturned = .init(steam.m_nResultsReturned)
        totalResultCount = .init(steam.m_nTotalResultCount)
        publishedFileId = .init(steam.m_rgPublishedFileId_ptr, 50) { .init($0) }
    }
}

/// Steamworks `RemoteStorageEnumerateUserSubscribedFilesResult_t`
public struct RemoteStorageEnumerateUserSubscribedFilesResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileID]
    /// Steamworks `m_rgRTimeSubscribed`
    public let rTimeSubscribed: [RTime32]

    /// Create a customized `RemoteStorageEnumerateUserSubscribedFilesResult`
    public init(result: Result = .none, resultsReturned: Int = 0, totalResultCount: Int = 0, publishedFileId: [PublishedFileID] = [], rTimeSubscribed: [RTime32] = []) {
        self.result = result
        self.resultsReturned = resultsReturned
        self.totalResultCount = totalResultCount
        self.publishedFileId = publishedFileId
        self.rTimeSubscribed = rTimeSubscribed
    }
}

extension RemoteStorageEnumerateUserSubscribedFilesResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageEnumerateUserSubscribedFilesResult_t
    init(_ steam: CSteamworks.RemoteStorageEnumerateUserSubscribedFilesResult_t) {
        result = .init(steam.m_eResult)
        resultsReturned = .init(steam.m_nResultsReturned)
        totalResultCount = .init(steam.m_nTotalResultCount)
        publishedFileId = .init(steam.m_rgPublishedFileId_ptr, 50) { .init($0) }
        rTimeSubscribed = .init(steam.m_rgRTimeSubscribed_ptr, 50) { .init($0) }
    }
}

/// Steamworks `RemoteStorageEnumerateWorkshopFilesResult_t`
public struct RemoteStorageEnumerateWorkshopFilesResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nResultsReturned`
    public let resultsReturned: Int
    /// Steamworks `m_nTotalResultCount`
    public let totalResultCount: Int
    /// Steamworks `m_rgPublishedFileId`
    public let publishedFileId: [PublishedFileID]
    /// Steamworks `m_rgScore`
    public let score: [Float]
    /// Steamworks `m_nAppId`
    public let appId: AppID
    /// Steamworks `m_unStartIndex`
    public let startIndex: Int

    /// Create a customized `RemoteStorageEnumerateWorkshopFilesResult`
    public init(result: Result = .none, resultsReturned: Int = 0, totalResultCount: Int = 0, publishedFileId: [PublishedFileID] = [], score: [Float] = [], appId: AppID = 0, startIndex: Int = 0) {
        self.result = result
        self.resultsReturned = resultsReturned
        self.totalResultCount = totalResultCount
        self.publishedFileId = publishedFileId
        self.score = score
        self.appId = appId
        self.startIndex = startIndex
    }
}

extension RemoteStorageEnumerateWorkshopFilesResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageEnumerateWorkshopFilesResult_t
    init(_ steam: CSteamworks.RemoteStorageEnumerateWorkshopFilesResult_t) {
        result = .init(steam.m_eResult)
        resultsReturned = .init(steam.m_nResultsReturned)
        totalResultCount = .init(steam.m_nTotalResultCount)
        publishedFileId = .init(steam.m_rgPublishedFileId_ptr, 50) { .init($0) }
        score = .init(steam.m_rgScore_ptr, 50) { .init($0) }
        appId = .init(steam.m_nAppId)
        startIndex = .init(steam.m_unStartIndex)
    }
}

/// Steamworks `RemoteStorageFileReadAsyncComplete_t`
public struct RemoteStorageFileReadAsyncComplete {
    /// Steamworks `m_hFileReadAsync`
    public let fileReadAsync: SteamAPICall
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nOffset`
    public let offset: Int
    /// Steamworks `m_cubRead`
    public let readSize: Int

    /// Create a customized `RemoteStorageFileReadAsyncComplete`
    public init(fileReadAsync: SteamAPICall = 0, result: Result = .none, offset: Int = 0, readSize: Int = 0) {
        self.fileReadAsync = fileReadAsync
        self.result = result
        self.offset = offset
        self.readSize = readSize
    }
}

extension RemoteStorageFileReadAsyncComplete: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageFileReadAsyncComplete_t
    init(_ steam: CSteamworks.RemoteStorageFileReadAsyncComplete_t) {
        fileReadAsync = .init(steam.m_hFileReadAsync)
        result = .init(steam.m_eResult)
        offset = .init(steam.m_nOffset)
        readSize = .init(steam.m_cubRead)
    }
}

/// Steamworks `RemoteStorageFileShareResult_t`
public struct RemoteStorageFileShareResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_hFile`
    public let file: UGCHandle
    /// Steamworks `m_rgchFilename`
    public let filename: String

    /// Create a customized `RemoteStorageFileShareResult`
    public init(result: Result = .none, file: UGCHandle = 0, filename: String = "") {
        self.result = result
        self.file = file
        self.filename = filename
    }
}

extension RemoteStorageFileShareResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageFileShareResult_t
    init(_ steam: CSteamworks.RemoteStorageFileShareResult_t) {
        result = .init(steam.m_eResult)
        file = .init(steam.m_hFile)
        filename = .init(steam.m_rgchFilename_ptr)
    }
}

/// Steamworks `RemoteStorageFileWriteAsyncComplete_t`
public struct RemoteStorageFileWriteAsyncComplete {
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `RemoteStorageFileWriteAsyncComplete`
    public init(result: Result = .none) {
        self.result = result
    }
}

extension RemoteStorageFileWriteAsyncComplete: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageFileWriteAsyncComplete_t
    init(_ steam: CSteamworks.RemoteStorageFileWriteAsyncComplete_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `RemoteStorageGetPublishedFileDetailsResult_t`
public struct RemoteStorageGetPublishedFileDetailsResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nCreatorAppID`
    public let creatorAppID: AppID
    /// Steamworks `m_nConsumerAppID`
    public let consumerAppID: AppID
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
    public let rtimeCreated: RTime32
    /// Steamworks `m_rtimeUpdated`
    public let rtimeUpdated: RTime32
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

    /// Create a customized `RemoteStorageGetPublishedFileDetailsResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, creatorAppID: AppID = 0, consumerAppID: AppID = 0, title: String = "", description: String = "", file: UGCHandle = 0, previewFile: UGCHandle = 0, steamIDOwner: SteamID = SteamID(), rtimeCreated: RTime32 = 0, rtimeUpdated: RTime32 = 0, visibility: RemoteStoragePublishedFileVisibility = .`public`, banned: Bool = false, tags: String = "", tagsTruncated: Bool = false, fileName: String = "", fileSize: Int = 0, previewFileSize: Int = 0, url: String = "", fileType: WorkshopFileType = .first, acceptedForUse: Bool = false) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.creatorAppID = creatorAppID
        self.consumerAppID = consumerAppID
        self.title = title
        self.description = description
        self.file = file
        self.previewFile = previewFile
        self.steamIDOwner = steamIDOwner
        self.rtimeCreated = rtimeCreated
        self.rtimeUpdated = rtimeUpdated
        self.visibility = visibility
        self.banned = banned
        self.tags = tags
        self.tagsTruncated = tagsTruncated
        self.fileName = fileName
        self.fileSize = fileSize
        self.previewFileSize = previewFileSize
        self.url = url
        self.fileType = fileType
        self.acceptedForUse = acceptedForUse
    }
}

extension RemoteStorageGetPublishedFileDetailsResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageGetPublishedFileDetailsResult_t
    init(_ steam: CSteamworks.RemoteStorageGetPublishedFileDetailsResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        creatorAppID = .init(steam.m_nCreatorAppID)
        consumerAppID = .init(steam.m_nConsumerAppID)
        title = .init(steam.m_rgchTitle_ptr)
        description = .init(steam.m_rgchDescription_ptr)
        file = .init(steam.m_hFile)
        previewFile = .init(steam.m_hPreviewFile)
        steamIDOwner = .init(steam.m_ulSteamIDOwner)
        rtimeCreated = .init(steam.m_rtimeCreated)
        rtimeUpdated = .init(steam.m_rtimeUpdated)
        visibility = .init(steam.m_eVisibility)
        banned = .init(steam.m_bBanned)
        tags = .init(steam.m_rgchTags_ptr)
        tagsTruncated = .init(steam.m_bTagsTruncated)
        fileName = .init(steam.m_pchFileName_ptr)
        fileSize = .init(steam.m_nFileSize)
        previewFileSize = .init(steam.m_nPreviewFileSize)
        url = .init(steam.m_rgchURL_ptr)
        fileType = .init(steam.m_eFileType)
        acceptedForUse = .init(steam.m_bAcceptedForUse)
    }
}

/// Steamworks `RemoteStorageGetPublishedItemVoteDetailsResult_t`
public struct RemoteStorageGetPublishedItemVoteDetailsResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_unPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nVotesFor`
    public let votesFor: Int
    /// Steamworks `m_nVotesAgainst`
    public let votesAgainst: Int
    /// Steamworks `m_nReports`
    public let reports: Int
    /// Steamworks `m_fScore`
    public let score: Float

    /// Create a customized `RemoteStorageGetPublishedItemVoteDetailsResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, votesFor: Int = 0, votesAgainst: Int = 0, reports: Int = 0, score: Float = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.votesFor = votesFor
        self.votesAgainst = votesAgainst
        self.reports = reports
        self.score = score
    }
}

extension RemoteStorageGetPublishedItemVoteDetailsResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageGetPublishedItemVoteDetailsResult_t
    init(_ steam: CSteamworks.RemoteStorageGetPublishedItemVoteDetailsResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_unPublishedFileId)
        votesFor = .init(steam.m_nVotesFor)
        votesAgainst = .init(steam.m_nVotesAgainst)
        reports = .init(steam.m_nReports)
        score = .init(steam.m_fScore)
    }
}

/// Steamworks `RemoteStorageLocalFileChange_t`
public struct RemoteStorageLocalFileChange {
    /// Create a customized `RemoteStorageLocalFileChange`
    public init() {
    }
}

extension RemoteStorageLocalFileChange: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageLocalFileChange_t
    init(_ steam: CSteamworks.RemoteStorageLocalFileChange_t) {
    }
}

/// Steamworks `RemoteStoragePublishFileProgress_t`
public struct RemoteStoragePublishFileProgress {
    /// Steamworks `m_dPercentFile`
    public let percentFile: Double
    /// Steamworks `m_bPreview`
    public let preview: Bool

    /// Create a customized `RemoteStoragePublishFileProgress`
    public init(percentFile: Double = 0, preview: Bool = false) {
        self.percentFile = percentFile
        self.preview = preview
    }
}

extension RemoteStoragePublishFileProgress: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStoragePublishFileProgress_t
    init(_ steam: CSteamworks.RemoteStoragePublishFileProgress_t) {
        percentFile = .init(steam.m_dPercentFile)
        preview = .init(steam.m_bPreview)
    }
}

/// Steamworks `RemoteStoragePublishFileResult_t`
public struct RemoteStoragePublishFileResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let userNeedsToAcceptWorkshopLegalAgreement: Bool

    /// Create a customized `RemoteStoragePublishFileResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, userNeedsToAcceptWorkshopLegalAgreement: Bool = false) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.userNeedsToAcceptWorkshopLegalAgreement = userNeedsToAcceptWorkshopLegalAgreement
    }
}

extension RemoteStoragePublishFileResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStoragePublishFileResult_t
    init(_ steam: CSteamworks.RemoteStoragePublishFileResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        userNeedsToAcceptWorkshopLegalAgreement = .init(steam.m_bUserNeedsToAcceptWorkshopLegalAgreement)
    }
}

/// Steamworks `RemoteStoragePublishedFileDeleted_t`
public struct RemoteStoragePublishedFileDeleted {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `RemoteStoragePublishedFileDeleted`
    public init(publishedFileId: PublishedFileID = 0, appID: AppID = 0) {
        self.publishedFileId = publishedFileId
        self.appID = appID
    }
}

extension RemoteStoragePublishedFileDeleted: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStoragePublishedFileDeleted_t
    init(_ steam: CSteamworks.RemoteStoragePublishedFileDeleted_t) {
        publishedFileId = .init(steam.m_nPublishedFileId)
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `RemoteStoragePublishedFileSubscribed_t`
public struct RemoteStoragePublishedFileSubscribed {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `RemoteStoragePublishedFileSubscribed`
    public init(publishedFileId: PublishedFileID = 0, appID: AppID = 0) {
        self.publishedFileId = publishedFileId
        self.appID = appID
    }
}

extension RemoteStoragePublishedFileSubscribed: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStoragePublishedFileSubscribed_t
    init(_ steam: CSteamworks.RemoteStoragePublishedFileSubscribed_t) {
        publishedFileId = .init(steam.m_nPublishedFileId)
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `RemoteStoragePublishedFileUnsubscribed_t`
public struct RemoteStoragePublishedFileUnsubscribed {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `RemoteStoragePublishedFileUnsubscribed`
    public init(publishedFileId: PublishedFileID = 0, appID: AppID = 0) {
        self.publishedFileId = publishedFileId
        self.appID = appID
    }
}

extension RemoteStoragePublishedFileUnsubscribed: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStoragePublishedFileUnsubscribed_t
    init(_ steam: CSteamworks.RemoteStoragePublishedFileUnsubscribed_t) {
        publishedFileId = .init(steam.m_nPublishedFileId)
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `RemoteStoragePublishedFileUpdated_t`
public struct RemoteStoragePublishedFileUpdated {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `RemoteStoragePublishedFileUpdated`
    public init(publishedFileId: PublishedFileID = 0, appID: AppID = 0) {
        self.publishedFileId = publishedFileId
        self.appID = appID
    }
}

extension RemoteStoragePublishedFileUpdated: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStoragePublishedFileUpdated_t
    init(_ steam: CSteamworks.RemoteStoragePublishedFileUpdated_t) {
        publishedFileId = .init(steam.m_nPublishedFileId)
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `RemoteStorageSetUserPublishedFileActionResult_t`
public struct RemoteStorageSetUserPublishedFileActionResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_eAction`
    public let action: WorkshopFileAction

    /// Create a customized `RemoteStorageSetUserPublishedFileActionResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, action: WorkshopFileAction = .played) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.action = action
    }
}

extension RemoteStorageSetUserPublishedFileActionResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageSetUserPublishedFileActionResult_t
    init(_ steam: CSteamworks.RemoteStorageSetUserPublishedFileActionResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        action = .init(steam.m_eAction)
    }
}

/// Steamworks `RemoteStorageSubscribePublishedFileResult_t`
public struct RemoteStorageSubscribePublishedFileResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID

    /// Create a customized `RemoteStorageSubscribePublishedFileResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
    }
}

extension RemoteStorageSubscribePublishedFileResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageSubscribePublishedFileResult_t
    init(_ steam: CSteamworks.RemoteStorageSubscribePublishedFileResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
    }
}

/// Steamworks `RemoteStorageUnsubscribePublishedFileResult_t`
public struct RemoteStorageUnsubscribePublishedFileResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID

    /// Create a customized `RemoteStorageUnsubscribePublishedFileResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
    }
}

extension RemoteStorageUnsubscribePublishedFileResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageUnsubscribePublishedFileResult_t
    init(_ steam: CSteamworks.RemoteStorageUnsubscribePublishedFileResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
    }
}

/// Steamworks `RemoteStorageUpdatePublishedFileResult_t`
public struct RemoteStorageUpdatePublishedFileResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let userNeedsToAcceptWorkshopLegalAgreement: Bool

    /// Create a customized `RemoteStorageUpdatePublishedFileResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, userNeedsToAcceptWorkshopLegalAgreement: Bool = false) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.userNeedsToAcceptWorkshopLegalAgreement = userNeedsToAcceptWorkshopLegalAgreement
    }
}

extension RemoteStorageUpdatePublishedFileResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageUpdatePublishedFileResult_t
    init(_ steam: CSteamworks.RemoteStorageUpdatePublishedFileResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        userNeedsToAcceptWorkshopLegalAgreement = .init(steam.m_bUserNeedsToAcceptWorkshopLegalAgreement)
    }
}

/// Steamworks `RemoteStorageUpdateUserPublishedItemVoteResult_t`
public struct RemoteStorageUpdateUserPublishedItemVoteResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID

    /// Create a customized `RemoteStorageUpdateUserPublishedItemVoteResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
    }
}

extension RemoteStorageUpdateUserPublishedItemVoteResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageUpdateUserPublishedItemVoteResult_t
    init(_ steam: CSteamworks.RemoteStorageUpdateUserPublishedItemVoteResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
    }
}

/// Steamworks `RemoteStorageUserVoteDetails_t`
public struct RemoteStorageUserVoteDetails {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_eVote`
    public let vote: WorkshopVote

    /// Create a customized `RemoteStorageUserVoteDetails`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, vote: WorkshopVote = .unvoted) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.vote = vote
    }
}

extension RemoteStorageUserVoteDetails: SteamCreatable {
    typealias SteamType = CSteamworks.RemoteStorageUserVoteDetails_t
    init(_ steam: CSteamworks.RemoteStorageUserVoteDetails_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        vote = .init(steam.m_eVote)
    }
}

/// Steamworks `RemoveAppDependencyResult_t`
public struct RemoveAppDependencyResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `RemoveAppDependencyResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, appID: AppID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.appID = appID
    }
}

extension RemoveAppDependencyResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoveAppDependencyResult_t
    init(_ steam: CSteamworks.RemoveAppDependencyResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `RemoveUGCDependencyResult_t`
public struct RemoveUGCDependencyResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_nChildPublishedFileId`
    public let childPublishedFileId: PublishedFileID

    /// Create a customized `RemoveUGCDependencyResult`
    public init(result: Result = .none, publishedFileId: PublishedFileID = 0, childPublishedFileId: PublishedFileID = 0) {
        self.result = result
        self.publishedFileId = publishedFileId
        self.childPublishedFileId = childPublishedFileId
    }
}

extension RemoveUGCDependencyResult: SteamCreatable {
    typealias SteamType = CSteamworks.RemoveUGCDependencyResult_t
    init(_ steam: CSteamworks.RemoveUGCDependencyResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
        childPublishedFileId = .init(steam.m_nChildPublishedFileId)
    }
}

/// Steamworks `RequestPlayersForGameFinalResultCallback_t`
public struct RequestPlayersForGameFinalResultCallback {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64
    /// Steamworks `m_ullUniqueGameID`
    public let uniqueGameID: GameID

    /// Create a customized `RequestPlayersForGameFinalResultCallback`
    public init(result: Result = .none, searchID: UInt64 = 0, uniqueGameID: GameID = GameID()) {
        self.result = result
        self.searchID = searchID
        self.uniqueGameID = uniqueGameID
    }
}

extension RequestPlayersForGameFinalResultCallback: SteamCreatable {
    typealias SteamType = CSteamworks.RequestPlayersForGameFinalResultCallback_t
    init(_ steam: CSteamworks.RequestPlayersForGameFinalResultCallback_t) {
        result = .init(steam.m_eResult)
        searchID = .init(steam.m_ullSearchID)
        uniqueGameID = .init(steam.m_ullUniqueGameID)
    }
}

/// Steamworks `RequestPlayersForGameProgressCallback_t`
public struct RequestPlayersForGameProgressCallback {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64

    /// Create a customized `RequestPlayersForGameProgressCallback`
    public init(result: Result = .none, searchID: UInt64 = 0) {
        self.result = result
        self.searchID = searchID
    }
}

extension RequestPlayersForGameProgressCallback: SteamCreatable {
    typealias SteamType = CSteamworks.RequestPlayersForGameProgressCallback_t
    init(_ steam: CSteamworks.RequestPlayersForGameProgressCallback_t) {
        result = .init(steam.m_eResult)
        searchID = .init(steam.m_ullSearchID)
    }
}

/// Steamworks `RequestPlayersForGameResultCallback_t`
public struct RequestPlayersForGameResultCallback {
    /// Steamworks `m_eResult`
    public let result: Result
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

    /// Create a customized `RequestPlayersForGameResultCallback`
    public init(result: Result = .none, searchID: UInt64 = 0, playerFound: SteamID = SteamID(), lobby: SteamID = SteamID(), playerAcceptState: PlayerAcceptState = .unknown, playerIndex: Int = 0, totalPlayersFound: Int = 0, totalPlayersAcceptedGame: Int = 0, suggestedTeamIndex: Int = 0, uniqueGameID: GameID = GameID()) {
        self.result = result
        self.searchID = searchID
        self.playerFound = playerFound
        self.lobby = lobby
        self.playerAcceptState = playerAcceptState
        self.playerIndex = playerIndex
        self.totalPlayersFound = totalPlayersFound
        self.totalPlayersAcceptedGame = totalPlayersAcceptedGame
        self.suggestedTeamIndex = suggestedTeamIndex
        self.uniqueGameID = uniqueGameID
    }
}

extension RequestPlayersForGameResultCallback: SteamCreatable {
    typealias SteamType = CSteamworks.RequestPlayersForGameResultCallback_t
    init(_ steam: CSteamworks.RequestPlayersForGameResultCallback_t) {
        result = .init(steam.m_eResult)
        searchID = .init(steam.m_ullSearchID)
        playerFound = .init(steam.m_SteamIDPlayerFound)
        lobby = .init(steam.m_SteamIDLobby)
        playerAcceptState = .init(steam.m_ePlayerAcceptState)
        playerIndex = .init(steam.m_nPlayerIndex)
        totalPlayersFound = .init(steam.m_nTotalPlayersFound)
        totalPlayersAcceptedGame = .init(steam.m_nTotalPlayersAcceptedGame)
        suggestedTeamIndex = .init(steam.m_nSuggestedTeamIndex)
        uniqueGameID = .init(steam.m_ullUniqueGameID)
    }
}

/// Steamworks `ReservationNotificationCallback_t`
public struct ReservationNotificationCallback {
    /// Steamworks `m_ulBeaconID`
    public let beaconID: PartyBeaconID
    /// Steamworks `m_steamIDJoiner`
    public let joiner: SteamID

    /// Create a customized `ReservationNotificationCallback`
    public init(beaconID: PartyBeaconID = 0, joiner: SteamID = SteamID()) {
        self.beaconID = beaconID
        self.joiner = joiner
    }
}

extension ReservationNotificationCallback: SteamCreatable {
    typealias SteamType = CSteamworks.ReservationNotificationCallback_t
    init(_ steam: CSteamworks.ReservationNotificationCallback_t) {
        beaconID = .init(steam.m_ulBeaconID)
        joiner = .init(steam.m_steamIDJoiner)
    }
}

/// Steamworks `ScreenshotReady_t`
public struct ScreenshotReady {
    /// Steamworks `m_hLocal`
    public let local: ScreenshotHandle
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `ScreenshotReady`
    public init(local: ScreenshotHandle = 0, result: Result = .none) {
        self.local = local
        self.result = result
    }
}

extension ScreenshotReady: SteamCreatable {
    typealias SteamType = CSteamworks.ScreenshotReady_t
    init(_ steam: CSteamworks.ScreenshotReady_t) {
        local = .init(steam.m_hLocal)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `ScreenshotRequested_t`
public struct ScreenshotRequested {
    /// Create a customized `ScreenshotRequested`
    public init() {
    }
}

extension ScreenshotRequested: SteamCreatable {
    typealias SteamType = CSteamworks.ScreenshotRequested_t
    init(_ steam: CSteamworks.ScreenshotRequested_t) {
    }
}

/// Steamworks `SearchForGameProgressCallback_t`
public struct SearchForGameProgressCallback {
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_lobbyID`
    public let id: SteamID
    /// Steamworks `m_steamIDEndedSearch`
    public let endedSearch: SteamID
    /// Steamworks `m_nSecondsRemainingEstimate`
    public let secondsRemainingEstimate: Int
    /// Steamworks `m_cPlayersSearching`
    public let playersSearching: Int

    /// Create a customized `SearchForGameProgressCallback`
    public init(searchID: UInt64 = 0, result: Result = .none, id: SteamID = SteamID(), endedSearch: SteamID = SteamID(), secondsRemainingEstimate: Int = 0, playersSearching: Int = 0) {
        self.searchID = searchID
        self.result = result
        self.id = id
        self.endedSearch = endedSearch
        self.secondsRemainingEstimate = secondsRemainingEstimate
        self.playersSearching = playersSearching
    }
}

extension SearchForGameProgressCallback: SteamCreatable {
    typealias SteamType = CSteamworks.SearchForGameProgressCallback_t
    init(_ steam: CSteamworks.SearchForGameProgressCallback_t) {
        searchID = .init(steam.m_ullSearchID)
        result = .init(steam.m_eResult)
        id = .init(steam.m_lobbyID)
        endedSearch = .init(steam.m_steamIDEndedSearch)
        secondsRemainingEstimate = .init(steam.m_nSecondsRemainingEstimate)
        playersSearching = .init(steam.m_cPlayersSearching)
    }
}

/// Steamworks `SearchForGameResultCallback_t`
public struct SearchForGameResultCallback {
    /// Steamworks `m_ullSearchID`
    public let searchID: UInt64
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nCountPlayersInGame`
    public let countPlayersInGame: Int
    /// Steamworks `m_nCountAcceptedGame`
    public let countAcceptedGame: Int
    /// Steamworks `m_steamIDHost`
    public let host: SteamID
    /// Steamworks `m_bFinalCallback`
    public let finalCallback: Bool

    /// Create a customized `SearchForGameResultCallback`
    public init(searchID: UInt64 = 0, result: Result = .none, countPlayersInGame: Int = 0, countAcceptedGame: Int = 0, host: SteamID = SteamID(), finalCallback: Bool = false) {
        self.searchID = searchID
        self.result = result
        self.countPlayersInGame = countPlayersInGame
        self.countAcceptedGame = countAcceptedGame
        self.host = host
        self.finalCallback = finalCallback
    }
}

extension SearchForGameResultCallback: SteamCreatable {
    typealias SteamType = CSteamworks.SearchForGameResultCallback_t
    init(_ steam: CSteamworks.SearchForGameResultCallback_t) {
        searchID = .init(steam.m_ullSearchID)
        result = .init(steam.m_eResult)
        countPlayersInGame = .init(steam.m_nCountPlayersInGame)
        countAcceptedGame = .init(steam.m_nCountAcceptedGame)
        host = .init(steam.m_steamIDHost)
        finalCallback = .init(steam.m_bFinalCallback)
    }
}

/// Steamworks `SetPersonaNameResponse_t`
public struct SetPersonaNameResponse {
    /// Steamworks `m_bSuccess`
    public let success: Bool
    /// Steamworks `m_bLocalSuccess`
    public let localSuccess: Bool
    /// Steamworks `m_result`
    public let result: Result

    /// Create a customized `SetPersonaNameResponse`
    public init(success: Bool = false, localSuccess: Bool = false, result: Result = .none) {
        self.success = success
        self.localSuccess = localSuccess
        self.result = result
    }
}

extension SetPersonaNameResponse: SteamCreatable {
    typealias SteamType = CSteamworks.SetPersonaNameResponse_t
    init(_ steam: CSteamworks.SetPersonaNameResponse_t) {
        success = .init(steam.m_bSuccess)
        localSuccess = .init(steam.m_bLocalSuccess)
        result = .init(steam.m_result)
    }
}

/// Steamworks `SetUserItemVoteResult_t`
public struct SetUserItemVoteResult {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_bVoteUp`
    public let voteUp: Bool

    /// Create a customized `SetUserItemVoteResult`
    public init(publishedFileId: PublishedFileID = 0, result: Result = .none, voteUp: Bool = false) {
        self.publishedFileId = publishedFileId
        self.result = result
        self.voteUp = voteUp
    }
}

extension SetUserItemVoteResult: SteamCreatable {
    typealias SteamType = CSteamworks.SetUserItemVoteResult_t
    init(_ steam: CSteamworks.SetUserItemVoteResult_t) {
        publishedFileId = .init(steam.m_nPublishedFileId)
        result = .init(steam.m_eResult)
        voteUp = .init(steam.m_bVoteUp)
    }
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

    /// Create a customized `SocketStatusCallback`
    public init(socket: SNetSocket = 0, listenSocket: SNetListenSocket = 0, remote: SteamID = SteamID(), sNetSocketState: Int = 0) {
        self.socket = socket
        self.listenSocket = listenSocket
        self.remote = remote
        self.sNetSocketState = sNetSocketState
    }
}

extension SocketStatusCallback: SteamCreatable {
    typealias SteamType = CSteamworks.SocketStatusCallback_t
    init(_ steam: CSteamworks.SocketStatusCallback_t) {
        socket = .init(steam.m_hSocket)
        listenSocket = .init(steam.m_hListenSocket)
        remote = .init(steam.m_steamIDRemote)
        sNetSocketState = .init(steam.m_eSNetSocketState)
    }
}

/// Steamworks `StartPlaytimeTrackingResult_t`
public struct StartPlaytimeTrackingResult {
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `StartPlaytimeTrackingResult`
    public init(result: Result = .none) {
        self.result = result
    }
}

extension StartPlaytimeTrackingResult: SteamCreatable {
    typealias SteamType = CSteamworks.StartPlaytimeTrackingResult_t
    init(_ steam: CSteamworks.StartPlaytimeTrackingResult_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `SteamAPICallCompleted_t`
public struct SteamAPICallCompleted {
    /// Steamworks `m_hAsyncCall`
    public let asyncCall: SteamAPICall
    /// Steamworks `m_iCallback`
    public let callbackIndex: Int
    /// Steamworks `m_cubParam`
    public let paramSize: Int

    /// Create a customized `SteamAPICallCompleted`
    public init(asyncCall: SteamAPICall = 0, callbackIndex: Int = 0, paramSize: Int = 0) {
        self.asyncCall = asyncCall
        self.callbackIndex = callbackIndex
        self.paramSize = paramSize
    }
}

extension SteamAPICallCompleted: SteamCreatable {
    typealias SteamType = CSteamworks.SteamAPICallCompleted_t
    init(_ steam: CSteamworks.SteamAPICallCompleted_t) {
        asyncCall = .init(steam.m_hAsyncCall)
        callbackIndex = .init(steam.m_iCallback)
        paramSize = .init(steam.m_cubParam)
    }
}

/// Steamworks `SteamAppInstalled_t`
public struct SteamAppInstalled {
    /// Steamworks `m_nAppID`
    public let appID: AppID
    /// Steamworks `m_iInstallFolderIndex`
    public let installFolderIndex: Int

    /// Create a customized `SteamAppInstalled`
    public init(appID: AppID = 0, installFolderIndex: Int = 0) {
        self.appID = appID
        self.installFolderIndex = installFolderIndex
    }
}

extension SteamAppInstalled: SteamCreatable {
    typealias SteamType = CSteamworks.SteamAppInstalled_t
    init(_ steam: CSteamworks.SteamAppInstalled_t) {
        appID = .init(steam.m_nAppID)
        installFolderIndex = .init(steam.m_iInstallFolderIndex)
    }
}

/// Steamworks `SteamAppUninstalled_t`
public struct SteamAppUninstalled {
    /// Steamworks `m_nAppID`
    public let appID: AppID
    /// Steamworks `m_iInstallFolderIndex`
    public let installFolderIndex: Int

    /// Create a customized `SteamAppUninstalled`
    public init(appID: AppID = 0, installFolderIndex: Int = 0) {
        self.appID = appID
        self.installFolderIndex = installFolderIndex
    }
}

extension SteamAppUninstalled: SteamCreatable {
    typealias SteamType = CSteamworks.SteamAppUninstalled_t
    init(_ steam: CSteamworks.SteamAppUninstalled_t) {
        appID = .init(steam.m_nAppID)
        installFolderIndex = .init(steam.m_iInstallFolderIndex)
    }
}

/// Steamworks `SteamInputConfigurationLoaded_t`
public struct SteamInputConfigurationLoaded {
    /// Steamworks `m_unAppID`
    public let appID: AppID
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

    /// Create a customized `SteamInputConfigurationLoaded`
    public init(appID: AppID = 0, deviceHandle: InputHandle = 0, mappingCreator: SteamID = SteamID(), majorRevision: Int = 0, minorRevision: Int = 0, usesSteamInputAPI: Bool = false, usesGamepadAPI: Bool = false) {
        self.appID = appID
        self.deviceHandle = deviceHandle
        self.mappingCreator = mappingCreator
        self.majorRevision = majorRevision
        self.minorRevision = minorRevision
        self.usesSteamInputAPI = usesSteamInputAPI
        self.usesGamepadAPI = usesGamepadAPI
    }
}

extension SteamInputConfigurationLoaded: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInputConfigurationLoaded_t
    init(_ steam: CSteamworks.SteamInputConfigurationLoaded_t) {
        appID = .init(steam.m_unAppID)
        deviceHandle = .init(steam.m_ulDeviceHandle)
        mappingCreator = .init(steam.m_ulMappingCreator)
        majorRevision = .init(steam.m_unMajorRevision)
        minorRevision = .init(steam.m_unMinorRevision)
        usesSteamInputAPI = .init(steam.m_bUsesSteamInputAPI)
        usesGamepadAPI = .init(steam.m_bUsesGamepadAPI)
    }
}

/// Steamworks `SteamInputDeviceConnected_t`
public struct SteamInputDeviceConnected {
    /// Steamworks `m_ulConnectedDeviceHandle`
    public let connectedDeviceHandle: InputHandle

    /// Create a customized `SteamInputDeviceConnected`
    public init(connectedDeviceHandle: InputHandle = 0) {
        self.connectedDeviceHandle = connectedDeviceHandle
    }
}

extension SteamInputDeviceConnected: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInputDeviceConnected_t
    init(_ steam: CSteamworks.SteamInputDeviceConnected_t) {
        connectedDeviceHandle = .init(steam.m_ulConnectedDeviceHandle)
    }
}

/// Steamworks `SteamInputDeviceDisconnected_t`
public struct SteamInputDeviceDisconnected {
    /// Steamworks `m_ulDisconnectedDeviceHandle`
    public let disconnectedDeviceHandle: InputHandle

    /// Create a customized `SteamInputDeviceDisconnected`
    public init(disconnectedDeviceHandle: InputHandle = 0) {
        self.disconnectedDeviceHandle = disconnectedDeviceHandle
    }
}

extension SteamInputDeviceDisconnected: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInputDeviceDisconnected_t
    init(_ steam: CSteamworks.SteamInputDeviceDisconnected_t) {
        disconnectedDeviceHandle = .init(steam.m_ulDisconnectedDeviceHandle)
    }
}

/// Steamworks `SteamInventoryDefinitionUpdate_t`
public struct SteamInventoryDefinitionUpdate {
    /// Create a customized `SteamInventoryDefinitionUpdate`
    public init() {
    }
}

extension SteamInventoryDefinitionUpdate: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInventoryDefinitionUpdate_t
    init(_ steam: CSteamworks.SteamInventoryDefinitionUpdate_t) {
    }
}

/// Steamworks `SteamInventoryEligiblePromoItemDefIDs_t`
public struct SteamInventoryEligiblePromoItemDefIDs {
    /// Steamworks `m_result`
    public let result: Result
    /// Steamworks `m_steamID`
    public let steamID: SteamID
    /// Steamworks `m_numEligiblePromoItemDefs`
    public let eligiblePromoItemDefs: Int
    /// Steamworks `m_bCachedData`
    public let cachedData: Bool

    /// Create a customized `SteamInventoryEligiblePromoItemDefIDs`
    public init(result: Result = .none, steamID: SteamID = SteamID(), eligiblePromoItemDefs: Int = 0, cachedData: Bool = false) {
        self.result = result
        self.steamID = steamID
        self.eligiblePromoItemDefs = eligiblePromoItemDefs
        self.cachedData = cachedData
    }
}

extension SteamInventoryEligiblePromoItemDefIDs: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInventoryEligiblePromoItemDefIDs_t
    init(_ steam: CSteamworks.SteamInventoryEligiblePromoItemDefIDs_t) {
        result = .init(steam.m_result)
        steamID = .init(steam.m_steamID)
        eligiblePromoItemDefs = .init(steam.m_numEligiblePromoItemDefs)
        cachedData = .init(steam.m_bCachedData)
    }
}

/// Steamworks `SteamInventoryFullUpdate_t`
public struct SteamInventoryFullUpdate {
    /// Steamworks `m_handle`
    public let handle: SteamInventoryResult

    /// Create a customized `SteamInventoryFullUpdate`
    public init(handle: SteamInventoryResult = 0) {
        self.handle = handle
    }
}

extension SteamInventoryFullUpdate: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInventoryFullUpdate_t
    init(_ steam: CSteamworks.SteamInventoryFullUpdate_t) {
        handle = .init(steam.m_handle)
    }
}

/// Steamworks `SteamInventoryRequestPricesResult_t`
public struct SteamInventoryRequestPricesResult {
    /// Steamworks `m_result`
    public let result: Result
    /// Steamworks `m_rgchCurrency`
    public let currency: String

    /// Create a customized `SteamInventoryRequestPricesResult`
    public init(result: Result = .none, currency: String = "") {
        self.result = result
        self.currency = currency
    }
}

extension SteamInventoryRequestPricesResult: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInventoryRequestPricesResult_t
    init(_ steam: CSteamworks.SteamInventoryRequestPricesResult_t) {
        result = .init(steam.m_result)
        currency = .init(steam.m_rgchCurrency_ptr)
    }
}

/// Steamworks `SteamInventoryResultReady_t`
public struct SteamInventoryResultReady {
    /// Steamworks `m_handle`
    public let handle: SteamInventoryResult
    /// Steamworks `m_result`
    public let result: Result

    /// Create a customized `SteamInventoryResultReady`
    public init(handle: SteamInventoryResult = 0, result: Result = .none) {
        self.handle = handle
        self.result = result
    }
}

extension SteamInventoryResultReady: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInventoryResultReady_t
    init(_ steam: CSteamworks.SteamInventoryResultReady_t) {
        handle = .init(steam.m_handle)
        result = .init(steam.m_result)
    }
}

/// Steamworks `SteamInventoryStartPurchaseResult_t`
public struct SteamInventoryStartPurchaseResult {
    /// Steamworks `m_result`
    public let result: Result
    /// Steamworks `m_ulOrderID`
    public let orderID: UInt64
    /// Steamworks `m_ulTransID`
    public let transID: UInt64

    /// Create a customized `SteamInventoryStartPurchaseResult`
    public init(result: Result = .none, orderID: UInt64 = 0, transID: UInt64 = 0) {
        self.result = result
        self.orderID = orderID
        self.transID = transID
    }
}

extension SteamInventoryStartPurchaseResult: SteamCreatable {
    typealias SteamType = CSteamworks.SteamInventoryStartPurchaseResult_t
    init(_ steam: CSteamworks.SteamInventoryStartPurchaseResult_t) {
        result = .init(steam.m_result)
        orderID = .init(steam.m_ulOrderID)
        transID = .init(steam.m_ulTransID)
    }
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
    public let flags: SteamItemFlags

    /// Create a customized `SteamItemDetails`
    public init(id: SteamItemInstanceID = 0, definitionIndex: SteamItemDef = 0, quantity: Int = 0, flags: SteamItemFlags = []) {
        self.id = id
        self.definitionIndex = definitionIndex
        self.quantity = quantity
        self.flags = flags
    }
}

extension SteamItemDetails: SteamCreatable {
    typealias SteamType = CSteamworks.SteamItemDetails_t
    init(_ steam: CSteamworks.SteamItemDetails_t) {
        id = .init(steam.m_itemId)
        definitionIndex = .init(steam.m_iDefinition)
        quantity = .init(steam.m_unQuantity)
        flags = .init(steam.m_unFlags)
    }
}

/// Steamworks `SteamNetAuthenticationStatus_t`
public struct SteamNetAuthenticationStatus {
    /// Steamworks `m_eAvail`
    public let avail: SteamNetworkingAvailability
    /// Steamworks `m_debugMsg`
    public let debugMsg: String

    /// Create a customized `SteamNetAuthenticationStatus`
    public init(avail: SteamNetworkingAvailability = .cannotTry, debugMsg: String = "") {
        self.avail = avail
        self.debugMsg = debugMsg
    }
}

extension SteamNetAuthenticationStatus: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetAuthenticationStatus_t
    init(_ steam: CSteamworks.SteamNetAuthenticationStatus_t) {
        avail = .init(steam.m_eAvail)
        debugMsg = .init(steam.m_debugMsg_ptr)
    }
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
    public let flags: SteamNetworkConnectionInfoFlags

    /// Create a customized `SteamNetConnectionInfo`
    public init(identityRemote: SteamNetworkingIdentity = SteamNetworkingIdentity(), userData: Int = 0, listenSocket: HSteamListenSocket = 0, addrRemote: SteamNetworkingIPAddr = SteamNetworkingIPAddr(), popRemote: SteamNetworkingPOPID = 0, popRelay: SteamNetworkingPOPID = 0, state: SteamNetworkingConnectionState = .none, endReason: Int = 0, endDebug: String = "", connectionDescription: String = "", flags: SteamNetworkConnectionInfoFlags = []) {
        self.identityRemote = identityRemote
        self.userData = userData
        self.listenSocket = listenSocket
        self.addrRemote = addrRemote
        self.popRemote = popRemote
        self.popRelay = popRelay
        self.state = state
        self.endReason = endReason
        self.endDebug = endDebug
        self.connectionDescription = connectionDescription
        self.flags = flags
    }
}

extension SteamNetConnectionInfo: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetConnectionInfo_t
    init(_ steam: CSteamworks.SteamNetConnectionInfo_t) {
        identityRemote = .init(steam.m_identityRemote)
        userData = .init(steam.m_nUserData)
        listenSocket = .init(steam.m_hListenSocket)
        addrRemote = .init(steam.m_addrRemote)
        popRemote = .init(steam.m_idPOPRemote)
        popRelay = .init(steam.m_idPOPRelay)
        state = .init(steam.m_eState)
        endReason = .init(steam.m_eEndReason)
        endDebug = .init(steam.m_szEndDebug_ptr)
        connectionDescription = .init(steam.m_szConnectionDescription_ptr)
        flags = .init(steam.m_nFlags)
    }
}

/// Steamworks `SteamNetConnectionRealTimeLaneStatus_t`
public struct SteamNetConnectionRealTimeLaneStatus {
    /// Steamworks `m_cbPendingUnreliable`
    public let pendingUnreliableSize: Int
    /// Steamworks `m_cbPendingReliable`
    public let pendingReliableSize: Int
    /// Steamworks `m_cbSentUnackedReliable`
    public let sentUnackedReliableSize: Int
    /// Steamworks `m_usecQueueTime`
    public let queueTime: SteamNetworkingMicroseconds

    /// Create a customized `SteamNetConnectionRealTimeLaneStatus`
    public init(pendingUnreliableSize: Int = 0, pendingReliableSize: Int = 0, sentUnackedReliableSize: Int = 0, queueTime: SteamNetworkingMicroseconds = 0) {
        self.pendingUnreliableSize = pendingUnreliableSize
        self.pendingReliableSize = pendingReliableSize
        self.sentUnackedReliableSize = sentUnackedReliableSize
        self.queueTime = queueTime
    }
}

extension SteamNetConnectionRealTimeLaneStatus: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetConnectionRealTimeLaneStatus_t
    init(_ steam: CSteamworks.SteamNetConnectionRealTimeLaneStatus_t) {
        pendingUnreliableSize = .init(steam.m_cbPendingUnreliable)
        pendingReliableSize = .init(steam.m_cbPendingReliable)
        sentUnackedReliableSize = .init(steam.m_cbSentUnackedReliable)
        queueTime = .init(steam.m_usecQueueTime)
    }
}

/// Steamworks `SteamNetConnectionRealTimeStatus_t`
public struct SteamNetConnectionRealTimeStatus {
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
    public let pendingUnreliableSize: Int
    /// Steamworks `m_cbPendingReliable`
    public let pendingReliableSize: Int
    /// Steamworks `m_cbSentUnackedReliable`
    public let sentUnackedReliableSize: Int
    /// Steamworks `m_usecQueueTime`
    public let queueTime: SteamNetworkingMicroseconds

    /// Create a customized `SteamNetConnectionRealTimeStatus`
    public init(state: SteamNetworkingConnectionState = .none, ping: Int = 0, connectionQualityLocal: Float = 0, connectionQualityRemote: Float = 0, outPacketsPerSec: Float = 0, outBytesPerSec: Float = 0, inPacketsPerSec: Float = 0, inBytesPerSec: Float = 0, sendRateBytesPerSecond: Int = 0, pendingUnreliableSize: Int = 0, pendingReliableSize: Int = 0, sentUnackedReliableSize: Int = 0, queueTime: SteamNetworkingMicroseconds = 0) {
        self.state = state
        self.ping = ping
        self.connectionQualityLocal = connectionQualityLocal
        self.connectionQualityRemote = connectionQualityRemote
        self.outPacketsPerSec = outPacketsPerSec
        self.outBytesPerSec = outBytesPerSec
        self.inPacketsPerSec = inPacketsPerSec
        self.inBytesPerSec = inBytesPerSec
        self.sendRateBytesPerSecond = sendRateBytesPerSecond
        self.pendingUnreliableSize = pendingUnreliableSize
        self.pendingReliableSize = pendingReliableSize
        self.sentUnackedReliableSize = sentUnackedReliableSize
        self.queueTime = queueTime
    }
}

extension SteamNetConnectionRealTimeStatus: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetConnectionRealTimeStatus_t
    init(_ steam: CSteamworks.SteamNetConnectionRealTimeStatus_t) {
        state = .init(steam.m_eState)
        ping = .init(steam.m_nPing)
        connectionQualityLocal = .init(steam.m_flConnectionQualityLocal)
        connectionQualityRemote = .init(steam.m_flConnectionQualityRemote)
        outPacketsPerSec = .init(steam.m_flOutPacketsPerSec)
        outBytesPerSec = .init(steam.m_flOutBytesPerSec)
        inPacketsPerSec = .init(steam.m_flInPacketsPerSec)
        inBytesPerSec = .init(steam.m_flInBytesPerSec)
        sendRateBytesPerSecond = .init(steam.m_nSendRateBytesPerSecond)
        pendingUnreliableSize = .init(steam.m_cbPendingUnreliable)
        pendingReliableSize = .init(steam.m_cbPendingReliable)
        sentUnackedReliableSize = .init(steam.m_cbSentUnackedReliable)
        queueTime = .init(steam.m_usecQueueTime)
    }
}

/// Steamworks `SteamNetConnectionStatusChangedCallback_t`
public struct SteamNetConnectionStatusChangedCallback {
    /// Steamworks `m_hConn`
    public let conn: HSteamNetConnection
    /// Steamworks `m_info`
    public let info: SteamNetConnectionInfo
    /// Steamworks `m_eOldState`
    public let oldState: SteamNetworkingConnectionState

    /// Create a customized `SteamNetConnectionStatusChangedCallback`
    public init(conn: HSteamNetConnection = 0, info: SteamNetConnectionInfo = SteamNetConnectionInfo(), oldState: SteamNetworkingConnectionState = .none) {
        self.conn = conn
        self.info = info
        self.oldState = oldState
    }
}

extension SteamNetConnectionStatusChangedCallback: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetConnectionStatusChangedCallback_t
    init(_ steam: CSteamworks.SteamNetConnectionStatusChangedCallback_t) {
        conn = .init(steam.m_hConn)
        info = .init(steam.m_info)
        oldState = .init(steam.m_eOldState)
    }
}

/// Steamworks `SteamNetworkPingLocation_t`
public struct SteamNetworkPingLocation {
    /// Steamworks `m_data`
    public let data: [UInt8]

    /// Create a customized `SteamNetworkPingLocation`
    public init(data: [UInt8] = []) {
        self.data = data
    }
}

extension SteamNetworkPingLocation: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetworkPingLocation_t
    init(_ steam: CSteamworks.SteamNetworkPingLocation_t) {
        data = .init(steam.m_data_ptr, 512)
    }
}

extension CSteamworks.SteamNetworkPingLocation_t : SwiftCreatable {
    init(_ swift: SteamNetworkPingLocation) {
        self.init()
        self.copy_m_data(from: swift.data)
    }
}

/// Steamworks `SteamNetworkingFakeIPResult_t`
public struct SteamNetworkingFakeIPResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_identity`
    public let identity: SteamNetworkingIdentity
    /// Steamworks `m_unIP`
    public let ip: Int
    /// Steamworks `m_unPorts`
    public let ports: [Int]

    /// Create a customized `SteamNetworkingFakeIPResult`
    public init(result: Result = .none, identity: SteamNetworkingIdentity = SteamNetworkingIdentity(), ip: Int = 0, ports: [Int] = []) {
        self.result = result
        self.identity = identity
        self.ip = ip
        self.ports = ports
    }
}

extension SteamNetworkingFakeIPResult: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetworkingFakeIPResult_t
    init(_ steam: CSteamworks.SteamNetworkingFakeIPResult_t) {
        result = .init(steam.m_eResult)
        identity = .init(steam.m_identity)
        ip = .init(steam.m_unIP)
        ports = .init(steam.m_unPorts_ptr, 8) { .init($0) }
    }
}

/// Steamworks `SteamNetworkingMessagesSessionFailed_t`
public struct SteamNetworkingMessagesSessionFailed {
    /// Steamworks `m_info`
    public let info: SteamNetConnectionInfo

    /// Create a customized `SteamNetworkingMessagesSessionFailed`
    public init(info: SteamNetConnectionInfo = SteamNetConnectionInfo()) {
        self.info = info
    }
}

extension SteamNetworkingMessagesSessionFailed: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetworkingMessagesSessionFailed_t
    init(_ steam: CSteamworks.SteamNetworkingMessagesSessionFailed_t) {
        info = .init(steam.m_info)
    }
}

/// Steamworks `SteamNetworkingMessagesSessionRequest_t`
public struct SteamNetworkingMessagesSessionRequest {
    /// Steamworks `m_identityRemote`
    public let identityRemote: SteamNetworkingIdentity

    /// Create a customized `SteamNetworkingMessagesSessionRequest`
    public init(identityRemote: SteamNetworkingIdentity = SteamNetworkingIdentity()) {
        self.identityRemote = identityRemote
    }
}

extension SteamNetworkingMessagesSessionRequest: SteamCreatable {
    typealias SteamType = CSteamworks.SteamNetworkingMessagesSessionRequest_t
    init(_ steam: CSteamworks.SteamNetworkingMessagesSessionRequest_t) {
        identityRemote = .init(steam.m_identityRemote)
    }
}

/// Steamworks `SteamParentalSettingsChanged_t`
public struct SteamParentalSettingsChanged {
    /// Create a customized `SteamParentalSettingsChanged`
    public init() {
    }
}

extension SteamParentalSettingsChanged: SteamCreatable {
    typealias SteamType = CSteamworks.SteamParentalSettingsChanged_t
    init(_ steam: CSteamworks.SteamParentalSettingsChanged_t) {
    }
}

/// Steamworks `SteamPartyBeaconLocation_t`
public struct SteamPartyBeaconLocation {
    /// Steamworks `m_eType`
    public let type: SteamPartyBeaconLocationType
    /// Steamworks `m_ulLocationID`
    public let locationID: UInt64

    /// Create a customized `SteamPartyBeaconLocation`
    public init(type: SteamPartyBeaconLocationType = .invalid, locationID: UInt64 = 0) {
        self.type = type
        self.locationID = locationID
    }
}

extension SteamPartyBeaconLocation: SteamCreatable {
    typealias SteamType = CSteamworks.SteamPartyBeaconLocation_t
    init(_ steam: CSteamworks.SteamPartyBeaconLocation_t) {
        type = .init(steam.m_eType)
        locationID = .init(steam.m_ulLocationID)
    }
}

extension CSteamworks.SteamPartyBeaconLocation_t : SwiftCreatable {
    init(_ swift: SteamPartyBeaconLocation) {
        self.init()
        m_eType = .init(swift.type)
        m_ulLocationID = .init(swift.locationID)
    }
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

    /// Create a customized `SteamRelayNetworkStatus`
    public init(avail: SteamNetworkingAvailability = .cannotTry, pingMeasurementInProgress: Bool = false, availNetworkConfig: SteamNetworkingAvailability = .cannotTry, availAnyRelay: SteamNetworkingAvailability = .cannotTry, debugMsg: String = "") {
        self.avail = avail
        self.pingMeasurementInProgress = pingMeasurementInProgress
        self.availNetworkConfig = availNetworkConfig
        self.availAnyRelay = availAnyRelay
        self.debugMsg = debugMsg
    }
}

extension SteamRelayNetworkStatus: SteamCreatable {
    typealias SteamType = CSteamworks.SteamRelayNetworkStatus_t
    init(_ steam: CSteamworks.SteamRelayNetworkStatus_t) {
        avail = .init(steam.m_eAvail)
        pingMeasurementInProgress = .init(steam.m_bPingMeasurementInProgress)
        availNetworkConfig = .init(steam.m_eAvailNetworkConfig)
        availAnyRelay = .init(steam.m_eAvailAnyRelay)
        debugMsg = .init(steam.m_debugMsg_ptr)
    }
}

/// Steamworks `SteamRemotePlaySessionConnected_t`
public struct SteamRemotePlaySessionConnected {
    /// Steamworks `m_unSessionID`
    public let sessionID: RemotePlaySessionID

    /// Create a customized `SteamRemotePlaySessionConnected`
    public init(sessionID: RemotePlaySessionID = 0) {
        self.sessionID = sessionID
    }
}

extension SteamRemotePlaySessionConnected: SteamCreatable {
    typealias SteamType = CSteamworks.SteamRemotePlaySessionConnected_t
    init(_ steam: CSteamworks.SteamRemotePlaySessionConnected_t) {
        sessionID = .init(steam.m_unSessionID)
    }
}

/// Steamworks `SteamRemotePlaySessionDisconnected_t`
public struct SteamRemotePlaySessionDisconnected {
    /// Steamworks `m_unSessionID`
    public let sessionID: RemotePlaySessionID

    /// Create a customized `SteamRemotePlaySessionDisconnected`
    public init(sessionID: RemotePlaySessionID = 0) {
        self.sessionID = sessionID
    }
}

extension SteamRemotePlaySessionDisconnected: SteamCreatable {
    typealias SteamType = CSteamworks.SteamRemotePlaySessionDisconnected_t
    init(_ steam: CSteamworks.SteamRemotePlaySessionDisconnected_t) {
        sessionID = .init(steam.m_unSessionID)
    }
}

/// Steamworks `SteamServerConnectFailure_t`
public struct SteamServerConnectFailure {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_bStillRetrying`
    public let stillRetrying: Bool

    /// Create a customized `SteamServerConnectFailure`
    public init(result: Result = .none, stillRetrying: Bool = false) {
        self.result = result
        self.stillRetrying = stillRetrying
    }
}

extension SteamServerConnectFailure: SteamCreatable {
    typealias SteamType = CSteamworks.SteamServerConnectFailure_t
    init(_ steam: CSteamworks.SteamServerConnectFailure_t) {
        result = .init(steam.m_eResult)
        stillRetrying = .init(steam.m_bStillRetrying)
    }
}

/// Steamworks `SteamServersConnected_t`
public struct SteamServersConnected {
    /// Create a customized `SteamServersConnected`
    public init() {
    }
}

extension SteamServersConnected: SteamCreatable {
    typealias SteamType = CSteamworks.SteamServersConnected_t
    init(_ steam: CSteamworks.SteamServersConnected_t) {
    }
}

/// Steamworks `SteamServersDisconnected_t`
public struct SteamServersDisconnected {
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `SteamServersDisconnected`
    public init(result: Result = .none) {
        self.result = result
    }
}

extension SteamServersDisconnected: SteamCreatable {
    typealias SteamType = CSteamworks.SteamServersDisconnected_t
    init(_ steam: CSteamworks.SteamServersDisconnected_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `SteamShutdown_t`
public struct SteamShutdown {
    /// Create a customized `SteamShutdown`
    public init() {
    }
}

extension SteamShutdown: SteamCreatable {
    typealias SteamType = CSteamworks.SteamShutdown_t
    init(_ steam: CSteamworks.SteamShutdown_t) {
    }
}

/// Steamworks `SteamUGCDetails_t`
public struct SteamUGCDetails {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_eFileType`
    public let fileType: WorkshopFileType
    /// Steamworks `m_nCreatorAppID`
    public let creatorAppID: AppID
    /// Steamworks `m_nConsumerAppID`
    public let consumerAppID: AppID
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

    /// Create a customized `SteamUGCDetails`
    public init(publishedFileId: PublishedFileID = 0, result: Result = .none, fileType: WorkshopFileType = .first, creatorAppID: AppID = 0, consumerAppID: AppID = 0, title: String = "", description: String = "", steamIDOwner: SteamID = SteamID(), rtimeCreated: Int = 0, rtimeUpdated: Int = 0, rtimeAddedToUserList: Int = 0, visibility: RemoteStoragePublishedFileVisibility = .`public`, banned: Bool = false, acceptedForUse: Bool = false, tagsTruncated: Bool = false, tags: String = "", file: UGCHandle = 0, previewFile: UGCHandle = 0, fileName: String = "", fileSize: Int = 0, previewFileSize: Int = 0, url: String = "", votesUp: Int = 0, votesDown: Int = 0, score: Float = 0, numChildren: Int = 0) {
        self.publishedFileId = publishedFileId
        self.result = result
        self.fileType = fileType
        self.creatorAppID = creatorAppID
        self.consumerAppID = consumerAppID
        self.title = title
        self.description = description
        self.steamIDOwner = steamIDOwner
        self.rtimeCreated = rtimeCreated
        self.rtimeUpdated = rtimeUpdated
        self.rtimeAddedToUserList = rtimeAddedToUserList
        self.visibility = visibility
        self.banned = banned
        self.acceptedForUse = acceptedForUse
        self.tagsTruncated = tagsTruncated
        self.tags = tags
        self.file = file
        self.previewFile = previewFile
        self.fileName = fileName
        self.fileSize = fileSize
        self.previewFileSize = previewFileSize
        self.url = url
        self.votesUp = votesUp
        self.votesDown = votesDown
        self.score = score
        self.numChildren = numChildren
    }
}

extension SteamUGCDetails: SteamCreatable {
    typealias SteamType = CSteamworks.SteamUGCDetails_t
    init(_ steam: CSteamworks.SteamUGCDetails_t) {
        publishedFileId = .init(steam.m_nPublishedFileId)
        result = .init(steam.m_eResult)
        fileType = .init(steam.m_eFileType)
        creatorAppID = .init(steam.m_nCreatorAppID)
        consumerAppID = .init(steam.m_nConsumerAppID)
        title = .init(steam.m_rgchTitle_ptr)
        description = .init(steam.m_rgchDescription_ptr)
        steamIDOwner = .init(steam.m_ulSteamIDOwner)
        rtimeCreated = .init(steam.m_rtimeCreated)
        rtimeUpdated = .init(steam.m_rtimeUpdated)
        rtimeAddedToUserList = .init(steam.m_rtimeAddedToUserList)
        visibility = .init(steam.m_eVisibility)
        banned = .init(steam.m_bBanned)
        acceptedForUse = .init(steam.m_bAcceptedForUse)
        tagsTruncated = .init(steam.m_bTagsTruncated)
        tags = .init(steam.m_rgchTags_ptr)
        file = .init(steam.m_hFile)
        previewFile = .init(steam.m_hPreviewFile)
        fileName = .init(steam.m_pchFileName_ptr)
        fileSize = .init(steam.m_nFileSize)
        previewFileSize = .init(steam.m_nPreviewFileSize)
        url = .init(steam.m_rgchURL_ptr)
        votesUp = .init(steam.m_unVotesUp)
        votesDown = .init(steam.m_unVotesDown)
        score = .init(steam.m_flScore)
        numChildren = .init(steam.m_unNumChildren)
    }
}

/// Steamworks `SteamUGCQueryCompleted_t`
public struct SteamUGCQueryCompleted {
    /// Steamworks `m_handle`
    public let handle: UGCQueryHandle
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_unNumResultsReturned`
    public let numResultsReturned: Int
    /// Steamworks `m_unTotalMatchingResults`
    public let totalMatchingResults: Int
    /// Steamworks `m_bCachedData`
    public let cachedData: Bool
    /// Steamworks `m_rgchNextCursor`
    public let nextCursor: String

    /// Create a customized `SteamUGCQueryCompleted`
    public init(handle: UGCQueryHandle = 0, result: Result = .none, numResultsReturned: Int = 0, totalMatchingResults: Int = 0, cachedData: Bool = false, nextCursor: String = "") {
        self.handle = handle
        self.result = result
        self.numResultsReturned = numResultsReturned
        self.totalMatchingResults = totalMatchingResults
        self.cachedData = cachedData
        self.nextCursor = nextCursor
    }
}

extension SteamUGCQueryCompleted: SteamCreatable {
    typealias SteamType = CSteamworks.SteamUGCQueryCompleted_t
    init(_ steam: CSteamworks.SteamUGCQueryCompleted_t) {
        handle = .init(steam.m_handle)
        result = .init(steam.m_eResult)
        numResultsReturned = .init(steam.m_unNumResultsReturned)
        totalMatchingResults = .init(steam.m_unTotalMatchingResults)
        cachedData = .init(steam.m_bCachedData)
        nextCursor = .init(steam.m_rgchNextCursor_ptr)
    }
}

/// Steamworks `SteamUGCRequestUGCDetailsResult_t`
public struct SteamUGCRequestUGCDetailsResult {
    /// Steamworks `m_details`
    public let details: SteamUGCDetails
    /// Steamworks `m_bCachedData`
    public let cachedData: Bool

    /// Create a customized `SteamUGCRequestUGCDetailsResult`
    public init(details: SteamUGCDetails = SteamUGCDetails(), cachedData: Bool = false) {
        self.details = details
        self.cachedData = cachedData
    }
}

extension SteamUGCRequestUGCDetailsResult: SteamCreatable {
    typealias SteamType = CSteamworks.SteamUGCRequestUGCDetailsResult_t
    init(_ steam: CSteamworks.SteamUGCRequestUGCDetailsResult_t) {
        details = .init(steam.m_details)
        cachedData = .init(steam.m_bCachedData)
    }
}

/// Steamworks `StopPlaytimeTrackingResult_t`
public struct StopPlaytimeTrackingResult {
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `StopPlaytimeTrackingResult`
    public init(result: Result = .none) {
        self.result = result
    }
}

extension StopPlaytimeTrackingResult: SteamCreatable {
    typealias SteamType = CSteamworks.StopPlaytimeTrackingResult_t
    init(_ steam: CSteamworks.StopPlaytimeTrackingResult_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `StoreAuthURLResponse_t`
public struct StoreAuthURLResponse {
    /// Steamworks `m_szURL`
    public let url: String

    /// Create a customized `StoreAuthURLResponse`
    public init(url: String = "") {
        self.url = url
    }
}

extension StoreAuthURLResponse: SteamCreatable {
    typealias SteamType = CSteamworks.StoreAuthURLResponse_t
    init(_ steam: CSteamworks.StoreAuthURLResponse_t) {
        url = .init(steam.m_szURL_ptr)
    }
}

/// Steamworks `SubmitItemUpdateResult_t`
public struct SubmitItemUpdateResult {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_bUserNeedsToAcceptWorkshopLegalAgreement`
    public let userNeedsToAcceptWorkshopLegalAgreement: Bool
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID

    /// Create a customized `SubmitItemUpdateResult`
    public init(result: Result = .none, userNeedsToAcceptWorkshopLegalAgreement: Bool = false, publishedFileId: PublishedFileID = 0) {
        self.result = result
        self.userNeedsToAcceptWorkshopLegalAgreement = userNeedsToAcceptWorkshopLegalAgreement
        self.publishedFileId = publishedFileId
    }
}

extension SubmitItemUpdateResult: SteamCreatable {
    typealias SteamType = CSteamworks.SubmitItemUpdateResult_t
    init(_ steam: CSteamworks.SubmitItemUpdateResult_t) {
        result = .init(steam.m_eResult)
        userNeedsToAcceptWorkshopLegalAgreement = .init(steam.m_bUserNeedsToAcceptWorkshopLegalAgreement)
        publishedFileId = .init(steam.m_nPublishedFileId)
    }
}

/// Steamworks `SubmitPlayerResultResultCallback_t`
public struct SubmitPlayerResultResultCallback {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `ullUniqueGameID`
    public let uniqueGameID: GameID
    /// Steamworks `steamIDPlayer`
    public let player: SteamID

    /// Create a customized `SubmitPlayerResultResultCallback`
    public init(result: Result = .none, uniqueGameID: GameID = GameID(), player: SteamID = SteamID()) {
        self.result = result
        self.uniqueGameID = uniqueGameID
        self.player = player
    }
}

extension SubmitPlayerResultResultCallback: SteamCreatable {
    typealias SteamType = CSteamworks.SubmitPlayerResultResultCallback_t
    init(_ steam: CSteamworks.SubmitPlayerResultResultCallback_t) {
        result = .init(steam.m_eResult)
        uniqueGameID = .init(steam.ullUniqueGameID)
        player = .init(steam.steamIDPlayer)
    }
}

/// Steamworks `TimedTrialStatus_t`
public struct TimedTrialStatus {
    /// Steamworks `m_unAppID`
    public let appID: AppID
    /// Steamworks `m_bIsOffline`
    public let isOffline: Bool
    /// Steamworks `m_unSecondsAllowed`
    public let secondsAllowed: Int
    /// Steamworks `m_unSecondsPlayed`
    public let secondsPlayed: Int

    /// Create a customized `TimedTrialStatus`
    public init(appID: AppID = 0, isOffline: Bool = false, secondsAllowed: Int = 0, secondsPlayed: Int = 0) {
        self.appID = appID
        self.isOffline = isOffline
        self.secondsAllowed = secondsAllowed
        self.secondsPlayed = secondsPlayed
    }
}

extension TimedTrialStatus: SteamCreatable {
    typealias SteamType = CSteamworks.TimedTrialStatus_t
    init(_ steam: CSteamworks.TimedTrialStatus_t) {
        appID = .init(steam.m_unAppID)
        isOffline = .init(steam.m_bIsOffline)
        secondsAllowed = .init(steam.m_unSecondsAllowed)
        secondsPlayed = .init(steam.m_unSecondsPlayed)
    }
}

/// Steamworks `UnreadChatMessagesChanged_t`
public struct UnreadChatMessagesChanged {
    /// Create a customized `UnreadChatMessagesChanged`
    public init() {
    }
}

extension UnreadChatMessagesChanged: SteamCreatable {
    typealias SteamType = CSteamworks.UnreadChatMessagesChanged_t
    init(_ steam: CSteamworks.UnreadChatMessagesChanged_t) {
    }
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

    /// Create a customized `UserAchievementIconFetched`
    public init(gameID: GameID = GameID(), achievementName: String = "", achieved: Bool = false, iconHandle: Int = 0) {
        self.gameID = gameID
        self.achievementName = achievementName
        self.achieved = achieved
        self.iconHandle = iconHandle
    }
}

extension UserAchievementIconFetched: SteamCreatable {
    typealias SteamType = CSteamworks.UserAchievementIconFetched_t
    init(_ steam: CSteamworks.UserAchievementIconFetched_t) {
        gameID = .init(steam.m_nGameID)
        achievementName = .init(steam.m_rgchAchievementName_ptr)
        achieved = .init(steam.m_bAchieved)
        iconHandle = .init(steam.m_nIconHandle)
    }
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

    /// Create a customized `UserAchievementStored`
    public init(gameID: GameID = GameID(), groupAchievement: Bool = false, achievementName: String = "", curProgress: Int = 0, maxProgress: Int = 0) {
        self.gameID = gameID
        self.groupAchievement = groupAchievement
        self.achievementName = achievementName
        self.curProgress = curProgress
        self.maxProgress = maxProgress
    }
}

extension UserAchievementStored: SteamCreatable {
    typealias SteamType = CSteamworks.UserAchievementStored_t
    init(_ steam: CSteamworks.UserAchievementStored_t) {
        gameID = .init(steam.m_nGameID)
        groupAchievement = .init(steam.m_bGroupAchievement)
        achievementName = .init(steam.m_rgchAchievementName_ptr)
        curProgress = .init(steam.m_nCurProgress)
        maxProgress = .init(steam.m_nMaxProgress)
    }
}

/// Steamworks `UserFavoriteItemsListChanged_t`
public struct UserFavoriteItemsListChanged {
    /// Steamworks `m_nPublishedFileId`
    public let publishedFileId: PublishedFileID
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_bWasAddRequest`
    public let wasAddRequest: Bool

    /// Create a customized `UserFavoriteItemsListChanged`
    public init(publishedFileId: PublishedFileID = 0, result: Result = .none, wasAddRequest: Bool = false) {
        self.publishedFileId = publishedFileId
        self.result = result
        self.wasAddRequest = wasAddRequest
    }
}

extension UserFavoriteItemsListChanged: SteamCreatable {
    typealias SteamType = CSteamworks.UserFavoriteItemsListChanged_t
    init(_ steam: CSteamworks.UserFavoriteItemsListChanged_t) {
        publishedFileId = .init(steam.m_nPublishedFileId)
        result = .init(steam.m_eResult)
        wasAddRequest = .init(steam.m_bWasAddRequest)
    }
}

/// Steamworks `UserStatsReceived_t`
public struct UserStatsReceived {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_steamIDUser`
    public let user: SteamID

    /// Create a customized `UserStatsReceived`
    public init(gameID: GameID = GameID(), result: Result = .none, user: SteamID = SteamID()) {
        self.gameID = gameID
        self.result = result
        self.user = user
    }
}

extension UserStatsReceived: SteamCreatable {
    typealias SteamType = CSteamworks.UserStatsReceived_t
    init(_ steam: CSteamworks.UserStatsReceived_t) {
        gameID = .init(steam.m_nGameID)
        result = .init(steam.m_eResult)
        user = .init(steam.m_steamIDUser)
    }
}

/// Steamworks `UserStatsStored_t`
public struct UserStatsStored {
    /// Steamworks `m_nGameID`
    public let gameID: GameID
    /// Steamworks `m_eResult`
    public let result: Result

    /// Create a customized `UserStatsStored`
    public init(gameID: GameID = GameID(), result: Result = .none) {
        self.gameID = gameID
        self.result = result
    }
}

extension UserStatsStored: SteamCreatable {
    typealias SteamType = CSteamworks.UserStatsStored_t
    init(_ steam: CSteamworks.UserStatsStored_t) {
        gameID = .init(steam.m_nGameID)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `UserStatsUnloaded_t`
public struct UserStatsUnloaded {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID

    /// Create a customized `UserStatsUnloaded`
    public init(user: SteamID = SteamID()) {
        self.user = user
    }
}

extension UserStatsUnloaded: SteamCreatable {
    typealias SteamType = CSteamworks.UserStatsUnloaded_t
    init(_ steam: CSteamworks.UserStatsUnloaded_t) {
        user = .init(steam.m_steamIDUser)
    }
}

/// Steamworks `UserSubscribedItemsListChanged_t`
public struct UserSubscribedItemsListChanged {
    /// Steamworks `m_nAppID`
    public let appID: AppID

    /// Create a customized `UserSubscribedItemsListChanged`
    public init(appID: AppID = 0) {
        self.appID = appID
    }
}

extension UserSubscribedItemsListChanged: SteamCreatable {
    typealias SteamType = CSteamworks.UserSubscribedItemsListChanged_t
    init(_ steam: CSteamworks.UserSubscribedItemsListChanged_t) {
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `ValidateAuthTicketResponse_t`
public struct ValidateAuthTicketResponse {
    /// Steamworks `m_SteamID`
    public let steamID: SteamID
    /// Steamworks `m_eAuthSessionResponse`
    public let authSessionResponse: AuthSessionResponse
    /// Steamworks `m_OwnerSteamID`
    public let ownerSteamID: SteamID

    /// Create a customized `ValidateAuthTicketResponse`
    public init(steamID: SteamID = SteamID(), authSessionResponse: AuthSessionResponse = .ok, ownerSteamID: SteamID = SteamID()) {
        self.steamID = steamID
        self.authSessionResponse = authSessionResponse
        self.ownerSteamID = ownerSteamID
    }
}

extension ValidateAuthTicketResponse: SteamCreatable {
    typealias SteamType = CSteamworks.ValidateAuthTicketResponse_t
    init(_ steam: CSteamworks.ValidateAuthTicketResponse_t) {
        steamID = .init(steam.m_SteamID)
        authSessionResponse = .init(steam.m_eAuthSessionResponse)
        ownerSteamID = .init(steam.m_OwnerSteamID)
    }
}

/// Steamworks `VolumeHasChanged_t`
public struct VolumeHasChanged {
    /// Steamworks `m_flNewVolume`
    public let newVolume: Float

    /// Create a customized `VolumeHasChanged`
    public init(newVolume: Float = 0) {
        self.newVolume = newVolume
    }
}

extension VolumeHasChanged: SteamCreatable {
    typealias SteamType = CSteamworks.VolumeHasChanged_t
    init(_ steam: CSteamworks.VolumeHasChanged_t) {
        newVolume = .init(steam.m_flNewVolume)
    }
}

/// Steamworks `WorkshopEULAStatus_t`
public struct WorkshopEULAStatus {
    /// Steamworks `m_eResult`
    public let result: Result
    /// Steamworks `m_nAppID`
    public let appID: AppID
    /// Steamworks `m_unVersion`
    public let version: Int
    /// Steamworks `m_rtAction`
    public let action: RTime32
    /// Steamworks `m_bAccepted`
    public let accepted: Bool
    /// Steamworks `m_bNeedsAction`
    public let needsAction: Bool

    /// Create a customized `WorkshopEULAStatus`
    public init(result: Result = .none, appID: AppID = 0, version: Int = 0, action: RTime32 = 0, accepted: Bool = false, needsAction: Bool = false) {
        self.result = result
        self.appID = appID
        self.version = version
        self.action = action
        self.accepted = accepted
        self.needsAction = needsAction
    }
}

extension WorkshopEULAStatus: SteamCreatable {
    typealias SteamType = CSteamworks.WorkshopEULAStatus_t
    init(_ steam: CSteamworks.WorkshopEULAStatus_t) {
        result = .init(steam.m_eResult)
        appID = .init(steam.m_nAppID)
        version = .init(steam.m_unVersion)
        action = .init(steam.m_rtAction)
        accepted = .init(steam.m_bAccepted)
        needsAction = .init(steam.m_bNeedsAction)
    }
}

/// Steamworks `gameserveritem_t`
public struct GameServerItem {
    /// Steamworks `m_NetAdr`
    public let netAdr: ServerNetAdr
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
    public let appID: AppID
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
    public let timeLastPlayed: RTime32
    /// Steamworks `m_nServerVersion`
    public let serverVersion: Int
    /// Steamworks `m_szGameTags`
    public let gameTags: String
    /// Steamworks `m_steamID`
    public let steamID: SteamID

    /// Create a customized `GameServerItem`
    public init(netAdr: ServerNetAdr = ServerNetAdr(), ping: Int = 0, hadSuccessfulResponse: Bool = false, doNotRefresh: Bool = false, gameDir: String = "", map: String = "", gameDescription: String = "", appID: AppID = 0, players: Int = 0, maxPlayers: Int = 0, botPlayers: Int = 0, password: Bool = false, secure: Bool = false, timeLastPlayed: RTime32 = 0, serverVersion: Int = 0, gameTags: String = "", steamID: SteamID = SteamID()) {
        self.netAdr = netAdr
        self.ping = ping
        self.hadSuccessfulResponse = hadSuccessfulResponse
        self.doNotRefresh = doNotRefresh
        self.gameDir = gameDir
        self.map = map
        self.gameDescription = gameDescription
        self.appID = appID
        self.players = players
        self.maxPlayers = maxPlayers
        self.botPlayers = botPlayers
        self.password = password
        self.secure = secure
        self.timeLastPlayed = timeLastPlayed
        self.serverVersion = serverVersion
        self.gameTags = gameTags
        self.steamID = steamID
    }
}

extension GameServerItem: SteamCreatable {
    typealias SteamType = CSteamworks.gameserveritem_t
    init(_ steam: CSteamworks.gameserveritem_t) {
        netAdr = .init(steam.m_NetAdr)
        ping = .init(steam.m_nPing)
        hadSuccessfulResponse = .init(steam.m_bHadSuccessfulResponse)
        doNotRefresh = .init(steam.m_bDoNotRefresh)
        gameDir = .init(steam.m_szGameDir_ptr)
        map = .init(steam.m_szMap_ptr)
        gameDescription = .init(steam.m_szGameDescription_ptr)
        appID = .init(steam.m_nAppID)
        players = .init(steam.m_nPlayers)
        maxPlayers = .init(steam.m_nMaxPlayers)
        botPlayers = .init(steam.m_nBotPlayers)
        password = .init(steam.m_bPassword)
        secure = .init(steam.m_bSecure)
        timeLastPlayed = .init(steam.m_ulTimeLastPlayed)
        serverVersion = .init(steam.m_nServerVersion)
        gameTags = .init(steam.m_szGameTags_ptr)
        steamID = .init(steam.m_steamID)
    }
}
