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
}

extension ActiveBeaconsUpdated: SteamCreatable {
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
}

extension AddAppDependencyResult: SteamCreatable {
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
}

extension AddUGCDependencyResult: SteamCreatable {
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
}

extension AppProofOfPurchaseKeyResponse: SteamCreatable {
    init(_ steam: CSteamworks.AppProofOfPurchaseKeyResponse_t) {
        result = .init(steam.m_eResult)
        appID = .init(steam.m_nAppID)
        keySize = .init(steam.m_cchKeyLength)
        key = .init(steam.m_rgchKey_ptr)
    }
}

/// Steamworks `AppResumingFromSuspend_t`
public struct AppResumingFromSuspend {
}

extension AppResumingFromSuspend: SteamCreatable {
    init(_ steam: CSteamworks.AppResumingFromSuspend_t) {
    }
}

/// Steamworks `AssociateWithClanResult_t`
public struct AssociateWithClanResult {
    /// Steamworks `m_eResult`
    public let result: Result
}

extension AssociateWithClanResult: SteamCreatable {
    init(_ steam: CSteamworks.AssociateWithClanResult_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `AvailableBeaconLocationsUpdated_t`
public struct AvailableBeaconLocationsUpdated {
}

extension AvailableBeaconLocationsUpdated: SteamCreatable {
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
}

extension AvatarImageLoaded: SteamCreatable {
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
}

extension ChangeNumOpenSlotsCallback: SteamCreatable {
    init(_ steam: CSteamworks.ChangeNumOpenSlotsCallback_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `CheckFileSignature_t`
public struct CheckFileSignature {
    /// Steamworks `m_eCheckFileSignature`
    public let checkFileSignature: CheckFileSignatureResult
}

extension CheckFileSignature: SteamCreatable {
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
}

extension ClanOfficerListResponse: SteamCreatable {
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
}

extension ClientGameServerDeny: SteamCreatable {
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
}

extension ComputeNewPlayerCompatibilityResult: SteamCreatable {
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
}

extension CreateBeaconCallback: SteamCreatable {
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
}

extension CreateItemResult: SteamCreatable {
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
}

extension DeleteItemResult: SteamCreatable {
    init(_ steam: CSteamworks.DeleteItemResult_t) {
        result = .init(steam.m_eResult)
        publishedFileId = .init(steam.m_nPublishedFileId)
    }
}

/// Steamworks `DlcInstalled_t`
public struct DlcInstalled {
    /// Steamworks `m_nAppID`
    public let appID: AppID
}

extension DlcInstalled: SteamCreatable {
    init(_ steam: CSteamworks.DlcInstalled_t) {
        appID = .init(steam.m_nAppID)
    }
}

/// Steamworks `DownloadClanActivityCountsResult_t`
public struct DownloadClanActivityCountsResult {
    /// Steamworks `m_bSuccess`
    public let success: Bool
}

extension DownloadClanActivityCountsResult: SteamCreatable {
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
}

extension DownloadItemResult: SteamCreatable {
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
}

extension DurationControl: SteamCreatable {
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
}

extension EncryptedAppTicketResponse: SteamCreatable {
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
}

extension EndGameResultCallback: SteamCreatable {
    init(_ steam: CSteamworks.EndGameResultCallback_t) {
        result = .init(steam.m_eResult)
        uniqueGameID = .init(steam.ullUniqueGameID)
    }
}

/// Steamworks `FavoritesListAccountsUpdated_t`
public struct FavoritesListAccountsUpdated {
    /// Steamworks `m_eResult`
    public let result: Result
}

extension FavoritesListAccountsUpdated: SteamCreatable {
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
}

extension FavoritesListChanged: SteamCreatable {
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
}

extension FileDetailsResult: SteamCreatable {
    init(_ steam: CSteamworks.FileDetailsResult_t) {
        result = .init(steam.m_eResult)
        fileSize = .init(steam.m_ulFileSize)
        fileSHA = .init(steam.m_FileSHA_ptr, 20)
        flags = .init(steam.m_unFlags)
    }
}

/// Steamworks `FloatingGamepadTextInputDismissed_t`
public struct FloatingGamepadTextInputDismissed {
}

extension FloatingGamepadTextInputDismissed: SteamCreatable {
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
}

extension FriendGameInfo: SteamCreatable {
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
}

extension FriendRichPresenceUpdate: SteamCreatable {
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
}

extension FriendsEnumerateFollowingList: SteamCreatable {
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
}

extension FriendsGetFollowerCount: SteamCreatable {
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
}

extension FriendsIsFollowing: SteamCreatable {
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
}

extension GSClientAchievementStatus: SteamCreatable {
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
}

extension GSClientApprove: SteamCreatable {
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
}

extension GSClientDeny: SteamCreatable {
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
}

extension GSClientGroupStatus: SteamCreatable {
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
}

extension GSClientKick: SteamCreatable {
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
}

extension GSGameplayStats: SteamCreatable {
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
}

extension GSPolicyResponse: SteamCreatable {
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
}

extension GSReputation: SteamCreatable {
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
}

extension GSStatsReceived: SteamCreatable {
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
}

extension GSStatsStored: SteamCreatable {
    init(_ steam: CSteamworks.GSStatsStored_t) {
        result = .init(steam.m_eResult)
        user = .init(steam.m_steamIDUser)
    }
}

/// Steamworks `GSStatsUnloaded_t`
public struct GSStatsUnloaded {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
}

extension GSStatsUnloaded: SteamCreatable {
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
}

extension GameConnectedChatJoin: SteamCreatable {
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
}

extension GameConnectedChatLeave: SteamCreatable {
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
}

extension GameConnectedClanChatMsg: SteamCreatable {
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
}

extension GameConnectedFriendChatMsg: SteamCreatable {
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
}

extension GameLobbyJoinRequested: SteamCreatable {
    init(_ steam: CSteamworks.GameLobbyJoinRequested_t) {
        lobby = .init(steam.m_steamIDLobby)
        friend = .init(steam.m_steamIDFriend)
    }
}

/// Steamworks `GameOverlayActivated_t`
public struct GameOverlayActivated {
    /// Steamworks `m_bActive`
    public let active: Bool
}

extension GameOverlayActivated: SteamCreatable {
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
}

extension GameRichPresenceJoinRequested: SteamCreatable {
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
}

extension GameServerChangeRequested: SteamCreatable {
    init(_ steam: CSteamworks.GameServerChangeRequested_t) {
        server = .init(steam.m_rgchServer_ptr)
        password = .init(steam.m_rgchPassword_ptr)
    }
}

/// Steamworks `GameWebCallback_t`
public struct GameWebCallback {
    /// Steamworks `m_szURL`
    public let url: String
}

extension GameWebCallback: SteamCreatable {
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
}

extension GamepadTextInputDismissed: SteamCreatable {
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
}

extension GetAppDependenciesResult: SteamCreatable {
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
}

extension GetAuthSessionTicketResponse: SteamCreatable {
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
}

extension GetOPFSettingsResult: SteamCreatable {
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
}

extension GetUserItemVoteResult: SteamCreatable {
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
}

extension GetVideoURLResult: SteamCreatable {
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
}

extension GlobalAchievementPercentagesReady: SteamCreatable {
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
}

extension GlobalStatsReceived: SteamCreatable {
    init(_ steam: CSteamworks.GlobalStatsReceived_t) {
        gameID = .init(steam.m_nGameID)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `HTML_BrowserReady_t`
public struct HTMLBrowserReady {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
}

extension HTMLBrowserReady: SteamCreatable {
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
}

extension HTMLBrowserRestarted: SteamCreatable {
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
}

extension HTMLCanGoBackAndForward: SteamCreatable {
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
}

extension HTMLChangedTitle: SteamCreatable {
    init(_ steam: CSteamworks.HTML_ChangedTitle_t) {
        browserHandle = .init(steam.unBrowserHandle)
        title = .init(steam.pchTitle)
    }
}

/// Steamworks `HTML_CloseBrowser_t`
public struct HTMLCloseBrowser {
    /// Steamworks `unBrowserHandle`
    public let browserHandle: HHTMLBrowser
}

extension HTMLCloseBrowser: SteamCreatable {
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
}

extension HTMLFileOpenDialog: SteamCreatable {
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
}

extension HTMLFinishedRequest: SteamCreatable {
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
}

extension HTMLHideToolTip: SteamCreatable {
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
}

extension HTMLHorizontalScroll: SteamCreatable {
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
}

extension HTMLJSAlert: SteamCreatable {
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
}

extension HTMLJSConfirm: SteamCreatable {
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
}

extension HTMLLinkAtPosition: SteamCreatable {
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

extension HTMLNeedsPaint: SteamCreatable {
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
}

extension HTMLNewWindow: SteamCreatable {
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
}

extension HTMLOpenLinkInNewTab: SteamCreatable {
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
}

extension HTMLSearchResults: SteamCreatable {
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
    public let mouseCursor: Int
}

extension HTMLSetCursor: SteamCreatable {
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
}

extension HTMLShowToolTip: SteamCreatable {
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
}

extension HTMLStartRequest: SteamCreatable {
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
}

extension HTMLStatusText: SteamCreatable {
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
}

extension HTMLURLChanged: SteamCreatable {
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
}

extension HTMLUpdateToolTip: SteamCreatable {
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
}

extension HTMLVerticalScroll: SteamCreatable {
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
}

extension HTTPRequestCompleted: SteamCreatable {
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
}

extension HTTPRequestDataReceived: SteamCreatable {
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
}

extension HTTPRequestHeadersReceived: SteamCreatable {
    init(_ steam: CSteamworks.HTTPRequestHeadersReceived_t) {
        request = .init(steam.m_hRequest)
        contextValue = .init(steam.m_ulContextValue)
    }
}

/// Steamworks `IPCFailure_t`
public struct IPCFailure {
    /// Steamworks `m_eFailureType`
    public let failureType: FailureType

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

extension IPCFailure: SteamCreatable {
    init(_ steam: CSteamworks.IPCFailure_t) {
        failureType = .init(steam.m_eFailureType)
    }
}

/// Steamworks `IPCountry_t`
public struct IPCountry {
}

extension IPCountry: SteamCreatable {
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
}

extension InputAnalogActionData: SteamCreatable {
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
}

extension InputDigitalActionData: SteamCreatable {
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
}

extension InputMotionData: SteamCreatable {
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
}

extension ItemInstalled: SteamCreatable {
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
}

extension JoinClanChatRoomCompletionResult: SteamCreatable {
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
}

extension JoinPartyCallback: SteamCreatable {
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
}

extension LeaderboardEntry: SteamCreatable {
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
}

extension LeaderboardFindResult: SteamCreatable {
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
}

extension LeaderboardScoreUploaded: SteamCreatable {
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
}

extension LeaderboardScoresDownloaded: SteamCreatable {
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
}

extension LeaderboardUGCSet: SteamCreatable {
    init(_ steam: CSteamworks.LeaderboardUGCSet_t) {
        result = .init(steam.m_eResult)
        steamLeaderboard = .init(steam.m_hSteamLeaderboard)
    }
}

/// Steamworks `LicensesUpdated_t`
public struct LicensesUpdated {
}

extension LicensesUpdated: SteamCreatable {
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
}

extension LobbyChatMsg: SteamCreatable {
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
}

extension LobbyChatUpdate: SteamCreatable {
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
}

extension LobbyCreated: SteamCreatable {
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
}

extension LobbyDataUpdate: SteamCreatable {
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
}

extension LobbyEnter: SteamCreatable {
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
}

extension LobbyGameCreated: SteamCreatable {
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
}

extension LobbyInvite: SteamCreatable {
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
}

extension LobbyKicked: SteamCreatable {
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
}

extension LobbyMatchList: SteamCreatable {
    init(_ steam: CSteamworks.LobbyMatchList_t) {
        lobbiesMatching = .init(steam.m_nLobbiesMatching)
    }
}

/// Steamworks `LowBatteryPower_t`
public struct LowBatteryPower {
    /// Steamworks `m_nMinutesBatteryLeft`
    public let minutesBatteryLeft: Int
}

extension LowBatteryPower: SteamCreatable {
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
}

extension MarketEligibilityResponse: SteamCreatable {
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
}

extension MatchMakingKeyValuePair: SteamCreatable {
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
}

extension MicroTxnAuthorizationResponse: SteamCreatable {
    init(_ steam: CSteamworks.MicroTxnAuthorizationResponse_t) {
        appID = .init(steam.m_unAppID)
        orderID = .init(steam.m_ulOrderID)
        authorized = .init(steam.m_bAuthorized)
    }
}

/// Steamworks `MusicPlayerRemoteToFront_t`
public struct MusicPlayerRemoteToFront {
}

extension MusicPlayerRemoteToFront: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerRemoteToFront_t) {
    }
}

/// Steamworks `MusicPlayerRemoteWillActivate_t`
public struct MusicPlayerRemoteWillActivate {
}

extension MusicPlayerRemoteWillActivate: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerRemoteWillActivate_t) {
    }
}

/// Steamworks `MusicPlayerRemoteWillDeactivate_t`
public struct MusicPlayerRemoteWillDeactivate {
}

extension MusicPlayerRemoteWillDeactivate: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerRemoteWillDeactivate_t) {
    }
}

/// Steamworks `MusicPlayerSelectsPlaylistEntry_t`
public struct MusicPlayerSelectsPlaylistEntry {
    /// Steamworks `nID`
    public let id: Int
}

extension MusicPlayerSelectsPlaylistEntry: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerSelectsPlaylistEntry_t) {
        id = .init(steam.nID)
    }
}

