//
//  Constants.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Namespace for Steamworks top-level constants
public enum SteamConstants {
    /// Steamworks `k_cubChatMetadataMax`
    public static let chatMetadataMaxSize = Int(8192)

    /// Steamworks `k_cchDeveloperMetadataMax`
    public static let developerMetadataMaxSize = Int(5000)

    /// Steamworks `k_unEnumeratePublishedFilesMaxResults`
    public static let enumeratePublishedFilesMaxResults = Int(50)

    /// Steamworks `k_cchFilenameMax`
    public static let filenameMaxSize = Int(260)

    /// Steamworks `k_cchGameExtraInfoMax`
    public static let gameExtraInfoMaxSize = Int(64)

    /// Steamworks `k_cLeaderboardDetailsMax`
    public static let leaderboardDetailsMax = Int(64)

    /// Steamworks `k_cchLeaderboardNameMax`
    public static let leaderboardNameMaxSize = Int(128)

    /// Steamworks `k_unMaxCloudFileChunkSize`
    public static let maxCloudFileChunkSize = Int(100 * 1024 * 1024)

    /// Steamworks `k_cchMaxFriendsGroupName`
    public static let maxFriendsGroupNameSize = Int(64)

    /// Steamworks `k_cbMaxGameServerGameData`
    public static let maxGameServerGameDataSize = Int(2048)

    /// Steamworks `k_cbMaxGameServerGameDescription`
    public static let maxGameServerGameDescriptionSize = Int(64)

    /// Steamworks `k_cbMaxGameServerGameDir`
    public static let maxGameServerGameDirSize = Int(32)

    /// Steamworks `k_cbMaxGameServerMapName`
    public static let maxGameServerMapNameSize = Int(32)

    /// Steamworks `k_cbMaxGameServerName`
    public static let maxGameServerNameSize = Int(64)

    /// Steamworks `k_cbMaxGameServerTags`
    public static let maxGameServerTagsSize = Int(128)

    /// Steamworks `k_cbMaxSteamDatagramGameCoordinatorServerLoginAppData`
    public static let maxSteamDatagramGameCoordinatorServerLoginAppDataSize = Int(2048)

    /// Steamworks `k_cbMaxSteamDatagramGameCoordinatorServerLoginSerialized`
    public static let maxSteamDatagramGameCoordinatorServerLoginSerializedSize = Int(4096)

    /// Steamworks `k_cchMaxSteamNetworkingErrMsg`
    public static let maxSteamNetworkingErrMsgSize = Int(1024)

    /// Steamworks `k_cchMaxSteamNetworkingPingLocationString`
    public static let maxSteamNetworkingPingLocationStringSize = Int(1024)

    /// Steamworks `k_cbMaxSteamNetworkingSocketsMessageSizeSend`
    public static let maxSteamNetworkingSocketsMessageSizeSendSize = Int(512 * 1024)

    /// Steamworks `kNumUGCResultsPerPage`
    public static let numUGCResultsPerPage = Int(50)

    /// Steamworks `k_cchPublishedDocumentChangeDescriptionMax`
    public static let publishedDocumentChangeDescriptionMaxSize = Int(8000)

    /// Steamworks `k_cchPublishedDocumentDescriptionMax`
    public static let publishedDocumentDescriptionMaxSize = Int(8000)

    /// Steamworks `k_cchPublishedDocumentTitleMax`
    public static let publishedDocumentTitleMaxSize = Int(128 + 1)

    /// Steamworks `k_cchPublishedFileURLMax`
    public static let publishedFileURLMaxSize = Int(256)

    /// Steamworks `k_nScreenshotMaxTaggedPublishedFiles`
    public static let screenshotMaxTaggedPublishedFiles = Int(32)

    /// Steamworks `k_nScreenshotMaxTaggedUsers`
    public static let screenshotMaxTaggedUsers = Int(32)

