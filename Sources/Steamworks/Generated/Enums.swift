//
//  Enums.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks `AudioPlayback_Status`
public enum AudioPlaybackStatus: UInt32 {
    /// Steamworks `AudioPlayback_Undefined`
    case undefined = 0
    /// Steamworks `AudioPlayback_Playing`
    case playing = 1
    /// Steamworks `AudioPlayback_Paused`
    case paused = 2
    /// Steamworks `AudioPlayback_Idle`
    case idle = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension AudioPlayback_Status: RawConvertible { typealias From = AudioPlaybackStatus }
extension AudioPlaybackStatus: EnumWithUnrepresented { typealias From = AudioPlayback_Status }

/// Steamworks `EAccountType`
public enum AccountType: UInt32 {
    /// Steamworks `k_EAccountTypeInvalid`
    case invalid = 0
    /// Steamworks `k_EAccountTypeIndividual`
    case individual = 1
    /// Steamworks `k_EAccountTypeMultiseat`
    case multiseat = 2
    /// Steamworks `k_EAccountTypeGameServer`
    case gameServer = 3
    /// Steamworks `k_EAccountTypeAnonGameServer`
    case anonGameServer = 4
    /// Steamworks `k_EAccountTypePending`
    case pending = 5
    /// Steamworks `k_EAccountTypeContentServer`
    case contentServer = 6
    /// Steamworks `k_EAccountTypeClan`
    case clan = 7
    /// Steamworks `k_EAccountTypeChat`
    case chat = 8
    /// Steamworks `k_EAccountTypeConsoleUser`
    case consoleUser = 9
    /// Steamworks `k_EAccountTypeAnonUser`
    case anonUser = 10
    /// Steamworks `k_EAccountTypeMax`
    case max = 11
    /// Some undocumented value
    case unrepresentedInSwift = 12
}

extension EAccountType: RawConvertible { typealias From = AccountType }
extension AccountType: EnumWithUnrepresented { typealias From = EAccountType }

/// Steamworks `EActivateGameOverlayToWebPageMode`
public enum ActivateGameOverlayToWebPageMode: UInt32 {
    /// Steamworks `k_EActivateGameOverlayToWebPageMode_Default`
    case `default` = 0
    /// Steamworks `k_EActivateGameOverlayToWebPageMode_Modal`
    case modal = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension EActivateGameOverlayToWebPageMode: RawConvertible { typealias From = ActivateGameOverlayToWebPageMode }
extension ActivateGameOverlayToWebPageMode: EnumWithUnrepresented { typealias From = EActivateGameOverlayToWebPageMode }

/// Steamworks `EAuthSessionResponse`
public enum AuthSessionResponse: UInt32 {
    /// Steamworks `k_EAuthSessionResponseOK`
    case ok = 0
    /// Steamworks `k_EAuthSessionResponseUserNotConnectedToSteam`
    case userNotConnectedToSteam = 1
    /// Steamworks `k_EAuthSessionResponseNoLicenseOrExpired`
    case noLicenseOrExpired = 2
    /// Steamworks `k_EAuthSessionResponseVACBanned`
    case vacBanned = 3
    /// Steamworks `k_EAuthSessionResponseLoggedInElseWhere`
    case loggedInElseWhere = 4
    /// Steamworks `k_EAuthSessionResponseVACCheckTimedOut`
    case vacCheckTimedOut = 5
    /// Steamworks `k_EAuthSessionResponseAuthTicketCanceled`
    case authTicketCanceled = 6
    /// Steamworks `k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed`
    case authTicketInvalidAlreadyUsed = 7
    /// Steamworks `k_EAuthSessionResponseAuthTicketInvalid`
    case authTicketInvalid = 8
    /// Steamworks `k_EAuthSessionResponsePublisherIssuedBan`
    case publisherIssuedBan = 9
    /// Some undocumented value
    case unrepresentedInSwift = 10
}

extension EAuthSessionResponse: RawConvertible { typealias From = AuthSessionResponse }
extension AuthSessionResponse: EnumWithUnrepresented { typealias From = EAuthSessionResponse }

/// Steamworks `EBeginAuthSessionResult`
public enum BeginAuthSessionResult: UInt32 {
    /// Steamworks `k_EBeginAuthSessionResultOK`
    case ok = 0
    /// Steamworks `k_EBeginAuthSessionResultInvalidTicket`
    case invalidTicket = 1
    /// Steamworks `k_EBeginAuthSessionResultDuplicateRequest`
    case duplicateRequest = 2
    /// Steamworks `k_EBeginAuthSessionResultInvalidVersion`
    case invalidVersion = 3
    /// Steamworks `k_EBeginAuthSessionResultGameMismatch`
    case gameMismatch = 4
    /// Steamworks `k_EBeginAuthSessionResultExpiredTicket`
    case expiredTicket = 5
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension EBeginAuthSessionResult: RawConvertible { typealias From = BeginAuthSessionResult }
extension BeginAuthSessionResult: EnumWithUnrepresented { typealias From = EBeginAuthSessionResult }

/// Steamworks `EBroadcastUploadResult`
public enum BroadcastUploadResult: UInt32 {
    /// Steamworks `k_EBroadcastUploadResultNone`
    case none = 0
    /// Steamworks `k_EBroadcastUploadResultOK`
    case ok = 1
    /// Steamworks `k_EBroadcastUploadResultInitFailed`
    case initFailed = 2
    /// Steamworks `k_EBroadcastUploadResultFrameFailed`
    case frameFailed = 3
    /// Steamworks `k_EBroadcastUploadResultTimeout`
    case timeout = 4
    /// Steamworks `k_EBroadcastUploadResultBandwidthExceeded`
    case bandwidthExceeded = 5
    /// Steamworks `k_EBroadcastUploadResultLowFPS`
    case lowFPS = 6
    /// Steamworks `k_EBroadcastUploadResultMissingKeyFrames`
    case missingKeyFrames = 7
    /// Steamworks `k_EBroadcastUploadResultNoConnection`
    case noConnection = 8
    /// Steamworks `k_EBroadcastUploadResultRelayFailed`
    case relayFailed = 9
    /// Steamworks `k_EBroadcastUploadResultSettingsChanged`
    case settingsChanged = 10
    /// Steamworks `k_EBroadcastUploadResultMissingAudio`
    case missingAudio = 11
    /// Steamworks `k_EBroadcastUploadResultTooFarBehind`
    case tooFarBehind = 12
    /// Steamworks `k_EBroadcastUploadResultTranscodeBehind`
    case transcodeBehind = 13
    /// Steamworks `k_EBroadcastUploadResultNotAllowedToPlay`
    case notAllowedToPlay = 14
    /// Steamworks `k_EBroadcastUploadResultBusy`
    case busy = 15
    /// Steamworks `k_EBroadcastUploadResultBanned`
    case banned = 16
    /// Steamworks `k_EBroadcastUploadResultAlreadyActive`
    case alreadyActive = 17
    /// Steamworks `k_EBroadcastUploadResultForcedOff`
    case forcedOff = 18
    /// Steamworks `k_EBroadcastUploadResultAudioBehind`
    case audioBehind = 19
    /// Steamworks `k_EBroadcastUploadResultShutdown`
    case shutdown = 20
    /// Steamworks `k_EBroadcastUploadResultDisconnect`
    case disconnect = 21
    /// Steamworks `k_EBroadcastUploadResultVideoInitFailed`
    case videoInitFailed = 22
    /// Steamworks `k_EBroadcastUploadResultAudioInitFailed`
    case audioInitFailed = 23
    /// Some undocumented value
    case unrepresentedInSwift = 24
}

extension EBroadcastUploadResult: RawConvertible { typealias From = BroadcastUploadResult }
extension BroadcastUploadResult: EnumWithUnrepresented { typealias From = EBroadcastUploadResult }

/// Steamworks `EChatEntryType`
public enum ChatEntryType: UInt32 {
    /// Steamworks `k_EChatEntryTypeInvalid`
    case invalid = 0
    /// Steamworks `k_EChatEntryTypeChatMsg`
    case chatMsg = 1
    /// Steamworks `k_EChatEntryTypeTyping`
    case typing = 2
    /// Steamworks `k_EChatEntryTypeInviteGame`
    case inviteGame = 3
    /// Steamworks `k_EChatEntryTypeEmote`
    case emote = 4
    /// Steamworks `k_EChatEntryTypeLeftConversation`
    case leftConversation = 6
    /// Steamworks `k_EChatEntryTypeEntered`
    case entered = 7
    /// Steamworks `k_EChatEntryTypeWasKicked`
    case wasKicked = 8
    /// Steamworks `k_EChatEntryTypeWasBanned`
    case wasBanned = 9
    /// Steamworks `k_EChatEntryTypeDisconnected`
    case disconnected = 10
    /// Steamworks `k_EChatEntryTypeHistoricalChat`
    case historicalChat = 11
    /// Steamworks `k_EChatEntryTypeLinkBlocked`
    case linkBlocked = 14
    /// Some undocumented value
    case unrepresentedInSwift = 15
}

extension EChatEntryType: RawConvertible { typealias From = ChatEntryType }
extension ChatEntryType: EnumWithUnrepresented { typealias From = EChatEntryType }

/// Steamworks `EChatMemberStateChange`
public enum ChatMemberStateChange: UInt32 {
    /// Steamworks `k_EChatMemberStateChangeEntered`
    case entered = 1
    /// Steamworks `k_EChatMemberStateChangeLeft`
    case left = 2
    /// Steamworks `k_EChatMemberStateChangeDisconnected`
    case disconnected = 4
    /// Steamworks `k_EChatMemberStateChangeKicked`
    case kicked = 8
    /// Steamworks `k_EChatMemberStateChangeBanned`
    case banned = 16
    /// Some undocumented value
    case unrepresentedInSwift = 17
}

extension EChatMemberStateChange: RawConvertible { typealias From = ChatMemberStateChange }
extension ChatMemberStateChange: EnumWithUnrepresented { typealias From = EChatMemberStateChange }

/// Steamworks `EChatRoomEnterResponse`
public enum ChatRoomEnterResponse: UInt32 {
    /// Steamworks `k_EChatRoomEnterResponseSuccess`
    case success = 1
    /// Steamworks `k_EChatRoomEnterResponseDoesntExist`
    case doesntExist = 2
    /// Steamworks `k_EChatRoomEnterResponseNotAllowed`
    case notAllowed = 3
    /// Steamworks `k_EChatRoomEnterResponseFull`
    case full = 4
    /// Steamworks `k_EChatRoomEnterResponseError`
    case error = 5
    /// Steamworks `k_EChatRoomEnterResponseBanned`
    case banned = 6
    /// Steamworks `k_EChatRoomEnterResponseLimited`
    case limited = 7
    /// Steamworks `k_EChatRoomEnterResponseClanDisabled`
    case clanDisabled = 8
    /// Steamworks `k_EChatRoomEnterResponseCommunityBan`
    case communityBan = 9
    /// Steamworks `k_EChatRoomEnterResponseMemberBlockedYou`
    case memberBlockedYou = 10
    /// Steamworks `k_EChatRoomEnterResponseYouBlockedMember`
    case youBlockedMember = 11
    /// Steamworks `k_EChatRoomEnterResponseRatelimitExceeded`
    case ratelimitExceeded = 15
    /// Some undocumented value
    case unrepresentedInSwift = 16
}

extension EChatRoomEnterResponse: RawConvertible { typealias From = ChatRoomEnterResponse }
extension ChatRoomEnterResponse: EnumWithUnrepresented { typealias From = EChatRoomEnterResponse }

/// Steamworks `EChatSteamIDInstanceFlags`
public struct ChatSteamIDInstanceFlags: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_EChatAccountInstanceMask`
    public static let accountInstanceMask = ChatSteamIDInstanceFlags(rawValue: 4095)
    /// Steamworks `k_EChatInstanceFlagClan`
    public static let clan = ChatSteamIDInstanceFlags(rawValue: 524288)
    /// Steamworks `k_EChatInstanceFlagLobby`
    public static let lobby = ChatSteamIDInstanceFlags(rawValue: 262144)
    /// Steamworks `k_EChatInstanceFlagMMSLobby`
    public static let mmsLobby = ChatSteamIDInstanceFlags(rawValue: 131072)
}

extension EChatSteamIDInstanceFlags: RawConvertible { typealias From = ChatSteamIDInstanceFlags }
extension ChatSteamIDInstanceFlags: RawConvertible { typealias From = EChatSteamIDInstanceFlags }

/// Steamworks `ECheckFileSignature`
public enum CheckFileSignatureResult: UInt32 {
    /// Steamworks `k_ECheckFileSignatureInvalidSignature`
    case invalidSignature = 0
    /// Steamworks `k_ECheckFileSignatureValidSignature`
    case validSignature = 1
    /// Steamworks `k_ECheckFileSignatureFileNotFound`
    case fileNotFound = 2
    /// Steamworks `k_ECheckFileSignatureNoSignaturesFoundForThisApp`
    case noSignaturesFoundForThisApp = 3
    /// Steamworks `k_ECheckFileSignatureNoSignaturesFoundForThisFile`
    case noSignaturesFoundForThisFile = 4
    /// Some undocumented value
    case unrepresentedInSwift = 5
}

extension ECheckFileSignature: RawConvertible { typealias From = CheckFileSignatureResult }
extension CheckFileSignatureResult: EnumWithUnrepresented { typealias From = ECheckFileSignature }

/// Steamworks `EControllerActionOrigin`
public enum ControllerActionOrigin: UInt32 {
    /// Steamworks `k_EControllerActionOrigin_None`
    case none = 0
    /// Steamworks `k_EControllerActionOrigin_A`
    case a = 1
    /// Steamworks `k_EControllerActionOrigin_B`
    case b = 2
    /// Steamworks `k_EControllerActionOrigin_X`
    case x = 3
    /// Steamworks `k_EControllerActionOrigin_Y`
    case y = 4
    /// Steamworks `k_EControllerActionOrigin_LeftBumper`
    case leftBumper = 5
    /// Steamworks `k_EControllerActionOrigin_RightBumper`
    case rightBumper = 6
    /// Steamworks `k_EControllerActionOrigin_LeftGrip`
    case leftGrip = 7
    /// Steamworks `k_EControllerActionOrigin_RightGrip`
    case rightGrip = 8
    /// Steamworks `k_EControllerActionOrigin_Start`
    case start = 9
    /// Steamworks `k_EControllerActionOrigin_Back`
    case back = 10
    /// Steamworks `k_EControllerActionOrigin_LeftPad_Touch`
    case leftPadTouch = 11
    /// Steamworks `k_EControllerActionOrigin_LeftPad_Swipe`
    case leftPadSwipe = 12
    /// Steamworks `k_EControllerActionOrigin_LeftPad_Click`
    case leftPadClick = 13
    /// Steamworks `k_EControllerActionOrigin_LeftPad_DPadNorth`
    case leftPadDPadNorth = 14
    /// Steamworks `k_EControllerActionOrigin_LeftPad_DPadSouth`
    case leftPadDPadSouth = 15
    /// Steamworks `k_EControllerActionOrigin_LeftPad_DPadWest`
    case leftPadDPadWest = 16
    /// Steamworks `k_EControllerActionOrigin_LeftPad_DPadEast`
    case leftPadDPadEast = 17
    /// Steamworks `k_EControllerActionOrigin_RightPad_Touch`
    case rightPadTouch = 18
    /// Steamworks `k_EControllerActionOrigin_RightPad_Swipe`
    case rightPadSwipe = 19
    /// Steamworks `k_EControllerActionOrigin_RightPad_Click`
    case rightPadClick = 20
    /// Steamworks `k_EControllerActionOrigin_RightPad_DPadNorth`
    case rightPadDPadNorth = 21
    /// Steamworks `k_EControllerActionOrigin_RightPad_DPadSouth`
    case rightPadDPadSouth = 22
    /// Steamworks `k_EControllerActionOrigin_RightPad_DPadWest`
    case rightPadDPadWest = 23
    /// Steamworks `k_EControllerActionOrigin_RightPad_DPadEast`
    case rightPadDPadEast = 24
    /// Steamworks `k_EControllerActionOrigin_LeftTrigger_Pull`
    case leftTriggerPull = 25
    /// Steamworks `k_EControllerActionOrigin_LeftTrigger_Click`
    case leftTriggerClick = 26
    /// Steamworks `k_EControllerActionOrigin_RightTrigger_Pull`
    case rightTriggerPull = 27
    /// Steamworks `k_EControllerActionOrigin_RightTrigger_Click`
    case rightTriggerClick = 28
    /// Steamworks `k_EControllerActionOrigin_LeftStick_Move`
    case leftStickMove = 29
    /// Steamworks `k_EControllerActionOrigin_LeftStick_Click`
    case leftStickClick = 30
    /// Steamworks `k_EControllerActionOrigin_LeftStick_DPadNorth`
    case leftStickDPadNorth = 31
    /// Steamworks `k_EControllerActionOrigin_LeftStick_DPadSouth`
    case leftStickDPadSouth = 32
    /// Steamworks `k_EControllerActionOrigin_LeftStick_DPadWest`
    case leftStickDPadWest = 33
    /// Steamworks `k_EControllerActionOrigin_LeftStick_DPadEast`
    case leftStickDPadEast = 34
    /// Steamworks `k_EControllerActionOrigin_Gyro_Move`
    case gyroMove = 35
    /// Steamworks `k_EControllerActionOrigin_Gyro_Pitch`
    case gyroPitch = 36
    /// Steamworks `k_EControllerActionOrigin_Gyro_Yaw`
    case gyroYaw = 37
    /// Steamworks `k_EControllerActionOrigin_Gyro_Roll`
    case gyroRoll = 38
    /// Steamworks `k_EControllerActionOrigin_PS4_X`
    case ps4X = 39
    /// Steamworks `k_EControllerActionOrigin_PS4_Circle`
    case ps4Circle = 40
    /// Steamworks `k_EControllerActionOrigin_PS4_Triangle`
    case ps4Triangle = 41
    /// Steamworks `k_EControllerActionOrigin_PS4_Square`
    case ps4Square = 42
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftBumper`
    case ps4LeftBumper = 43
    /// Steamworks `k_EControllerActionOrigin_PS4_RightBumper`
    case ps4RightBumper = 44
    /// Steamworks `k_EControllerActionOrigin_PS4_Options`
    case ps4Options = 45
    /// Steamworks `k_EControllerActionOrigin_PS4_Share`
    case ps4Share = 46
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftPad_Touch`
    case ps4LeftPadTouch = 47
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftPad_Swipe`
    case ps4LeftPadSwipe = 48
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftPad_Click`
    case ps4LeftPadClick = 49
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftPad_DPadNorth`
    case ps4LeftPadDPadNorth = 50
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftPad_DPadSouth`
    case ps4LeftPadDPadSouth = 51
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftPad_DPadWest`
    case ps4LeftPadDPadWest = 52
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftPad_DPadEast`
    case ps4LeftPadDPadEast = 53
    /// Steamworks `k_EControllerActionOrigin_PS4_RightPad_Touch`
    case ps4RightPadTouch = 54
    /// Steamworks `k_EControllerActionOrigin_PS4_RightPad_Swipe`
    case ps4RightPadSwipe = 55
    /// Steamworks `k_EControllerActionOrigin_PS4_RightPad_Click`
    case ps4RightPadClick = 56
    /// Steamworks `k_EControllerActionOrigin_PS4_RightPad_DPadNorth`
    case ps4RightPadDPadNorth = 57
    /// Steamworks `k_EControllerActionOrigin_PS4_RightPad_DPadSouth`
    case ps4RightPadDPadSouth = 58
    /// Steamworks `k_EControllerActionOrigin_PS4_RightPad_DPadWest`
    case ps4RightPadDPadWest = 59
    /// Steamworks `k_EControllerActionOrigin_PS4_RightPad_DPadEast`
    case ps4RightPadDPadEast = 60
    /// Steamworks `k_EControllerActionOrigin_PS4_CenterPad_Touch`
    case ps4CenterPadTouch = 61
    /// Steamworks `k_EControllerActionOrigin_PS4_CenterPad_Swipe`
    case ps4CenterPadSwipe = 62
    /// Steamworks `k_EControllerActionOrigin_PS4_CenterPad_Click`
    case ps4CenterPadClick = 63
    /// Steamworks `k_EControllerActionOrigin_PS4_CenterPad_DPadNorth`
    case ps4CenterPadDPadNorth = 64
    /// Steamworks `k_EControllerActionOrigin_PS4_CenterPad_DPadSouth`
    case ps4CenterPadDPadSouth = 65
    /// Steamworks `k_EControllerActionOrigin_PS4_CenterPad_DPadWest`
    case ps4CenterPadDPadWest = 66
    /// Steamworks `k_EControllerActionOrigin_PS4_CenterPad_DPadEast`
    case ps4CenterPadDPadEast = 67
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftTrigger_Pull`
    case ps4LeftTriggerPull = 68
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftTrigger_Click`
    case ps4LeftTriggerClick = 69
    /// Steamworks `k_EControllerActionOrigin_PS4_RightTrigger_Pull`
    case ps4RightTriggerPull = 70
    /// Steamworks `k_EControllerActionOrigin_PS4_RightTrigger_Click`
    case ps4RightTriggerClick = 71
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftStick_Move`
    case ps4LeftStickMove = 72
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftStick_Click`
    case ps4LeftStickClick = 73
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftStick_DPadNorth`
    case ps4LeftStickDPadNorth = 74
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftStick_DPadSouth`
    case ps4LeftStickDPadSouth = 75
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftStick_DPadWest`
    case ps4LeftStickDPadWest = 76
    /// Steamworks `k_EControllerActionOrigin_PS4_LeftStick_DPadEast`
    case ps4LeftStickDPadEast = 77
    /// Steamworks `k_EControllerActionOrigin_PS4_RightStick_Move`
    case ps4RightStickMove = 78
    /// Steamworks `k_EControllerActionOrigin_PS4_RightStick_Click`
    case ps4RightStickClick = 79
    /// Steamworks `k_EControllerActionOrigin_PS4_RightStick_DPadNorth`
    case ps4RightStickDPadNorth = 80
    /// Steamworks `k_EControllerActionOrigin_PS4_RightStick_DPadSouth`
    case ps4RightStickDPadSouth = 81
    /// Steamworks `k_EControllerActionOrigin_PS4_RightStick_DPadWest`
    case ps4RightStickDPadWest = 82
    /// Steamworks `k_EControllerActionOrigin_PS4_RightStick_DPadEast`
    case ps4RightStickDPadEast = 83
    /// Steamworks `k_EControllerActionOrigin_PS4_DPad_North`
    case ps4DPadNorth = 84
    /// Steamworks `k_EControllerActionOrigin_PS4_DPad_South`
    case ps4DPadSouth = 85
    /// Steamworks `k_EControllerActionOrigin_PS4_DPad_West`
    case ps4DPadWest = 86
    /// Steamworks `k_EControllerActionOrigin_PS4_DPad_East`
    case ps4DPadEast = 87
    /// Steamworks `k_EControllerActionOrigin_PS4_Gyro_Move`
    case ps4GyroMove = 88
    /// Steamworks `k_EControllerActionOrigin_PS4_Gyro_Pitch`
    case ps4GyroPitch = 89
    /// Steamworks `k_EControllerActionOrigin_PS4_Gyro_Yaw`
    case ps4GyroYaw = 90
    /// Steamworks `k_EControllerActionOrigin_PS4_Gyro_Roll`
    case ps4GyroRoll = 91
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_A`
    case xBoxOneA = 92
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_B`
    case xBoxOneB = 93
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_X`
    case xBoxOneX = 94
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_Y`
    case xBoxOneY = 95
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftBumper`
    case xBoxOneLeftBumper = 96
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightBumper`
    case xBoxOneRightBumper = 97
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_Menu`
    case xBoxOneMenu = 98
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_View`
    case xBoxOneView = 99
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull`
    case xBoxOneLeftTriggerPull = 100
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click`
    case xBoxOneLeftTriggerClick = 101
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull`
    case xBoxOneRightTriggerPull = 102
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightTrigger_Click`
    case xBoxOneRightTriggerClick = 103
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftStick_Move`
    case xBoxOneLeftStickMove = 104
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftStick_Click`
    case xBoxOneLeftStickClick = 105
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth`
    case xBoxOneLeftStickDPadNorth = 106
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth`
    case xBoxOneLeftStickDPadSouth = 107
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest`
    case xBoxOneLeftStickDPadWest = 108
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast`
    case xBoxOneLeftStickDPadEast = 109
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightStick_Move`
    case xBoxOneRightStickMove = 110
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightStick_Click`
    case xBoxOneRightStickClick = 111
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth`
    case xBoxOneRightStickDPadNorth = 112
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth`
    case xBoxOneRightStickDPadSouth = 113
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest`
    case xBoxOneRightStickDPadWest = 114
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast`
    case xBoxOneRightStickDPadEast = 115
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_DPad_North`
    case xBoxOneDPadNorth = 116
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_DPad_South`
    case xBoxOneDPadSouth = 117
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_DPad_West`
    case xBoxOneDPadWest = 118
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_DPad_East`
    case xBoxOneDPadEast = 119
    /// Steamworks `k_EControllerActionOrigin_XBox360_A`
    case xBox360A = 120
    /// Steamworks `k_EControllerActionOrigin_XBox360_B`
    case xBox360B = 121
    /// Steamworks `k_EControllerActionOrigin_XBox360_X`
    case xBox360X = 122
    /// Steamworks `k_EControllerActionOrigin_XBox360_Y`
    case xBox360Y = 123
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftBumper`
    case xBox360LeftBumper = 124
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightBumper`
    case xBox360RightBumper = 125
    /// Steamworks `k_EControllerActionOrigin_XBox360_Start`
    case xBox360Start = 126
    /// Steamworks `k_EControllerActionOrigin_XBox360_Back`
    case xBox360Back = 127
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftTrigger_Pull`
    case xBox360LeftTriggerPull = 128
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftTrigger_Click`
    case xBox360LeftTriggerClick = 129
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightTrigger_Pull`
    case xBox360RightTriggerPull = 130
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightTrigger_Click`
    case xBox360RightTriggerClick = 131
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftStick_Move`
    case xBox360LeftStickMove = 132
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftStick_Click`
    case xBox360LeftStickClick = 133
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth`
    case xBox360LeftStickDPadNorth = 134
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth`
    case xBox360LeftStickDPadSouth = 135
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftStick_DPadWest`
    case xBox360LeftStickDPadWest = 136
    /// Steamworks `k_EControllerActionOrigin_XBox360_LeftStick_DPadEast`
    case xBox360LeftStickDPadEast = 137
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightStick_Move`
    case xBox360RightStickMove = 138
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightStick_Click`
    case xBox360RightStickClick = 139
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightStick_DPadNorth`
    case xBox360RightStickDPadNorth = 140
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightStick_DPadSouth`
    case xBox360RightStickDPadSouth = 141
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightStick_DPadWest`
    case xBox360RightStickDPadWest = 142
    /// Steamworks `k_EControllerActionOrigin_XBox360_RightStick_DPadEast`
    case xBox360RightStickDPadEast = 143
    /// Steamworks `k_EControllerActionOrigin_XBox360_DPad_North`
    case xBox360DPadNorth = 144
    /// Steamworks `k_EControllerActionOrigin_XBox360_DPad_South`
    case xBox360DPadSouth = 145
    /// Steamworks `k_EControllerActionOrigin_XBox360_DPad_West`
    case xBox360DPadWest = 146
    /// Steamworks `k_EControllerActionOrigin_XBox360_DPad_East`
    case xBox360DPadEast = 147
    /// Steamworks `k_EControllerActionOrigin_SteamV2_A`
    case steamV2A = 148
    /// Steamworks `k_EControllerActionOrigin_SteamV2_B`
    case steamV2B = 149
    /// Steamworks `k_EControllerActionOrigin_SteamV2_X`
    case steamV2X = 150
    /// Steamworks `k_EControllerActionOrigin_SteamV2_Y`
    case steamV2Y = 151
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftBumper`
    case steamV2LeftBumper = 152
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightBumper`
    case steamV2RightBumper = 153
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftGrip_Lower`
    case steamV2LeftGripLower = 154
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftGrip_Upper`
    case steamV2LeftGripUpper = 155
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightGrip_Lower`
    case steamV2RightGripLower = 156
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightGrip_Upper`
    case steamV2RightGripUpper = 157
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftBumper_Pressure`
    case steamV2LeftBumperPressure = 158
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightBumper_Pressure`
    case steamV2RightBumperPressure = 159
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftGrip_Pressure`
    case steamV2LeftGripPressure = 160
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightGrip_Pressure`
    case steamV2RightGripPressure = 161
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftGrip_Upper_Pressure`
    case steamV2LeftGripUpperPressure = 162
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightGrip_Upper_Pressure`
    case steamV2RightGripUpperPressure = 163
    /// Steamworks `k_EControllerActionOrigin_SteamV2_Start`
    case steamV2Start = 164
    /// Steamworks `k_EControllerActionOrigin_SteamV2_Back`
    case steamV2Back = 165
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftPad_Touch`
    case steamV2LeftPadTouch = 166
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftPad_Swipe`
    case steamV2LeftPadSwipe = 167
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftPad_Click`
    case steamV2LeftPadClick = 168
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftPad_Pressure`
    case steamV2LeftPadPressure = 169
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth`
    case steamV2LeftPadDPadNorth = 170
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth`
    case steamV2LeftPadDPadSouth = 171
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest`
    case steamV2LeftPadDPadWest = 172
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast`
    case steamV2LeftPadDPadEast = 173
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightPad_Touch`
    case steamV2RightPadTouch = 174
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightPad_Swipe`
    case steamV2RightPadSwipe = 175
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightPad_Click`
    case steamV2RightPadClick = 176
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightPad_Pressure`
    case steamV2RightPadPressure = 177
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth`
    case steamV2RightPadDPadNorth = 178
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth`
    case steamV2RightPadDPadSouth = 179
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightPad_DPadWest`
    case steamV2RightPadDPadWest = 180
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightPad_DPadEast`
    case steamV2RightPadDPadEast = 181
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull`
    case steamV2LeftTriggerPull = 182
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftTrigger_Click`
    case steamV2LeftTriggerClick = 183
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightTrigger_Pull`
    case steamV2RightTriggerPull = 184
    /// Steamworks `k_EControllerActionOrigin_SteamV2_RightTrigger_Click`
    case steamV2RightTriggerClick = 185
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftStick_Move`
    case steamV2LeftStickMove = 186
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftStick_Click`
    case steamV2LeftStickClick = 187
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth`
    case steamV2LeftStickDPadNorth = 188
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth`
    case steamV2LeftStickDPadSouth = 189
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest`
    case steamV2LeftStickDPadWest = 190
    /// Steamworks `k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast`
    case steamV2LeftStickDPadEast = 191
    /// Steamworks `k_EControllerActionOrigin_SteamV2_Gyro_Move`
    case steamV2GyroMove = 192
    /// Steamworks `k_EControllerActionOrigin_SteamV2_Gyro_Pitch`
    case steamV2GyroPitch = 193
    /// Steamworks `k_EControllerActionOrigin_SteamV2_Gyro_Yaw`
    case steamV2GyroYaw = 194
    /// Steamworks `k_EControllerActionOrigin_SteamV2_Gyro_Roll`
    case steamV2GyroRoll = 195
    /// Steamworks `k_EControllerActionOrigin_Switch_A`
    case switchA = 196
    /// Steamworks `k_EControllerActionOrigin_Switch_B`
    case switchB = 197
    /// Steamworks `k_EControllerActionOrigin_Switch_X`
    case switchX = 198
    /// Steamworks `k_EControllerActionOrigin_Switch_Y`
    case switchY = 199
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftBumper`
    case switchLeftBumper = 200
    /// Steamworks `k_EControllerActionOrigin_Switch_RightBumper`
    case switchRightBumper = 201
    /// Steamworks `k_EControllerActionOrigin_Switch_Plus`
    case switchPlus = 202
    /// Steamworks `k_EControllerActionOrigin_Switch_Minus`
    case switchMinus = 203
    /// Steamworks `k_EControllerActionOrigin_Switch_Capture`
    case switchCapture = 204
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftTrigger_Pull`
    case switchLeftTriggerPull = 205
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftTrigger_Click`
    case switchLeftTriggerClick = 206
    /// Steamworks `k_EControllerActionOrigin_Switch_RightTrigger_Pull`
    case switchRightTriggerPull = 207
    /// Steamworks `k_EControllerActionOrigin_Switch_RightTrigger_Click`
    case switchRightTriggerClick = 208
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftStick_Move`
    case switchLeftStickMove = 209
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftStick_Click`
    case switchLeftStickClick = 210
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftStick_DPadNorth`
    case switchLeftStickDPadNorth = 211
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftStick_DPadSouth`
    case switchLeftStickDPadSouth = 212
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftStick_DPadWest`
    case switchLeftStickDPadWest = 213
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftStick_DPadEast`
    case switchLeftStickDPadEast = 214
    /// Steamworks `k_EControllerActionOrigin_Switch_RightStick_Move`
    case switchRightStickMove = 215
    /// Steamworks `k_EControllerActionOrigin_Switch_RightStick_Click`
    case switchRightStickClick = 216
    /// Steamworks `k_EControllerActionOrigin_Switch_RightStick_DPadNorth`
    case switchRightStickDPadNorth = 217
    /// Steamworks `k_EControllerActionOrigin_Switch_RightStick_DPadSouth`
    case switchRightStickDPadSouth = 218
    /// Steamworks `k_EControllerActionOrigin_Switch_RightStick_DPadWest`
    case switchRightStickDPadWest = 219
    /// Steamworks `k_EControllerActionOrigin_Switch_RightStick_DPadEast`
    case switchRightStickDPadEast = 220
    /// Steamworks `k_EControllerActionOrigin_Switch_DPad_North`
    case switchDPadNorth = 221
    /// Steamworks `k_EControllerActionOrigin_Switch_DPad_South`
    case switchDPadSouth = 222
    /// Steamworks `k_EControllerActionOrigin_Switch_DPad_West`
    case switchDPadWest = 223
    /// Steamworks `k_EControllerActionOrigin_Switch_DPad_East`
    case switchDPadEast = 224
    /// Steamworks `k_EControllerActionOrigin_Switch_ProGyro_Move`
    case switchProGyroMove = 225
    /// Steamworks `k_EControllerActionOrigin_Switch_ProGyro_Pitch`
    case switchProGyroPitch = 226
    /// Steamworks `k_EControllerActionOrigin_Switch_ProGyro_Yaw`
    case switchProGyroYaw = 227
    /// Steamworks `k_EControllerActionOrigin_Switch_ProGyro_Roll`
    case switchProGyroRoll = 228
    /// Steamworks `k_EControllerActionOrigin_Switch_RightGyro_Move`
    case switchRightGyroMove = 229
    /// Steamworks `k_EControllerActionOrigin_Switch_RightGyro_Pitch`
    case switchRightGyroPitch = 230
    /// Steamworks `k_EControllerActionOrigin_Switch_RightGyro_Yaw`
    case switchRightGyroYaw = 231
    /// Steamworks `k_EControllerActionOrigin_Switch_RightGyro_Roll`
    case switchRightGyroRoll = 232
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftGyro_Move`
    case switchLeftGyroMove = 233
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftGyro_Pitch`
    case switchLeftGyroPitch = 234
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftGyro_Yaw`
    case switchLeftGyroYaw = 235
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftGyro_Roll`
    case switchLeftGyroRoll = 236
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftGrip_Lower`
    case switchLeftGripLower = 237
    /// Steamworks `k_EControllerActionOrigin_Switch_LeftGrip_Upper`
    case switchLeftGripUpper = 238
    /// Steamworks `k_EControllerActionOrigin_Switch_RightGrip_Lower`
    case switchRightGripLower = 239
    /// Steamworks `k_EControllerActionOrigin_Switch_RightGrip_Upper`
    case switchRightGripUpper = 240
    /// Steamworks `k_EControllerActionOrigin_PS4_DPad_Move`
    case ps4DPadMove = 241
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_DPad_Move`
    case xBoxOneDPadMove = 242
    /// Steamworks `k_EControllerActionOrigin_XBox360_DPad_Move`
    case xBox360DPadMove = 243
    /// Steamworks `k_EControllerActionOrigin_Switch_DPad_Move`
    case switchDPadMove = 244
    /// Steamworks `k_EControllerActionOrigin_PS5_X`
    case ps5X = 245
    /// Steamworks `k_EControllerActionOrigin_PS5_Circle`
    case ps5Circle = 246
    /// Steamworks `k_EControllerActionOrigin_PS5_Triangle`
    case ps5Triangle = 247
    /// Steamworks `k_EControllerActionOrigin_PS5_Square`
    case ps5Square = 248
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftBumper`
    case ps5LeftBumper = 249
    /// Steamworks `k_EControllerActionOrigin_PS5_RightBumper`
    case ps5RightBumper = 250
    /// Steamworks `k_EControllerActionOrigin_PS5_Option`
    case ps5Option = 251
    /// Steamworks `k_EControllerActionOrigin_PS5_Create`
    case ps5Create = 252
    /// Steamworks `k_EControllerActionOrigin_PS5_Mute`
    case ps5Mute = 253
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftPad_Touch`
    case ps5LeftPadTouch = 254
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftPad_Swipe`
    case ps5LeftPadSwipe = 255
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftPad_Click`
    case ps5LeftPadClick = 256
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftPad_DPadNorth`
    case ps5LeftPadDPadNorth = 257
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftPad_DPadSouth`
    case ps5LeftPadDPadSouth = 258
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftPad_DPadWest`
    case ps5LeftPadDPadWest = 259
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftPad_DPadEast`
    case ps5LeftPadDPadEast = 260
    /// Steamworks `k_EControllerActionOrigin_PS5_RightPad_Touch`
    case ps5RightPadTouch = 261
    /// Steamworks `k_EControllerActionOrigin_PS5_RightPad_Swipe`
    case ps5RightPadSwipe = 262
    /// Steamworks `k_EControllerActionOrigin_PS5_RightPad_Click`
    case ps5RightPadClick = 263
    /// Steamworks `k_EControllerActionOrigin_PS5_RightPad_DPadNorth`
    case ps5RightPadDPadNorth = 264
    /// Steamworks `k_EControllerActionOrigin_PS5_RightPad_DPadSouth`
    case ps5RightPadDPadSouth = 265
    /// Steamworks `k_EControllerActionOrigin_PS5_RightPad_DPadWest`
    case ps5RightPadDPadWest = 266
    /// Steamworks `k_EControllerActionOrigin_PS5_RightPad_DPadEast`
    case ps5RightPadDPadEast = 267
    /// Steamworks `k_EControllerActionOrigin_PS5_CenterPad_Touch`
    case ps5CenterPadTouch = 268
    /// Steamworks `k_EControllerActionOrigin_PS5_CenterPad_Swipe`
    case ps5CenterPadSwipe = 269
    /// Steamworks `k_EControllerActionOrigin_PS5_CenterPad_Click`
    case ps5CenterPadClick = 270
    /// Steamworks `k_EControllerActionOrigin_PS5_CenterPad_DPadNorth`
    case ps5CenterPadDPadNorth = 271
    /// Steamworks `k_EControllerActionOrigin_PS5_CenterPad_DPadSouth`
    case ps5CenterPadDPadSouth = 272
    /// Steamworks `k_EControllerActionOrigin_PS5_CenterPad_DPadWest`
    case ps5CenterPadDPadWest = 273
    /// Steamworks `k_EControllerActionOrigin_PS5_CenterPad_DPadEast`
    case ps5CenterPadDPadEast = 274
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftTrigger_Pull`
    case ps5LeftTriggerPull = 275
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftTrigger_Click`
    case ps5LeftTriggerClick = 276
    /// Steamworks `k_EControllerActionOrigin_PS5_RightTrigger_Pull`
    case ps5RightTriggerPull = 277
    /// Steamworks `k_EControllerActionOrigin_PS5_RightTrigger_Click`
    case ps5RightTriggerClick = 278
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftStick_Move`
    case ps5LeftStickMove = 279
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftStick_Click`
    case ps5LeftStickClick = 280
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftStick_DPadNorth`
    case ps5LeftStickDPadNorth = 281
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftStick_DPadSouth`
    case ps5LeftStickDPadSouth = 282
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftStick_DPadWest`
    case ps5LeftStickDPadWest = 283
    /// Steamworks `k_EControllerActionOrigin_PS5_LeftStick_DPadEast`
    case ps5LeftStickDPadEast = 284
    /// Steamworks `k_EControllerActionOrigin_PS5_RightStick_Move`
    case ps5RightStickMove = 285
    /// Steamworks `k_EControllerActionOrigin_PS5_RightStick_Click`
    case ps5RightStickClick = 286
    /// Steamworks `k_EControllerActionOrigin_PS5_RightStick_DPadNorth`
    case ps5RightStickDPadNorth = 287
    /// Steamworks `k_EControllerActionOrigin_PS5_RightStick_DPadSouth`
    case ps5RightStickDPadSouth = 288
    /// Steamworks `k_EControllerActionOrigin_PS5_RightStick_DPadWest`
    case ps5RightStickDPadWest = 289
    /// Steamworks `k_EControllerActionOrigin_PS5_RightStick_DPadEast`
    case ps5RightStickDPadEast = 290
    /// Steamworks `k_EControllerActionOrigin_PS5_DPad_Move`
    case ps5DPadMove = 291
    /// Steamworks `k_EControllerActionOrigin_PS5_DPad_North`
    case ps5DPadNorth = 292
    /// Steamworks `k_EControllerActionOrigin_PS5_DPad_South`
    case ps5DPadSouth = 293
    /// Steamworks `k_EControllerActionOrigin_PS5_DPad_West`
    case ps5DPadWest = 294
    /// Steamworks `k_EControllerActionOrigin_PS5_DPad_East`
    case ps5DPadEast = 295
    /// Steamworks `k_EControllerActionOrigin_PS5_Gyro_Move`
    case ps5GyroMove = 296
    /// Steamworks `k_EControllerActionOrigin_PS5_Gyro_Pitch`
    case ps5GyroPitch = 297
    /// Steamworks `k_EControllerActionOrigin_PS5_Gyro_Yaw`
    case ps5GyroYaw = 298
    /// Steamworks `k_EControllerActionOrigin_PS5_Gyro_Roll`
    case ps5GyroRoll = 299
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftGrip_Lower`
    case xBoxOneLeftGripLower = 300
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_LeftGrip_Upper`
    case xBoxOneLeftGripUpper = 301
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightGrip_Lower`
    case xBoxOneRightGripLower = 302
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_RightGrip_Upper`
    case xBoxOneRightGripUpper = 303
    /// Steamworks `k_EControllerActionOrigin_XBoxOne_Share`
    case xBoxOneShare = 304
    /// Steamworks `k_EControllerActionOrigin_Count`
    case count = 305
    /// Steamworks `k_EControllerActionOrigin_MaximumPossibleValue`
    case maximumPossibleValue = 32767
    /// Some undocumented value
    case unrepresentedInSwift = 32768
}

extension EControllerActionOrigin: RawConvertible { typealias From = ControllerActionOrigin }
extension ControllerActionOrigin: EnumWithUnrepresented { typealias From = EControllerActionOrigin }

/// Steamworks `EControllerHapticLocation`
public enum ControllerHapticLocation: UInt32 {
    /// Steamworks `k_EControllerHapticLocation_Left`
    case left = 1
    /// Steamworks `k_EControllerHapticLocation_Right`
    case right = 2
    /// Steamworks `k_EControllerHapticLocation_Both`
    case both = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension EControllerHapticLocation: RawConvertible { typealias From = ControllerHapticLocation }
extension ControllerHapticLocation: EnumWithUnrepresented { typealias From = EControllerHapticLocation }

/// Steamworks `EControllerHapticType`
public enum ControllerHapticType: UInt32 {
    /// Steamworks `k_EControllerHapticType_Off`
    case off = 0
    /// Steamworks `k_EControllerHapticType_Tick`
    case tick = 1
    /// Steamworks `k_EControllerHapticType_Click`
    case click = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension EControllerHapticType: RawConvertible { typealias From = ControllerHapticType }
extension ControllerHapticType: EnumWithUnrepresented { typealias From = EControllerHapticType }

/// Steamworks `EDenyReason`
public enum DenyReason: UInt32 {
    /// Steamworks `k_EDenyInvalid`
    case invalid = 0
    /// Steamworks `k_EDenyInvalidVersion`
    case invalidVersion = 1
    /// Steamworks `k_EDenyGeneric`
    case generic = 2
    /// Steamworks `k_EDenyNotLoggedOn`
    case notLoggedOn = 3
    /// Steamworks `k_EDenyNoLicense`
    case noLicense = 4
    /// Steamworks `k_EDenyCheater`
    case cheater = 5
    /// Steamworks `k_EDenyLoggedInElseWhere`
    case loggedInElseWhere = 6
    /// Steamworks `k_EDenyUnknownText`
    case unknownText = 7
    /// Steamworks `k_EDenyIncompatibleAnticheat`
    case incompatibleAnticheat = 8
    /// Steamworks `k_EDenyMemoryCorruption`
    case memoryCorruption = 9
    /// Steamworks `k_EDenyIncompatibleSoftware`
    case incompatibleSoftware = 10
    /// Steamworks `k_EDenySteamConnectionLost`
    case steamConnectionLost = 11
    /// Steamworks `k_EDenySteamConnectionError`
    case steamConnectionError = 12
    /// Steamworks `k_EDenySteamResponseTimedOut`
    case steamResponseTimedOut = 13
    /// Steamworks `k_EDenySteamValidationStalled`
    case steamValidationStalled = 14
    /// Steamworks `k_EDenySteamOwnerLeftGuestUser`
    case steamOwnerLeftGuestUser = 15
    /// Some undocumented value
    case unrepresentedInSwift = 16
}

extension EDenyReason: RawConvertible { typealias From = DenyReason }
extension DenyReason: EnumWithUnrepresented { typealias From = EDenyReason }

/// Steamworks `EDurationControlNotification`
public enum DurationControlNotification: UInt32 {
    /// Steamworks `k_EDurationControlNotification_None`
    case none = 0
    /// Steamworks `k_EDurationControlNotification_1Hour`
    case in1Hour = 1
    /// Steamworks `k_EDurationControlNotification_3Hours`
    case in3Hours = 2
    /// Steamworks `k_EDurationControlNotification_HalfProgress`
    case halfProgress = 3
    /// Steamworks `k_EDurationControlNotification_NoProgress`
    case noProgress = 4
    /// Steamworks `k_EDurationControlNotification_ExitSoon_3h`
    case exitSoon3h = 5
    /// Steamworks `k_EDurationControlNotification_ExitSoon_5h`
    case exitSoon5h = 6
    /// Steamworks `k_EDurationControlNotification_ExitSoon_Night`
    case exitSoonNight = 7
    /// Some undocumented value
    case unrepresentedInSwift = 8
}

extension EDurationControlNotification: RawConvertible { typealias From = DurationControlNotification }
extension DurationControlNotification: EnumWithUnrepresented { typealias From = EDurationControlNotification }

/// Steamworks `EDurationControlOnlineState`
public enum DurationControlOnlineState: UInt32 {
    /// Steamworks `k_EDurationControlOnlineState_Invalid`
    case invalid = 0
    /// Steamworks `k_EDurationControlOnlineState_Offline`
    case offline = 1
    /// Steamworks `k_EDurationControlOnlineState_Online`
    case online = 2
    /// Steamworks `k_EDurationControlOnlineState_OnlineHighPri`
    case onlineHighPri = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension EDurationControlOnlineState: RawConvertible { typealias From = DurationControlOnlineState }
extension DurationControlOnlineState: EnumWithUnrepresented { typealias From = EDurationControlOnlineState }

/// Steamworks `EDurationControlProgress`
public enum DurationControlProgress: UInt32 {
    /// Steamworks `k_EDurationControlProgress_Full`
    case full = 0
    /// Steamworks `k_EDurationControlProgress_Half`
    case half = 1
    /// Steamworks `k_EDurationControlProgress_None`
    case none = 2
    /// Steamworks `k_EDurationControl_ExitSoon_3h`
    case exitSoon3h = 3
    /// Steamworks `k_EDurationControl_ExitSoon_5h`
    case exitSoon5h = 4
    /// Steamworks `k_EDurationControl_ExitSoon_Night`
    case exitSoonNight = 5
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension EDurationControlProgress: RawConvertible { typealias From = DurationControlProgress }
extension DurationControlProgress: EnumWithUnrepresented { typealias From = EDurationControlProgress }

/// Steamworks `EFavoriteFlags`
public enum FavoriteFlags: UInt32 {
    /// Steamworks `k_unFavoriteFlagNone`
    case none = 0
    /// Steamworks `k_unFavoriteFlagFavorite`
    case favorite = 1
    /// Steamworks `k_unFavoriteFlagHistory`
    case history = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension EFavoriteFlags: RawConvertible { typealias From = FavoriteFlags }
extension FavoriteFlags: EnumWithUnrepresented { typealias From = EFavoriteFlags }

/// Steamworks `EFriendFlags`
public struct FriendFlags: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_EFriendFlagNone`
    public static let none = FriendFlags([])
    /// Steamworks `k_EFriendFlagBlocked`
    public static let blocked = FriendFlags(rawValue: 1)
    /// Steamworks `k_EFriendFlagFriendshipRequested`
    public static let friendshipRequested = FriendFlags(rawValue: 2)
    /// Steamworks `k_EFriendFlagImmediate`
    public static let immediate = FriendFlags(rawValue: 4)
    /// Steamworks `k_EFriendFlagClanMember`
    public static let clanMember = FriendFlags(rawValue: 8)
    /// Steamworks `k_EFriendFlagOnGameServer`
    public static let onGameServer = FriendFlags(rawValue: 16)
    /// Steamworks `k_EFriendFlagRequestingFriendship`
    public static let requestingFriendship = FriendFlags(rawValue: 128)
    /// Steamworks `k_EFriendFlagRequestingInfo`
    public static let requestingInfo = FriendFlags(rawValue: 256)
    /// Steamworks `k_EFriendFlagIgnored`
    public static let ignored = FriendFlags(rawValue: 512)
    /// Steamworks `k_EFriendFlagIgnoredFriend`
    public static let ignoredFriend = FriendFlags(rawValue: 1024)
    /// Steamworks `k_EFriendFlagChatMember`
    public static let chatMember = FriendFlags(rawValue: 4096)
    /// Steamworks `k_EFriendFlagAll`
    public static let all = FriendFlags(rawValue: 65535)
}

extension EFriendFlags: RawConvertible { typealias From = FriendFlags }
extension FriendFlags: RawConvertible { typealias From = EFriendFlags }

/// Steamworks `EFriendRelationship`
public enum FriendRelationship: UInt32 {
    /// Steamworks `k_EFriendRelationshipNone`
    case none = 0
    /// Steamworks `k_EFriendRelationshipBlocked`
    case blocked = 1
    /// Steamworks `k_EFriendRelationshipRequestRecipient`
    case requestRecipient = 2
    /// Steamworks `k_EFriendRelationshipFriend`
    case friend = 3
    /// Steamworks `k_EFriendRelationshipRequestInitiator`
    case requestInitiator = 4
    /// Steamworks `k_EFriendRelationshipIgnored`
    case ignored = 5
    /// Steamworks `k_EFriendRelationshipIgnoredFriend`
    case ignoredFriend = 6
    /// Steamworks `k_EFriendRelationshipSuggested_DEPRECATED`
    case suggestedDEPRECATED = 7
    /// Steamworks `k_EFriendRelationshipMax`
    case max = 8
    /// Some undocumented value
    case unrepresentedInSwift = 9
}

extension EFriendRelationship: RawConvertible { typealias From = FriendRelationship }
extension FriendRelationship: EnumWithUnrepresented { typealias From = EFriendRelationship }

/// Steamworks `EGameSearchErrorCode_t`
public enum GameSearchErrorCode: UInt32 {
    /// Steamworks `k_EGameSearchErrorCode_OK`
    case ok = 1
    /// Steamworks `k_EGameSearchErrorCode_Failed_Search_Already_In_Progress`
    case failedSearchAlreadyInProgress = 2
    /// Steamworks `k_EGameSearchErrorCode_Failed_No_Search_In_Progress`
    case failedNoSearchInProgress = 3
    /// Steamworks `k_EGameSearchErrorCode_Failed_Not_Lobby_Leader`
    case failedNotLobbyLeader = 4
    /// Steamworks `k_EGameSearchErrorCode_Failed_No_Host_Available`
    case failedNoHostAvailable = 5
    /// Steamworks `k_EGameSearchErrorCode_Failed_Search_Params_Invalid`
    case failedSearchParamsInvalid = 6
    /// Steamworks `k_EGameSearchErrorCode_Failed_Offline`
    case failedOffline = 7
    /// Steamworks `k_EGameSearchErrorCode_Failed_NotAuthorized`
    case failedNotAuthorized = 8
    /// Steamworks `k_EGameSearchErrorCode_Failed_Unknown_Error`
    case failedUnknownError = 9
    /// Some undocumented value
    case unrepresentedInSwift = 10
}

extension EGameSearchErrorCode_t: RawConvertible { typealias From = GameSearchErrorCode }
extension GameSearchErrorCode: EnumWithUnrepresented { typealias From = EGameSearchErrorCode_t }

/// Steamworks `EGamepadTextInputLineMode`
public enum GamepadTextInputLineMode: UInt32 {
    /// Steamworks `k_EGamepadTextInputLineModeSingleLine`
    case singleLine = 0
    /// Steamworks `k_EGamepadTextInputLineModeMultipleLines`
    case multipleLines = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension EGamepadTextInputLineMode: RawConvertible { typealias From = GamepadTextInputLineMode }
extension GamepadTextInputLineMode: EnumWithUnrepresented { typealias From = EGamepadTextInputLineMode }

/// Steamworks `EGamepadTextInputMode`
public enum GamepadTextInputMode: UInt32 {
    /// Steamworks `k_EGamepadTextInputModeNormal`
    case normal = 0
    /// Steamworks `k_EGamepadTextInputModePassword`
    case password = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension EGamepadTextInputMode: RawConvertible { typealias From = GamepadTextInputMode }
extension GamepadTextInputMode: EnumWithUnrepresented { typealias From = EGamepadTextInputMode }

/// Steamworks `EHTTPMethod`
public enum HTTPMethod: UInt32 {
    /// Steamworks `k_EHTTPMethodInvalid`
    case invalid = 0
    /// Steamworks `k_EHTTPMethodGET`
    case get = 1
    /// Steamworks `k_EHTTPMethodHEAD`
    case head = 2
    /// Steamworks `k_EHTTPMethodPOST`
    case post = 3
    /// Steamworks `k_EHTTPMethodPUT`
    case put = 4
    /// Steamworks `k_EHTTPMethodDELETE`
    case delete = 5
    /// Steamworks `k_EHTTPMethodOPTIONS`
    case options = 6
    /// Steamworks `k_EHTTPMethodPATCH`
    case patch = 7
    /// Some undocumented value
    case unrepresentedInSwift = 8
}

extension EHTTPMethod: RawConvertible { typealias From = HTTPMethod }
extension HTTPMethod: EnumWithUnrepresented { typealias From = EHTTPMethod }

/// Steamworks `EHTTPStatusCode`
public enum HTTPStatusCode: UInt32 {
    /// Steamworks `k_EHTTPStatusCodeInvalid`
    case invalid = 0
    /// Steamworks `k_EHTTPStatusCode100Continue`
    case http100Continue = 100
    /// Steamworks `k_EHTTPStatusCode101SwitchingProtocols`
    case http101SwitchingProtocols = 101
    /// Steamworks `k_EHTTPStatusCode200OK`
    case http200OK = 200
    /// Steamworks `k_EHTTPStatusCode201Created`
    case http201Created = 201
    /// Steamworks `k_EHTTPStatusCode202Accepted`
    case http202Accepted = 202
    /// Steamworks `k_EHTTPStatusCode203NonAuthoritative`
    case http203NonAuthoritative = 203
    /// Steamworks `k_EHTTPStatusCode204NoContent`
    case http204NoContent = 204
    /// Steamworks `k_EHTTPStatusCode205ResetContent`
    case http205ResetContent = 205
    /// Steamworks `k_EHTTPStatusCode206PartialContent`
    case http206PartialContent = 206
    /// Steamworks `k_EHTTPStatusCode300MultipleChoices`
    case http300MultipleChoices = 300
    /// Steamworks `k_EHTTPStatusCode301MovedPermanently`
    case http301MovedPermanently = 301
    /// Steamworks `k_EHTTPStatusCode302Found`
    case http302Found = 302
    /// Steamworks `k_EHTTPStatusCode303SeeOther`
    case http303SeeOther = 303
    /// Steamworks `k_EHTTPStatusCode304NotModified`
    case http304NotModified = 304
    /// Steamworks `k_EHTTPStatusCode305UseProxy`
    case http305UseProxy = 305
    /// Steamworks `k_EHTTPStatusCode307TemporaryRedirect`
    case http307TemporaryRedirect = 307
    /// Steamworks `k_EHTTPStatusCode400BadRequest`
    case http400BadRequest = 400
    /// Steamworks `k_EHTTPStatusCode401Unauthorized`
    case http401Unauthorized = 401
    /// Steamworks `k_EHTTPStatusCode402PaymentRequired`
    case http402PaymentRequired = 402
    /// Steamworks `k_EHTTPStatusCode403Forbidden`
    case http403Forbidden = 403
    /// Steamworks `k_EHTTPStatusCode404NotFound`
    case http404NotFound = 404
    /// Steamworks `k_EHTTPStatusCode405MethodNotAllowed`
    case http405MethodNotAllowed = 405
    /// Steamworks `k_EHTTPStatusCode406NotAcceptable`
    case http406NotAcceptable = 406
    /// Steamworks `k_EHTTPStatusCode407ProxyAuthRequired`
    case http407ProxyAuthRequired = 407
    /// Steamworks `k_EHTTPStatusCode408RequestTimeout`
    case http408RequestTimeout = 408
    /// Steamworks `k_EHTTPStatusCode409Conflict`
    case http409Conflict = 409
    /// Steamworks `k_EHTTPStatusCode410Gone`
    case http410Gone = 410
    /// Steamworks `k_EHTTPStatusCode411LengthRequired`
    case http411LengthRequired = 411
    /// Steamworks `k_EHTTPStatusCode412PreconditionFailed`
    case http412PreconditionFailed = 412
    /// Steamworks `k_EHTTPStatusCode413RequestEntityTooLarge`
    case http413RequestEntityTooLarge = 413
    /// Steamworks `k_EHTTPStatusCode414RequestURITooLong`
    case http414RequestURITooLong = 414
    /// Steamworks `k_EHTTPStatusCode415UnsupportedMediaType`
    case http415UnsupportedMediaType = 415
    /// Steamworks `k_EHTTPStatusCode416RequestedRangeNotSatisfiable`
    case http416RequestedRangeNotSatisfiable = 416
    /// Steamworks `k_EHTTPStatusCode417ExpectationFailed`
    case http417ExpectationFailed = 417
    /// Steamworks `k_EHTTPStatusCode4xxUnknown`
    case http4xxUnknown = 418
    /// Steamworks `k_EHTTPStatusCode429TooManyRequests`
    case http429TooManyRequests = 429
    /// Steamworks `k_EHTTPStatusCode444ConnectionClosed`
    case http444ConnectionClosed = 444
    /// Steamworks `k_EHTTPStatusCode500InternalServerError`
    case http500InternalServerError = 500
    /// Steamworks `k_EHTTPStatusCode501NotImplemented`
    case http501NotImplemented = 501
    /// Steamworks `k_EHTTPStatusCode502BadGateway`
    case http502BadGateway = 502
    /// Steamworks `k_EHTTPStatusCode503ServiceUnavailable`
    case http503ServiceUnavailable = 503
    /// Steamworks `k_EHTTPStatusCode504GatewayTimeout`
    case http504GatewayTimeout = 504
    /// Steamworks `k_EHTTPStatusCode505HTTPVersionNotSupported`
    case http505HTTPVersionNotSupported = 505
    /// Steamworks `k_EHTTPStatusCode5xxUnknown`
    case http5xxUnknown = 599
    /// Some undocumented value
    case unrepresentedInSwift = 600
}

extension EHTTPStatusCode: RawConvertible { typealias From = HTTPStatusCode }
extension HTTPStatusCode: EnumWithUnrepresented { typealias From = EHTTPStatusCode }

/// Steamworks `EInputActionOrigin`
public enum InputActionOrigin: UInt32 {
    /// Steamworks `k_EInputActionOrigin_None`
    case none = 0
    /// Steamworks `k_EInputActionOrigin_SteamController_A`
    case steamControllerA = 1
    /// Steamworks `k_EInputActionOrigin_SteamController_B`
    case steamControllerB = 2
    /// Steamworks `k_EInputActionOrigin_SteamController_X`
    case steamControllerX = 3
    /// Steamworks `k_EInputActionOrigin_SteamController_Y`
    case steamControllerY = 4
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftBumper`
    case steamControllerLeftBumper = 5
    /// Steamworks `k_EInputActionOrigin_SteamController_RightBumper`
    case steamControllerRightBumper = 6
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftGrip`
    case steamControllerLeftGrip = 7
    /// Steamworks `k_EInputActionOrigin_SteamController_RightGrip`
    case steamControllerRightGrip = 8
    /// Steamworks `k_EInputActionOrigin_SteamController_Start`
    case steamControllerStart = 9
    /// Steamworks `k_EInputActionOrigin_SteamController_Back`
    case steamControllerBack = 10
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftPad_Touch`
    case steamControllerLeftPadTouch = 11
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftPad_Swipe`
    case steamControllerLeftPadSwipe = 12
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftPad_Click`
    case steamControllerLeftPadClick = 13
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftPad_DPadNorth`
    case steamControllerLeftPadDPadNorth = 14
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftPad_DPadSouth`
    case steamControllerLeftPadDPadSouth = 15
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftPad_DPadWest`
    case steamControllerLeftPadDPadWest = 16
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftPad_DPadEast`
    case steamControllerLeftPadDPadEast = 17
    /// Steamworks `k_EInputActionOrigin_SteamController_RightPad_Touch`
    case steamControllerRightPadTouch = 18
    /// Steamworks `k_EInputActionOrigin_SteamController_RightPad_Swipe`
    case steamControllerRightPadSwipe = 19
    /// Steamworks `k_EInputActionOrigin_SteamController_RightPad_Click`
    case steamControllerRightPadClick = 20
    /// Steamworks `k_EInputActionOrigin_SteamController_RightPad_DPadNorth`
    case steamControllerRightPadDPadNorth = 21
    /// Steamworks `k_EInputActionOrigin_SteamController_RightPad_DPadSouth`
    case steamControllerRightPadDPadSouth = 22
    /// Steamworks `k_EInputActionOrigin_SteamController_RightPad_DPadWest`
    case steamControllerRightPadDPadWest = 23
    /// Steamworks `k_EInputActionOrigin_SteamController_RightPad_DPadEast`
    case steamControllerRightPadDPadEast = 24
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftTrigger_Pull`
    case steamControllerLeftTriggerPull = 25
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftTrigger_Click`
    case steamControllerLeftTriggerClick = 26
    /// Steamworks `k_EInputActionOrigin_SteamController_RightTrigger_Pull`
    case steamControllerRightTriggerPull = 27
    /// Steamworks `k_EInputActionOrigin_SteamController_RightTrigger_Click`
    case steamControllerRightTriggerClick = 28
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftStick_Move`
    case steamControllerLeftStickMove = 29
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftStick_Click`
    case steamControllerLeftStickClick = 30
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftStick_DPadNorth`
    case steamControllerLeftStickDPadNorth = 31
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftStick_DPadSouth`
    case steamControllerLeftStickDPadSouth = 32
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftStick_DPadWest`
    case steamControllerLeftStickDPadWest = 33
    /// Steamworks `k_EInputActionOrigin_SteamController_LeftStick_DPadEast`
    case steamControllerLeftStickDPadEast = 34
    /// Steamworks `k_EInputActionOrigin_SteamController_Gyro_Move`
    case steamControllerGyroMove = 35
    /// Steamworks `k_EInputActionOrigin_SteamController_Gyro_Pitch`
    case steamControllerGyroPitch = 36
    /// Steamworks `k_EInputActionOrigin_SteamController_Gyro_Yaw`
    case steamControllerGyroYaw = 37
    /// Steamworks `k_EInputActionOrigin_SteamController_Gyro_Roll`
    case steamControllerGyroRoll = 38
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved0`
    case steamControllerReserved0 = 39
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved1`
    case steamControllerReserved1 = 40
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved2`
    case steamControllerReserved2 = 41
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved3`
    case steamControllerReserved3 = 42
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved4`
    case steamControllerReserved4 = 43
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved5`
    case steamControllerReserved5 = 44
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved6`
    case steamControllerReserved6 = 45
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved7`
    case steamControllerReserved7 = 46
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved8`
    case steamControllerReserved8 = 47
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved9`
    case steamControllerReserved9 = 48
    /// Steamworks `k_EInputActionOrigin_SteamController_Reserved10`
    case steamControllerReserved10 = 49
    /// Steamworks `k_EInputActionOrigin_PS4_X`
    case ps4X = 50
    /// Steamworks `k_EInputActionOrigin_PS4_Circle`
    case ps4Circle = 51
    /// Steamworks `k_EInputActionOrigin_PS4_Triangle`
    case ps4Triangle = 52
    /// Steamworks `k_EInputActionOrigin_PS4_Square`
    case ps4Square = 53
    /// Steamworks `k_EInputActionOrigin_PS4_LeftBumper`
    case ps4LeftBumper = 54
    /// Steamworks `k_EInputActionOrigin_PS4_RightBumper`
    case ps4RightBumper = 55
    /// Steamworks `k_EInputActionOrigin_PS4_Options`
    case ps4Options = 56
    /// Steamworks `k_EInputActionOrigin_PS4_Share`
    case ps4Share = 57
    /// Steamworks `k_EInputActionOrigin_PS4_LeftPad_Touch`
    case ps4LeftPadTouch = 58
    /// Steamworks `k_EInputActionOrigin_PS4_LeftPad_Swipe`
    case ps4LeftPadSwipe = 59
    /// Steamworks `k_EInputActionOrigin_PS4_LeftPad_Click`
    case ps4LeftPadClick = 60
    /// Steamworks `k_EInputActionOrigin_PS4_LeftPad_DPadNorth`
    case ps4LeftPadDPadNorth = 61
    /// Steamworks `k_EInputActionOrigin_PS4_LeftPad_DPadSouth`
    case ps4LeftPadDPadSouth = 62
    /// Steamworks `k_EInputActionOrigin_PS4_LeftPad_DPadWest`
    case ps4LeftPadDPadWest = 63
    /// Steamworks `k_EInputActionOrigin_PS4_LeftPad_DPadEast`
    case ps4LeftPadDPadEast = 64
    /// Steamworks `k_EInputActionOrigin_PS4_RightPad_Touch`
    case ps4RightPadTouch = 65
    /// Steamworks `k_EInputActionOrigin_PS4_RightPad_Swipe`
    case ps4RightPadSwipe = 66
    /// Steamworks `k_EInputActionOrigin_PS4_RightPad_Click`
    case ps4RightPadClick = 67
    /// Steamworks `k_EInputActionOrigin_PS4_RightPad_DPadNorth`
    case ps4RightPadDPadNorth = 68
    /// Steamworks `k_EInputActionOrigin_PS4_RightPad_DPadSouth`
    case ps4RightPadDPadSouth = 69
    /// Steamworks `k_EInputActionOrigin_PS4_RightPad_DPadWest`
    case ps4RightPadDPadWest = 70
    /// Steamworks `k_EInputActionOrigin_PS4_RightPad_DPadEast`
    case ps4RightPadDPadEast = 71
    /// Steamworks `k_EInputActionOrigin_PS4_CenterPad_Touch`
    case ps4CenterPadTouch = 72
    /// Steamworks `k_EInputActionOrigin_PS4_CenterPad_Swipe`
    case ps4CenterPadSwipe = 73
    /// Steamworks `k_EInputActionOrigin_PS4_CenterPad_Click`
    case ps4CenterPadClick = 74
    /// Steamworks `k_EInputActionOrigin_PS4_CenterPad_DPadNorth`
    case ps4CenterPadDPadNorth = 75
    /// Steamworks `k_EInputActionOrigin_PS4_CenterPad_DPadSouth`
    case ps4CenterPadDPadSouth = 76
    /// Steamworks `k_EInputActionOrigin_PS4_CenterPad_DPadWest`
    case ps4CenterPadDPadWest = 77
    /// Steamworks `k_EInputActionOrigin_PS4_CenterPad_DPadEast`
    case ps4CenterPadDPadEast = 78
    /// Steamworks `k_EInputActionOrigin_PS4_LeftTrigger_Pull`
    case ps4LeftTriggerPull = 79
    /// Steamworks `k_EInputActionOrigin_PS4_LeftTrigger_Click`
    case ps4LeftTriggerClick = 80
    /// Steamworks `k_EInputActionOrigin_PS4_RightTrigger_Pull`
    case ps4RightTriggerPull = 81
    /// Steamworks `k_EInputActionOrigin_PS4_RightTrigger_Click`
    case ps4RightTriggerClick = 82
    /// Steamworks `k_EInputActionOrigin_PS4_LeftStick_Move`
    case ps4LeftStickMove = 83
    /// Steamworks `k_EInputActionOrigin_PS4_LeftStick_Click`
    case ps4LeftStickClick = 84
    /// Steamworks `k_EInputActionOrigin_PS4_LeftStick_DPadNorth`
    case ps4LeftStickDPadNorth = 85
    /// Steamworks `k_EInputActionOrigin_PS4_LeftStick_DPadSouth`
    case ps4LeftStickDPadSouth = 86
    /// Steamworks `k_EInputActionOrigin_PS4_LeftStick_DPadWest`
    case ps4LeftStickDPadWest = 87
    /// Steamworks `k_EInputActionOrigin_PS4_LeftStick_DPadEast`
    case ps4LeftStickDPadEast = 88
    /// Steamworks `k_EInputActionOrigin_PS4_RightStick_Move`
    case ps4RightStickMove = 89
    /// Steamworks `k_EInputActionOrigin_PS4_RightStick_Click`
    case ps4RightStickClick = 90
    /// Steamworks `k_EInputActionOrigin_PS4_RightStick_DPadNorth`
    case ps4RightStickDPadNorth = 91
    /// Steamworks `k_EInputActionOrigin_PS4_RightStick_DPadSouth`
    case ps4RightStickDPadSouth = 92
    /// Steamworks `k_EInputActionOrigin_PS4_RightStick_DPadWest`
    case ps4RightStickDPadWest = 93
    /// Steamworks `k_EInputActionOrigin_PS4_RightStick_DPadEast`
    case ps4RightStickDPadEast = 94
    /// Steamworks `k_EInputActionOrigin_PS4_DPad_North`
    case ps4DPadNorth = 95
    /// Steamworks `k_EInputActionOrigin_PS4_DPad_South`
    case ps4DPadSouth = 96
    /// Steamworks `k_EInputActionOrigin_PS4_DPad_West`
    case ps4DPadWest = 97
    /// Steamworks `k_EInputActionOrigin_PS4_DPad_East`
    case ps4DPadEast = 98
    /// Steamworks `k_EInputActionOrigin_PS4_Gyro_Move`
    case ps4GyroMove = 99
    /// Steamworks `k_EInputActionOrigin_PS4_Gyro_Pitch`
    case ps4GyroPitch = 100
    /// Steamworks `k_EInputActionOrigin_PS4_Gyro_Yaw`
    case ps4GyroYaw = 101
    /// Steamworks `k_EInputActionOrigin_PS4_Gyro_Roll`
    case ps4GyroRoll = 102
    /// Steamworks `k_EInputActionOrigin_PS4_DPad_Move`
    case ps4DPadMove = 103
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved1`
    case ps4Reserved1 = 104
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved2`
    case ps4Reserved2 = 105
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved3`
    case ps4Reserved3 = 106
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved4`
    case ps4Reserved4 = 107
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved5`
    case ps4Reserved5 = 108
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved6`
    case ps4Reserved6 = 109
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved7`
    case ps4Reserved7 = 110
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved8`
    case ps4Reserved8 = 111
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved9`
    case ps4Reserved9 = 112
    /// Steamworks `k_EInputActionOrigin_PS4_Reserved10`
    case ps4Reserved10 = 113
    /// Steamworks `k_EInputActionOrigin_XBoxOne_A`
    case xBoxOneA = 114
    /// Steamworks `k_EInputActionOrigin_XBoxOne_B`
    case xBoxOneB = 115
    /// Steamworks `k_EInputActionOrigin_XBoxOne_X`
    case xBoxOneX = 116
    /// Steamworks `k_EInputActionOrigin_XBoxOne_Y`
    case xBoxOneY = 117
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftBumper`
    case xBoxOneLeftBumper = 118
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightBumper`
    case xBoxOneRightBumper = 119
    /// Steamworks `k_EInputActionOrigin_XBoxOne_Menu`
    case xBoxOneMenu = 120
    /// Steamworks `k_EInputActionOrigin_XBoxOne_View`
    case xBoxOneView = 121
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftTrigger_Pull`
    case xBoxOneLeftTriggerPull = 122
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftTrigger_Click`
    case xBoxOneLeftTriggerClick = 123
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightTrigger_Pull`
    case xBoxOneRightTriggerPull = 124
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightTrigger_Click`
    case xBoxOneRightTriggerClick = 125
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftStick_Move`
    case xBoxOneLeftStickMove = 126
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftStick_Click`
    case xBoxOneLeftStickClick = 127
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftStick_DPadNorth`
    case xBoxOneLeftStickDPadNorth = 128
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftStick_DPadSouth`
    case xBoxOneLeftStickDPadSouth = 129
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftStick_DPadWest`
    case xBoxOneLeftStickDPadWest = 130
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftStick_DPadEast`
    case xBoxOneLeftStickDPadEast = 131
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightStick_Move`
    case xBoxOneRightStickMove = 132
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightStick_Click`
    case xBoxOneRightStickClick = 133
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightStick_DPadNorth`
    case xBoxOneRightStickDPadNorth = 134
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightStick_DPadSouth`
    case xBoxOneRightStickDPadSouth = 135
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightStick_DPadWest`
    case xBoxOneRightStickDPadWest = 136
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightStick_DPadEast`
    case xBoxOneRightStickDPadEast = 137
    /// Steamworks `k_EInputActionOrigin_XBoxOne_DPad_North`
    case xBoxOneDPadNorth = 138
    /// Steamworks `k_EInputActionOrigin_XBoxOne_DPad_South`
    case xBoxOneDPadSouth = 139
    /// Steamworks `k_EInputActionOrigin_XBoxOne_DPad_West`
    case xBoxOneDPadWest = 140
    /// Steamworks `k_EInputActionOrigin_XBoxOne_DPad_East`
    case xBoxOneDPadEast = 141
    /// Steamworks `k_EInputActionOrigin_XBoxOne_DPad_Move`
    case xBoxOneDPadMove = 142
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftGrip_Lower`
    case xBoxOneLeftGripLower = 143
    /// Steamworks `k_EInputActionOrigin_XBoxOne_LeftGrip_Upper`
    case xBoxOneLeftGripUpper = 144
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightGrip_Lower`
    case xBoxOneRightGripLower = 145
    /// Steamworks `k_EInputActionOrigin_XBoxOne_RightGrip_Upper`
    case xBoxOneRightGripUpper = 146
    /// Steamworks `k_EInputActionOrigin_XBoxOne_Share`
    case xBoxOneShare = 147
    /// Steamworks `k_EInputActionOrigin_XBoxOne_Reserved6`
    case xBoxOneReserved6 = 148
    /// Steamworks `k_EInputActionOrigin_XBoxOne_Reserved7`
    case xBoxOneReserved7 = 149
    /// Steamworks `k_EInputActionOrigin_XBoxOne_Reserved8`
    case xBoxOneReserved8 = 150
    /// Steamworks `k_EInputActionOrigin_XBoxOne_Reserved9`
    case xBoxOneReserved9 = 151
    /// Steamworks `k_EInputActionOrigin_XBoxOne_Reserved10`
    case xBoxOneReserved10 = 152
    /// Steamworks `k_EInputActionOrigin_XBox360_A`
    case xBox360A = 153
    /// Steamworks `k_EInputActionOrigin_XBox360_B`
    case xBox360B = 154
    /// Steamworks `k_EInputActionOrigin_XBox360_X`
    case xBox360X = 155
    /// Steamworks `k_EInputActionOrigin_XBox360_Y`
    case xBox360Y = 156
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftBumper`
    case xBox360LeftBumper = 157
    /// Steamworks `k_EInputActionOrigin_XBox360_RightBumper`
    case xBox360RightBumper = 158
    /// Steamworks `k_EInputActionOrigin_XBox360_Start`
    case xBox360Start = 159
    /// Steamworks `k_EInputActionOrigin_XBox360_Back`
    case xBox360Back = 160
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftTrigger_Pull`
    case xBox360LeftTriggerPull = 161
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftTrigger_Click`
    case xBox360LeftTriggerClick = 162
    /// Steamworks `k_EInputActionOrigin_XBox360_RightTrigger_Pull`
    case xBox360RightTriggerPull = 163
    /// Steamworks `k_EInputActionOrigin_XBox360_RightTrigger_Click`
    case xBox360RightTriggerClick = 164
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftStick_Move`
    case xBox360LeftStickMove = 165
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftStick_Click`
    case xBox360LeftStickClick = 166
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftStick_DPadNorth`
    case xBox360LeftStickDPadNorth = 167
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftStick_DPadSouth`
    case xBox360LeftStickDPadSouth = 168
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftStick_DPadWest`
    case xBox360LeftStickDPadWest = 169
    /// Steamworks `k_EInputActionOrigin_XBox360_LeftStick_DPadEast`
    case xBox360LeftStickDPadEast = 170
    /// Steamworks `k_EInputActionOrigin_XBox360_RightStick_Move`
    case xBox360RightStickMove = 171
    /// Steamworks `k_EInputActionOrigin_XBox360_RightStick_Click`
    case xBox360RightStickClick = 172
    /// Steamworks `k_EInputActionOrigin_XBox360_RightStick_DPadNorth`
    case xBox360RightStickDPadNorth = 173
    /// Steamworks `k_EInputActionOrigin_XBox360_RightStick_DPadSouth`
    case xBox360RightStickDPadSouth = 174
    /// Steamworks `k_EInputActionOrigin_XBox360_RightStick_DPadWest`
    case xBox360RightStickDPadWest = 175
    /// Steamworks `k_EInputActionOrigin_XBox360_RightStick_DPadEast`
    case xBox360RightStickDPadEast = 176
    /// Steamworks `k_EInputActionOrigin_XBox360_DPad_North`
    case xBox360DPadNorth = 177
    /// Steamworks `k_EInputActionOrigin_XBox360_DPad_South`
    case xBox360DPadSouth = 178
    /// Steamworks `k_EInputActionOrigin_XBox360_DPad_West`
    case xBox360DPadWest = 179
    /// Steamworks `k_EInputActionOrigin_XBox360_DPad_East`
    case xBox360DPadEast = 180
    /// Steamworks `k_EInputActionOrigin_XBox360_DPad_Move`
    case xBox360DPadMove = 181
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved1`
    case xBox360Reserved1 = 182
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved2`
    case xBox360Reserved2 = 183
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved3`
    case xBox360Reserved3 = 184
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved4`
    case xBox360Reserved4 = 185
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved5`
    case xBox360Reserved5 = 186
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved6`
    case xBox360Reserved6 = 187
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved7`
    case xBox360Reserved7 = 188
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved8`
    case xBox360Reserved8 = 189
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved9`
    case xBox360Reserved9 = 190
    /// Steamworks `k_EInputActionOrigin_XBox360_Reserved10`
    case xBox360Reserved10 = 191
    /// Steamworks `k_EInputActionOrigin_Switch_A`
    case switchA = 192
    /// Steamworks `k_EInputActionOrigin_Switch_B`
    case switchB = 193
    /// Steamworks `k_EInputActionOrigin_Switch_X`
    case switchX = 194
    /// Steamworks `k_EInputActionOrigin_Switch_Y`
    case switchY = 195
    /// Steamworks `k_EInputActionOrigin_Switch_LeftBumper`
    case switchLeftBumper = 196
    /// Steamworks `k_EInputActionOrigin_Switch_RightBumper`
    case switchRightBumper = 197
    /// Steamworks `k_EInputActionOrigin_Switch_Plus`
    case switchPlus = 198
    /// Steamworks `k_EInputActionOrigin_Switch_Minus`
    case switchMinus = 199
    /// Steamworks `k_EInputActionOrigin_Switch_Capture`
    case switchCapture = 200
    /// Steamworks `k_EInputActionOrigin_Switch_LeftTrigger_Pull`
    case switchLeftTriggerPull = 201
    /// Steamworks `k_EInputActionOrigin_Switch_LeftTrigger_Click`
    case switchLeftTriggerClick = 202
    /// Steamworks `k_EInputActionOrigin_Switch_RightTrigger_Pull`
    case switchRightTriggerPull = 203
    /// Steamworks `k_EInputActionOrigin_Switch_RightTrigger_Click`
    case switchRightTriggerClick = 204
    /// Steamworks `k_EInputActionOrigin_Switch_LeftStick_Move`
    case switchLeftStickMove = 205
    /// Steamworks `k_EInputActionOrigin_Switch_LeftStick_Click`
    case switchLeftStickClick = 206
    /// Steamworks `k_EInputActionOrigin_Switch_LeftStick_DPadNorth`
    case switchLeftStickDPadNorth = 207
    /// Steamworks `k_EInputActionOrigin_Switch_LeftStick_DPadSouth`
    case switchLeftStickDPadSouth = 208
    /// Steamworks `k_EInputActionOrigin_Switch_LeftStick_DPadWest`
    case switchLeftStickDPadWest = 209
    /// Steamworks `k_EInputActionOrigin_Switch_LeftStick_DPadEast`
    case switchLeftStickDPadEast = 210
    /// Steamworks `k_EInputActionOrigin_Switch_RightStick_Move`
    case switchRightStickMove = 211
    /// Steamworks `k_EInputActionOrigin_Switch_RightStick_Click`
    case switchRightStickClick = 212
    /// Steamworks `k_EInputActionOrigin_Switch_RightStick_DPadNorth`
    case switchRightStickDPadNorth = 213
    /// Steamworks `k_EInputActionOrigin_Switch_RightStick_DPadSouth`
    case switchRightStickDPadSouth = 214
    /// Steamworks `k_EInputActionOrigin_Switch_RightStick_DPadWest`
    case switchRightStickDPadWest = 215
    /// Steamworks `k_EInputActionOrigin_Switch_RightStick_DPadEast`
    case switchRightStickDPadEast = 216
    /// Steamworks `k_EInputActionOrigin_Switch_DPad_North`
    case switchDPadNorth = 217
    /// Steamworks `k_EInputActionOrigin_Switch_DPad_South`
    case switchDPadSouth = 218
    /// Steamworks `k_EInputActionOrigin_Switch_DPad_West`
    case switchDPadWest = 219
    /// Steamworks `k_EInputActionOrigin_Switch_DPad_East`
    case switchDPadEast = 220
    /// Steamworks `k_EInputActionOrigin_Switch_ProGyro_Move`
    case switchProGyroMove = 221
    /// Steamworks `k_EInputActionOrigin_Switch_ProGyro_Pitch`
    case switchProGyroPitch = 222
    /// Steamworks `k_EInputActionOrigin_Switch_ProGyro_Yaw`
    case switchProGyroYaw = 223
    /// Steamworks `k_EInputActionOrigin_Switch_ProGyro_Roll`
    case switchProGyroRoll = 224
    /// Steamworks `k_EInputActionOrigin_Switch_DPad_Move`
    case switchDPadMove = 225
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved1`
    case switchReserved1 = 226
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved2`
    case switchReserved2 = 227
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved3`
    case switchReserved3 = 228
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved4`
    case switchReserved4 = 229
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved5`
    case switchReserved5 = 230
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved6`
    case switchReserved6 = 231
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved7`
    case switchReserved7 = 232
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved8`
    case switchReserved8 = 233
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved9`
    case switchReserved9 = 234
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved10`
    case switchReserved10 = 235
    /// Steamworks `k_EInputActionOrigin_Switch_RightGyro_Move`
    case switchRightGyroMove = 236
    /// Steamworks `k_EInputActionOrigin_Switch_RightGyro_Pitch`
    case switchRightGyroPitch = 237
    /// Steamworks `k_EInputActionOrigin_Switch_RightGyro_Yaw`
    case switchRightGyroYaw = 238
    /// Steamworks `k_EInputActionOrigin_Switch_RightGyro_Roll`
    case switchRightGyroRoll = 239
    /// Steamworks `k_EInputActionOrigin_Switch_LeftGyro_Move`
    case switchLeftGyroMove = 240
    /// Steamworks `k_EInputActionOrigin_Switch_LeftGyro_Pitch`
    case switchLeftGyroPitch = 241
    /// Steamworks `k_EInputActionOrigin_Switch_LeftGyro_Yaw`
    case switchLeftGyroYaw = 242
    /// Steamworks `k_EInputActionOrigin_Switch_LeftGyro_Roll`
    case switchLeftGyroRoll = 243
    /// Steamworks `k_EInputActionOrigin_Switch_LeftGrip_Lower`
    case switchLeftGripLower = 244
    /// Steamworks `k_EInputActionOrigin_Switch_LeftGrip_Upper`
    case switchLeftGripUpper = 245
    /// Steamworks `k_EInputActionOrigin_Switch_RightGrip_Lower`
    case switchRightGripLower = 246
    /// Steamworks `k_EInputActionOrigin_Switch_RightGrip_Upper`
    case switchRightGripUpper = 247
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved11`
    case switchReserved11 = 248
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved12`
    case switchReserved12 = 249
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved13`
    case switchReserved13 = 250
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved14`
    case switchReserved14 = 251
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved15`
    case switchReserved15 = 252
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved16`
    case switchReserved16 = 253
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved17`
    case switchReserved17 = 254
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved18`
    case switchReserved18 = 255
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved19`
    case switchReserved19 = 256
    /// Steamworks `k_EInputActionOrigin_Switch_Reserved20`
    case switchReserved20 = 257
    /// Steamworks `k_EInputActionOrigin_PS5_X`
    case ps5X = 258
    /// Steamworks `k_EInputActionOrigin_PS5_Circle`
    case ps5Circle = 259
    /// Steamworks `k_EInputActionOrigin_PS5_Triangle`
    case ps5Triangle = 260
    /// Steamworks `k_EInputActionOrigin_PS5_Square`
    case ps5Square = 261
    /// Steamworks `k_EInputActionOrigin_PS5_LeftBumper`
    case ps5LeftBumper = 262
    /// Steamworks `k_EInputActionOrigin_PS5_RightBumper`
    case ps5RightBumper = 263
    /// Steamworks `k_EInputActionOrigin_PS5_Option`
    case ps5Option = 264
    /// Steamworks `k_EInputActionOrigin_PS5_Create`
    case ps5Create = 265
    /// Steamworks `k_EInputActionOrigin_PS5_Mute`
    case ps5Mute = 266
    /// Steamworks `k_EInputActionOrigin_PS5_LeftPad_Touch`
    case ps5LeftPadTouch = 267
    /// Steamworks `k_EInputActionOrigin_PS5_LeftPad_Swipe`
    case ps5LeftPadSwipe = 268
    /// Steamworks `k_EInputActionOrigin_PS5_LeftPad_Click`
    case ps5LeftPadClick = 269
    /// Steamworks `k_EInputActionOrigin_PS5_LeftPad_DPadNorth`
    case ps5LeftPadDPadNorth = 270
    /// Steamworks `k_EInputActionOrigin_PS5_LeftPad_DPadSouth`
    case ps5LeftPadDPadSouth = 271
    /// Steamworks `k_EInputActionOrigin_PS5_LeftPad_DPadWest`
    case ps5LeftPadDPadWest = 272
    /// Steamworks `k_EInputActionOrigin_PS5_LeftPad_DPadEast`
    case ps5LeftPadDPadEast = 273
    /// Steamworks `k_EInputActionOrigin_PS5_RightPad_Touch`
    case ps5RightPadTouch = 274
    /// Steamworks `k_EInputActionOrigin_PS5_RightPad_Swipe`
    case ps5RightPadSwipe = 275
    /// Steamworks `k_EInputActionOrigin_PS5_RightPad_Click`
    case ps5RightPadClick = 276
    /// Steamworks `k_EInputActionOrigin_PS5_RightPad_DPadNorth`
    case ps5RightPadDPadNorth = 277
    /// Steamworks `k_EInputActionOrigin_PS5_RightPad_DPadSouth`
    case ps5RightPadDPadSouth = 278
    /// Steamworks `k_EInputActionOrigin_PS5_RightPad_DPadWest`
    case ps5RightPadDPadWest = 279
    /// Steamworks `k_EInputActionOrigin_PS5_RightPad_DPadEast`
    case ps5RightPadDPadEast = 280
    /// Steamworks `k_EInputActionOrigin_PS5_CenterPad_Touch`
    case ps5CenterPadTouch = 281
    /// Steamworks `k_EInputActionOrigin_PS5_CenterPad_Swipe`
    case ps5CenterPadSwipe = 282
    /// Steamworks `k_EInputActionOrigin_PS5_CenterPad_Click`
    case ps5CenterPadClick = 283
    /// Steamworks `k_EInputActionOrigin_PS5_CenterPad_DPadNorth`
    case ps5CenterPadDPadNorth = 284
    /// Steamworks `k_EInputActionOrigin_PS5_CenterPad_DPadSouth`
    case ps5CenterPadDPadSouth = 285
    /// Steamworks `k_EInputActionOrigin_PS5_CenterPad_DPadWest`
    case ps5CenterPadDPadWest = 286
    /// Steamworks `k_EInputActionOrigin_PS5_CenterPad_DPadEast`
    case ps5CenterPadDPadEast = 287
    /// Steamworks `k_EInputActionOrigin_PS5_LeftTrigger_Pull`
    case ps5LeftTriggerPull = 288
    /// Steamworks `k_EInputActionOrigin_PS5_LeftTrigger_Click`
    case ps5LeftTriggerClick = 289
    /// Steamworks `k_EInputActionOrigin_PS5_RightTrigger_Pull`
    case ps5RightTriggerPull = 290
    /// Steamworks `k_EInputActionOrigin_PS5_RightTrigger_Click`
    case ps5RightTriggerClick = 291
    /// Steamworks `k_EInputActionOrigin_PS5_LeftStick_Move`
    case ps5LeftStickMove = 292
    /// Steamworks `k_EInputActionOrigin_PS5_LeftStick_Click`
    case ps5LeftStickClick = 293
    /// Steamworks `k_EInputActionOrigin_PS5_LeftStick_DPadNorth`
    case ps5LeftStickDPadNorth = 294
    /// Steamworks `k_EInputActionOrigin_PS5_LeftStick_DPadSouth`
    case ps5LeftStickDPadSouth = 295
    /// Steamworks `k_EInputActionOrigin_PS5_LeftStick_DPadWest`
    case ps5LeftStickDPadWest = 296
    /// Steamworks `k_EInputActionOrigin_PS5_LeftStick_DPadEast`
    case ps5LeftStickDPadEast = 297
    /// Steamworks `k_EInputActionOrigin_PS5_RightStick_Move`
    case ps5RightStickMove = 298
    /// Steamworks `k_EInputActionOrigin_PS5_RightStick_Click`
    case ps5RightStickClick = 299
    /// Steamworks `k_EInputActionOrigin_PS5_RightStick_DPadNorth`
    case ps5RightStickDPadNorth = 300
    /// Steamworks `k_EInputActionOrigin_PS5_RightStick_DPadSouth`
    case ps5RightStickDPadSouth = 301
    /// Steamworks `k_EInputActionOrigin_PS5_RightStick_DPadWest`
    case ps5RightStickDPadWest = 302
    /// Steamworks `k_EInputActionOrigin_PS5_RightStick_DPadEast`
    case ps5RightStickDPadEast = 303
    /// Steamworks `k_EInputActionOrigin_PS5_DPad_North`
    case ps5DPadNorth = 304
    /// Steamworks `k_EInputActionOrigin_PS5_DPad_South`
    case ps5DPadSouth = 305
    /// Steamworks `k_EInputActionOrigin_PS5_DPad_West`
    case ps5DPadWest = 306
    /// Steamworks `k_EInputActionOrigin_PS5_DPad_East`
    case ps5DPadEast = 307
    /// Steamworks `k_EInputActionOrigin_PS5_Gyro_Move`
    case ps5GyroMove = 308
    /// Steamworks `k_EInputActionOrigin_PS5_Gyro_Pitch`
    case ps5GyroPitch = 309
    /// Steamworks `k_EInputActionOrigin_PS5_Gyro_Yaw`
    case ps5GyroYaw = 310
    /// Steamworks `k_EInputActionOrigin_PS5_Gyro_Roll`
    case ps5GyroRoll = 311
    /// Steamworks `k_EInputActionOrigin_PS5_DPad_Move`
    case ps5DPadMove = 312
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved1`
    case ps5Reserved1 = 313
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved2`
    case ps5Reserved2 = 314
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved3`
    case ps5Reserved3 = 315
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved4`
    case ps5Reserved4 = 316
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved5`
    case ps5Reserved5 = 317
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved6`
    case ps5Reserved6 = 318
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved7`
    case ps5Reserved7 = 319
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved8`
    case ps5Reserved8 = 320
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved9`
    case ps5Reserved9 = 321
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved10`
    case ps5Reserved10 = 322
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved11`
    case ps5Reserved11 = 323
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved12`
    case ps5Reserved12 = 324
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved13`
    case ps5Reserved13 = 325
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved14`
    case ps5Reserved14 = 326
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved15`
    case ps5Reserved15 = 327
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved16`
    case ps5Reserved16 = 328
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved17`
    case ps5Reserved17 = 329
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved18`
    case ps5Reserved18 = 330
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved19`
    case ps5Reserved19 = 331
    /// Steamworks `k_EInputActionOrigin_PS5_Reserved20`
    case ps5Reserved20 = 332
    /// Steamworks `k_EInputActionOrigin_Count`
    case count = 333
    /// Steamworks `k_EInputActionOrigin_MaximumPossibleValue`
    case maximumPossibleValue = 32767
    /// Some undocumented value
    case unrepresentedInSwift = 32768
}

extension EInputActionOrigin: RawConvertible { typealias From = InputActionOrigin }
extension InputActionOrigin: EnumWithUnrepresented { typealias From = EInputActionOrigin }

/// Steamworks `EInputSourceMode`
public enum InputSourceMode: UInt32 {
    /// Steamworks `k_EInputSourceMode_None`
    case none = 0
    /// Steamworks `k_EInputSourceMode_Dpad`
    case dpad = 1
    /// Steamworks `k_EInputSourceMode_Buttons`
    case buttons = 2
    /// Steamworks `k_EInputSourceMode_FourButtons`
    case fourButtons = 3
    /// Steamworks `k_EInputSourceMode_AbsoluteMouse`
    case absoluteMouse = 4
    /// Steamworks `k_EInputSourceMode_RelativeMouse`
    case relativeMouse = 5
    /// Steamworks `k_EInputSourceMode_JoystickMove`
    case joystickMove = 6
    /// Steamworks `k_EInputSourceMode_JoystickMouse`
    case joystickMouse = 7
    /// Steamworks `k_EInputSourceMode_JoystickCamera`
    case joystickCamera = 8
    /// Steamworks `k_EInputSourceMode_ScrollWheel`
    case scrollWheel = 9
    /// Steamworks `k_EInputSourceMode_Trigger`
    case trigger = 10
    /// Steamworks `k_EInputSourceMode_TouchMenu`
    case touchMenu = 11
    /// Steamworks `k_EInputSourceMode_MouseJoystick`
    case mouseJoystick = 12
    /// Steamworks `k_EInputSourceMode_MouseRegion`
    case mouseRegion = 13
    /// Steamworks `k_EInputSourceMode_RadialMenu`
    case radialMenu = 14
    /// Steamworks `k_EInputSourceMode_SingleButton`
    case singleButton = 15
    /// Steamworks `k_EInputSourceMode_Switches`
    case switches = 16
    /// Some undocumented value
    case unrepresentedInSwift = 17
}

extension EInputSourceMode: RawConvertible { typealias From = InputSourceMode }
extension InputSourceMode: EnumWithUnrepresented { typealias From = EInputSourceMode }

/// Steamworks `EItemPreviewType`
public enum ItemPreviewType: UInt32 {
    /// Steamworks `k_EItemPreviewType_Image`
    case image = 0
    /// Steamworks `k_EItemPreviewType_YouTubeVideo`
    case youTubeVideo = 1
    /// Steamworks `k_EItemPreviewType_Sketchfab`
    case sketchfab = 2
    /// Steamworks `k_EItemPreviewType_EnvironmentMap_HorizontalCross`
    case environmentMapHorizontalCross = 3
    /// Steamworks `k_EItemPreviewType_EnvironmentMap_LatLong`
    case environmentMapLatLong = 4
    /// Steamworks `k_EItemPreviewType_ReservedMax`
    case reservedMax = 255
    /// Some undocumented value
    case unrepresentedInSwift = 256
}

extension EItemPreviewType: RawConvertible { typealias From = ItemPreviewType }
extension ItemPreviewType: EnumWithUnrepresented { typealias From = EItemPreviewType }

/// Steamworks `EItemState`
public enum ItemState: UInt32 {
    /// Steamworks `k_EItemStateNone`
    case none = 0
    /// Steamworks `k_EItemStateSubscribed`
    case subscribed = 1
    /// Steamworks `k_EItemStateLegacyItem`
    case legacyItem = 2
    /// Steamworks `k_EItemStateInstalled`
    case installed = 4
    /// Steamworks `k_EItemStateNeedsUpdate`
    case needsUpdate = 8
    /// Steamworks `k_EItemStateDownloading`
    case downloading = 16
    /// Steamworks `k_EItemStateDownloadPending`
    case downloadPending = 32
    /// Some undocumented value
    case unrepresentedInSwift = 33
}

extension EItemState: RawConvertible { typealias From = ItemState }
extension ItemState: EnumWithUnrepresented { typealias From = EItemState }

/// Steamworks `EItemStatistic`
public enum ItemStatistic: UInt32 {
    /// Steamworks `k_EItemStatistic_NumSubscriptions`
    case numSubscriptions = 0
    /// Steamworks `k_EItemStatistic_NumFavorites`
    case numFavorites = 1
    /// Steamworks `k_EItemStatistic_NumFollowers`
    case numFollowers = 2
    /// Steamworks `k_EItemStatistic_NumUniqueSubscriptions`
    case numUniqueSubscriptions = 3
    /// Steamworks `k_EItemStatistic_NumUniqueFavorites`
    case numUniqueFavorites = 4
    /// Steamworks `k_EItemStatistic_NumUniqueFollowers`
    case numUniqueFollowers = 5
    /// Steamworks `k_EItemStatistic_NumUniqueWebsiteViews`
    case numUniqueWebsiteViews = 6
    /// Steamworks `k_EItemStatistic_ReportScore`
    case reportScore = 7
    /// Steamworks `k_EItemStatistic_NumSecondsPlayed`
    case numSecondsPlayed = 8
    /// Steamworks `k_EItemStatistic_NumPlaytimeSessions`
    case numPlaytimeSessions = 9
    /// Steamworks `k_EItemStatistic_NumComments`
    case numComments = 10
    /// Steamworks `k_EItemStatistic_NumSecondsPlayedDuringTimePeriod`
    case numSecondsPlayedDuringTimePeriod = 11
    /// Steamworks `k_EItemStatistic_NumPlaytimeSessionsDuringTimePeriod`
    case numPlaytimeSessionsDuringTimePeriod = 12
    /// Some undocumented value
    case unrepresentedInSwift = 13
}

extension EItemStatistic: RawConvertible { typealias From = ItemStatistic }
extension ItemStatistic: EnumWithUnrepresented { typealias From = EItemStatistic }

/// Steamworks `EItemUpdateStatus`
public enum ItemUpdateStatus: UInt32 {
    /// Steamworks `k_EItemUpdateStatusInvalid`
    case invalid = 0
    /// Steamworks `k_EItemUpdateStatusPreparingConfig`
    case preparingConfig = 1
    /// Steamworks `k_EItemUpdateStatusPreparingContent`
    case preparingContent = 2
    /// Steamworks `k_EItemUpdateStatusUploadingContent`
    case uploadingContent = 3
    /// Steamworks `k_EItemUpdateStatusUploadingPreviewFile`
    case uploadingPreviewFile = 4
    /// Steamworks `k_EItemUpdateStatusCommittingChanges`
    case committingChanges = 5
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension EItemUpdateStatus: RawConvertible { typealias From = ItemUpdateStatus }
extension ItemUpdateStatus: EnumWithUnrepresented { typealias From = EItemUpdateStatus }

/// Steamworks `ELeaderboardDataRequest`
public enum LeaderboardDataRequest: UInt32 {
    /// Steamworks `k_ELeaderboardDataRequestGlobal`
    case global = 0
    /// Steamworks `k_ELeaderboardDataRequestGlobalAroundUser`
    case globalAroundUser = 1
    /// Steamworks `k_ELeaderboardDataRequestFriends`
    case friends = 2
    /// Steamworks `k_ELeaderboardDataRequestUsers`
    case users = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension ELeaderboardDataRequest: RawConvertible { typealias From = LeaderboardDataRequest }
extension LeaderboardDataRequest: EnumWithUnrepresented { typealias From = ELeaderboardDataRequest }

/// Steamworks `ELeaderboardDisplayType`
public enum LeaderboardDisplayType: UInt32 {
    /// Steamworks `k_ELeaderboardDisplayTypeNone`
    case none = 0
    /// Steamworks `k_ELeaderboardDisplayTypeNumeric`
    case numeric = 1
    /// Steamworks `k_ELeaderboardDisplayTypeTimeSeconds`
    case timeSeconds = 2
    /// Steamworks `k_ELeaderboardDisplayTypeTimeMilliSeconds`
    case timeMilliSeconds = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension ELeaderboardDisplayType: RawConvertible { typealias From = LeaderboardDisplayType }
extension LeaderboardDisplayType: EnumWithUnrepresented { typealias From = ELeaderboardDisplayType }

/// Steamworks `ELeaderboardSortMethod`
public enum LeaderboardSortMethod: UInt32 {
    /// Steamworks `k_ELeaderboardSortMethodNone`
    case none = 0
    /// Steamworks `k_ELeaderboardSortMethodAscending`
    case ascending = 1
    /// Steamworks `k_ELeaderboardSortMethodDescending`
    case descending = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ELeaderboardSortMethod: RawConvertible { typealias From = LeaderboardSortMethod }
extension LeaderboardSortMethod: EnumWithUnrepresented { typealias From = ELeaderboardSortMethod }

/// Steamworks `ELeaderboardUploadScoreMethod`
public enum LeaderboardUploadScoreMethod: UInt32 {
    /// Steamworks `k_ELeaderboardUploadScoreMethodNone`
    case none = 0
    /// Steamworks `k_ELeaderboardUploadScoreMethodKeepBest`
    case keepBest = 1
    /// Steamworks `k_ELeaderboardUploadScoreMethodForceUpdate`
    case forceUpdate = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ELeaderboardUploadScoreMethod: RawConvertible { typealias From = LeaderboardUploadScoreMethod }
extension LeaderboardUploadScoreMethod: EnumWithUnrepresented { typealias From = ELeaderboardUploadScoreMethod }

/// Steamworks `ELobbyComparison`
public enum LobbyComparison: Int32 {
    /// Steamworks `k_ELobbyComparisonEqualToOrLessThan`
    case equalToOrLessThan = -2
    /// Steamworks `k_ELobbyComparisonLessThan`
    case lessThan = -1
    /// Steamworks `k_ELobbyComparisonEqual`
    case equal = 0
    /// Steamworks `k_ELobbyComparisonGreaterThan`
    case greaterThan = 1
    /// Steamworks `k_ELobbyComparisonEqualToOrGreaterThan`
    case equalToOrGreaterThan = 2
    /// Steamworks `k_ELobbyComparisonNotEqual`
    case notEqual = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension ELobbyComparison: RawConvertible { typealias From = LobbyComparison }
extension LobbyComparison: EnumWithUnrepresented { typealias From = ELobbyComparison }

/// Steamworks `ELobbyDistanceFilter`
public enum LobbyDistanceFilter: UInt32 {
    /// Steamworks `k_ELobbyDistanceFilterClose`
    case close = 0
    /// Steamworks `k_ELobbyDistanceFilterDefault`
    case `default` = 1
    /// Steamworks `k_ELobbyDistanceFilterFar`
    case far = 2
    /// Steamworks `k_ELobbyDistanceFilterWorldwide`
    case worldwide = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension ELobbyDistanceFilter: RawConvertible { typealias From = LobbyDistanceFilter }
extension LobbyDistanceFilter: EnumWithUnrepresented { typealias From = ELobbyDistanceFilter }

/// Steamworks `ELobbyType`
public enum LobbyType: UInt32 {
    /// Steamworks `k_ELobbyTypePrivate`
    case `private` = 0
    /// Steamworks `k_ELobbyTypeFriendsOnly`
    case friendsOnly = 1
    /// Steamworks `k_ELobbyTypePublic`
    case `public` = 2
    /// Steamworks `k_ELobbyTypeInvisible`
    case invisible = 3
    /// Steamworks `k_ELobbyTypePrivateUnique`
    case privateUnique = 4
    /// Some undocumented value
    case unrepresentedInSwift = 5
}

extension ELobbyType: RawConvertible { typealias From = LobbyType }
extension LobbyType: EnumWithUnrepresented { typealias From = ELobbyType }

/// Steamworks `EMarketNotAllowedReasonFlags`
public struct MarketNotAllowedReasonFlags: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_EMarketNotAllowedReason_None`
    public static let none = MarketNotAllowedReasonFlags([])
    /// Steamworks `k_EMarketNotAllowedReason_TemporaryFailure`
    public static let temporaryFailure = MarketNotAllowedReasonFlags(rawValue: 1)
    /// Steamworks `k_EMarketNotAllowedReason_AccountDisabled`
    public static let accountDisabled = MarketNotAllowedReasonFlags(rawValue: 2)
    /// Steamworks `k_EMarketNotAllowedReason_AccountLockedDown`
    public static let accountLockedDown = MarketNotAllowedReasonFlags(rawValue: 4)
    /// Steamworks `k_EMarketNotAllowedReason_AccountLimited`
    public static let accountLimited = MarketNotAllowedReasonFlags(rawValue: 8)
    /// Steamworks `k_EMarketNotAllowedReason_TradeBanned`
    public static let tradeBanned = MarketNotAllowedReasonFlags(rawValue: 16)
    /// Steamworks `k_EMarketNotAllowedReason_AccountNotTrusted`
    public static let accountNotTrusted = MarketNotAllowedReasonFlags(rawValue: 32)
    /// Steamworks `k_EMarketNotAllowedReason_SteamGuardNotEnabled`
    public static let steamGuardNotEnabled = MarketNotAllowedReasonFlags(rawValue: 64)
    /// Steamworks `k_EMarketNotAllowedReason_SteamGuardOnlyRecentlyEnabled`
    public static let steamGuardOnlyRecentlyEnabled = MarketNotAllowedReasonFlags(rawValue: 128)
    /// Steamworks `k_EMarketNotAllowedReason_RecentPasswordReset`
    public static let recentPasswordReset = MarketNotAllowedReasonFlags(rawValue: 256)
    /// Steamworks `k_EMarketNotAllowedReason_NewPaymentMethod`
    public static let newPaymentMethod = MarketNotAllowedReasonFlags(rawValue: 512)
    /// Steamworks `k_EMarketNotAllowedReason_InvalidCookie`
    public static let invalidCookie = MarketNotAllowedReasonFlags(rawValue: 1024)
    /// Steamworks `k_EMarketNotAllowedReason_UsingNewDevice`
    public static let usingNewDevice = MarketNotAllowedReasonFlags(rawValue: 2048)
    /// Steamworks `k_EMarketNotAllowedReason_RecentSelfRefund`
    public static let recentSelfRefund = MarketNotAllowedReasonFlags(rawValue: 4096)
    /// Steamworks `k_EMarketNotAllowedReason_NewPaymentMethodCannotBeVerified`
    public static let newPaymentMethodCannotBeVerified = MarketNotAllowedReasonFlags(rawValue: 8192)
    /// Steamworks `k_EMarketNotAllowedReason_NoRecentPurchases`
    public static let noRecentPurchases = MarketNotAllowedReasonFlags(rawValue: 16384)
    /// Steamworks `k_EMarketNotAllowedReason_AcceptedWalletGift`
    public static let acceptedWalletGift = MarketNotAllowedReasonFlags(rawValue: 32768)
}

extension EMarketNotAllowedReasonFlags: RawConvertible { typealias From = MarketNotAllowedReasonFlags }
extension MarketNotAllowedReasonFlags: RawConvertible { typealias From = EMarketNotAllowedReasonFlags }

/// Steamworks `EMatchMakingServerResponse`
public enum MatchMakingServerResponse: UInt32 {
    /// Steamworks `eServerResponded`
    case eServerResponded = 0
    /// Steamworks `eServerFailedToRespond`
    case eServerFailedToRespond = 1
    /// Steamworks `eNoServersListedOnMasterServer`
    case eNoServersListedOnMasterServer = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension EMatchMakingServerResponse: RawConvertible { typealias From = MatchMakingServerResponse }
extension MatchMakingServerResponse: EnumWithUnrepresented { typealias From = EMatchMakingServerResponse }

/// Steamworks `ENotificationPosition`
public enum NotificationPosition: UInt32 {
    /// Steamworks `k_EPositionTopLeft`
    case topLeft = 0
    /// Steamworks `k_EPositionTopRight`
    case topRight = 1
    /// Steamworks `k_EPositionBottomLeft`
    case bottomLeft = 2
    /// Steamworks `k_EPositionBottomRight`
    case bottomRight = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension ENotificationPosition: RawConvertible { typealias From = NotificationPosition }
extension NotificationPosition: EnumWithUnrepresented { typealias From = ENotificationPosition }

/// Steamworks `EOverlayToStoreFlag`
public enum OverlayToStoreFlag: UInt32 {
    /// Steamworks `k_EOverlayToStoreFlag_None`
    case none = 0
    /// Steamworks `k_EOverlayToStoreFlag_AddToCart`
    case addToCart = 1
    /// Steamworks `k_EOverlayToStoreFlag_AddToCartAndShow`
    case addToCartAndShow = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension EOverlayToStoreFlag: RawConvertible { typealias From = OverlayToStoreFlag }
extension OverlayToStoreFlag: EnumWithUnrepresented { typealias From = EOverlayToStoreFlag }

/// Steamworks `EP2PSend`
public enum P2PSend: UInt32 {
    /// Steamworks `k_EP2PSendUnreliable`
    case unreliable = 0
    /// Steamworks `k_EP2PSendUnreliableNoDelay`
    case unreliableNoDelay = 1
    /// Steamworks `k_EP2PSendReliable`
    case reliable = 2
    /// Steamworks `k_EP2PSendReliableWithBuffering`
    case reliableWithBuffering = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension EP2PSend: RawConvertible { typealias From = P2PSend }
extension P2PSend: EnumWithUnrepresented { typealias From = EP2PSend }

/// Steamworks `EP2PSessionError`
public enum P2PSessionError: UInt32 {
    /// Steamworks `k_EP2PSessionErrorNone`
    case none = 0
    /// Steamworks `k_EP2PSessionErrorNoRightsToApp`
    case noRightsToApp = 2
    /// Steamworks `k_EP2PSessionErrorTimeout`
    case timeout = 4
    /// Steamworks `k_EP2PSessionErrorNotRunningApp_DELETED`
    case notRunningAppDELETED = 1
    /// Steamworks `k_EP2PSessionErrorDestinationNotLoggedIn_DELETED`
    case destinationNotLoggedInDELETED = 3
    /// Steamworks `k_EP2PSessionErrorMax`
    case max = 5
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension EP2PSessionError: RawConvertible { typealias From = P2PSessionError }
extension P2PSessionError: EnumWithUnrepresented { typealias From = EP2PSessionError }

/// Steamworks `EParentalFeature`
public enum ParentalFeature: UInt32 {
    /// Steamworks `k_EFeatureInvalid`
    case invalid = 0
    /// Steamworks `k_EFeatureStore`
    case store = 1
    /// Steamworks `k_EFeatureCommunity`
    case community = 2
    /// Steamworks `k_EFeatureProfile`
    case profile = 3
    /// Steamworks `k_EFeatureFriends`
    case friends = 4
    /// Steamworks `k_EFeatureNews`
    case news = 5
    /// Steamworks `k_EFeatureTrading`
    case trading = 6
    /// Steamworks `k_EFeatureSettings`
    case settings = 7
    /// Steamworks `k_EFeatureConsole`
    case console = 8
    /// Steamworks `k_EFeatureBrowser`
    case browser = 9
    /// Steamworks `k_EFeatureParentalSetup`
    case parentalSetup = 10
    /// Steamworks `k_EFeatureLibrary`
    case library = 11
    /// Steamworks `k_EFeatureTest`
    case test = 12
    /// Steamworks `k_EFeatureSiteLicense`
    case siteLicense = 13
    /// Steamworks `k_EFeatureMax`
    case max = 14
    /// Some undocumented value
    case unrepresentedInSwift = 15
}

extension EParentalFeature: RawConvertible { typealias From = ParentalFeature }
extension ParentalFeature: EnumWithUnrepresented { typealias From = EParentalFeature }

/// Steamworks `EPersonaChange`
public struct PersonaChange: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_EPersonaChangeName`
    public static let name = PersonaChange(rawValue: 1)
    /// Steamworks `k_EPersonaChangeStatus`
    public static let status = PersonaChange(rawValue: 2)
    /// Steamworks `k_EPersonaChangeComeOnline`
    public static let comeOnline = PersonaChange(rawValue: 4)
    /// Steamworks `k_EPersonaChangeGoneOffline`
    public static let goneOffline = PersonaChange(rawValue: 8)
    /// Steamworks `k_EPersonaChangeGamePlayed`
    public static let gamePlayed = PersonaChange(rawValue: 16)
    /// Steamworks `k_EPersonaChangeGameServer`
    public static let gameServer = PersonaChange(rawValue: 32)
    /// Steamworks `k_EPersonaChangeAvatar`
    public static let avatar = PersonaChange(rawValue: 64)
    /// Steamworks `k_EPersonaChangeJoinedSource`
    public static let joinedSource = PersonaChange(rawValue: 128)
    /// Steamworks `k_EPersonaChangeLeftSource`
    public static let leftSource = PersonaChange(rawValue: 256)
    /// Steamworks `k_EPersonaChangeRelationshipChanged`
    public static let relationshipChanged = PersonaChange(rawValue: 512)
    /// Steamworks `k_EPersonaChangeNameFirstSet`
    public static let nameFirstSet = PersonaChange(rawValue: 1024)
    /// Steamworks `k_EPersonaChangeBroadcast`
    public static let broadcast = PersonaChange(rawValue: 2048)
    /// Steamworks `k_EPersonaChangeNickname`
    public static let nickname = PersonaChange(rawValue: 4096)
    /// Steamworks `k_EPersonaChangeSteamLevel`
    public static let steamLevel = PersonaChange(rawValue: 8192)
    /// Steamworks `k_EPersonaChangeRichPresence`
    public static let richPresence = PersonaChange(rawValue: 16384)
}

extension EPersonaChange: RawConvertible { typealias From = PersonaChange }
extension PersonaChange: RawConvertible { typealias From = EPersonaChange }

/// Steamworks `EPersonaState`
public enum PersonaState: UInt32 {
    /// Steamworks `k_EPersonaStateOffline`
    case offline = 0
    /// Steamworks `k_EPersonaStateOnline`
    case online = 1
    /// Steamworks `k_EPersonaStateBusy`
    case busy = 2
    /// Steamworks `k_EPersonaStateAway`
    case away = 3
    /// Steamworks `k_EPersonaStateSnooze`
    case snooze = 4
    /// Steamworks `k_EPersonaStateLookingToTrade`
    case lookingToTrade = 5
    /// Steamworks `k_EPersonaStateLookingToPlay`
    case lookingToPlay = 6
    /// Steamworks `k_EPersonaStateInvisible`
    case invisible = 7
    /// Steamworks `k_EPersonaStateMax`
    case max = 8
    /// Some undocumented value
    case unrepresentedInSwift = 9
}

extension EPersonaState: RawConvertible { typealias From = PersonaState }
extension PersonaState: EnumWithUnrepresented { typealias From = EPersonaState }

/// Steamworks `EPlayerResult_t`
public enum PlayerResult: UInt32 {
    /// Steamworks `k_EPlayerResultFailedToConnect`
    case failedToConnect = 1
    /// Steamworks `k_EPlayerResultAbandoned`
    case abandoned = 2
    /// Steamworks `k_EPlayerResultKicked`
    case kicked = 3
    /// Steamworks `k_EPlayerResultIncomplete`
    case incomplete = 4
    /// Steamworks `k_EPlayerResultCompleted`
    case completed = 5
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension EPlayerResult_t: RawConvertible { typealias From = PlayerResult }
extension PlayerResult: EnumWithUnrepresented { typealias From = EPlayerResult_t }

/// Steamworks `ERegisterActivationCodeResult`
public enum RegisterActivationCodeResult: UInt32 {
    /// Steamworks `k_ERegisterActivationCodeResultOK`
    case ok = 0
    /// Steamworks `k_ERegisterActivationCodeResultFail`
    case fail = 1
    /// Steamworks `k_ERegisterActivationCodeResultAlreadyRegistered`
    case alreadyRegistered = 2
    /// Steamworks `k_ERegisterActivationCodeResultTimeout`
    case timeout = 3
    /// Steamworks `k_ERegisterActivationCodeAlreadyOwned`
    case alreadyOwned = 4
    /// Some undocumented value
    case unrepresentedInSwift = 5
}

extension ERegisterActivationCodeResult: RawConvertible { typealias From = RegisterActivationCodeResult }
extension RegisterActivationCodeResult: EnumWithUnrepresented { typealias From = ERegisterActivationCodeResult }

/// Steamworks `ERemoteStorageFilePathType`
public enum RemoteStorageFilePathType: UInt32 {
    /// Steamworks `k_ERemoteStorageFilePathType_Invalid`
    case invalid = 0
    /// Steamworks `k_ERemoteStorageFilePathType_Absolute`
    case absolute = 1
    /// Steamworks `k_ERemoteStorageFilePathType_APIFilename`
    case apiFilename = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ERemoteStorageFilePathType: RawConvertible { typealias From = RemoteStorageFilePathType }
extension RemoteStorageFilePathType: EnumWithUnrepresented { typealias From = ERemoteStorageFilePathType }

/// Steamworks `ERemoteStorageLocalFileChange`
public enum RemoteStorageLocalFileChangeType: UInt32 {
    /// Steamworks `k_ERemoteStorageLocalFileChange_Invalid`
    case invalid = 0
    /// Steamworks `k_ERemoteStorageLocalFileChange_FileUpdated`
    case fileUpdated = 1
    /// Steamworks `k_ERemoteStorageLocalFileChange_FileDeleted`
    case fileDeleted = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ERemoteStorageLocalFileChange: RawConvertible { typealias From = RemoteStorageLocalFileChangeType }
extension RemoteStorageLocalFileChangeType: EnumWithUnrepresented { typealias From = ERemoteStorageLocalFileChange }

/// Steamworks `ERemoteStoragePlatform`
public struct RemoteStoragePlatform: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_ERemoteStoragePlatformNone`
    public static let none = RemoteStoragePlatform([])
    /// Steamworks `k_ERemoteStoragePlatformWindows`
    public static let windows = RemoteStoragePlatform(rawValue: 1)
    /// Steamworks `k_ERemoteStoragePlatformOSX`
    public static let osx = RemoteStoragePlatform(rawValue: 2)
    /// Steamworks `k_ERemoteStoragePlatformPS3`
    public static let ps3 = RemoteStoragePlatform(rawValue: 4)
    /// Steamworks `k_ERemoteStoragePlatformLinux`
    public static let linux = RemoteStoragePlatform(rawValue: 8)
    /// Steamworks `k_ERemoteStoragePlatformSwitch`
    public static let `switch` = RemoteStoragePlatform(rawValue: 16)
    /// Steamworks `k_ERemoteStoragePlatformAndroid`
    public static let android = RemoteStoragePlatform(rawValue: 32)
    /// Steamworks `k_ERemoteStoragePlatformIOS`
    public static let ios = RemoteStoragePlatform(rawValue: 64)
    /// Steamworks `k_ERemoteStoragePlatformAll`
    public static let all = RemoteStoragePlatform(rawValue: 0xffffffff)
}

extension ERemoteStoragePlatform: RawConvertible { typealias From = RemoteStoragePlatform }
extension RemoteStoragePlatform: RawConvertible { typealias From = ERemoteStoragePlatform }

/// Steamworks `ERemoteStoragePublishedFileVisibility`
public enum RemoteStoragePublishedFileVisibility: UInt32 {
    /// Steamworks `k_ERemoteStoragePublishedFileVisibilityPublic`
    case `public` = 0
    /// Steamworks `k_ERemoteStoragePublishedFileVisibilityFriendsOnly`
    case friendsOnly = 1
    /// Steamworks `k_ERemoteStoragePublishedFileVisibilityPrivate`
    case `private` = 2
    /// Steamworks `k_ERemoteStoragePublishedFileVisibilityUnlisted`
    case unlisted = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension ERemoteStoragePublishedFileVisibility: RawConvertible { typealias From = RemoteStoragePublishedFileVisibility }
extension RemoteStoragePublishedFileVisibility: EnumWithUnrepresented { typealias From = ERemoteStoragePublishedFileVisibility }

/// Steamworks `EResult`
public enum Result: UInt32 {
    /// Steamworks `k_EResultNone`
    case none = 0
    /// Steamworks `k_EResultOK`
    case ok = 1
    /// Steamworks `k_EResultFail`
    case fail = 2
    /// Steamworks `k_EResultNoConnection`
    case noConnection = 3
    /// Steamworks `k_EResultInvalidPassword`
    case invalidPassword = 5
    /// Steamworks `k_EResultLoggedInElsewhere`
    case loggedInElsewhere = 6
    /// Steamworks `k_EResultInvalidProtocolVer`
    case invalidProtocolVer = 7
    /// Steamworks `k_EResultInvalidParam`
    case invalidParam = 8
    /// Steamworks `k_EResultFileNotFound`
    case fileNotFound = 9
    /// Steamworks `k_EResultBusy`
    case busy = 10
    /// Steamworks `k_EResultInvalidState`
    case invalidState = 11
    /// Steamworks `k_EResultInvalidName`
    case invalidName = 12
    /// Steamworks `k_EResultInvalidEmail`
    case invalidEmail = 13
    /// Steamworks `k_EResultDuplicateName`
    case duplicateName = 14
    /// Steamworks `k_EResultAccessDenied`
    case accessDenied = 15
    /// Steamworks `k_EResultTimeout`
    case timeout = 16
    /// Steamworks `k_EResultBanned`
    case banned = 17
    /// Steamworks `k_EResultAccountNotFound`
    case accountNotFound = 18
    /// Steamworks `k_EResultInvalidSteamID`
    case invalidSteamID = 19
    /// Steamworks `k_EResultServiceUnavailable`
    case serviceUnavailable = 20
    /// Steamworks `k_EResultNotLoggedOn`
    case notLoggedOn = 21
    /// Steamworks `k_EResultPending`
    case pending = 22
    /// Steamworks `k_EResultEncryptionFailure`
    case encryptionFailure = 23
    /// Steamworks `k_EResultInsufficientPrivilege`
    case insufficientPrivilege = 24
    /// Steamworks `k_EResultLimitExceeded`
    case limitExceeded = 25
    /// Steamworks `k_EResultRevoked`
    case revoked = 26
    /// Steamworks `k_EResultExpired`
    case expired = 27
    /// Steamworks `k_EResultAlreadyRedeemed`
    case alreadyRedeemed = 28
    /// Steamworks `k_EResultDuplicateRequest`
    case duplicateRequest = 29
    /// Steamworks `k_EResultAlreadyOwned`
    case alreadyOwned = 30
    /// Steamworks `k_EResultIPNotFound`
    case ipNotFound = 31
    /// Steamworks `k_EResultPersistFailed`
    case persistFailed = 32
    /// Steamworks `k_EResultLockingFailed`
    case lockingFailed = 33
    /// Steamworks `k_EResultLogonSessionReplaced`
    case logonSessionReplaced = 34
    /// Steamworks `k_EResultConnectFailed`
    case connectFailed = 35
    /// Steamworks `k_EResultHandshakeFailed`
    case handshakeFailed = 36
    /// Steamworks `k_EResultIOFailure`
    case ioFailure = 37
    /// Steamworks `k_EResultRemoteDisconnect`
    case remoteDisconnect = 38
    /// Steamworks `k_EResultShoppingCartNotFound`
    case shoppingCartNotFound = 39
    /// Steamworks `k_EResultBlocked`
    case blocked = 40
    /// Steamworks `k_EResultIgnored`
    case ignored = 41
    /// Steamworks `k_EResultNoMatch`
    case noMatch = 42
    /// Steamworks `k_EResultAccountDisabled`
    case accountDisabled = 43
    /// Steamworks `k_EResultServiceReadOnly`
    case serviceReadOnly = 44
    /// Steamworks `k_EResultAccountNotFeatured`
    case accountNotFeatured = 45
    /// Steamworks `k_EResultAdministratorOK`
    case administratorOK = 46
    /// Steamworks `k_EResultContentVersion`
    case contentVersion = 47
    /// Steamworks `k_EResultTryAnotherCM`
    case tryAnotherCM = 48
    /// Steamworks `k_EResultPasswordRequiredToKickSession`
    case passwordRequiredToKickSession = 49
    /// Steamworks `k_EResultAlreadyLoggedInElsewhere`
    case alreadyLoggedInElsewhere = 50
    /// Steamworks `k_EResultSuspended`
    case suspended = 51
    /// Steamworks `k_EResultCancelled`
    case cancelled = 52
    /// Steamworks `k_EResultDataCorruption`
    case dataCorruption = 53
    /// Steamworks `k_EResultDiskFull`
    case diskFull = 54
    /// Steamworks `k_EResultRemoteCallFailed`
    case remoteCallFailed = 55
    /// Steamworks `k_EResultPasswordUnset`
    case passwordUnset = 56
    /// Steamworks `k_EResultExternalAccountUnlinked`
    case externalAccountUnlinked = 57
    /// Steamworks `k_EResultPSNTicketInvalid`
    case psnTicketInvalid = 58
    /// Steamworks `k_EResultExternalAccountAlreadyLinked`
    case externalAccountAlreadyLinked = 59
    /// Steamworks `k_EResultRemoteFileConflict`
    case remoteFileConflict = 60
    /// Steamworks `k_EResultIllegalPassword`
    case illegalPassword = 61
    /// Steamworks `k_EResultSameAsPreviousValue`
    case sameAsPreviousValue = 62
    /// Steamworks `k_EResultAccountLogonDenied`
    case accountLogonDenied = 63
    /// Steamworks `k_EResultCannotUseOldPassword`
    case cannotUseOldPassword = 64
    /// Steamworks `k_EResultInvalidLoginAuthCode`
    case invalidLoginAuthCode = 65
    /// Steamworks `k_EResultAccountLogonDeniedNoMail`
    case accountLogonDeniedNoMail = 66
    /// Steamworks `k_EResultHardwareNotCapableOfIPT`
    case hardwareNotCapableOfIPT = 67
    /// Steamworks `k_EResultIPTInitError`
    case iptInitError = 68
    /// Steamworks `k_EResultParentalControlRestricted`
    case parentalControlRestricted = 69
    /// Steamworks `k_EResultFacebookQueryError`
    case facebookQueryError = 70
    /// Steamworks `k_EResultExpiredLoginAuthCode`
    case expiredLoginAuthCode = 71
    /// Steamworks `k_EResultIPLoginRestrictionFailed`
    case ipLoginRestrictionFailed = 72
    /// Steamworks `k_EResultAccountLockedDown`
    case accountLockedDown = 73
    /// Steamworks `k_EResultAccountLogonDeniedVerifiedEmailRequired`
    case accountLogonDeniedVerifiedEmailRequired = 74
    /// Steamworks `k_EResultNoMatchingURL`
    case noMatchingURL = 75
    /// Steamworks `k_EResultBadResponse`
    case badResponse = 76
    /// Steamworks `k_EResultRequirePasswordReEntry`
    case requirePasswordReEntry = 77
    /// Steamworks `k_EResultValueOutOfRange`
    case valueOutOfRange = 78
    /// Steamworks `k_EResultUnexpectedError`
    case unexpectedError = 79
    /// Steamworks `k_EResultDisabled`
    case disabled = 80
    /// Steamworks `k_EResultInvalidCEGSubmission`
    case invalidCEGSubmission = 81
    /// Steamworks `k_EResultRestrictedDevice`
    case restrictedDevice = 82
    /// Steamworks `k_EResultRegionLocked`
    case regionLocked = 83
    /// Steamworks `k_EResultRateLimitExceeded`
    case rateLimitExceeded = 84
    /// Steamworks `k_EResultAccountLoginDeniedNeedTwoFactor`
    case accountLoginDeniedNeedTwoFactor = 85
    /// Steamworks `k_EResultItemDeleted`
    case itemDeleted = 86
    /// Steamworks `k_EResultAccountLoginDeniedThrottle`
    case accountLoginDeniedThrottle = 87
    /// Steamworks `k_EResultTwoFactorCodeMismatch`
    case twoFactorCodeMismatch = 88
    /// Steamworks `k_EResultTwoFactorActivationCodeMismatch`
    case twoFactorActivationCodeMismatch = 89
    /// Steamworks `k_EResultAccountAssociatedToMultiplePartners`
    case accountAssociatedToMultiplePartners = 90
    /// Steamworks `k_EResultNotModified`
    case notModified = 91
    /// Steamworks `k_EResultNoMobileDevice`
    case noMobileDevice = 92
    /// Steamworks `k_EResultTimeNotSynced`
    case timeNotSynced = 93
    /// Steamworks `k_EResultSmsCodeFailed`
    case smsCodeFailed = 94
    /// Steamworks `k_EResultAccountLimitExceeded`
    case accountLimitExceeded = 95
    /// Steamworks `k_EResultAccountActivityLimitExceeded`
    case accountActivityLimitExceeded = 96
    /// Steamworks `k_EResultPhoneActivityLimitExceeded`
    case phoneActivityLimitExceeded = 97
    /// Steamworks `k_EResultRefundToWallet`
    case refundToWallet = 98
    /// Steamworks `k_EResultEmailSendFailure`
    case emailSendFailure = 99
    /// Steamworks `k_EResultNotSettled`
    case notSettled = 100
    /// Steamworks `k_EResultNeedCaptcha`
    case needCaptcha = 101
    /// Steamworks `k_EResultGSLTDenied`
    case gsltDenied = 102
    /// Steamworks `k_EResultGSOwnerDenied`
    case gsOwnerDenied = 103
    /// Steamworks `k_EResultInvalidItemType`
    case invalidItemType = 104
    /// Steamworks `k_EResultIPBanned`
    case ipBanned = 105
    /// Steamworks `k_EResultGSLTExpired`
    case gsltExpired = 106
    /// Steamworks `k_EResultInsufficientFunds`
    case insufficientFunds = 107
    /// Steamworks `k_EResultTooManyPending`
    case tooManyPending = 108
    /// Steamworks `k_EResultNoSiteLicensesFound`
    case noSiteLicensesFound = 109
    /// Steamworks `k_EResultWGNetworkSendExceeded`
    case wgNetworkSendExceeded = 110
    /// Steamworks `k_EResultAccountNotFriends`
    case accountNotFriends = 111
    /// Steamworks `k_EResultLimitedUserAccount`
    case limitedUserAccount = 112
    /// Steamworks `k_EResultCantRemoveItem`
    case cantRemoveItem = 113
    /// Steamworks `k_EResultAccountDeleted`
    case accountDeleted = 114
    /// Steamworks `k_EResultExistingUserCancelledLicense`
    case existingUserCancelledLicense = 115
    /// Steamworks `k_EResultCommunityCooldown`
    case communityCooldown = 116
    /// Steamworks `k_EResultNoLauncherSpecified`
    case noLauncherSpecified = 117
    /// Steamworks `k_EResultMustAgreeToSSA`
    case mustAgreeToSSA = 118
    /// Steamworks `k_EResultLauncherMigrated`
    case launcherMigrated = 119
    /// Steamworks `k_EResultSteamRealmMismatch`
    case steamRealmMismatch = 120
    /// Steamworks `k_EResultInvalidSignature`
    case invalidSignature = 121
    /// Steamworks `k_EResultParseFailure`
    case parseFailure = 122
    /// Some undocumented value
    case unrepresentedInSwift = 123
}

extension EResult: RawConvertible { typealias From = Result }
extension Result: EnumWithUnrepresented { typealias From = EResult }

/// Steamworks `ESNetSocketConnectionType`
public enum SNetSocketConnectionType: UInt32 {
    /// Steamworks `k_ESNetSocketConnectionTypeNotConnected`
    case notConnected = 0
    /// Steamworks `k_ESNetSocketConnectionTypeUDP`
    case udp = 1
    /// Steamworks `k_ESNetSocketConnectionTypeUDPRelay`
    case udpRelay = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ESNetSocketConnectionType: RawConvertible { typealias From = SNetSocketConnectionType }
extension SNetSocketConnectionType: EnumWithUnrepresented { typealias From = ESNetSocketConnectionType }

/// Steamworks `ESNetSocketState`
public enum SNetSocketState: UInt32 {
    /// Steamworks `k_ESNetSocketStateInvalid`
    case invalid = 0
    /// Steamworks `k_ESNetSocketStateConnected`
    case connected = 1
    /// Steamworks `k_ESNetSocketStateInitiated`
    case initiated = 10
    /// Steamworks `k_ESNetSocketStateLocalCandidatesFound`
    case localCandidatesFound = 11
    /// Steamworks `k_ESNetSocketStateReceivedRemoteCandidates`
    case receivedRemoteCandidates = 12
    /// Steamworks `k_ESNetSocketStateChallengeHandshake`
    case challengeHandshake = 15
    /// Steamworks `k_ESNetSocketStateDisconnecting`
    case disconnecting = 21
    /// Steamworks `k_ESNetSocketStateLocalDisconnect`
    case localDisconnect = 22
    /// Steamworks `k_ESNetSocketStateTimeoutDuringConnect`
    case timeoutDuringConnect = 23
    /// Steamworks `k_ESNetSocketStateRemoteEndDisconnected`
    case remoteEndDisconnected = 24
    /// Steamworks `k_ESNetSocketStateConnectionBroken`
    case connectionBroken = 25
    /// Some undocumented value
    case unrepresentedInSwift = 26
}

extension ESNetSocketState: RawConvertible { typealias From = SNetSocketState }
extension SNetSocketState: EnumWithUnrepresented { typealias From = ESNetSocketState }

/// Steamworks `EServerMode`
public enum ServerMode: UInt32 {
    /// Steamworks `eServerModeInvalid`
    case invalid = 0
    /// Steamworks `eServerModeNoAuthentication`
    case noAuthentication = 1
    /// Steamworks `eServerModeAuthentication`
    case authentication = 2
    /// Steamworks `eServerModeAuthenticationAndSecure`
    case authenticationAndSecure = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension EServerMode: RawConvertible { typealias From = ServerMode }
extension ServerMode: EnumWithUnrepresented { typealias From = EServerMode }

/// Steamworks `ESteamAPICallFailure`
public enum SteamAPICallFailure: Int32 {
    /// Steamworks `k_ESteamAPICallFailureNone`
    case none = -1
    /// Steamworks `k_ESteamAPICallFailureSteamGone`
    case steamGone = 0
    /// Steamworks `k_ESteamAPICallFailureNetworkFailure`
    case networkFailure = 1
    /// Steamworks `k_ESteamAPICallFailureInvalidHandle`
    case invalidHandle = 2
    /// Steamworks `k_ESteamAPICallFailureMismatchedCallback`
    case mismatchedCallback = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension ESteamAPICallFailure: RawConvertible { typealias From = SteamAPICallFailure }
extension SteamAPICallFailure: EnumWithUnrepresented { typealias From = ESteamAPICallFailure }

/// Steamworks `ESteamControllerLEDFlag`
public struct SteamControllerLEDFlag: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_ESteamControllerLEDFlag_SetColor`
    public static let setColor = SteamControllerLEDFlag([])
    /// Steamworks `k_ESteamControllerLEDFlag_RestoreUserDefault`
    public static let restoreUserDefault = SteamControllerLEDFlag(rawValue: 1)
}

extension ESteamControllerLEDFlag: RawConvertible { typealias From = SteamControllerLEDFlag }
extension SteamControllerLEDFlag: RawConvertible { typealias From = ESteamControllerLEDFlag }

/// Steamworks `ESteamControllerPad`
public enum SteamControllerPad: UInt32 {
    /// Steamworks `k_ESteamControllerPad_Left`
    case left = 0
    /// Steamworks `k_ESteamControllerPad_Right`
    case right = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension ESteamControllerPad: RawConvertible { typealias From = SteamControllerPad }
extension SteamControllerPad: EnumWithUnrepresented { typealias From = ESteamControllerPad }

/// Steamworks `ESteamDeviceFormFactor`
public enum SteamDeviceFormFactor: UInt32 {
    /// Steamworks `k_ESteamDeviceFormFactorUnknown`
    case unknown = 0
    /// Steamworks `k_ESteamDeviceFormFactorPhone`
    case phone = 1
    /// Steamworks `k_ESteamDeviceFormFactorTablet`
    case tablet = 2
    /// Steamworks `k_ESteamDeviceFormFactorComputer`
    case computer = 3
    /// Steamworks `k_ESteamDeviceFormFactorTV`
    case tv = 4
    /// Some undocumented value
    case unrepresentedInSwift = 5
}

extension ESteamDeviceFormFactor: RawConvertible { typealias From = SteamDeviceFormFactor }
extension SteamDeviceFormFactor: EnumWithUnrepresented { typealias From = ESteamDeviceFormFactor }

/// Steamworks `ESteamIPType`
public enum SteamIPType: UInt32 {
    /// Steamworks `k_ESteamIPTypeIPv4`
    case ipv4 = 0
    /// Steamworks `k_ESteamIPTypeIPv6`
    case ipv6 = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension ESteamIPType: RawConvertible { typealias From = SteamIPType }
extension SteamIPType: EnumWithUnrepresented { typealias From = ESteamIPType }

/// Steamworks `ESteamIPv6ConnectivityProtocol`
public enum SteamIPv6ConnectivityProtocol: UInt32 {
    /// Steamworks `k_ESteamIPv6ConnectivityProtocol_Invalid`
    case invalid = 0
    /// Steamworks `k_ESteamIPv6ConnectivityProtocol_HTTP`
    case http = 1
    /// Steamworks `k_ESteamIPv6ConnectivityProtocol_UDP`
    case udp = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ESteamIPv6ConnectivityProtocol: RawConvertible { typealias From = SteamIPv6ConnectivityProtocol }
extension SteamIPv6ConnectivityProtocol: EnumWithUnrepresented { typealias From = ESteamIPv6ConnectivityProtocol }

/// Steamworks `ESteamIPv6ConnectivityState`
public enum SteamIPv6ConnectivityState: UInt32 {
    /// Steamworks `k_ESteamIPv6ConnectivityState_Unknown`
    case unknown = 0
    /// Steamworks `k_ESteamIPv6ConnectivityState_Good`
    case good = 1
    /// Steamworks `k_ESteamIPv6ConnectivityState_Bad`
    case bad = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ESteamIPv6ConnectivityState: RawConvertible { typealias From = SteamIPv6ConnectivityState }
extension SteamIPv6ConnectivityState: EnumWithUnrepresented { typealias From = ESteamIPv6ConnectivityState }

/// Steamworks `ESteamInputActionEventType`
public enum SteamInputActionEventType: UInt32 {
    /// Steamworks `ESteamInputActionEventType_DigitalAction`
    case digitalAction = 0
    /// Steamworks `ESteamInputActionEventType_AnalogAction`
    case analogAction = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension ESteamInputActionEventType: RawConvertible { typealias From = SteamInputActionEventType }
extension SteamInputActionEventType: EnumWithUnrepresented { typealias From = ESteamInputActionEventType }

/// Steamworks `ESteamInputConfigurationEnableType`
public enum SteamInputConfigurationEnableType: UInt32 {
    /// Steamworks `k_ESteamInputConfigurationEnableType_None`
    case none = 0
    /// Steamworks `k_ESteamInputConfigurationEnableType_Playstation`
    case playstation = 1
    /// Steamworks `k_ESteamInputConfigurationEnableType_Xbox`
    case xbox = 2
    /// Steamworks `k_ESteamInputConfigurationEnableType_Generic`
    case generic = 4
    /// Steamworks `k_ESteamInputConfigurationEnableType_Switch`
    case `switch` = 8
    /// Some undocumented value
    case unrepresentedInSwift = 9
}

extension ESteamInputConfigurationEnableType: RawConvertible { typealias From = SteamInputConfigurationEnableType }
extension SteamInputConfigurationEnableType: EnumWithUnrepresented { typealias From = ESteamInputConfigurationEnableType }

/// Steamworks `ESteamInputGlyphSize`
public enum SteamInputGlyphSize: UInt32 {
    /// Steamworks `k_ESteamInputGlyphSize_Small`
    case small = 0
    /// Steamworks `k_ESteamInputGlyphSize_Medium`
    case medium = 1
    /// Steamworks `k_ESteamInputGlyphSize_Large`
    case large = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ESteamInputGlyphSize: RawConvertible { typealias From = SteamInputGlyphSize }
extension SteamInputGlyphSize: EnumWithUnrepresented { typealias From = ESteamInputGlyphSize }

/// Steamworks `ESteamInputLEDFlag`
public enum SteamInputLEDFlag: UInt32 {
    /// Steamworks `k_ESteamInputLEDFlag_SetColor`
    case setColor = 0
    /// Steamworks `k_ESteamInputLEDFlag_RestoreUserDefault`
    case restoreUserDefault = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension ESteamInputLEDFlag: RawConvertible { typealias From = SteamInputLEDFlag }
extension SteamInputLEDFlag: EnumWithUnrepresented { typealias From = ESteamInputLEDFlag }

/// Steamworks `ESteamInputType`
public enum SteamInputType: UInt32 {
    /// Steamworks `k_ESteamInputType_Unknown`
    case unknown = 0
    /// Steamworks `k_ESteamInputType_SteamController`
    case steamController = 1
    /// Steamworks `k_ESteamInputType_XBox360Controller`
    case xBox360Controller = 2
    /// Steamworks `k_ESteamInputType_XBoxOneController`
    case xBoxOneController = 3
    /// Steamworks `k_ESteamInputType_GenericGamepad`
    case genericGamepad = 4
    /// Steamworks `k_ESteamInputType_PS4Controller`
    case ps4Controller = 5
    /// Steamworks `k_ESteamInputType_AppleMFiController`
    case appleMFiController = 6
    /// Steamworks `k_ESteamInputType_AndroidController`
    case androidController = 7
    /// Steamworks `k_ESteamInputType_SwitchJoyConPair`
    case switchJoyConPair = 8
    /// Steamworks `k_ESteamInputType_SwitchJoyConSingle`
    case switchJoyConSingle = 9
    /// Steamworks `k_ESteamInputType_SwitchProController`
    case switchProController = 10
    /// Steamworks `k_ESteamInputType_MobileTouch`
    case mobileTouch = 11
    /// Steamworks `k_ESteamInputType_PS3Controller`
    case ps3Controller = 12
    /// Steamworks `k_ESteamInputType_PS5Controller`
    case ps5Controller = 13
    /// Steamworks `k_ESteamInputType_Count`
    case count = 14
    /// Steamworks `k_ESteamInputType_MaximumPossibleValue`
    case maximumPossibleValue = 255
    /// Some undocumented value
    case unrepresentedInSwift = 256
}

extension ESteamInputType: RawConvertible { typealias From = SteamInputType }
extension SteamInputType: EnumWithUnrepresented { typealias From = ESteamInputType }

/// Steamworks `ESteamItemFlags`
public struct SteamItemFlags: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_ESteamItemNoTrade`
    public static let noTrade = SteamItemFlags(rawValue: 1)
    /// Steamworks `k_ESteamItemRemoved`
    public static let removed = SteamItemFlags(rawValue: 256)
    /// Steamworks `k_ESteamItemConsumed`
    public static let consumed = SteamItemFlags(rawValue: 512)
}

extension ESteamItemFlags: RawConvertible { typealias From = SteamItemFlags }
extension SteamItemFlags: RawConvertible { typealias From = ESteamItemFlags }

/// Steamworks `ESteamNetConnectionEnd`
public enum SteamNetConnectionEnd: UInt32 {
    /// Steamworks `k_ESteamNetConnectionEnd_Invalid`
    case invalid = 0
    /// Steamworks `k_ESteamNetConnectionEnd_App_Min`
    case appMin = 1000
    /// Steamworks `k_ESteamNetConnectionEnd_App_Generic`
    public static let appGeneric = SteamNetConnectionEnd(rawValue: 1000)!
    /// Steamworks `k_ESteamNetConnectionEnd_App_Max`
    case appMax = 1999
    /// Steamworks `k_ESteamNetConnectionEnd_AppException_Min`
    case appExceptionMin = 2000
    /// Steamworks `k_ESteamNetConnectionEnd_AppException_Generic`
    public static let appExceptionGeneric = SteamNetConnectionEnd(rawValue: 2000)!
    /// Steamworks `k_ESteamNetConnectionEnd_AppException_Max`
    case appExceptionMax = 2999
    /// Steamworks `k_ESteamNetConnectionEnd_Local_Min`
    case localMin = 3000
    /// Steamworks `k_ESteamNetConnectionEnd_Local_OfflineMode`
    case localOfflineMode = 3001
    /// Steamworks `k_ESteamNetConnectionEnd_Local_ManyRelayConnectivity`
    case localManyRelayConnectivity = 3002
    /// Steamworks `k_ESteamNetConnectionEnd_Local_HostedServerPrimaryRelay`
    case localHostedServerPrimaryRelay = 3003
    /// Steamworks `k_ESteamNetConnectionEnd_Local_NetworkConfig`
    case localNetworkConfig = 3004
    /// Steamworks `k_ESteamNetConnectionEnd_Local_Rights`
    case localRights = 3005
    /// Steamworks `k_ESteamNetConnectionEnd_Local_P2P_ICE_NoPublicAddresses`
    case localP2PICENoPublicAddresses = 3006
    /// Steamworks `k_ESteamNetConnectionEnd_Local_Max`
    case localMax = 3999
    /// Steamworks `k_ESteamNetConnectionEnd_Remote_Min`
    case remoteMin = 4000
    /// Steamworks `k_ESteamNetConnectionEnd_Remote_Timeout`
    case remoteTimeout = 4001
    /// Steamworks `k_ESteamNetConnectionEnd_Remote_BadCrypt`
    case remoteBadCrypt = 4002
    /// Steamworks `k_ESteamNetConnectionEnd_Remote_BadCert`
    case remoteBadCert = 4003
    /// Steamworks `k_ESteamNetConnectionEnd_Remote_BadProtocolVersion`
    case remoteBadProtocolVersion = 4006
    /// Steamworks `k_ESteamNetConnectionEnd_Remote_P2P_ICE_NoPublicAddresses`
    case remoteP2PICENoPublicAddresses = 4007
    /// Steamworks `k_ESteamNetConnectionEnd_Remote_Max`
    case remoteMax = 4999
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_Min`
    case miscMin = 5000
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_Generic`
    case miscGeneric = 5001
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_InternalError`
    case miscInternalError = 5002
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_Timeout`
    case miscTimeout = 5003
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_SteamConnectivity`
    case miscSteamConnectivity = 5005
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_NoRelaySessionsToClient`
    case miscNoRelaySessionsToClient = 5006
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_P2P_Rendezvous`
    case miscP2PRendezvous = 5008
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_P2P_NAT_Firewall`
    case miscP2PNATFirewall = 5009
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_PeerSentNoConnection`
    case miscPeerSentNoConnection = 5010
    /// Steamworks `k_ESteamNetConnectionEnd_Misc_Max`
    case miscMax = 5999
    /// Some undocumented value
    case unrepresentedInSwift = 6000
}

extension ESteamNetConnectionEnd: RawConvertible { typealias From = SteamNetConnectionEnd }
extension SteamNetConnectionEnd: EnumWithUnrepresented { typealias From = ESteamNetConnectionEnd }

/// Steamworks `ESteamNetworkingAvailability`
public enum SteamNetworkingAvailability: Int32 {
    /// Steamworks `k_ESteamNetworkingAvailability_CannotTry`
    case cannotTry = -102
    /// Steamworks `k_ESteamNetworkingAvailability_Failed`
    case failed = -101
    /// Steamworks `k_ESteamNetworkingAvailability_Previously`
    case previously = -100
    /// Steamworks `k_ESteamNetworkingAvailability_Retrying`
    case retrying = -10
    /// Steamworks `k_ESteamNetworkingAvailability_NeverTried`
    case neverTried = 1
    /// Steamworks `k_ESteamNetworkingAvailability_Waiting`
    case waiting = 2
    /// Steamworks `k_ESteamNetworkingAvailability_Attempting`
    case attempting = 3
    /// Steamworks `k_ESteamNetworkingAvailability_Current`
    case current = 100
    /// Steamworks `k_ESteamNetworkingAvailability_Unknown`
    case unknown = 0
    /// Some undocumented value
    case unrepresentedInSwift = 101
}

extension ESteamNetworkingAvailability: RawConvertible { typealias From = SteamNetworkingAvailability }
extension SteamNetworkingAvailability: EnumWithUnrepresented { typealias From = ESteamNetworkingAvailability }

/// Steamworks `ESteamNetworkingConfigDataType`
public enum SteamNetworkingConfigDataType: UInt32 {
    /// Steamworks `k_ESteamNetworkingConfig_Int32`
    case int32 = 1
    /// Steamworks `k_ESteamNetworkingConfig_Int64`
    case int64 = 2
    /// Steamworks `k_ESteamNetworkingConfig_Float`
    case float = 3
    /// Steamworks `k_ESteamNetworkingConfig_String`
    case string = 4
    /// Steamworks `k_ESteamNetworkingConfig_Ptr`
    case ptr = 5
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension ESteamNetworkingConfigDataType: RawConvertible { typealias From = SteamNetworkingConfigDataType }
extension SteamNetworkingConfigDataType: EnumWithUnrepresented { typealias From = ESteamNetworkingConfigDataType }

/// Steamworks `ESteamNetworkingConfigScope`
public enum SteamNetworkingConfigScope: UInt32 {
    /// Steamworks `k_ESteamNetworkingConfig_Global`
    case global = 1
    /// Steamworks `k_ESteamNetworkingConfig_SocketsInterface`
    case socketsInterface = 2
    /// Steamworks `k_ESteamNetworkingConfig_ListenSocket`
    case listenSocket = 3
    /// Steamworks `k_ESteamNetworkingConfig_Connection`
    case connection = 4
    /// Some undocumented value
    case unrepresentedInSwift = 5
}

extension ESteamNetworkingConfigScope: RawConvertible { typealias From = SteamNetworkingConfigScope }
extension SteamNetworkingConfigScope: EnumWithUnrepresented { typealias From = ESteamNetworkingConfigScope }

/// Steamworks `ESteamNetworkingConfigValue`
public enum SteamNetworkingConfigValueSetting: UInt32 {
    /// Steamworks `k_ESteamNetworkingConfig_Invalid`
    case invalid = 0
    /// Steamworks `k_ESteamNetworkingConfig_TimeoutInitial`
    case timeoutInitial = 24
    /// Steamworks `k_ESteamNetworkingConfig_TimeoutConnected`
    case timeoutConnected = 25
    /// Steamworks `k_ESteamNetworkingConfig_SendBufferSize`
    case sendBufferSize = 9
    /// Steamworks `k_ESteamNetworkingConfig_ConnectionUserData`
    case connectionUserData = 40
    /// Steamworks `k_ESteamNetworkingConfig_SendRateMin`
    case sendRateMin = 10
    /// Steamworks `k_ESteamNetworkingConfig_SendRateMax`
    case sendRateMax = 11
    /// Steamworks `k_ESteamNetworkingConfig_NagleTime`
    case nagleTime = 12
    /// Steamworks `k_ESteamNetworkingConfig_IP_AllowWithoutAuth`
    case ipAllowWithoutAuth = 23
    /// Steamworks `k_ESteamNetworkingConfig_MTU_PacketSize`
    case mtuPacketSize = 32
    /// Steamworks `k_ESteamNetworkingConfig_MTU_DataSize`
    case mtuDataSize = 33
    /// Steamworks `k_ESteamNetworkingConfig_Unencrypted`
    case unencrypted = 34
    /// Steamworks `k_ESteamNetworkingConfig_SymmetricConnect`
    case symmetricConnect = 37
    /// Steamworks `k_ESteamNetworkingConfig_LocalVirtualPort`
    case localVirtualPort = 38
    /// Steamworks `k_ESteamNetworkingConfig_DualWifi_Enable`
    case dualWifiEnable = 39
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketLoss_Send`
    case fakePacketLossSend = 2
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketLoss_Recv`
    case fakePacketLossRecv = 3
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketLag_Send`
    case fakePacketLagSend = 4
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketLag_Recv`
    case fakePacketLagRecv = 5
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketReorder_Send`
    case fakePacketReorderSend = 6
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketReorder_Recv`
    case fakePacketReorderRecv = 7
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketReorder_Time`
    case fakePacketReorderTime = 8
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketDup_Send`
    case fakePacketDupSend = 26
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketDup_Recv`
    case fakePacketDupRecv = 27
    /// Steamworks `k_ESteamNetworkingConfig_FakePacketDup_TimeMax`
    case fakePacketDupTimeMax = 28
    /// Steamworks `k_ESteamNetworkingConfig_PacketTraceMaxBytes`
    case packetTraceMaxBytes = 41
    /// Steamworks `k_ESteamNetworkingConfig_FakeRateLimit_Send_Rate`
    case fakeRateLimitSendRate = 42
    /// Steamworks `k_ESteamNetworkingConfig_FakeRateLimit_Send_Burst`
    case fakeRateLimitSendBurst = 43
    /// Steamworks `k_ESteamNetworkingConfig_FakeRateLimit_Recv_Rate`
    case fakeRateLimitRecvRate = 44
    /// Steamworks `k_ESteamNetworkingConfig_FakeRateLimit_Recv_Burst`
    case fakeRateLimitRecvBurst = 45
    /// Steamworks `k_ESteamNetworkingConfig_Callback_ConnectionStatusChanged`
    case callbackConnectionStatusChanged = 201
    /// Steamworks `k_ESteamNetworkingConfig_Callback_AuthStatusChanged`
    case callbackAuthStatusChanged = 202
    /// Steamworks `k_ESteamNetworkingConfig_Callback_RelayNetworkStatusChanged`
    case callbackRelayNetworkStatusChanged = 203
    /// Steamworks `k_ESteamNetworkingConfig_Callback_MessagesSessionRequest`
    case callbackMessagesSessionRequest = 204
    /// Steamworks `k_ESteamNetworkingConfig_Callback_MessagesSessionFailed`
    case callbackMessagesSessionFailed = 205
    /// Steamworks `k_ESteamNetworkingConfig_Callback_CreateConnectionSignaling`
    case callbackCreateConnectionSignaling = 206
    /// Steamworks `k_ESteamNetworkingConfig_P2P_STUN_ServerList`
    case p2PSTUNServerList = 103
    /// Steamworks `k_ESteamNetworkingConfig_P2P_Transport_ICE_Enable`
    case p2PTransportICEEnable = 104
    /// Steamworks `k_ESteamNetworkingConfig_P2P_Transport_ICE_Penalty`
    case p2PTransportICEPenalty = 105
    /// Steamworks `k_ESteamNetworkingConfig_P2P_Transport_SDR_Penalty`
    case p2PTransportSDRPenalty = 106
    /// Steamworks `k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFailInitial`
    case sdrClientConsecutitivePingTimeoutsFailInitial = 19
    /// Steamworks `k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFail`
    case sdrClientConsecutitivePingTimeoutsFail = 20
    /// Steamworks `k_ESteamNetworkingConfig_SDRClient_MinPingsBeforePingAccurate`
    case sdrClientMinPingsBeforePingAccurate = 21
    /// Steamworks `k_ESteamNetworkingConfig_SDRClient_SingleSocket`
    case sdrClientSingleSocket = 22
    /// Steamworks `k_ESteamNetworkingConfig_SDRClient_ForceRelayCluster`
    case sdrClientForceRelayCluster = 29
    /// Steamworks `k_ESteamNetworkingConfig_SDRClient_DebugTicketAddress`
    case sdrClientDebugTicketAddress = 30
    /// Steamworks `k_ESteamNetworkingConfig_SDRClient_ForceProxyAddr`
    case sdrClientForceProxyAddr = 31
    /// Steamworks `k_ESteamNetworkingConfig_SDRClient_FakeClusterPing`
    case sdrClientFakeClusterPing = 36
    /// Steamworks `k_ESteamNetworkingConfig_LogLevel_AckRTT`
    case logLevelAckRTT = 13
    /// Steamworks `k_ESteamNetworkingConfig_LogLevel_PacketDecode`
    case logLevelPacketDecode = 14
    /// Steamworks `k_ESteamNetworkingConfig_LogLevel_Message`
    case logLevelMessage = 15
    /// Steamworks `k_ESteamNetworkingConfig_LogLevel_PacketGaps`
    case logLevelPacketGaps = 16
    /// Steamworks `k_ESteamNetworkingConfig_LogLevel_P2PRendezvous`
    case logLevelP2PRendezvous = 17
    /// Steamworks `k_ESteamNetworkingConfig_LogLevel_SDRRelayPings`
    case logLevelSDRRelayPings = 18
    /// Steamworks `k_ESteamNetworkingConfig_DELETED_EnumerateDevVars`
    case deletedEnumerateDevVars = 35
    /// Some undocumented value
    case unrepresentedInSwift = 207
}

extension ESteamNetworkingConfigValue: RawConvertible { typealias From = SteamNetworkingConfigValueSetting }
extension SteamNetworkingConfigValueSetting: EnumWithUnrepresented { typealias From = ESteamNetworkingConfigValue }

/// Steamworks `ESteamNetworkingConnectionState`
public enum SteamNetworkingConnectionState: Int32 {
    /// Steamworks `k_ESteamNetworkingConnectionState_None`
    case none = 0
    /// Steamworks `k_ESteamNetworkingConnectionState_Connecting`
    case connecting = 1
    /// Steamworks `k_ESteamNetworkingConnectionState_FindingRoute`
    case findingRoute = 2
    /// Steamworks `k_ESteamNetworkingConnectionState_Connected`
    case connected = 3
    /// Steamworks `k_ESteamNetworkingConnectionState_ClosedByPeer`
    case closedByPeer = 4
    /// Steamworks `k_ESteamNetworkingConnectionState_ProblemDetectedLocally`
    case problemDetectedLocally = 5
    /// Steamworks `k_ESteamNetworkingConnectionState_FinWait`
    case finWait = -1
    /// Steamworks `k_ESteamNetworkingConnectionState_Linger`
    case linger = -2
    /// Steamworks `k_ESteamNetworkingConnectionState_Dead`
    case dead = -3
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension ESteamNetworkingConnectionState: RawConvertible { typealias From = SteamNetworkingConnectionState }
extension SteamNetworkingConnectionState: EnumWithUnrepresented { typealias From = ESteamNetworkingConnectionState }

/// Steamworks `ESteamNetworkingGetConfigValueResult`
public enum SteamNetworkingGetConfigValueResult: Int32 {
    /// Steamworks `k_ESteamNetworkingGetConfigValue_BadValue`
    case badValue = -1
    /// Steamworks `k_ESteamNetworkingGetConfigValue_BadScopeObj`
    case badScopeObj = -2
    /// Steamworks `k_ESteamNetworkingGetConfigValue_BufferTooSmall`
    case bufferTooSmall = -3
    /// Steamworks `k_ESteamNetworkingGetConfigValue_OK`
    case ok = 1
    /// Steamworks `k_ESteamNetworkingGetConfigValue_OKInherited`
    case okInherited = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ESteamNetworkingGetConfigValueResult: RawConvertible { typealias From = SteamNetworkingGetConfigValueResult }
extension SteamNetworkingGetConfigValueResult: EnumWithUnrepresented { typealias From = ESteamNetworkingGetConfigValueResult }

/// Steamworks `ESteamNetworkingIdentityType`
public enum SteamNetworkingIdentityType: UInt32 {
    /// Steamworks `k_ESteamNetworkingIdentityType_Invalid`
    case invalid = 0
    /// Steamworks `k_ESteamNetworkingIdentityType_SteamID`
    case steamID = 16
    /// Steamworks `k_ESteamNetworkingIdentityType_XboxPairwiseID`
    case xboxPairwiseID = 17
    /// Steamworks `k_ESteamNetworkingIdentityType_SonyPSN`
    case sonyPSN = 18
    /// Steamworks `k_ESteamNetworkingIdentityType_GoogleStadia`
    case googleStadia = 19
    /// Steamworks `k_ESteamNetworkingIdentityType_IPAddress`
    case ipAddress = 1
    /// Steamworks `k_ESteamNetworkingIdentityType_GenericString`
    case genericString = 2
    /// Steamworks `k_ESteamNetworkingIdentityType_GenericBytes`
    case genericBytes = 3
    /// Steamworks `k_ESteamNetworkingIdentityType_UnknownType`
    case unknownType = 4
    /// Some undocumented value
    case unrepresentedInSwift = 20
}

extension ESteamNetworkingIdentityType: RawConvertible { typealias From = SteamNetworkingIdentityType }
extension SteamNetworkingIdentityType: EnumWithUnrepresented { typealias From = ESteamNetworkingIdentityType }

/// Steamworks `ESteamNetworkingSocketsDebugOutputType`
public enum SteamNetworkingSocketsDebugOutputType: UInt32 {
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_None`
    case none = 0
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_Bug`
    case bug = 1
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_Error`
    case error = 2
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_Important`
    case important = 3
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_Warning`
    case warning = 4
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_Msg`
    case msg = 5
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_Verbose`
    case verbose = 6
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_Debug`
    case debug = 7
    /// Steamworks `k_ESteamNetworkingSocketsDebugOutputType_Everything`
    case everything = 8
    /// Some undocumented value
    case unrepresentedInSwift = 9
}

extension ESteamNetworkingSocketsDebugOutputType: RawConvertible { typealias From = SteamNetworkingSocketsDebugOutputType }
extension SteamNetworkingSocketsDebugOutputType: EnumWithUnrepresented { typealias From = ESteamNetworkingSocketsDebugOutputType }

/// Steamworks `ESteamPartyBeaconLocationData`
public enum SteamPartyBeaconLocationData: UInt32 {
    /// Steamworks `k_ESteamPartyBeaconLocationDataInvalid`
    case invalid = 0
    /// Steamworks `k_ESteamPartyBeaconLocationDataName`
    case name = 1
    /// Steamworks `k_ESteamPartyBeaconLocationDataIconURLSmall`
    case iconURLSmall = 2
    /// Steamworks `k_ESteamPartyBeaconLocationDataIconURLMedium`
    case iconURLMedium = 3
    /// Steamworks `k_ESteamPartyBeaconLocationDataIconURLLarge`
    case iconURLLarge = 4
    /// Some undocumented value
    case unrepresentedInSwift = 5
}

extension ESteamPartyBeaconLocationData: RawConvertible { typealias From = SteamPartyBeaconLocationData }
extension SteamPartyBeaconLocationData: EnumWithUnrepresented { typealias From = ESteamPartyBeaconLocationData }

/// Steamworks `ESteamPartyBeaconLocationType`
public enum SteamPartyBeaconLocationType: UInt32 {
    /// Steamworks `k_ESteamPartyBeaconLocationType_Invalid`
    case invalid = 0
    /// Steamworks `k_ESteamPartyBeaconLocationType_ChatGroup`
    case chatGroup = 1
    /// Steamworks `k_ESteamPartyBeaconLocationType_Max`
    case max = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ESteamPartyBeaconLocationType: RawConvertible { typealias From = SteamPartyBeaconLocationType }
extension SteamPartyBeaconLocationType: EnumWithUnrepresented { typealias From = ESteamPartyBeaconLocationType }

/// Steamworks `ETextFilteringContext`
public enum TextFilteringContext: UInt32 {
    /// Steamworks `k_ETextFilteringContextUnknown`
    case unknown = 0
    /// Steamworks `k_ETextFilteringContextGameContent`
    case gameContent = 1
    /// Steamworks `k_ETextFilteringContextChat`
    case chat = 2
    /// Steamworks `k_ETextFilteringContextName`
    case name = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension ETextFilteringContext: RawConvertible { typealias From = TextFilteringContext }
extension TextFilteringContext: EnumWithUnrepresented { typealias From = ETextFilteringContext }

/// Steamworks `EUGCMatchingUGCType`
public enum UGCMatchingUGCType: Int32 {
    /// Steamworks `k_EUGCMatchingUGCType_Items`
    case items = 0
    /// Steamworks `k_EUGCMatchingUGCType_Items_Mtx`
    case itemsMtx = 1
    /// Steamworks `k_EUGCMatchingUGCType_Items_ReadyToUse`
    case itemsReadyToUse = 2
    /// Steamworks `k_EUGCMatchingUGCType_Collections`
    case collections = 3
    /// Steamworks `k_EUGCMatchingUGCType_Artwork`
    case artwork = 4
    /// Steamworks `k_EUGCMatchingUGCType_Videos`
    case videos = 5
    /// Steamworks `k_EUGCMatchingUGCType_Screenshots`
    case screenshots = 6
    /// Steamworks `k_EUGCMatchingUGCType_AllGuides`
    case allGuides = 7
    /// Steamworks `k_EUGCMatchingUGCType_WebGuides`
    case webGuides = 8
    /// Steamworks `k_EUGCMatchingUGCType_IntegratedGuides`
    case integratedGuides = 9
    /// Steamworks `k_EUGCMatchingUGCType_UsableInGame`
    case usableInGame = 10
    /// Steamworks `k_EUGCMatchingUGCType_ControllerBindings`
    case controllerBindings = 11
    /// Steamworks `k_EUGCMatchingUGCType_GameManagedItems`
    case gameManagedItems = 12
    /// Steamworks `k_EUGCMatchingUGCType_All`
    case all = -1
    /// Some undocumented value
    case unrepresentedInSwift = 13
}

extension EUGCMatchingUGCType: RawConvertible { typealias From = UGCMatchingUGCType }
extension UGCMatchingUGCType: EnumWithUnrepresented { typealias From = EUGCMatchingUGCType }

/// Steamworks `EUGCQuery`
public enum UGCQuery: UInt32 {
    /// Steamworks `k_EUGCQuery_RankedByVote`
    case rankedByVote = 0
    /// Steamworks `k_EUGCQuery_RankedByPublicationDate`
    case rankedByPublicationDate = 1
    /// Steamworks `k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate`
    case acceptedForGameRankedByAcceptanceDate = 2
    /// Steamworks `k_EUGCQuery_RankedByTrend`
    case rankedByTrend = 3
    /// Steamworks `k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate`
    case favoritedByFriendsRankedByPublicationDate = 4
    /// Steamworks `k_EUGCQuery_CreatedByFriendsRankedByPublicationDate`
    case createdByFriendsRankedByPublicationDate = 5
    /// Steamworks `k_EUGCQuery_RankedByNumTimesReported`
    case rankedByNumTimesReported = 6
    /// Steamworks `k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate`
    case createdByFollowedUsersRankedByPublicationDate = 7
    /// Steamworks `k_EUGCQuery_NotYetRated`
    case notYetRated = 8
    /// Steamworks `k_EUGCQuery_RankedByTotalVotesAsc`
    case rankedByTotalVotesAsc = 9
    /// Steamworks `k_EUGCQuery_RankedByVotesUp`
    case rankedByVotesUp = 10
    /// Steamworks `k_EUGCQuery_RankedByTextSearch`
    case rankedByTextSearch = 11
    /// Steamworks `k_EUGCQuery_RankedByTotalUniqueSubscriptions`
    case rankedByTotalUniqueSubscriptions = 12
    /// Steamworks `k_EUGCQuery_RankedByPlaytimeTrend`
    case rankedByPlaytimeTrend = 13
    /// Steamworks `k_EUGCQuery_RankedByTotalPlaytime`
    case rankedByTotalPlaytime = 14
    /// Steamworks `k_EUGCQuery_RankedByAveragePlaytimeTrend`
    case rankedByAveragePlaytimeTrend = 15
    /// Steamworks `k_EUGCQuery_RankedByLifetimeAveragePlaytime`
    case rankedByLifetimeAveragePlaytime = 16
    /// Steamworks `k_EUGCQuery_RankedByPlaytimeSessionsTrend`
    case rankedByPlaytimeSessionsTrend = 17
    /// Steamworks `k_EUGCQuery_RankedByLifetimePlaytimeSessions`
    case rankedByLifetimePlaytimeSessions = 18
    /// Steamworks `k_EUGCQuery_RankedByLastUpdatedDate`
    case rankedByLastUpdatedDate = 19
    /// Some undocumented value
    case unrepresentedInSwift = 20
}

extension EUGCQuery: RawConvertible { typealias From = UGCQuery }
extension UGCQuery: EnumWithUnrepresented { typealias From = EUGCQuery }

/// Steamworks `EUGCReadAction`
public enum UGCReadAction: UInt32 {
    /// Steamworks `k_EUGCRead_ContinueReadingUntilFinished`
    case continueReadingUntilFinished = 0
    /// Steamworks `k_EUGCRead_ContinueReading`
    case continueReading = 1
    /// Steamworks `k_EUGCRead_Close`
    case close = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension EUGCReadAction: RawConvertible { typealias From = UGCReadAction }
extension UGCReadAction: EnumWithUnrepresented { typealias From = EUGCReadAction }

/// Steamworks `EUniverse`
public enum Universe: UInt32 {
    /// Steamworks `k_EUniverseInvalid`
    case invalid = 0
    /// Steamworks `k_EUniversePublic`
    case `public` = 1
    /// Steamworks `k_EUniverseBeta`
    case beta = 2
    /// Steamworks `k_EUniverseInternal`
    case `internal` = 3
    /// Steamworks `k_EUniverseDev`
    case dev = 4
    /// Steamworks `k_EUniverseMax`
    case max = 5
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension EUniverse: RawConvertible { typealias From = Universe }
extension Universe: EnumWithUnrepresented { typealias From = EUniverse }

/// Steamworks `EUserHasLicenseForAppResult`
public enum UserHasLicenseForAppResult: UInt32 {
    /// Steamworks `k_EUserHasLicenseResultHasLicense`
    case hasLicense = 0
    /// Steamworks `k_EUserHasLicenseResultDoesNotHaveLicense`
    case doesNotHaveLicense = 1
    /// Steamworks `k_EUserHasLicenseResultNoAuth`
    case noAuth = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension EUserHasLicenseForAppResult: RawConvertible { typealias From = UserHasLicenseForAppResult }
extension UserHasLicenseForAppResult: EnumWithUnrepresented { typealias From = EUserHasLicenseForAppResult }

/// Steamworks `EUserRestriction`
public struct UserRestriction: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_nUserRestrictionNone`
    public static let none = UserRestriction([])
    /// Steamworks `k_nUserRestrictionUnknown`
    public static let unknown = UserRestriction(rawValue: 1)
    /// Steamworks `k_nUserRestrictionAnyChat`
    public static let anyChat = UserRestriction(rawValue: 2)
    /// Steamworks `k_nUserRestrictionVoiceChat`
    public static let voiceChat = UserRestriction(rawValue: 4)
    /// Steamworks `k_nUserRestrictionGroupChat`
    public static let groupChat = UserRestriction(rawValue: 8)
    /// Steamworks `k_nUserRestrictionRating`
    public static let rating = UserRestriction(rawValue: 16)
    /// Steamworks `k_nUserRestrictionGameInvites`
    public static let gameInvites = UserRestriction(rawValue: 32)
    /// Steamworks `k_nUserRestrictionTrading`
    public static let trading = UserRestriction(rawValue: 64)
}

extension EUserRestriction: RawConvertible { typealias From = UserRestriction }
extension UserRestriction: RawConvertible { typealias From = EUserRestriction }

/// Steamworks `EUserUGCList`
public enum UserUGCList: UInt32 {
    /// Steamworks `k_EUserUGCList_Published`
    case published = 0
    /// Steamworks `k_EUserUGCList_VotedOn`
    case votedOn = 1
    /// Steamworks `k_EUserUGCList_VotedUp`
    case votedUp = 2
    /// Steamworks `k_EUserUGCList_VotedDown`
    case votedDown = 3
    /// Steamworks `k_EUserUGCList_WillVoteLater`
    case willVoteLater = 4
    /// Steamworks `k_EUserUGCList_Favorited`
    case favorited = 5
    /// Steamworks `k_EUserUGCList_Subscribed`
    case subscribed = 6
    /// Steamworks `k_EUserUGCList_UsedOrPlayed`
    case usedOrPlayed = 7
    /// Steamworks `k_EUserUGCList_Followed`
    case followed = 8
    /// Some undocumented value
    case unrepresentedInSwift = 9
}

extension EUserUGCList: RawConvertible { typealias From = UserUGCList }
extension UserUGCList: EnumWithUnrepresented { typealias From = EUserUGCList }

/// Steamworks `EUserUGCListSortOrder`
public enum UserUGCListSortOrder: UInt32 {
    /// Steamworks `k_EUserUGCListSortOrder_CreationOrderDesc`
    case creationOrderDesc = 0
    /// Steamworks `k_EUserUGCListSortOrder_CreationOrderAsc`
    case creationOrderAsc = 1
    /// Steamworks `k_EUserUGCListSortOrder_TitleAsc`
    case titleAsc = 2
    /// Steamworks `k_EUserUGCListSortOrder_LastUpdatedDesc`
    case lastUpdatedDesc = 3
    /// Steamworks `k_EUserUGCListSortOrder_SubscriptionDateDesc`
    case subscriptionDateDesc = 4
    /// Steamworks `k_EUserUGCListSortOrder_VoteScoreDesc`
    case voteScoreDesc = 5
    /// Steamworks `k_EUserUGCListSortOrder_ForModeration`
    case forModeration = 6
    /// Some undocumented value
    case unrepresentedInSwift = 7
}

extension EUserUGCListSortOrder: RawConvertible { typealias From = UserUGCListSortOrder }
extension UserUGCListSortOrder: EnumWithUnrepresented { typealias From = EUserUGCListSortOrder }

/// Steamworks `EVRScreenshotType`
public enum VRScreenshotType: UInt32 {
    /// Steamworks `k_EVRScreenshotType_None`
    case none = 0
    /// Steamworks `k_EVRScreenshotType_Mono`
    case mono = 1
    /// Steamworks `k_EVRScreenshotType_Stereo`
    case stereo = 2
    /// Steamworks `k_EVRScreenshotType_MonoCubemap`
    case monoCubemap = 3
    /// Steamworks `k_EVRScreenshotType_MonoPanorama`
    case monoPanorama = 4
    /// Steamworks `k_EVRScreenshotType_StereoPanorama`
    case stereoPanorama = 5
    /// Some undocumented value
    case unrepresentedInSwift = 6
}

extension EVRScreenshotType: RawConvertible { typealias From = VRScreenshotType }
extension VRScreenshotType: EnumWithUnrepresented { typealias From = EVRScreenshotType }

/// Steamworks `EVoiceResult`
public enum VoiceResult: UInt32 {
    /// Steamworks `k_EVoiceResultOK`
    case ok = 0
    /// Steamworks `k_EVoiceResultNotInitialized`
    case notInitialized = 1
    /// Steamworks `k_EVoiceResultNotRecording`
    case notRecording = 2
    /// Steamworks `k_EVoiceResultNoData`
    case noData = 3
    /// Steamworks `k_EVoiceResultBufferTooSmall`
    case bufferTooSmall = 4
    /// Steamworks `k_EVoiceResultDataCorrupted`
    case dataCorrupted = 5
    /// Steamworks `k_EVoiceResultRestricted`
    case restricted = 6
    /// Steamworks `k_EVoiceResultUnsupportedCodec`
    case unsupportedCodec = 7
    /// Steamworks `k_EVoiceResultReceiverOutOfDate`
    case receiverOutOfDate = 8
    /// Steamworks `k_EVoiceResultReceiverDidNotAnswer`
    case receiverDidNotAnswer = 9
    /// Some undocumented value
    case unrepresentedInSwift = 10
}

extension EVoiceResult: RawConvertible { typealias From = VoiceResult }
extension VoiceResult: EnumWithUnrepresented { typealias From = EVoiceResult }

/// Steamworks `EWorkshopEnumerationType`
public enum WorkshopEnumerationType: UInt32 {
    /// Steamworks `k_EWorkshopEnumerationTypeRankedByVote`
    case rankedByVote = 0
    /// Steamworks `k_EWorkshopEnumerationTypeRecent`
    case recent = 1
    /// Steamworks `k_EWorkshopEnumerationTypeTrending`
    case trending = 2
    /// Steamworks `k_EWorkshopEnumerationTypeFavoritesOfFriends`
    case favoritesOfFriends = 3
    /// Steamworks `k_EWorkshopEnumerationTypeVotedByFriends`
    case votedByFriends = 4
    /// Steamworks `k_EWorkshopEnumerationTypeContentByFriends`
    case contentByFriends = 5
    /// Steamworks `k_EWorkshopEnumerationTypeRecentFromFollowedUsers`
    case recentFromFollowedUsers = 6
    /// Some undocumented value
    case unrepresentedInSwift = 7
}

extension EWorkshopEnumerationType: RawConvertible { typealias From = WorkshopEnumerationType }
extension WorkshopEnumerationType: EnumWithUnrepresented { typealias From = EWorkshopEnumerationType }

/// Steamworks `EWorkshopFileAction`
public enum WorkshopFileAction: UInt32 {
    /// Steamworks `k_EWorkshopFileActionPlayed`
    case played = 0
    /// Steamworks `k_EWorkshopFileActionCompleted`
    case completed = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension EWorkshopFileAction: RawConvertible { typealias From = WorkshopFileAction }
extension WorkshopFileAction: EnumWithUnrepresented { typealias From = EWorkshopFileAction }

/// Steamworks `EWorkshopFileType`
public enum WorkshopFileType: UInt32 {
    /// Steamworks `k_EWorkshopFileTypeFirst`
    public static let first = WorkshopFileType(rawValue: 0)!
    /// Steamworks `k_EWorkshopFileTypeCommunity`
    case community = 0
    /// Steamworks `k_EWorkshopFileTypeMicrotransaction`
    case microtransaction = 1
    /// Steamworks `k_EWorkshopFileTypeCollection`
    case collection = 2
    /// Steamworks `k_EWorkshopFileTypeArt`
    case art = 3
    /// Steamworks `k_EWorkshopFileTypeVideo`
    case video = 4
    /// Steamworks `k_EWorkshopFileTypeScreenshot`
    case screenshot = 5
    /// Steamworks `k_EWorkshopFileTypeGame`
    case game = 6
    /// Steamworks `k_EWorkshopFileTypeSoftware`
    case software = 7
    /// Steamworks `k_EWorkshopFileTypeConcept`
    case concept = 8
    /// Steamworks `k_EWorkshopFileTypeWebGuide`
    case webGuide = 9
    /// Steamworks `k_EWorkshopFileTypeIntegratedGuide`
    case integratedGuide = 10
    /// Steamworks `k_EWorkshopFileTypeMerch`
    case merch = 11
    /// Steamworks `k_EWorkshopFileTypeControllerBinding`
    case controllerBinding = 12
    /// Steamworks `k_EWorkshopFileTypeSteamworksAccessInvite`
    case steamworksAccessInvite = 13
    /// Steamworks `k_EWorkshopFileTypeSteamVideo`
    case steamVideo = 14
    /// Steamworks `k_EWorkshopFileTypeGameManagedItem`
    case gameManagedItem = 15
    /// Steamworks `k_EWorkshopFileTypeMax`
    case max = 16
    /// Some undocumented value
    case unrepresentedInSwift = 17
}

extension EWorkshopFileType: RawConvertible { typealias From = WorkshopFileType }
extension WorkshopFileType: EnumWithUnrepresented { typealias From = EWorkshopFileType }

/// Steamworks `EWorkshopVideoProvider`
public enum WorkshopVideoProvider: UInt32 {
    /// Steamworks `k_EWorkshopVideoProviderNone`
    case none = 0
    /// Steamworks `k_EWorkshopVideoProviderYoutube`
    case youtube = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension EWorkshopVideoProvider: RawConvertible { typealias From = WorkshopVideoProvider }
extension WorkshopVideoProvider: EnumWithUnrepresented { typealias From = EWorkshopVideoProvider }

/// Steamworks `EWorkshopVote`
public enum WorkshopVote: UInt32 {
    /// Steamworks `k_EWorkshopVoteUnvoted`
    case unvoted = 0
    /// Steamworks `k_EWorkshopVoteFor`
    case `for` = 1
    /// Steamworks `k_EWorkshopVoteAgainst`
    case against = 2
    /// Steamworks `k_EWorkshopVoteLater`
    case later = 3
    /// Some undocumented value
    case unrepresentedInSwift = 4
}

extension EWorkshopVote: RawConvertible { typealias From = WorkshopVote }
extension WorkshopVote: EnumWithUnrepresented { typealias From = EWorkshopVote }

/// Steamworks `EXboxOrigin`
public enum XboxOrigin: UInt32 {
    /// Steamworks `k_EXboxOrigin_A`
    case a = 0
    /// Steamworks `k_EXboxOrigin_B`
    case b = 1
    /// Steamworks `k_EXboxOrigin_X`
    case x = 2
    /// Steamworks `k_EXboxOrigin_Y`
    case y = 3
    /// Steamworks `k_EXboxOrigin_LeftBumper`
    case leftBumper = 4
    /// Steamworks `k_EXboxOrigin_RightBumper`
    case rightBumper = 5
    /// Steamworks `k_EXboxOrigin_Menu`
    case menu = 6
    /// Steamworks `k_EXboxOrigin_View`
    case view = 7
    /// Steamworks `k_EXboxOrigin_LeftTrigger_Pull`
    case leftTriggerPull = 8
    /// Steamworks `k_EXboxOrigin_LeftTrigger_Click`
    case leftTriggerClick = 9
    /// Steamworks `k_EXboxOrigin_RightTrigger_Pull`
    case rightTriggerPull = 10
    /// Steamworks `k_EXboxOrigin_RightTrigger_Click`
    case rightTriggerClick = 11
    /// Steamworks `k_EXboxOrigin_LeftStick_Move`
    case leftStickMove = 12
    /// Steamworks `k_EXboxOrigin_LeftStick_Click`
    case leftStickClick = 13
    /// Steamworks `k_EXboxOrigin_LeftStick_DPadNorth`
    case leftStickDPadNorth = 14
    /// Steamworks `k_EXboxOrigin_LeftStick_DPadSouth`
    case leftStickDPadSouth = 15
    /// Steamworks `k_EXboxOrigin_LeftStick_DPadWest`
    case leftStickDPadWest = 16
    /// Steamworks `k_EXboxOrigin_LeftStick_DPadEast`
    case leftStickDPadEast = 17
    /// Steamworks `k_EXboxOrigin_RightStick_Move`
    case rightStickMove = 18
    /// Steamworks `k_EXboxOrigin_RightStick_Click`
    case rightStickClick = 19
    /// Steamworks `k_EXboxOrigin_RightStick_DPadNorth`
    case rightStickDPadNorth = 20
    /// Steamworks `k_EXboxOrigin_RightStick_DPadSouth`
    case rightStickDPadSouth = 21
    /// Steamworks `k_EXboxOrigin_RightStick_DPadWest`
    case rightStickDPadWest = 22
    /// Steamworks `k_EXboxOrigin_RightStick_DPadEast`
    case rightStickDPadEast = 23
    /// Steamworks `k_EXboxOrigin_DPad_North`
    case dPadNorth = 24
    /// Steamworks `k_EXboxOrigin_DPad_South`
    case dPadSouth = 25
    /// Steamworks `k_EXboxOrigin_DPad_West`
    case dPadWest = 26
    /// Steamworks `k_EXboxOrigin_DPad_East`
    case dPadEast = 27
    /// Steamworks `k_EXboxOrigin_Count`
    case count = 28
    /// Some undocumented value
    case unrepresentedInSwift = 29
}

extension EXboxOrigin: RawConvertible { typealias From = XboxOrigin }
extension XboxOrigin: EnumWithUnrepresented { typealias From = EXboxOrigin }

/// Steamworks `IPCFailure_t::EFailureType`
public enum IPCFailureType: UInt32 {
    /// Steamworks `k_EFailureFlushedCallbackQueue`
    case flushedCallbackQueue = 0
    /// Steamworks `k_EFailurePipeFail`
    case pipeFail = 1
    /// Some undocumented value
    case unrepresentedInSwift = 2
}

extension IPCFailure_t.EFailureType: RawConvertible { typealias From = IPCFailureType }
extension IPCFailureType: EnumWithUnrepresented { typealias From = IPCFailure_t.EFailureType }

extension IPCFailureType {
    init(_ from: UInt8) {
        self.init(From(rawValue: UInt32(from)))
    }
}

/// Steamworks `ISteamHTMLSurface::EHTMLKeyModifiers`
public struct HTMLKeyModifiers: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
    /// Steamworks `k_eHTMLKeyModifier_None`
    public static let none = HTMLKeyModifiers([])
    /// Steamworks `k_eHTMLKeyModifier_AltDown`
    public static let altDown = HTMLKeyModifiers(rawValue: 1)
    /// Steamworks `k_eHTMLKeyModifier_CtrlDown`
    public static let ctrlDown = HTMLKeyModifiers(rawValue: 2)
    /// Steamworks `k_eHTMLKeyModifier_ShiftDown`
    public static let shiftDown = HTMLKeyModifiers(rawValue: 4)
}

extension ISteamHTMLSurface.EHTMLKeyModifiers: RawConvertible { typealias From = HTMLKeyModifiers }
extension HTMLKeyModifiers: RawConvertible { typealias From = ISteamHTMLSurface.EHTMLKeyModifiers }

/// Steamworks `ISteamHTMLSurface::EHTMLMouseButton`
public enum HTMLMouseButton: UInt32 {
    /// Steamworks `eHTMLMouseButton_Left`
    case left = 0
    /// Steamworks `eHTMLMouseButton_Right`
    case right = 1
    /// Steamworks `eHTMLMouseButton_Middle`
    case middle = 2
    /// Some undocumented value
    case unrepresentedInSwift = 3
}

extension ISteamHTMLSurface.EHTMLMouseButton: RawConvertible { typealias From = HTMLMouseButton }
extension HTMLMouseButton: EnumWithUnrepresented { typealias From = ISteamHTMLSurface.EHTMLMouseButton }

/// Steamworks `ISteamHTMLSurface::EMouseCursor`
public enum HTMLMouseCursor: UInt32 {
    /// Steamworks `dc_user`
    case user = 0
    /// Steamworks `dc_none`
    case none = 1
    /// Steamworks `dc_arrow`
    case arrow = 2
    /// Steamworks `dc_ibeam`
    case ibeam = 3
    /// Steamworks `dc_hourglass`
    case hourglass = 4
    /// Steamworks `dc_waitarrow`
    case waitarrow = 5
    /// Steamworks `dc_crosshair`
    case crosshair = 6
    /// Steamworks `dc_up`
    case up = 7
    /// Steamworks `dc_sizenw`
    case sizenw = 8
    /// Steamworks `dc_sizese`
    case sizese = 9
    /// Steamworks `dc_sizene`
    case sizene = 10
    /// Steamworks `dc_sizesw`
    case sizesw = 11
    /// Steamworks `dc_sizew`
    case sizew = 12
    /// Steamworks `dc_sizee`
    case sizee = 13
    /// Steamworks `dc_sizen`
    case sizen = 14
    /// Steamworks `dc_sizes`
    case sizes = 15
    /// Steamworks `dc_sizewe`
    case sizewe = 16
    /// Steamworks `dc_sizens`
    case sizens = 17
    /// Steamworks `dc_sizeall`
    case sizeall = 18
    /// Steamworks `dc_no`
    case no = 19
    /// Steamworks `dc_hand`
    case hand = 20
    /// Steamworks `dc_blank`
    case blank = 21
    /// Steamworks `dc_middle_pan`
    case middlepan = 22
    /// Steamworks `dc_north_pan`
    case northpan = 23
    /// Steamworks `dc_north_east_pan`
    case northeastpan = 24
    /// Steamworks `dc_east_pan`
    case eastpan = 25
    /// Steamworks `dc_south_east_pan`
    case southeastpan = 26
    /// Steamworks `dc_south_pan`
    case southpan = 27
    /// Steamworks `dc_south_west_pan`
    case southwestpan = 28
    /// Steamworks `dc_west_pan`
    case westpan = 29
    /// Steamworks `dc_north_west_pan`
    case northwestpan = 30
    /// Steamworks `dc_alias`
    case alias = 31
    /// Steamworks `dc_cell`
    case cell = 32
    /// Steamworks `dc_colresize`
    case colresize = 33
    /// Steamworks `dc_copycur`
    case copycur = 34
    /// Steamworks `dc_verticaltext`
    case verticaltext = 35
    /// Steamworks `dc_rowresize`
    case rowresize = 36
    /// Steamworks `dc_zoomin`
    case zoomin = 37
    /// Steamworks `dc_zoomout`
    case zoomout = 38
    /// Steamworks `dc_help`
    case help = 39
    /// Steamworks `dc_custom`
    case custom = 40
    /// Steamworks `dc_last`
    case last = 41
    /// Some undocumented value
    case unrepresentedInSwift = 42
}

extension ISteamHTMLSurface.EMouseCursor: RawConvertible { typealias From = HTMLMouseCursor }
extension HTMLMouseCursor: EnumWithUnrepresented { typealias From = ISteamHTMLSurface.EMouseCursor }

extension HTMLMouseCursor {
    init(_ from: UInt32) {
        self.init(From(rawValue: UInt32(from)))
    }
}

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

extension RequestPlayersForGameResultCallback_t.PlayerAcceptState_t: RawConvertible { typealias From = PlayerAcceptState }
extension PlayerAcceptState: EnumWithUnrepresented { typealias From = RequestPlayersForGameResultCallback_t.PlayerAcceptState_t }