/// Steamworks `MusicPlayerSelectsQueueEntry_t`
public struct MusicPlayerSelectsQueueEntry {
    /// Steamworks `nID`
    public let id: Int
}

extension MusicPlayerSelectsQueueEntry: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerSelectsQueueEntry_t) {
        id = .init(steam.nID)
    }
}

/// Steamworks `MusicPlayerWantsLooped_t`
public struct MusicPlayerWantsLooped {
    /// Steamworks `m_bLooped`
    public let looped: Bool
}

extension MusicPlayerWantsLooped: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWantsLooped_t) {
        looped = .init(steam.m_bLooped)
    }
}

/// Steamworks `MusicPlayerWantsPause_t`
public struct MusicPlayerWantsPause {
}

extension MusicPlayerWantsPause: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWantsPause_t) {
    }
}

/// Steamworks `MusicPlayerWantsPlayNext_t`
public struct MusicPlayerWantsPlayNext {
}

extension MusicPlayerWantsPlayNext: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWantsPlayNext_t) {
    }
}

/// Steamworks `MusicPlayerWantsPlayPrevious_t`
public struct MusicPlayerWantsPlayPrevious {
}

extension MusicPlayerWantsPlayPrevious: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWantsPlayPrevious_t) {
    }
}

/// Steamworks `MusicPlayerWantsPlay_t`
public struct MusicPlayerWantsPlay {
}

