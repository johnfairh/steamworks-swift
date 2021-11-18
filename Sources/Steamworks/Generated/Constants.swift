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
    /// Steamworks `k_uAppIdInvalid`
    public static let appIdInvalid = AppID(0x0)

    /// Steamworks `k_uDepotIdInvalid`
    public static let depotIdInvalid = DepotID(0x0)

    /// Steamworks `k_uAPICallInvalid`
    public static let apiCallInvalid = SteamAPICall(0x0)

    /// Steamworks `k_ulPartyBeaconIdInvalid`
    public static let partyBeaconIdInvalid = PartyBeaconID(0)

    /// Steamworks `k_HAuthTicketInvalid`
    public static let hAuthTicketInvalid = HAuthTicket(0)

    /// Steamworks `k_unSteamAccountIDMask`
    public static let steamAccountIDMask = Int(0xFFFFFFFF)

    /// Steamworks `k_unSteamAccountInstanceMask`
    public static let steamAccountInstanceMask = Int(0x000FFFFF)

    /// Steamworks `k_unSteamUserDefaultInstance`
    public static let steamUserDefaultInstance = Int(1)

    /// Steamworks `k_cchGameExtraInfoMax`
    public static let gameExtraInfoMax = Int(64)

    /// Steamworks `k_cchMaxFriendsGroupName`
    public static let maxFriendsGroupName = Int(64)

    /// Steamworks `k_cFriendsGroupLimit`
    public static let friendsGroupLimit = Int(100)

    /// Steamworks `k_FriendsGroupID_Invalid`
    public static let friendsGroupIDInvalid = FriendsGroupID(-1)

    /// Steamworks `k_cEnumerateFollowersMax`
    public static let enumerateFollowersMax = Int(50)

    /// Steamworks `k_cubChatMetadataMax`
    public static let chatMetadataMax = Int(8192)

    /// Steamworks `k_cbMaxGameServerGameDir`
    public static let maxGameServerGameDir = Int(32)

    /// Steamworks `k_cbMaxGameServerMapName`
    public static let maxGameServerMapName = Int(32)

    /// Steamworks `k_cbMaxGameServerGameDescription`
    public static let maxGameServerGameDescription = Int(64)

    /// Steamworks `k_cbMaxGameServerName`
    public static let maxGameServerName = Int(64)

    /// Steamworks `k_cbMaxGameServerTags`
    public static let maxGameServerTags = Int(128)

    /// Steamworks `k_cbMaxGameServerGameData`
    public static let maxGameServerGameData = Int(2048)

    /// Steamworks `HSERVERQUERY_INVALID`
    public static let HSERVERQUERY_INVALID = Int(0xffffffff)

    /// Steamworks `k_unFavoriteFlagNone`
    public static let favoriteFlagNone = Int(0x00)

    /// Steamworks `k_unFavoriteFlagFavorite`
    public static let favoriteFlagFavorite = Int(0x01)

    /// Steamworks `k_unFavoriteFlagHistory`
    public static let favoriteFlagHistory = Int(0x02)

    /// Steamworks `k_unMaxCloudFileChunkSize`
    public static let maxCloudFileChunkSize = Int(100 * 1024 * 1024)

    /// Steamworks `k_PublishedFileIdInvalid`
    public static let publishedFileIdInvalid = PublishedFileID(0)

    /// Steamworks `k_UGCHandleInvalid`
    public static let ugcHandleInvalid = UGCHandle(0xffffffffffffffff)

    /// Steamworks `k_PublishedFileUpdateHandleInvalid`
    public static let publishedFileUpdateHandleInvalid = PublishedFileUpdateHandle(0xffffffffffffffff)

    /// Steamworks `k_UGCFileStreamHandleInvalid`
    public static let ugcFileStreamHandleInvalid = UGCFileWriteStreamHandle(0xffffffffffffffff)

    /// Steamworks `k_cchPublishedDocumentTitleMax`
    public static let publishedDocumentTitleMax = Int(128 + 1)

    /// Steamworks `k_cchPublishedDocumentDescriptionMax`
    public static let publishedDocumentDescriptionMax = Int(8000)

    /// Steamworks `k_cchPublishedDocumentChangeDescriptionMax`
    public static let publishedDocumentChangeDescriptionMax = Int(8000)

    /// Steamworks `k_unEnumeratePublishedFilesMaxResults`
    public static let enumeratePublishedFilesMaxResults = Int(50)

    /// Steamworks `k_cchTagListMax`
    public static let tagListMax = Int(1024 + 1)

    /// Steamworks `k_cchFilenameMax`
    public static let filenameMax = Int(260)

    /// Steamworks `k_cchPublishedFileURLMax`
    public static let publishedFileURLMax = Int(256)

    /// Steamworks `k_cubAppProofOfPurchaseKeyMax`
    public static let appProofOfPurchaseKeyMax = Int(240)

    /// Steamworks `k_nScreenshotMaxTaggedUsers`
    public static let screenshotMaxTaggedUsers = Int(32)

    /// Steamworks `k_nScreenshotMaxTaggedPublishedFiles`
    public static let screenshotMaxTaggedPublishedFiles = Int(32)

    /// Steamworks `k_cubUFSTagTypeMax`
    public static let ufsTagTypeMax = Int(255)

    /// Steamworks `k_cubUFSTagValueMax`
    public static let ufsTagValueMax = Int(255)

    /// Steamworks `k_ScreenshotThumbWidth`
    public static let screenshotThumbWidth = Int(200)

    /// Steamworks `k_UGCQueryHandleInvalid`
    public static let ugcQueryHandleInvalid = UGCQueryHandle(0xffffffffffffffff)

    /// Steamworks `k_UGCUpdateHandleInvalid`
    public static let ugcUpdateHandleInvalid = UGCUpdateHandle(0xffffffffffffffff)

    /// Steamworks `kNumUGCResultsPerPage`
    public static let numUGCResultsPerPage = Int(50)

    /// Steamworks `k_cchDeveloperMetadataMax`
    public static let developerMetadataMax = Int(5000)

    /// Steamworks `INVALID_HTMLBROWSER`
    public static let INVALID_HTMLBROWSER = Int(0)

    /// Steamworks `k_SteamItemInstanceIDInvalid`
    public static let steamItemInstanceIDInvalid = SteamItemInstanceID(~0)

    /// Steamworks `k_SteamInventoryResultInvalid`
    public static let steamInventoryResultInvalid = SteamInventoryResult(-1)

    /// Steamworks `k_SteamInventoryUpdateHandleInvalid`
    public static let steamInventoryUpdateHandleInvalid = SteamInventoryUpdateHandle(0xffffffffffffffff)

    /// Steamworks `k_HSteamNetConnection_Invalid`
    public static let hSteamNetConnectionInvalid = HSteamNetConnection(0)

    /// Steamworks `k_HSteamListenSocket_Invalid`
    public static let hSteamListenSocketInvalid = HSteamListenSocket(0)

    /// Steamworks `k_HSteamNetPollGroup_Invalid`
    public static let hSteamNetPollGroupInvalid = HSteamNetPollGroup(0)

    /// Steamworks `k_cchMaxSteamNetworkingErrMsg`
    public static let maxSteamNetworkingErrMsg = Int(1024)

    /// Steamworks `k_cchSteamNetworkingMaxConnectionCloseReason`
    public static let steamNetworkingMaxConnectionCloseReason = Int(128)

    /// Steamworks `k_cchSteamNetworkingMaxConnectionDescription`
    public static let steamNetworkingMaxConnectionDescription = Int(128)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_Unauthenticated`
    public static let steamNetworkConnectionInfoFlagsUnauthenticated = Int(1)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_Unencrypted`
    public static let steamNetworkConnectionInfoFlagsUnencrypted = Int(2)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_LoopbackBuffers`
    public static let steamNetworkConnectionInfoFlagsLoopbackBuffers = Int(4)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_Fast`
    public static let steamNetworkConnectionInfoFlagsFast = Int(8)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_Relayed`
    public static let steamNetworkConnectionInfoFlagsRelayed = Int(16)

    /// Steamworks `k_nSteamNetworkConnectionInfoFlags_DualWifi`
    public static let steamNetworkConnectionInfoFlagsDualWifi = Int(32)

    /// Steamworks `k_cbMaxSteamNetworkingSocketsMessageSizeSend`
    public static let maxSteamNetworkingSocketsMessageSizeSend = Int(512 * 1024)

    /// Steamworks `k_nSteamNetworkingSend_Unreliable`
    public static let steamNetworkingSendUnreliable = Int(0)

    /// Steamworks `k_nSteamNetworkingSend_NoNagle`
    public static let steamNetworkingSendNoNagle = Int(1)

    /// Steamworks `k_nSteamNetworkingSend_UnreliableNoNagle`
    public static let steamNetworkingSendUnreliableNoNagle = Int(k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoNagle)

    /// Steamworks `k_nSteamNetworkingSend_NoDelay`
    public static let steamNetworkingSendNoDelay = Int(4)

    /// Steamworks `k_nSteamNetworkingSend_UnreliableNoDelay`
    public static let steamNetworkingSendUnreliableNoDelay = Int(k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoDelay | k_nSteamNetworkingSend_NoNagle)

    /// Steamworks `k_nSteamNetworkingSend_Reliable`
    public static let steamNetworkingSendReliable = Int(8)

    /// Steamworks `k_nSteamNetworkingSend_ReliableNoNagle`
    public static let steamNetworkingSendReliableNoNagle = Int(k_nSteamNetworkingSend_Reliable | k_nSteamNetworkingSend_NoNagle)

    /// Steamworks `k_nSteamNetworkingSend_UseCurrentThread`
    public static let steamNetworkingSendUseCurrentThread = Int(16)

    /// Steamworks `k_nSteamNetworkingSend_AutoRestartBrokenSession`
    public static let steamNetworkingSendAutoRestartBrokenSession = Int(32)

    /// Steamworks `k_cchMaxSteamNetworkingPingLocationString`
    public static let maxSteamNetworkingPingLocationString = Int(1024)

    /// Steamworks `k_nSteamNetworkingPing_Failed`
    public static let steamNetworkingPingFailed = Int(-1)

    /// Steamworks `k_nSteamNetworkingPing_Unknown`
    public static let steamNetworkingPingUnknown = Int(-2)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Default`
    public static let steamNetworkingConfigP2PTransportICEEnableDefault = Int(-1)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Disable`
    public static let steamNetworkingConfigP2PTransportICEEnableDisable = Int(0)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Relay`
    public static let steamNetworkingConfigP2PTransportICEEnableRelay = Int(1)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Private`
    public static let steamNetworkingConfigP2PTransportICEEnablePrivate = Int(2)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Public`
    public static let steamNetworkingConfigP2PTransportICEEnablePublic = Int(4)

    /// Steamworks `k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_All`
    public static let steamNetworkingConfigP2PTransportICEEnableAll = Int(0x7fffffff)

    /// Steamworks `k_SteamDatagramPOPID_dev`
    public static let steamDatagramPOPIDdev = SteamNetworkingPOPID(0x00646576)

    /// Steamworks `STEAMGAMESERVER_QUERY_PORT_SHARED`
    public static let STEAMGAMESERVER_QUERY_PORT_SHARED = Int(0xffff)

    /// Steamworks `MASTERSERVERUPDATERPORT_USEGAMESOCKETSHARE`
    public static let MASTERSERVERUPDATERPORT_USEGAMESOCKETSHARE = Int(STEAMGAMESERVER_QUERY_PORT_SHARED)

    /// Steamworks `k_cbSteamDatagramMaxSerializedTicket`
    public static let steamDatagramMaxSerializedTicket = Int(512)

    /// Steamworks `k_cbMaxSteamDatagramGameCoordinatorServerLoginAppData`
    public static let maxSteamDatagramGameCoordinatorServerLoginAppData = Int(2048)

    /// Steamworks `k_cbMaxSteamDatagramGameCoordinatorServerLoginSerialized`
    public static let maxSteamDatagramGameCoordinatorServerLoginSerialized = Int(4096)
}