    /// Steamworks `k_ScreenshotThumbWidth`
    public static let screenshotThumbWidth = Int(200)

    /// Steamworks `k_cchStatNameMax`
    public static let statNameMaxSize = Int(128)

    /// Steamworks `k_cbSteamDatagramMaxSerializedTicket`
    public static let steamDatagramMaxSerializedTicketSize = Int(512)

    /// Steamworks `k_SteamDatagramPOPID_dev`
    public static let steamDatagramPOPIDdev = SteamNetworkingPOPID(0x00646576)

    /// Steamworks `k_SteamMusicNameMaxLength`
    public static let steamMusicNameMaxLength = Int(255)

    /// Steamworks `k_SteamMusicPNGMaxLength`
    public static let steamMusicPNGMaxLength = Int(65535)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_DualWifi`
    public static let steamNetworkConnectionInfoFlagsDualWifi = Int(32)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_Fast`
    public static let steamNetworkConnectionInfoFlagsFast = Int(8)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_LoopbackBuffers`
    public static let steamNetworkConnectionInfoFlagsLoopbackBuffers = Int(4)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_Relayed`
    public static let steamNetworkConnectionInfoFlagsRelayed = Int(16)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_Unauthenticated`
    public static let steamNetworkConnectionInfoFlagsUnauthenticated = Int(1)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_Unencrypted`
    public static let steamNetworkConnectionInfoFlagsUnencrypted = Int(2)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_All`
    public static let steamNetworkingConfigP2PTransportICEEnableAll = Int(0x7fffffff)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Default`
    public static let steamNetworkingConfigP2PTransportICEEnableDefault = Int(-1)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Disable`
    public static let steamNetworkingConfigP2PTransportICEEnableDisable = Int(0)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Private`
    public static let steamNetworkingConfigP2PTransportICEEnablePrivate = Int(2)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Public`
    public static let steamNetworkingConfigP2PTransportICEEnablePublic = Int(4)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Relay`
    public static let steamNetworkingConfigP2PTransportICEEnableRelay = Int(1)

    /// Steamworks `k_cchSteamNetworkingMaxConnectionCloseReason`
    public static let steamNetworkingMaxConnectionCloseReasonSize = Int(128)

    /// Steamworks `k_cchSteamNetworkingMaxConnectionDescription`
    public static let steamNetworkingMaxConnectionDescriptionSize = Int(128)

    /// Steamworks `k_nSteamNetworkingPing_Failed`
    public static let steamNetworkingPingFailed = Int(-1)

    /// Steamworks `k_nSteamNetworkingPing_Unknown`
    public static let steamNetworkingPingUnknown = Int(-2)

    /// Steamworks `k_nSteamNetworkingSend_AutoRestartBrokenSession`
    public static let steamNetworkingSendAutoRestartBrokenSession = Int(32)

    /// Steamworks `k_nSteamNetworkingSend_NoDelay`
    public static let steamNetworkingSendNoDelay = Int(4)

    /// Steamworks `k_nSteamNetworkingSend_NoNagle`
    public static let steamNetworkingSendNoNagle = Int(1)

    /// Steamworks `k_nSteamNetworkingSend_Reliable`
    public static let steamNetworkingSendReliable = Int(8)

    /// Steamworks `k_nSteamNetworkingSend_ReliableNoNagle`
    public static let steamNetworkingSendReliableNoNagle = Int(k_nSteamNetworkingSend_Reliable | k_nSteamNetworkingSend_NoNagle)

    /// Steamworks `k_nSteamNetworkingSend_Unreliable`
    public static let steamNetworkingSendUnreliable = Int(0)

    /// Steamworks `k_nSteamNetworkingSend_UnreliableNoDelay`
    public static let steamNetworkingSendUnreliableNoDelay = Int(k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoDelay | k_nSteamNetworkingSend_NoNagle)