extension MusicPlayerWantsPlay: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWantsPlay_t) {
    }
}

/// Steamworks `MusicPlayerWantsPlayingRepeatStatus_t`
public struct MusicPlayerWantsPlayingRepeatStatus {
    /// Steamworks `m_nPlayingRepeatStatus`
    public let playingRepeatStatus: Int
}

extension MusicPlayerWantsPlayingRepeatStatus: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWantsPlayingRepeatStatus_t) {
        playingRepeatStatus = .init(steam.m_nPlayingRepeatStatus)
    }
}

/// Steamworks `MusicPlayerWantsShuffled_t`
public struct MusicPlayerWantsShuffled {
    /// Steamworks `m_bShuffled`
    public let shuffled: Bool
}

extension MusicPlayerWantsShuffled: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWantsShuffled_t) {
        shuffled = .init(steam.m_bShuffled)
    }
}

/// Steamworks `MusicPlayerWantsVolume_t`
public struct MusicPlayerWantsVolume {
    /// Steamworks `m_flNewVolume`
    public let newVolume: Float
}

extension MusicPlayerWantsVolume: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWantsVolume_t) {
        newVolume = .init(steam.m_flNewVolume)
    }
}

/// Steamworks `MusicPlayerWillQuit_t`
public struct MusicPlayerWillQuit {
}

extension MusicPlayerWillQuit: SteamCreatable {
    init(_ steam: CSteamworks.MusicPlayerWillQuit_t) {
    }
}

/// Steamworks `NewUrlLaunchParameters_t`
public struct NewUrlLaunchParameters {
}

extension NewUrlLaunchParameters: SteamCreatable {
    init(_ steam: CSteamworks.NewUrlLaunchParameters_t) {
    }
}

/// Steamworks `NumberOfCurrentPlayers_t`
public struct NumberOfCurrentPlayers {
    /// Steamworks `m_bSuccess`
    public let success: Bool
    /// Steamworks `m_cPlayers`
    public let players: Int
}

extension NumberOfCurrentPlayers: SteamCreatable {
    init(_ steam: CSteamworks.NumberOfCurrentPlayers_t) {
        success = .init(steam.m_bSuccess)
        players = .init(steam.m_cPlayers)
    }
}

/// Steamworks `OverlayBrowserProtocolNavigation_t`
public struct OverlayBrowserProtocolNavigation {
    /// Steamworks `rgchURI`
    public let uri: String
}

extension OverlayBrowserProtocolNavigation: SteamCreatable {
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
}

extension P2PSessionConnectFail: SteamCreatable {
    init(_ steam: CSteamworks.P2PSessionConnectFail_t) {
        remote = .init(steam.m_steamIDRemote)
        p2PSessionError = .init(steam.m_eP2PSessionError)
    }
}