    /// Steamworks `k_nSteamNetworkingSend_UnreliableNoNagle`
    public static let steamNetworkingSendUnreliableNoNagle = Int(k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoNagle)

    /// Steamworks `k_nSteamNetworkingSend_UseCurrentThread`
    public static let steamNetworkingSendUseCurrentThread = Int(16)

    /// Steamworks `k_cchTagListMax`
    public static let tagListMaxSize = Int(1024 + 1)

    /// Steamworks `k_cubUFSTagTypeMax`
    public static let ufsTagTypeMax = Int(255)

    /// Steamworks `k_cubUFSTagValueMax`
    public static let ufsTagValueMax = Int(255)
}

extension HServerQuery {
    /// Steamworks `HSERVERQUERY_INVALID`
    public static let invalid = HServerQuery(-1)
}

extension HHTMLBrowser {
    /// Steamworks `INVALID_HTMLBROWSER`
    public static let invalid = HHTMLBrowser(0)
}

extension SteamAPICall {
    /// Steamworks `k_uAPICallInvalid`
    public static let invalid = SteamAPICall(0x0)
}

extension AppID {
    /// Steamworks `k_uAppIdInvalid`
    public static let invalid = AppID(0x0)
}

extension DepotID {
    /// Steamworks `k_uDepotIdInvalid`
    public static let invalid = DepotID(0x0)
}

extension FriendsGroupID {
    /// Steamworks `k_FriendsGroupID_Invalid`
    public static let invalid = FriendsGroupID(-1)
}

extension HAuthTicket {
    /// Steamworks `k_HAuthTicketInvalid`
    public static let invalid = HAuthTicket(0)
}

extension HSteamListenSocket {
    /// Steamworks `k_HSteamListenSocket_Invalid`
    public static let invalid = HSteamListenSocket(0)
}

extension HSteamNetConnection {
    /// Steamworks `k_HSteamNetConnection_Invalid`
    public static let invalid = HSteamNetConnection(0)
}

extension HSteamNetPollGroup {
    /// Steamworks `k_HSteamNetPollGroup_Invalid`
    public static let invalid = HSteamNetPollGroup(0)
}

extension PartyBeaconID {
    /// Steamworks `k_ulPartyBeaconIdInvalid`
    public static let invalid = PartyBeaconID(0)
}

extension PublishedFileID {
    /// Steamworks `k_PublishedFileIdInvalid`
    public static let invalid = PublishedFileID(0)
}

extension PublishedFileUpdateHandle {
    /// Steamworks `k_PublishedFileUpdateHandleInvalid`
    public static let invalid = PublishedFileUpdateHandle(0xffffffffffffffff)
}

extension SteamInventoryResult {
    /// Steamworks `k_SteamInventoryResultInvalid`
    public static let invalid = SteamInventoryResult(-1)
}

extension SteamInventoryUpdateHandle {
    /// Steamworks `k_SteamInventoryUpdateHandleInvalid`
    public static let invalid = SteamInventoryUpdateHandle(0xffffffffffffffff)
}

extension SteamItemInstanceID {
    /// Steamworks `k_SteamItemInstanceIDInvalid`
    public static let invalid = SteamItemInstanceID(~0)
}

extension UGCFileWriteStreamHandle {
    /// Steamworks `k_UGCFileStreamHandleInvalid`
    public static let invalid = UGCFileWriteStreamHandle(0xffffffffffffffff)
}

extension UGCHandle {
    /// Steamworks `k_UGCHandleInvalid`
    public static let invalid = UGCHandle(0xffffffffffffffff)
}

extension UGCQueryHandle {
    /// Steamworks `k_UGCQueryHandleInvalid`
    public static let invalid = UGCQueryHandle(0xffffffffffffffff)
}

extension UGCUpdateHandle {
    /// Steamworks `k_UGCUpdateHandleInvalid`
    public static let invalid = UGCUpdateHandle(0xffffffffffffffff)
}