/// Steamworks `P2PSessionRequest_t`
public struct P2PSessionRequest {
    /// Steamworks `m_steamIDRemote`
    public let remote: SteamID
}

extension P2PSessionRequest: SteamCreatable {
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
}

extension P2PSessionState: SteamCreatable {
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
}

extension PS3TrophiesInstalled: SteamCreatable {
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
}

extension PSNGameBootInviteResult: SteamCreatable {
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
}

extension PersonaStateChange: SteamCreatable {
    init(_ steam: CSteamworks.PersonaStateChange_t) {
        steamID = .init(steam.m_ulSteamID)
        changeFlags = .init(steam.m_nChangeFlags)
    }
}

/// Steamworks `PlaybackStatusHasChanged_t`
public struct PlaybackStatusHasChanged {
}

extension PlaybackStatusHasChanged: SteamCreatable {
    init(_ steam: CSteamworks.PlaybackStatusHasChanged_t) {
    }
}

/// Steamworks `RegisterActivationCodeResponse_t`
public struct RegisterActivationCodeResponse {
    /// Steamworks `m_eResult`
    public let result: RegisterActivationCodeResult
    /// Steamworks `m_unPackageRegistered`
    public let packageRegistered: Int
}

extension RegisterActivationCodeResponse: SteamCreatable {
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
}

extension RemoteStorageDeletePublishedFileResult: SteamCreatable {
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
}

extension RemoteStorageDownloadUGCResult: SteamCreatable {
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
    public let rTimeUpdated: [Int]
}

extension RemoteStorageEnumeratePublishedFilesByUserActionResult: SteamCreatable {
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
}

extension RemoteStorageEnumerateUserPublishedFilesResult: SteamCreatable {
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
}

extension RemoteStorageEnumerateUserSharedWorkshopFilesResult: SteamCreatable {
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
    public let rTimeSubscribed: [Int]
}

extension RemoteStorageEnumerateUserSubscribedFilesResult: SteamCreatable {
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
}

extension RemoteStorageEnumerateWorkshopFilesResult: SteamCreatable {
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
}

extension RemoteStorageFileReadAsyncComplete: SteamCreatable {
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
}

extension RemoteStorageFileShareResult: SteamCreatable {
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
}

extension RemoteStorageFileWriteAsyncComplete: SteamCreatable {
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

extension RemoteStorageGetPublishedFileDetailsResult: SteamCreatable {
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
}

extension RemoteStorageGetPublishedItemVoteDetailsResult: SteamCreatable {
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
}

extension RemoteStorageLocalFileChange: SteamCreatable {
    init(_ steam: CSteamworks.RemoteStorageLocalFileChange_t) {
    }
}

/// Steamworks `RemoteStoragePublishFileProgress_t`
public struct RemoteStoragePublishFileProgress {
    /// Steamworks `m_dPercentFile`
    public let percentFile: Double
    /// Steamworks `m_bPreview`
    public let preview: Bool
}

extension RemoteStoragePublishFileProgress: SteamCreatable {
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
}

extension RemoteStoragePublishFileResult: SteamCreatable {
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
}

extension RemoteStoragePublishedFileDeleted: SteamCreatable {
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
}

extension RemoteStoragePublishedFileSubscribed: SteamCreatable {
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
}

extension RemoteStoragePublishedFileUnsubscribed: SteamCreatable {
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
}

extension RemoteStoragePublishedFileUpdated: SteamCreatable {
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
}

extension RemoteStorageSetUserPublishedFileActionResult: SteamCreatable {
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
}

extension RemoteStorageSubscribePublishedFileResult: SteamCreatable {
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
}

extension RemoteStorageUnsubscribePublishedFileResult: SteamCreatable {
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
}

extension RemoteStorageUpdatePublishedFileResult: SteamCreatable {
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
}

extension RemoteStorageUpdateUserPublishedItemVoteResult: SteamCreatable {
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
}

extension RemoteStorageUserVoteDetails: SteamCreatable {
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
}

extension RemoveAppDependencyResult: SteamCreatable {
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
}

extension RemoveUGCDependencyResult: SteamCreatable {
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
}

extension RequestPlayersForGameFinalResultCallback: SteamCreatable {
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
}

extension RequestPlayersForGameProgressCallback: SteamCreatable {
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

extension RequestPlayersForGameResultCallback: SteamCreatable {
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
}

extension ReservationNotificationCallback: SteamCreatable {
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
}

extension ScreenshotReady: SteamCreatable {
    init(_ steam: CSteamworks.ScreenshotReady_t) {
        local = .init(steam.m_hLocal)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `ScreenshotRequested_t`
public struct ScreenshotRequested {
}

extension ScreenshotRequested: SteamCreatable {
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
}

extension SearchForGameProgressCallback: SteamCreatable {
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
}

extension SearchForGameResultCallback: SteamCreatable {
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
}

extension SetPersonaNameResponse: SteamCreatable {
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
}

extension SetUserItemVoteResult: SteamCreatable {
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
}

extension SocketStatusCallback: SteamCreatable {
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
}

extension StartPlaytimeTrackingResult: SteamCreatable {
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
}

extension SteamAPICallCompleted: SteamCreatable {
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
}

extension SteamAppInstalled: SteamCreatable {
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
}

extension SteamAppUninstalled: SteamCreatable {
    init(_ steam: CSteamworks.SteamAppUninstalled_t) {
        appID = .init(steam.m_nAppID)
        installFolderIndex = .init(steam.m_iInstallFolderIndex)
    }
}

/// Steamworks `SteamInputActionEvent_t`
public struct SteamInputActionEvent {
    /// Steamworks `controllerHandle`
    public let handle: InputHandle
    /// Steamworks `eEventType`
    public let eventType: SteamInputActionEventType
}

extension SteamInputActionEvent: SteamCreatable {
    init(_ steam: CSteamworks.SteamInputActionEvent_t) {
        handle = .init(steam.controllerHandle)
        eventType = .init(steam.eEventType)
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
}

extension SteamInputConfigurationLoaded: SteamCreatable {
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
}

extension SteamInputDeviceConnected: SteamCreatable {
    init(_ steam: CSteamworks.SteamInputDeviceConnected_t) {
        connectedDeviceHandle = .init(steam.m_ulConnectedDeviceHandle)
    }
}

/// Steamworks `SteamInputDeviceDisconnected_t`
public struct SteamInputDeviceDisconnected {
    /// Steamworks `m_ulDisconnectedDeviceHandle`
    public let disconnectedDeviceHandle: InputHandle
}

extension SteamInputDeviceDisconnected: SteamCreatable {
    init(_ steam: CSteamworks.SteamInputDeviceDisconnected_t) {
        disconnectedDeviceHandle = .init(steam.m_ulDisconnectedDeviceHandle)
    }
}

/// Steamworks `SteamInventoryDefinitionUpdate_t`
public struct SteamInventoryDefinitionUpdate {
}

extension SteamInventoryDefinitionUpdate: SteamCreatable {
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
}

extension SteamInventoryEligiblePromoItemDefIDs: SteamCreatable {
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
}

extension SteamInventoryFullUpdate: SteamCreatable {
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
}

extension SteamInventoryRequestPricesResult: SteamCreatable {
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
}

extension SteamInventoryResultReady: SteamCreatable {
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
}

extension SteamInventoryStartPurchaseResult: SteamCreatable {
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
    public let flags: Int
}

extension SteamItemDetails: SteamCreatable {
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
}

extension SteamNetAuthenticationStatus: SteamCreatable {
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
}

extension SteamNetConnectionInfo: SteamCreatable {
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
}

extension SteamNetConnectionStatusChangedCallback: SteamCreatable {
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
}

extension SteamNetworkPingLocation: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkPingLocation_t) {
        data = .init(steam.m_data_ptr, 512)
    }
}

/// Steamworks `SteamNetworkingConfigValue_t`
public struct SteamNetworkingConfigValue {
    /// Steamworks `m_eValue`
    public let value: SteamNetworkingConfigValueSetting
    /// Steamworks `m_eDataType`
    public let dataType: SteamNetworkingConfigDataType
}

extension SteamNetworkingConfigValue: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingConfigValue_t) {
        value = .init(steam.m_eValue)
        dataType = .init(steam.m_eDataType)
    }
}

/// Steamworks `SteamNetworkingIPAddr`
public struct SteamNetworkingIPAddr {
    /// Steamworks `m_ipv6`
    public let ipv6: [UInt8]
    /// Steamworks `m_port`
    public let port: Int
}

extension SteamNetworkingIPAddr: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingIPAddr) {
        ipv6 = .init(steam.m_ipv6_ptr, 16)
        port = .init(steam.m_port)
    }
}

/// Steamworks `SteamNetworkingIPAddrRender`
public struct SteamNetworkingIPAddrRender {
}

extension SteamNetworkingIPAddrRender: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingIPAddrRender) {
    }
}

/// Steamworks `SteamNetworkingIdentity`
public struct SteamNetworkingIdentity {
    /// Steamworks `m_eType`
    public let type: SteamNetworkingIdentityType
    /// Steamworks `m_cbSize`
    public let sizeSize: Int
    /// Steamworks `m_szUnknownRawString`
    public let unknownRawString: String
}

extension SteamNetworkingIdentity: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingIdentity) {
        type = .init(steam.m_eType)
        sizeSize = .init(steam.m_cbSize)
        unknownRawString = .init(steam.m_szUnknownRawString_ptr)
    }
}

/// Steamworks `SteamNetworkingIdentityRender`
public struct SteamNetworkingIdentityRender {
}

extension SteamNetworkingIdentityRender: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingIdentityRender) {
    }
}

/// Steamworks `SteamNetworkingMessagesSessionFailed_t`
public struct SteamNetworkingMessagesSessionFailed {
    /// Steamworks `m_info`
    public let info: SteamNetConnectionInfo
}

extension SteamNetworkingMessagesSessionFailed: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingMessagesSessionFailed_t) {
        info = .init(steam.m_info)
    }
}

/// Steamworks `SteamNetworkingMessagesSessionRequest_t`
public struct SteamNetworkingMessagesSessionRequest {
    /// Steamworks `m_identityRemote`
    public let identityRemote: SteamNetworkingIdentity
}

extension SteamNetworkingMessagesSessionRequest: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingMessagesSessionRequest_t) {
        identityRemote = .init(steam.m_identityRemote)
    }
}

/// Steamworks `SteamNetworkingPOPIDRender`
public struct SteamNetworkingPOPIDRender {
}

extension SteamNetworkingPOPIDRender: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingPOPIDRender) {
    }
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
    public let pendingUnreliableSize: Int
    /// Steamworks `m_cbPendingReliable`
    public let pendingReliableSize: Int
    /// Steamworks `m_cbSentUnackedReliable`
    public let sentUnackedReliableSize: Int
    /// Steamworks `m_usecQueueTime`
    public let queueTime: SteamNetworkingMicroseconds
}

extension SteamNetworkingQuickConnectionStatus: SteamCreatable {
    init(_ steam: CSteamworks.SteamNetworkingQuickConnectionStatus) {
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

/// Steamworks `SteamParentalSettingsChanged_t`
public struct SteamParentalSettingsChanged {
}

extension SteamParentalSettingsChanged: SteamCreatable {
    init(_ steam: CSteamworks.SteamParentalSettingsChanged_t) {
    }
}

/// Steamworks `SteamPartyBeaconLocation_t`
public struct SteamPartyBeaconLocation {
    /// Steamworks `m_eType`
    public let type: SteamPartyBeaconLocationType
    /// Steamworks `m_ulLocationID`
    public let locationID: UInt64
}

extension SteamPartyBeaconLocation: SteamCreatable {
    init(_ steam: CSteamworks.SteamPartyBeaconLocation_t) {
        type = .init(steam.m_eType)
        locationID = .init(steam.m_ulLocationID)
    }
}

extension CSteamworks.SteamPartyBeaconLocation_t {
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
}

extension SteamRelayNetworkStatus: SteamCreatable {
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
}

extension SteamRemotePlaySessionConnected: SteamCreatable {
    init(_ steam: CSteamworks.SteamRemotePlaySessionConnected_t) {
        sessionID = .init(steam.m_unSessionID)
    }
}

/// Steamworks `SteamRemotePlaySessionDisconnected_t`
public struct SteamRemotePlaySessionDisconnected {
    /// Steamworks `m_unSessionID`
    public let sessionID: RemotePlaySessionID
}

extension SteamRemotePlaySessionDisconnected: SteamCreatable {
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
}

extension SteamServerConnectFailure: SteamCreatable {
    init(_ steam: CSteamworks.SteamServerConnectFailure_t) {
        result = .init(steam.m_eResult)
        stillRetrying = .init(steam.m_bStillRetrying)
    }
}

/// Steamworks `SteamServersConnected_t`
public struct SteamServersConnected {
}

extension SteamServersConnected: SteamCreatable {
    init(_ steam: CSteamworks.SteamServersConnected_t) {
    }
}

/// Steamworks `SteamServersDisconnected_t`
public struct SteamServersDisconnected {
    /// Steamworks `m_eResult`
    public let result: Result
}

extension SteamServersDisconnected: SteamCreatable {
    init(_ steam: CSteamworks.SteamServersDisconnected_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `SteamShutdown_t`
public struct SteamShutdown {
}

extension SteamShutdown: SteamCreatable {
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
}

extension SteamUGCDetails: SteamCreatable {
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
}

extension SteamUGCQueryCompleted: SteamCreatable {
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
}

extension SteamUGCRequestUGCDetailsResult: SteamCreatable {
    init(_ steam: CSteamworks.SteamUGCRequestUGCDetailsResult_t) {
        details = .init(steam.m_details)
        cachedData = .init(steam.m_bCachedData)
    }
}

/// Steamworks `StopPlaytimeTrackingResult_t`
public struct StopPlaytimeTrackingResult {
    /// Steamworks `m_eResult`
    public let result: Result
}

extension StopPlaytimeTrackingResult: SteamCreatable {
    init(_ steam: CSteamworks.StopPlaytimeTrackingResult_t) {
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `StoreAuthURLResponse_t`
public struct StoreAuthURLResponse {
    /// Steamworks `m_szURL`
    public let url: String
}

extension StoreAuthURLResponse: SteamCreatable {
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
}

extension SubmitItemUpdateResult: SteamCreatable {
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
}

extension SubmitPlayerResultResultCallback: SteamCreatable {
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
}

extension TimedTrialStatus: SteamCreatable {
    init(_ steam: CSteamworks.TimedTrialStatus_t) {
        appID = .init(steam.m_unAppID)
        isOffline = .init(steam.m_bIsOffline)
        secondsAllowed = .init(steam.m_unSecondsAllowed)
        secondsPlayed = .init(steam.m_unSecondsPlayed)
    }
}

/// Steamworks `UnreadChatMessagesChanged_t`
public struct UnreadChatMessagesChanged {
}

extension UnreadChatMessagesChanged: SteamCreatable {
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
}

extension UserAchievementIconFetched: SteamCreatable {
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
}

extension UserAchievementStored: SteamCreatable {
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
}

extension UserFavoriteItemsListChanged: SteamCreatable {
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
}

extension UserStatsReceived: SteamCreatable {
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
}

extension UserStatsStored: SteamCreatable {
    init(_ steam: CSteamworks.UserStatsStored_t) {
        gameID = .init(steam.m_nGameID)
        result = .init(steam.m_eResult)
    }
}

/// Steamworks `UserStatsUnloaded_t`
public struct UserStatsUnloaded {
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
}

extension UserStatsUnloaded: SteamCreatable {
    init(_ steam: CSteamworks.UserStatsUnloaded_t) {
        user = .init(steam.m_steamIDUser)
    }
}

/// Steamworks `UserSubscribedItemsListChanged_t`
public struct UserSubscribedItemsListChanged {
    /// Steamworks `m_nAppID`
    public let appID: AppID
}

extension UserSubscribedItemsListChanged: SteamCreatable {
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
}

extension ValidateAuthTicketResponse: SteamCreatable {
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
}

extension VolumeHasChanged: SteamCreatable {
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
}

extension WorkshopEULAStatus: SteamCreatable {
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
    /// Steamworks `m_szGameTags`
    public let gameTags: String
    /// Steamworks `m_steamID`
    public let steamID: SteamID
}

extension gameserveritem: SteamCreatable {
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

/// Steamworks `servernetadr_t`
public struct servernetadr {
}

extension servernetadr: SteamCreatable {
    init(_ steam: CSteamworks.servernetadr_t) {
    }
}
