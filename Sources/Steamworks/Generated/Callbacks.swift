//
//  Callbacks.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

public extension SteamBaseAPI {
    // MARK: Callback registration
    /// Registration for Steamworks `SteamServersConnected_t` callback
    func onSteamServersConnected(_ client: @escaping (SteamServersConnected) -> Void) {
        callbacks.add(callbackID: CallbackID(101), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamServerConnectFailure_t` callback
    func onSteamServerConnectFailure(_ client: @escaping (SteamServerConnectFailure) -> Void) {
        callbacks.add(callbackID: CallbackID(102), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamServersDisconnected_t` callback
    func onSteamServersDisconnected(_ client: @escaping (SteamServersDisconnected) -> Void) {
        callbacks.add(callbackID: CallbackID(103), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ClientGameServerDeny_t` callback
    func onClientGameServerDeny(_ client: @escaping (ClientGameServerDeny) -> Void) {
        callbacks.add(callbackID: CallbackID(113), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `IPCFailure_t` callback
    func onIPCFailure(_ client: @escaping (IPCFailure) -> Void) {
        callbacks.add(callbackID: CallbackID(117), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LicensesUpdated_t` callback
    func onLicensesUpdated(_ client: @escaping (LicensesUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(125), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ValidateAuthTicketResponse_t` callback
    func onValidateAuthTicketResponse(_ client: @escaping (ValidateAuthTicketResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(143), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MicroTxnAuthorizationResponse_t` callback
    func onMicroTxnAuthorizationResponse(_ client: @escaping (MicroTxnAuthorizationResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(152), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GetAuthSessionTicketResponse_t` callback
    func onGetAuthSessionTicketResponse(_ client: @escaping (GetAuthSessionTicketResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(163), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameWebCallback_t` callback
    func onGameWebCallback(_ client: @escaping (GameWebCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(164), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `PersonaStateChange_t` callback
    func onPersonaStateChange(_ client: @escaping (PersonaStateChange) -> Void) {
        callbacks.add(callbackID: CallbackID(304), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameOverlayActivated_t` callback
    func onGameOverlayActivated(_ client: @escaping (GameOverlayActivated) -> Void) {
        callbacks.add(callbackID: CallbackID(331), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameServerChangeRequested_t` callback
    func onGameServerChangeRequested(_ client: @escaping (GameServerChangeRequested) -> Void) {
        callbacks.add(callbackID: CallbackID(332), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameLobbyJoinRequested_t` callback
    func onGameLobbyJoinRequested(_ client: @escaping (GameLobbyJoinRequested) -> Void) {
        callbacks.add(callbackID: CallbackID(333), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `AvatarImageLoaded_t` callback
    func onAvatarImageLoaded(_ client: @escaping (AvatarImageLoaded) -> Void) {
        callbacks.add(callbackID: CallbackID(334), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FriendRichPresenceUpdate_t` callback
    func onFriendRichPresenceUpdate(_ client: @escaping (FriendRichPresenceUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(336), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameRichPresenceJoinRequested_t` callback
    func onGameRichPresenceJoinRequested(_ client: @escaping (GameRichPresenceJoinRequested) -> Void) {
        callbacks.add(callbackID: CallbackID(337), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameConnectedClanChatMsg_t` callback
    func onGameConnectedClanChatMsg(_ client: @escaping (GameConnectedClanChatMsg) -> Void) {
        callbacks.add(callbackID: CallbackID(338), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameConnectedChatJoin_t` callback
    func onGameConnectedChatJoin(_ client: @escaping (GameConnectedChatJoin) -> Void) {
        callbacks.add(callbackID: CallbackID(339), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameConnectedChatLeave_t` callback
    func onGameConnectedChatLeave(_ client: @escaping (GameConnectedChatLeave) -> Void) {
        callbacks.add(callbackID: CallbackID(340), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameConnectedFriendChatMsg_t` callback
    func onGameConnectedFriendChatMsg(_ client: @escaping (GameConnectedFriendChatMsg) -> Void) {
        callbacks.add(callbackID: CallbackID(343), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UnreadChatMessagesChanged_t` callback
    func onUnreadChatMessagesChanged(_ client: @escaping (UnreadChatMessagesChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(348), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `OverlayBrowserProtocolNavigation_t` callback
    func onOverlayBrowserProtocolNavigation(_ client: @escaping (OverlayBrowserProtocolNavigation) -> Void) {
        callbacks.add(callbackID: CallbackID(349), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `IPCountry_t` callback
    func onIPCountry(_ client: @escaping (IPCountry) -> Void) {
        callbacks.add(callbackID: CallbackID(701), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LowBatteryPower_t` callback
    func onLowBatteryPower(_ client: @escaping (LowBatteryPower) -> Void) {
        callbacks.add(callbackID: CallbackID(702), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamAPICallCompleted_t` callback
    func onSteamAPICallCompleted(_ client: @escaping (SteamAPICallCompleted) -> Void) {
        callbacks.add(callbackID: CallbackID(703), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamShutdown_t` callback
    func onSteamShutdown(_ client: @escaping (SteamShutdown) -> Void) {
        callbacks.add(callbackID: CallbackID(704), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GamepadTextInputDismissed_t` callback
    func onGamepadTextInputDismissed(_ client: @escaping (GamepadTextInputDismissed) -> Void) {
        callbacks.add(callbackID: CallbackID(714), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `AppResumingFromSuspend_t` callback
    func onAppResumingFromSuspend(_ client: @escaping (AppResumingFromSuspend) -> Void) {
        callbacks.add(callbackID: CallbackID(736), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FloatingGamepadTextInputDismissed_t` callback
    func onFloatingGamepadTextInputDismissed(_ client: @escaping (FloatingGamepadTextInputDismissed) -> Void) {
        callbacks.add(callbackID: CallbackID(738), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FavoritesListChanged_t` callback
    func onFavoritesListChanged(_ client: @escaping (FavoritesListChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(502), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyInvite_t` callback
    func onLobbyInvite(_ client: @escaping (LobbyInvite) -> Void) {
        callbacks.add(callbackID: CallbackID(503), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyDataUpdate_t` callback
    func onLobbyDataUpdate(_ client: @escaping (LobbyDataUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(505), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyChatUpdate_t` callback
    func onLobbyChatUpdate(_ client: @escaping (LobbyChatUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(506), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyChatMsg_t` callback
    func onLobbyChatMsg(_ client: @escaping (LobbyChatMsg) -> Void) {
        callbacks.add(callbackID: CallbackID(507), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyGameCreated_t` callback
    func onLobbyGameCreated(_ client: @escaping (LobbyGameCreated) -> Void) {
        callbacks.add(callbackID: CallbackID(509), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyKicked_t` callback
    func onLobbyKicked(_ client: @escaping (LobbyKicked) -> Void) {
        callbacks.add(callbackID: CallbackID(512), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `PSNGameBootInviteResult_t` callback
    func onPSNGameBootInviteResult(_ client: @escaping (PSNGameBootInviteResult) -> Void) {
        callbacks.add(callbackID: CallbackID(515), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FavoritesListAccountsUpdated_t` callback
    func onFavoritesListAccountsUpdated(_ client: @escaping (FavoritesListAccountsUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(516), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SearchForGameProgressCallback_t` callback
    func onSearchForGameProgressCallback(_ client: @escaping (SearchForGameProgressCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5201), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SearchForGameResultCallback_t` callback
    func onSearchForGameResultCallback(_ client: @escaping (SearchForGameResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5202), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RequestPlayersForGameProgressCallback_t` callback
    func onRequestPlayersForGameProgressCallback(_ client: @escaping (RequestPlayersForGameProgressCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5211), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RequestPlayersForGameResultCallback_t` callback
    func onRequestPlayersForGameResultCallback(_ client: @escaping (RequestPlayersForGameResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5212), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RequestPlayersForGameFinalResultCallback_t` callback
    func onRequestPlayersForGameFinalResultCallback(_ client: @escaping (RequestPlayersForGameFinalResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5213), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SubmitPlayerResultResultCallback_t` callback
    func onSubmitPlayerResultResultCallback(_ client: @escaping (SubmitPlayerResultResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5214), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `EndGameResultCallback_t` callback
    func onEndGameResultCallback(_ client: @escaping (EndGameResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5215), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ReservationNotificationCallback_t` callback
    func onReservationNotificationCallback(_ client: @escaping (ReservationNotificationCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5303), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `AvailableBeaconLocationsUpdated_t` callback
    func onAvailableBeaconLocationsUpdated(_ client: @escaping (AvailableBeaconLocationsUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(5305), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ActiveBeaconsUpdated_t` callback
    func onActiveBeaconsUpdated(_ client: @escaping (ActiveBeaconsUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(5306), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishFileResult_t` callback
    func onRemoteStoragePublishFileResult(_ client: @escaping (RemoteStoragePublishFileResult) -> Void) {
        callbacks.add(callbackID: CallbackID(1309), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishedFileSubscribed_t` callback
    func onRemoteStoragePublishedFileSubscribed(_ client: @escaping (RemoteStoragePublishedFileSubscribed) -> Void) {
        callbacks.add(callbackID: CallbackID(1321), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishedFileUnsubscribed_t` callback
    func onRemoteStoragePublishedFileUnsubscribed(_ client: @escaping (RemoteStoragePublishedFileUnsubscribed) -> Void) {
        callbacks.add(callbackID: CallbackID(1322), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishedFileDeleted_t` callback
    func onRemoteStoragePublishedFileDeleted(_ client: @escaping (RemoteStoragePublishedFileDeleted) -> Void) {
        callbacks.add(callbackID: CallbackID(1323), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStorageUserVoteDetails_t` callback
    func onRemoteStorageUserVoteDetails(_ client: @escaping (RemoteStorageUserVoteDetails) -> Void) {
        callbacks.add(callbackID: CallbackID(1325), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStorageEnumerateUserSharedWorkshopFilesResult_t` callback
    func onRemoteStorageEnumerateUserSharedWorkshopFilesResult(_ client: @escaping (RemoteStorageEnumerateUserSharedWorkshopFilesResult) -> Void) {
        callbacks.add(callbackID: CallbackID(1326), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishedFileUpdated_t` callback
    func onRemoteStoragePublishedFileUpdated(_ client: @escaping (RemoteStoragePublishedFileUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(1330), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStorageLocalFileChange_t` callback
    func onRemoteStorageLocalFileChange(_ client: @escaping (RemoteStorageLocalFileChange) -> Void) {
        callbacks.add(callbackID: CallbackID(1333), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserStatsReceived_t` callback
    func onUserStatsReceived(_ client: @escaping (UserStatsReceived) -> Void) {
        callbacks.add(callbackID: CallbackID(1101), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserStatsStored_t` callback
    func onUserStatsStored(_ client: @escaping (UserStatsStored) -> Void) {
        callbacks.add(callbackID: CallbackID(1102), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserAchievementStored_t` callback
    func onUserAchievementStored(_ client: @escaping (UserAchievementStored) -> Void) {
        callbacks.add(callbackID: CallbackID(1103), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserStatsUnloaded_t` callback
    func onUserStatsUnloaded(_ client: @escaping (UserStatsUnloaded) -> Void) {
        callbacks.add(callbackID: CallbackID(1108), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserAchievementIconFetched_t` callback
    func onUserAchievementIconFetched(_ client: @escaping (UserAchievementIconFetched) -> Void) {
        callbacks.add(callbackID: CallbackID(1109), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `PS3TrophiesInstalled_t` callback
    func onPS3TrophiesInstalled(_ client: @escaping (PS3TrophiesInstalled) -> Void) {
        callbacks.add(callbackID: CallbackID(1112), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `DlcInstalled_t` callback
    func onDlcInstalled(_ client: @escaping (DlcInstalled) -> Void) {
        callbacks.add(callbackID: CallbackID(1005), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RegisterActivationCodeResponse_t` callback
    func onRegisterActivationCodeResponse(_ client: @escaping (RegisterActivationCodeResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(1008), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `NewUrlLaunchParameters_t` callback
    func onNewUrlLaunchParameters(_ client: @escaping (NewUrlLaunchParameters) -> Void) {
        callbacks.add(callbackID: CallbackID(1014), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `AppProofOfPurchaseKeyResponse_t` callback
    func onAppProofOfPurchaseKeyResponse(_ client: @escaping (AppProofOfPurchaseKeyResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(1021), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `TimedTrialStatus_t` callback
    func onTimedTrialStatus(_ client: @escaping (TimedTrialStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(1030), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `P2PSessionRequest_t` callback
    func onP2PSessionRequest(_ client: @escaping (P2PSessionRequest) -> Void) {
        callbacks.add(callbackID: CallbackID(1202), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `P2PSessionConnectFail_t` callback
    func onP2PSessionConnectFail(_ client: @escaping (P2PSessionConnectFail) -> Void) {
        callbacks.add(callbackID: CallbackID(1203), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SocketStatusCallback_t` callback
    func onSocketStatusCallback(_ client: @escaping (SocketStatusCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(1201), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ScreenshotReady_t` callback
    func onScreenshotReady(_ client: @escaping (ScreenshotReady) -> Void) {
        callbacks.add(callbackID: CallbackID(2301), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ScreenshotRequested_t` callback
    func onScreenshotRequested(_ client: @escaping (ScreenshotRequested) -> Void) {
        callbacks.add(callbackID: CallbackID(2302), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `PlaybackStatusHasChanged_t` callback
    func onPlaybackStatusHasChanged(_ client: @escaping (PlaybackStatusHasChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(4001), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `VolumeHasChanged_t` callback
    func onVolumeHasChanged(_ client: @escaping (VolumeHasChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(4002), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerRemoteWillActivate_t` callback
    func onMusicPlayerRemoteWillActivate(_ client: @escaping (MusicPlayerRemoteWillActivate) -> Void) {
        callbacks.add(callbackID: CallbackID(4101), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerRemoteWillDeactivate_t` callback
    func onMusicPlayerRemoteWillDeactivate(_ client: @escaping (MusicPlayerRemoteWillDeactivate) -> Void) {
        callbacks.add(callbackID: CallbackID(4102), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerRemoteToFront_t` callback
    func onMusicPlayerRemoteToFront(_ client: @escaping (MusicPlayerRemoteToFront) -> Void) {
        callbacks.add(callbackID: CallbackID(4103), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWillQuit_t` callback
    func onMusicPlayerWillQuit(_ client: @escaping (MusicPlayerWillQuit) -> Void) {
        callbacks.add(callbackID: CallbackID(4104), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPlay_t` callback
    func onMusicPlayerWantsPlay(_ client: @escaping (MusicPlayerWantsPlay) -> Void) {
        callbacks.add(callbackID: CallbackID(4105), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPause_t` callback
    func onMusicPlayerWantsPause(_ client: @escaping (MusicPlayerWantsPause) -> Void) {
        callbacks.add(callbackID: CallbackID(4106), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPlayPrevious_t` callback
    func onMusicPlayerWantsPlayPrevious(_ client: @escaping (MusicPlayerWantsPlayPrevious) -> Void) {
        callbacks.add(callbackID: CallbackID(4107), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPlayNext_t` callback
    func onMusicPlayerWantsPlayNext(_ client: @escaping (MusicPlayerWantsPlayNext) -> Void) {
        callbacks.add(callbackID: CallbackID(4108), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsShuffled_t` callback
    func onMusicPlayerWantsShuffled(_ client: @escaping (MusicPlayerWantsShuffled) -> Void) {
        callbacks.add(callbackID: CallbackID(4109), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsLooped_t` callback
    func onMusicPlayerWantsLooped(_ client: @escaping (MusicPlayerWantsLooped) -> Void) {
        callbacks.add(callbackID: CallbackID(4110), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsVolume_t` callback
    func onMusicPlayerWantsVolume(_ client: @escaping (MusicPlayerWantsVolume) -> Void) {
        callbacks.add(callbackID: CallbackID(4011), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerSelectsQueueEntry_t` callback
    func onMusicPlayerSelectsQueueEntry(_ client: @escaping (MusicPlayerSelectsQueueEntry) -> Void) {
        callbacks.add(callbackID: CallbackID(4012), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerSelectsPlaylistEntry_t` callback
    func onMusicPlayerSelectsPlaylistEntry(_ client: @escaping (MusicPlayerSelectsPlaylistEntry) -> Void) {
        callbacks.add(callbackID: CallbackID(4013), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPlayingRepeatStatus_t` callback
    func onMusicPlayerWantsPlayingRepeatStatus(_ client: @escaping (MusicPlayerWantsPlayingRepeatStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(4114), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTTPRequestCompleted_t` callback
    func onHTTPRequestCompleted(_ client: @escaping (HTTPRequestCompleted) -> Void) {
        callbacks.add(callbackID: CallbackID(2101), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTTPRequestHeadersReceived_t` callback
    func onHTTPRequestHeadersReceived(_ client: @escaping (HTTPRequestHeadersReceived) -> Void) {
        callbacks.add(callbackID: CallbackID(2102), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTTPRequestDataReceived_t` callback
    func onHTTPRequestDataReceived(_ client: @escaping (HTTPRequestDataReceived) -> Void) {
        callbacks.add(callbackID: CallbackID(2103), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInputDeviceConnected_t` callback
    func onSteamInputDeviceConnected(_ client: @escaping (SteamInputDeviceConnected) -> Void) {
        callbacks.add(callbackID: CallbackID(2801), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInputDeviceDisconnected_t` callback
    func onSteamInputDeviceDisconnected(_ client: @escaping (SteamInputDeviceDisconnected) -> Void) {
        callbacks.add(callbackID: CallbackID(2802), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInputConfigurationLoaded_t` callback
    func onSteamInputConfigurationLoaded(_ client: @escaping (SteamInputConfigurationLoaded) -> Void) {
        callbacks.add(callbackID: CallbackID(2803), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ItemInstalled_t` callback
    func onItemInstalled(_ client: @escaping (ItemInstalled) -> Void) {
        callbacks.add(callbackID: CallbackID(3405), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `DownloadItemResult_t` callback
    func onDownloadItemResult(_ client: @escaping (DownloadItemResult) -> Void) {
        callbacks.add(callbackID: CallbackID(3406), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserSubscribedItemsListChanged_t` callback
    func onUserSubscribedItemsListChanged(_ client: @escaping (UserSubscribedItemsListChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(3418), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamAppInstalled_t` callback
    func onSteamAppInstalled(_ client: @escaping (SteamAppInstalled) -> Void) {
        callbacks.add(callbackID: CallbackID(3901), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamAppUninstalled_t` callback
    func onSteamAppUninstalled(_ client: @escaping (SteamAppUninstalled) -> Void) {
        callbacks.add(callbackID: CallbackID(3902), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_NeedsPaint_t` callback
    func onHTMLNeedsPaint(_ client: @escaping (HTMLNeedsPaint) -> Void) {
        callbacks.add(callbackID: CallbackID(4502), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_StartRequest_t` callback
    func onHTMLStartRequest(_ client: @escaping (HTMLStartRequest) -> Void) {
        callbacks.add(callbackID: CallbackID(4503), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_CloseBrowser_t` callback
    func onHTMLCloseBrowser(_ client: @escaping (HTMLCloseBrowser) -> Void) {
        callbacks.add(callbackID: CallbackID(4504), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_URLChanged_t` callback
    func onHTMLURLChanged(_ client: @escaping (HTMLURLChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(4505), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_FinishedRequest_t` callback
    func onHTMLFinishedRequest(_ client: @escaping (HTMLFinishedRequest) -> Void) {
        callbacks.add(callbackID: CallbackID(4506), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_OpenLinkInNewTab_t` callback
    func onHTMLOpenLinkInNewTab(_ client: @escaping (HTMLOpenLinkInNewTab) -> Void) {
        callbacks.add(callbackID: CallbackID(4507), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_ChangedTitle_t` callback
    func onHTMLChangedTitle(_ client: @escaping (HTMLChangedTitle) -> Void) {
        callbacks.add(callbackID: CallbackID(4508), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_SearchResults_t` callback
    func onHTMLSearchResults(_ client: @escaping (HTMLSearchResults) -> Void) {
        callbacks.add(callbackID: CallbackID(4509), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_CanGoBackAndForward_t` callback
    func onHTMLCanGoBackAndForward(_ client: @escaping (HTMLCanGoBackAndForward) -> Void) {
        callbacks.add(callbackID: CallbackID(4510), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_HorizontalScroll_t` callback
    func onHTMLHorizontalScroll(_ client: @escaping (HTMLHorizontalScroll) -> Void) {
        callbacks.add(callbackID: CallbackID(4511), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_VerticalScroll_t` callback
    func onHTMLVerticalScroll(_ client: @escaping (HTMLVerticalScroll) -> Void) {
        callbacks.add(callbackID: CallbackID(4512), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_LinkAtPosition_t` callback
    func onHTMLLinkAtPosition(_ client: @escaping (HTMLLinkAtPosition) -> Void) {
        callbacks.add(callbackID: CallbackID(4513), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_JSAlert_t` callback
    func onHTMLJSAlert(_ client: @escaping (HTMLJSAlert) -> Void) {
        callbacks.add(callbackID: CallbackID(4514), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_JSConfirm_t` callback
    func onHTMLJSConfirm(_ client: @escaping (HTMLJSConfirm) -> Void) {
        callbacks.add(callbackID: CallbackID(4515), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_FileOpenDialog_t` callback
    func onHTMLFileOpenDialog(_ client: @escaping (HTMLFileOpenDialog) -> Void) {
        callbacks.add(callbackID: CallbackID(4516), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_NewWindow_t` callback
    func onHTMLNewWindow(_ client: @escaping (HTMLNewWindow) -> Void) {
        callbacks.add(callbackID: CallbackID(4521), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_SetCursor_t` callback
    func onHTMLSetCursor(_ client: @escaping (HTMLSetCursor) -> Void) {
        callbacks.add(callbackID: CallbackID(4522), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_StatusText_t` callback
    func onHTMLStatusText(_ client: @escaping (HTMLStatusText) -> Void) {
        callbacks.add(callbackID: CallbackID(4523), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_ShowToolTip_t` callback
    func onHTMLShowToolTip(_ client: @escaping (HTMLShowToolTip) -> Void) {
        callbacks.add(callbackID: CallbackID(4524), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_UpdateToolTip_t` callback
    func onHTMLUpdateToolTip(_ client: @escaping (HTMLUpdateToolTip) -> Void) {
        callbacks.add(callbackID: CallbackID(4525), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_HideToolTip_t` callback
    func onHTMLHideToolTip(_ client: @escaping (HTMLHideToolTip) -> Void) {
        callbacks.add(callbackID: CallbackID(4526), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_BrowserRestarted_t` callback
    func onHTMLBrowserRestarted(_ client: @escaping (HTMLBrowserRestarted) -> Void) {
        callbacks.add(callbackID: CallbackID(4527), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInventoryResultReady_t` callback
    func onSteamInventoryResultReady(_ client: @escaping (SteamInventoryResultReady) -> Void) {
        callbacks.add(callbackID: CallbackID(4700), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInventoryFullUpdate_t` callback
    func onSteamInventoryFullUpdate(_ client: @escaping (SteamInventoryFullUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(4701), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInventoryDefinitionUpdate_t` callback
    func onSteamInventoryDefinitionUpdate(_ client: @escaping (SteamInventoryDefinitionUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(4702), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GetVideoURLResult_t` callback
    func onGetVideoURLResult(_ client: @escaping (GetVideoURLResult) -> Void) {
        callbacks.add(callbackID: CallbackID(4611), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GetOPFSettingsResult_t` callback
    func onGetOPFSettingsResult(_ client: @escaping (GetOPFSettingsResult) -> Void) {
        callbacks.add(callbackID: CallbackID(4624), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamParentalSettingsChanged_t` callback
    func onSteamParentalSettingsChanged(_ client: @escaping (SteamParentalSettingsChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(5001), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamRemotePlaySessionConnected_t` callback
    func onSteamRemotePlaySessionConnected(_ client: @escaping (SteamRemotePlaySessionConnected) -> Void) {
        callbacks.add(callbackID: CallbackID(5701), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamRemotePlaySessionDisconnected_t` callback
    func onSteamRemotePlaySessionDisconnected(_ client: @escaping (SteamRemotePlaySessionDisconnected) -> Void) {
        callbacks.add(callbackID: CallbackID(5702), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetworkingMessagesSessionRequest_t` callback
    func onSteamNetworkingMessagesSessionRequest(_ client: @escaping (SteamNetworkingMessagesSessionRequest) -> Void) {
        callbacks.add(callbackID: CallbackID(1251), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetworkingMessagesSessionFailed_t` callback
    func onSteamNetworkingMessagesSessionFailed(_ client: @escaping (SteamNetworkingMessagesSessionFailed) -> Void) {
        callbacks.add(callbackID: CallbackID(1252), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetConnectionStatusChangedCallback_t` callback
    func onSteamNetConnectionStatusChangedCallback(_ client: @escaping (SteamNetConnectionStatusChangedCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(1221), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetAuthenticationStatus_t` callback
    func onSteamNetAuthenticationStatus(_ client: @escaping (SteamNetAuthenticationStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(1222), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamRelayNetworkStatus_t` callback
    func onSteamRelayNetworkStatus(_ client: @escaping (SteamRelayNetworkStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(1281), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientApprove_t` callback
    func onGSClientApprove(_ client: @escaping (GSClientApprove) -> Void) {
        callbacks.add(callbackID: CallbackID(201), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientDeny_t` callback
    func onGSClientDeny(_ client: @escaping (GSClientDeny) -> Void) {
        callbacks.add(callbackID: CallbackID(202), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientKick_t` callback
    func onGSClientKick(_ client: @escaping (GSClientKick) -> Void) {
        callbacks.add(callbackID: CallbackID(203), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientAchievementStatus_t` callback
    func onGSClientAchievementStatus(_ client: @escaping (GSClientAchievementStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(206), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSPolicyResponse_t` callback
    func onGSPolicyResponse(_ client: @escaping (GSPolicyResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(115), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSGameplayStats_t` callback
    func onGSGameplayStats(_ client: @escaping (GSGameplayStats) -> Void) {
        callbacks.add(callbackID: CallbackID(207), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientGroupStatus_t` callback
    func onGSClientGroupStatus(_ client: @escaping (GSClientGroupStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(208), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSStatsUnloaded_t` callback
    func onGSStatsUnloaded(_ client: @escaping (GSStatsUnloaded) -> Void) {
        callbacks.add(callbackID: CallbackID(1108), rawClient: SteamBaseAPI.makeRaw(client))
    }
}

public extension SteamBaseAPI {
    // MARK: AsyncStream callback registration
    /// Async stream of Steamworks `SteamServersConnected_t` callbacks
    var steamServersConnected: AsyncStream<SteamServersConnected> {
        AsyncStream { continuation in
            onSteamServersConnected { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamServerConnectFailure_t` callbacks
    var steamServerConnectFailure: AsyncStream<SteamServerConnectFailure> {
        AsyncStream { continuation in
            onSteamServerConnectFailure { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamServersDisconnected_t` callbacks
    var steamServersDisconnected: AsyncStream<SteamServersDisconnected> {
        AsyncStream { continuation in
            onSteamServersDisconnected { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `ClientGameServerDeny_t` callbacks
    var clientGameServerDeny: AsyncStream<ClientGameServerDeny> {
        AsyncStream { continuation in
            onClientGameServerDeny { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `IPCFailure_t` callbacks
    var ipcFailure: AsyncStream<IPCFailure> {
        AsyncStream { continuation in
            onIPCFailure { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `LicensesUpdated_t` callbacks
    var licensesUpdated: AsyncStream<LicensesUpdated> {
        AsyncStream { continuation in
            onLicensesUpdated { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `ValidateAuthTicketResponse_t` callbacks
    var validateAuthTicketResponse: AsyncStream<ValidateAuthTicketResponse> {
        AsyncStream { continuation in
            onValidateAuthTicketResponse { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MicroTxnAuthorizationResponse_t` callbacks
    var microTxnAuthorizationResponse: AsyncStream<MicroTxnAuthorizationResponse> {
        AsyncStream { continuation in
            onMicroTxnAuthorizationResponse { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GetAuthSessionTicketResponse_t` callbacks
    var getAuthSessionTicketResponse: AsyncStream<GetAuthSessionTicketResponse> {
        AsyncStream { continuation in
            onGetAuthSessionTicketResponse { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameWebCallback_t` callbacks
    var gameWebCallback: AsyncStream<GameWebCallback> {
        AsyncStream { continuation in
            onGameWebCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `PersonaStateChange_t` callbacks
    var personaStateChange: AsyncStream<PersonaStateChange> {
        AsyncStream { continuation in
            onPersonaStateChange { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameOverlayActivated_t` callbacks
    var gameOverlayActivated: AsyncStream<GameOverlayActivated> {
        AsyncStream { continuation in
            onGameOverlayActivated { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameServerChangeRequested_t` callbacks
    var gameServerChangeRequested: AsyncStream<GameServerChangeRequested> {
        AsyncStream { continuation in
            onGameServerChangeRequested { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameLobbyJoinRequested_t` callbacks
    var gameLobbyJoinRequested: AsyncStream<GameLobbyJoinRequested> {
        AsyncStream { continuation in
            onGameLobbyJoinRequested { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `AvatarImageLoaded_t` callbacks
    var avatarImageLoaded: AsyncStream<AvatarImageLoaded> {
        AsyncStream { continuation in
            onAvatarImageLoaded { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `FriendRichPresenceUpdate_t` callbacks
    var friendRichPresenceUpdate: AsyncStream<FriendRichPresenceUpdate> {
        AsyncStream { continuation in
            onFriendRichPresenceUpdate { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameRichPresenceJoinRequested_t` callbacks
    var gameRichPresenceJoinRequested: AsyncStream<GameRichPresenceJoinRequested> {
        AsyncStream { continuation in
            onGameRichPresenceJoinRequested { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameConnectedClanChatMsg_t` callbacks
    var gameConnectedClanChatMsg: AsyncStream<GameConnectedClanChatMsg> {
        AsyncStream { continuation in
            onGameConnectedClanChatMsg { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameConnectedChatJoin_t` callbacks
    var gameConnectedChatJoin: AsyncStream<GameConnectedChatJoin> {
        AsyncStream { continuation in
            onGameConnectedChatJoin { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameConnectedChatLeave_t` callbacks
    var gameConnectedChatLeave: AsyncStream<GameConnectedChatLeave> {
        AsyncStream { continuation in
            onGameConnectedChatLeave { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GameConnectedFriendChatMsg_t` callbacks
    var gameConnectedFriendChatMsg: AsyncStream<GameConnectedFriendChatMsg> {
        AsyncStream { continuation in
            onGameConnectedFriendChatMsg { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `UnreadChatMessagesChanged_t` callbacks
    var unreadChatMessagesChanged: AsyncStream<UnreadChatMessagesChanged> {
        AsyncStream { continuation in
            onUnreadChatMessagesChanged { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `OverlayBrowserProtocolNavigation_t` callbacks
    var overlayBrowserProtocolNavigation: AsyncStream<OverlayBrowserProtocolNavigation> {
        AsyncStream { continuation in
            onOverlayBrowserProtocolNavigation { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `IPCountry_t` callbacks
    var ipCountry: AsyncStream<IPCountry> {
        AsyncStream { continuation in
            onIPCountry { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `LowBatteryPower_t` callbacks
    var lowBatteryPower: AsyncStream<LowBatteryPower> {
        AsyncStream { continuation in
            onLowBatteryPower { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamAPICallCompleted_t` callbacks
    var steamAPICallCompleted: AsyncStream<SteamAPICallCompleted> {
        AsyncStream { continuation in
            onSteamAPICallCompleted { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamShutdown_t` callbacks
    var steamShutdown: AsyncStream<SteamShutdown> {
        AsyncStream { continuation in
            onSteamShutdown { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GamepadTextInputDismissed_t` callbacks
    var gamepadTextInputDismissed: AsyncStream<GamepadTextInputDismissed> {
        AsyncStream { continuation in
            onGamepadTextInputDismissed { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `AppResumingFromSuspend_t` callbacks
    var appResumingFromSuspend: AsyncStream<AppResumingFromSuspend> {
        AsyncStream { continuation in
            onAppResumingFromSuspend { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `FloatingGamepadTextInputDismissed_t` callbacks
    var floatingGamepadTextInputDismissed: AsyncStream<FloatingGamepadTextInputDismissed> {
        AsyncStream { continuation in
            onFloatingGamepadTextInputDismissed { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `FavoritesListChanged_t` callbacks
    var favoritesListChanged: AsyncStream<FavoritesListChanged> {
        AsyncStream { continuation in
            onFavoritesListChanged { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `LobbyInvite_t` callbacks
    var lobbyInvite: AsyncStream<LobbyInvite> {
        AsyncStream { continuation in
            onLobbyInvite { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `LobbyDataUpdate_t` callbacks
    var lobbyDataUpdate: AsyncStream<LobbyDataUpdate> {
        AsyncStream { continuation in
            onLobbyDataUpdate { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `LobbyChatUpdate_t` callbacks
    var lobbyChatUpdate: AsyncStream<LobbyChatUpdate> {
        AsyncStream { continuation in
            onLobbyChatUpdate { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `LobbyChatMsg_t` callbacks
    var lobbyChatMsg: AsyncStream<LobbyChatMsg> {
        AsyncStream { continuation in
            onLobbyChatMsg { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `LobbyGameCreated_t` callbacks
    var lobbyGameCreated: AsyncStream<LobbyGameCreated> {
        AsyncStream { continuation in
            onLobbyGameCreated { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `LobbyKicked_t` callbacks
    var lobbyKicked: AsyncStream<LobbyKicked> {
        AsyncStream { continuation in
            onLobbyKicked { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `PSNGameBootInviteResult_t` callbacks
    var psnGameBootInviteResult: AsyncStream<PSNGameBootInviteResult> {
        AsyncStream { continuation in
            onPSNGameBootInviteResult { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `FavoritesListAccountsUpdated_t` callbacks
    var favoritesListAccountsUpdated: AsyncStream<FavoritesListAccountsUpdated> {
        AsyncStream { continuation in
            onFavoritesListAccountsUpdated { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SearchForGameProgressCallback_t` callbacks
    var searchForGameProgressCallback: AsyncStream<SearchForGameProgressCallback> {
        AsyncStream { continuation in
            onSearchForGameProgressCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SearchForGameResultCallback_t` callbacks
    var searchForGameResultCallback: AsyncStream<SearchForGameResultCallback> {
        AsyncStream { continuation in
            onSearchForGameResultCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RequestPlayersForGameProgressCallback_t` callbacks
    var requestPlayersForGameProgressCallback: AsyncStream<RequestPlayersForGameProgressCallback> {
        AsyncStream { continuation in
            onRequestPlayersForGameProgressCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RequestPlayersForGameResultCallback_t` callbacks
    var requestPlayersForGameResultCallback: AsyncStream<RequestPlayersForGameResultCallback> {
        AsyncStream { continuation in
            onRequestPlayersForGameResultCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RequestPlayersForGameFinalResultCallback_t` callbacks
    var requestPlayersForGameFinalResultCallback: AsyncStream<RequestPlayersForGameFinalResultCallback> {
        AsyncStream { continuation in
            onRequestPlayersForGameFinalResultCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SubmitPlayerResultResultCallback_t` callbacks
    var submitPlayerResultResultCallback: AsyncStream<SubmitPlayerResultResultCallback> {
        AsyncStream { continuation in
            onSubmitPlayerResultResultCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `EndGameResultCallback_t` callbacks
    var endGameResultCallback: AsyncStream<EndGameResultCallback> {
        AsyncStream { continuation in
            onEndGameResultCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `ReservationNotificationCallback_t` callbacks
    var reservationNotificationCallback: AsyncStream<ReservationNotificationCallback> {
        AsyncStream { continuation in
            onReservationNotificationCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `AvailableBeaconLocationsUpdated_t` callbacks
    var availableBeaconLocationsUpdated: AsyncStream<AvailableBeaconLocationsUpdated> {
        AsyncStream { continuation in
            onAvailableBeaconLocationsUpdated { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `ActiveBeaconsUpdated_t` callbacks
    var activeBeaconsUpdated: AsyncStream<ActiveBeaconsUpdated> {
        AsyncStream { continuation in
            onActiveBeaconsUpdated { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RemoteStoragePublishFileResult_t` callbacks
    var remoteStoragePublishFileResult: AsyncStream<RemoteStoragePublishFileResult> {
        AsyncStream { continuation in
            onRemoteStoragePublishFileResult { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RemoteStoragePublishedFileSubscribed_t` callbacks
    var remoteStoragePublishedFileSubscribed: AsyncStream<RemoteStoragePublishedFileSubscribed> {
        AsyncStream { continuation in
            onRemoteStoragePublishedFileSubscribed { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RemoteStoragePublishedFileUnsubscribed_t` callbacks
    var remoteStoragePublishedFileUnsubscribed: AsyncStream<RemoteStoragePublishedFileUnsubscribed> {
        AsyncStream { continuation in
            onRemoteStoragePublishedFileUnsubscribed { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RemoteStoragePublishedFileDeleted_t` callbacks
    var remoteStoragePublishedFileDeleted: AsyncStream<RemoteStoragePublishedFileDeleted> {
        AsyncStream { continuation in
            onRemoteStoragePublishedFileDeleted { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RemoteStorageUserVoteDetails_t` callbacks
    var remoteStorageUserVoteDetails: AsyncStream<RemoteStorageUserVoteDetails> {
        AsyncStream { continuation in
            onRemoteStorageUserVoteDetails { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RemoteStorageEnumerateUserSharedWorkshopFilesResult_t` callbacks
    var remoteStorageEnumerateUserSharedWorkshopFilesResult: AsyncStream<RemoteStorageEnumerateUserSharedWorkshopFilesResult> {
        AsyncStream { continuation in
            onRemoteStorageEnumerateUserSharedWorkshopFilesResult { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RemoteStoragePublishedFileUpdated_t` callbacks
    var remoteStoragePublishedFileUpdated: AsyncStream<RemoteStoragePublishedFileUpdated> {
        AsyncStream { continuation in
            onRemoteStoragePublishedFileUpdated { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RemoteStorageLocalFileChange_t` callbacks
    var remoteStorageLocalFileChange: AsyncStream<RemoteStorageLocalFileChange> {
        AsyncStream { continuation in
            onRemoteStorageLocalFileChange { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `UserStatsReceived_t` callbacks
    var userStatsReceived: AsyncStream<UserStatsReceived> {
        AsyncStream { continuation in
            onUserStatsReceived { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `UserStatsStored_t` callbacks
    var userStatsStored: AsyncStream<UserStatsStored> {
        AsyncStream { continuation in
            onUserStatsStored { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `UserAchievementStored_t` callbacks
    var userAchievementStored: AsyncStream<UserAchievementStored> {
        AsyncStream { continuation in
            onUserAchievementStored { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `UserStatsUnloaded_t` callbacks
    var userStatsUnloaded: AsyncStream<UserStatsUnloaded> {
        AsyncStream { continuation in
            onUserStatsUnloaded { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `UserAchievementIconFetched_t` callbacks
    var userAchievementIconFetched: AsyncStream<UserAchievementIconFetched> {
        AsyncStream { continuation in
            onUserAchievementIconFetched { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `PS3TrophiesInstalled_t` callbacks
    var ps3TrophiesInstalled: AsyncStream<PS3TrophiesInstalled> {
        AsyncStream { continuation in
            onPS3TrophiesInstalled { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `DlcInstalled_t` callbacks
    var dlcInstalled: AsyncStream<DlcInstalled> {
        AsyncStream { continuation in
            onDlcInstalled { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `RegisterActivationCodeResponse_t` callbacks
    var registerActivationCodeResponse: AsyncStream<RegisterActivationCodeResponse> {
        AsyncStream { continuation in
            onRegisterActivationCodeResponse { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `NewUrlLaunchParameters_t` callbacks
    var newUrlLaunchParameters: AsyncStream<NewUrlLaunchParameters> {
        AsyncStream { continuation in
            onNewUrlLaunchParameters { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `AppProofOfPurchaseKeyResponse_t` callbacks
    var appProofOfPurchaseKeyResponse: AsyncStream<AppProofOfPurchaseKeyResponse> {
        AsyncStream { continuation in
            onAppProofOfPurchaseKeyResponse { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `TimedTrialStatus_t` callbacks
    var timedTrialStatus: AsyncStream<TimedTrialStatus> {
        AsyncStream { continuation in
            onTimedTrialStatus { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `P2PSessionRequest_t` callbacks
    var p2PSessionRequest: AsyncStream<P2PSessionRequest> {
        AsyncStream { continuation in
            onP2PSessionRequest { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `P2PSessionConnectFail_t` callbacks
    var p2PSessionConnectFail: AsyncStream<P2PSessionConnectFail> {
        AsyncStream { continuation in
            onP2PSessionConnectFail { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SocketStatusCallback_t` callbacks
    var socketStatusCallback: AsyncStream<SocketStatusCallback> {
        AsyncStream { continuation in
            onSocketStatusCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `ScreenshotReady_t` callbacks
    var screenshotReady: AsyncStream<ScreenshotReady> {
        AsyncStream { continuation in
            onScreenshotReady { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `ScreenshotRequested_t` callbacks
    var screenshotRequested: AsyncStream<ScreenshotRequested> {
        AsyncStream { continuation in
            onScreenshotRequested { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `PlaybackStatusHasChanged_t` callbacks
    var playbackStatusHasChanged: AsyncStream<PlaybackStatusHasChanged> {
        AsyncStream { continuation in
            onPlaybackStatusHasChanged { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `VolumeHasChanged_t` callbacks
    var volumeHasChanged: AsyncStream<VolumeHasChanged> {
        AsyncStream { continuation in
            onVolumeHasChanged { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerRemoteWillActivate_t` callbacks
    var musicPlayerRemoteWillActivate: AsyncStream<MusicPlayerRemoteWillActivate> {
        AsyncStream { continuation in
            onMusicPlayerRemoteWillActivate { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerRemoteWillDeactivate_t` callbacks
    var musicPlayerRemoteWillDeactivate: AsyncStream<MusicPlayerRemoteWillDeactivate> {
        AsyncStream { continuation in
            onMusicPlayerRemoteWillDeactivate { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerRemoteToFront_t` callbacks
    var musicPlayerRemoteToFront: AsyncStream<MusicPlayerRemoteToFront> {
        AsyncStream { continuation in
            onMusicPlayerRemoteToFront { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWillQuit_t` callbacks
    var musicPlayerWillQuit: AsyncStream<MusicPlayerWillQuit> {
        AsyncStream { continuation in
            onMusicPlayerWillQuit { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPlay_t` callbacks
    var musicPlayerWantsPlay: AsyncStream<MusicPlayerWantsPlay> {
        AsyncStream { continuation in
            onMusicPlayerWantsPlay { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPause_t` callbacks
    var musicPlayerWantsPause: AsyncStream<MusicPlayerWantsPause> {
        AsyncStream { continuation in
            onMusicPlayerWantsPause { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPlayPrevious_t` callbacks
    var musicPlayerWantsPlayPrevious: AsyncStream<MusicPlayerWantsPlayPrevious> {
        AsyncStream { continuation in
            onMusicPlayerWantsPlayPrevious { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPlayNext_t` callbacks
    var musicPlayerWantsPlayNext: AsyncStream<MusicPlayerWantsPlayNext> {
        AsyncStream { continuation in
            onMusicPlayerWantsPlayNext { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWantsShuffled_t` callbacks
    var musicPlayerWantsShuffled: AsyncStream<MusicPlayerWantsShuffled> {
        AsyncStream { continuation in
            onMusicPlayerWantsShuffled { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWantsLooped_t` callbacks
    var musicPlayerWantsLooped: AsyncStream<MusicPlayerWantsLooped> {
        AsyncStream { continuation in
            onMusicPlayerWantsLooped { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWantsVolume_t` callbacks
    var musicPlayerWantsVolume: AsyncStream<MusicPlayerWantsVolume> {
        AsyncStream { continuation in
            onMusicPlayerWantsVolume { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerSelectsQueueEntry_t` callbacks
    var musicPlayerSelectsQueueEntry: AsyncStream<MusicPlayerSelectsQueueEntry> {
        AsyncStream { continuation in
            onMusicPlayerSelectsQueueEntry { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerSelectsPlaylistEntry_t` callbacks
    var musicPlayerSelectsPlaylistEntry: AsyncStream<MusicPlayerSelectsPlaylistEntry> {
        AsyncStream { continuation in
            onMusicPlayerSelectsPlaylistEntry { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPlayingRepeatStatus_t` callbacks
    var musicPlayerWantsPlayingRepeatStatus: AsyncStream<MusicPlayerWantsPlayingRepeatStatus> {
        AsyncStream { continuation in
            onMusicPlayerWantsPlayingRepeatStatus { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTTPRequestCompleted_t` callbacks
    var httpRequestCompleted: AsyncStream<HTTPRequestCompleted> {
        AsyncStream { continuation in
            onHTTPRequestCompleted { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTTPRequestHeadersReceived_t` callbacks
    var httpRequestHeadersReceived: AsyncStream<HTTPRequestHeadersReceived> {
        AsyncStream { continuation in
            onHTTPRequestHeadersReceived { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTTPRequestDataReceived_t` callbacks
    var httpRequestDataReceived: AsyncStream<HTTPRequestDataReceived> {
        AsyncStream { continuation in
            onHTTPRequestDataReceived { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamInputDeviceConnected_t` callbacks
    var steamInputDeviceConnected: AsyncStream<SteamInputDeviceConnected> {
        AsyncStream { continuation in
            onSteamInputDeviceConnected { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamInputDeviceDisconnected_t` callbacks
    var steamInputDeviceDisconnected: AsyncStream<SteamInputDeviceDisconnected> {
        AsyncStream { continuation in
            onSteamInputDeviceDisconnected { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamInputConfigurationLoaded_t` callbacks
    var steamInputConfigurationLoaded: AsyncStream<SteamInputConfigurationLoaded> {
        AsyncStream { continuation in
            onSteamInputConfigurationLoaded { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `ItemInstalled_t` callbacks
    var itemInstalled: AsyncStream<ItemInstalled> {
        AsyncStream { continuation in
            onItemInstalled { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `DownloadItemResult_t` callbacks
    var downloadItemResult: AsyncStream<DownloadItemResult> {
        AsyncStream { continuation in
            onDownloadItemResult { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `UserSubscribedItemsListChanged_t` callbacks
    var userSubscribedItemsListChanged: AsyncStream<UserSubscribedItemsListChanged> {
        AsyncStream { continuation in
            onUserSubscribedItemsListChanged { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamAppInstalled_t` callbacks
    var steamAppInstalled: AsyncStream<SteamAppInstalled> {
        AsyncStream { continuation in
            onSteamAppInstalled { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamAppUninstalled_t` callbacks
    var steamAppUninstalled: AsyncStream<SteamAppUninstalled> {
        AsyncStream { continuation in
            onSteamAppUninstalled { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_NeedsPaint_t` callbacks
    var htmlNeedsPaint: AsyncStream<HTMLNeedsPaint> {
        AsyncStream { continuation in
            onHTMLNeedsPaint { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_StartRequest_t` callbacks
    var htmlStartRequest: AsyncStream<HTMLStartRequest> {
        AsyncStream { continuation in
            onHTMLStartRequest { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_CloseBrowser_t` callbacks
    var htmlCloseBrowser: AsyncStream<HTMLCloseBrowser> {
        AsyncStream { continuation in
            onHTMLCloseBrowser { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_URLChanged_t` callbacks
    var htmlurlChanged: AsyncStream<HTMLURLChanged> {
        AsyncStream { continuation in
            onHTMLURLChanged { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_FinishedRequest_t` callbacks
    var htmlFinishedRequest: AsyncStream<HTMLFinishedRequest> {
        AsyncStream { continuation in
            onHTMLFinishedRequest { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_OpenLinkInNewTab_t` callbacks
    var htmlOpenLinkInNewTab: AsyncStream<HTMLOpenLinkInNewTab> {
        AsyncStream { continuation in
            onHTMLOpenLinkInNewTab { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_ChangedTitle_t` callbacks
    var htmlChangedTitle: AsyncStream<HTMLChangedTitle> {
        AsyncStream { continuation in
            onHTMLChangedTitle { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_SearchResults_t` callbacks
    var htmlSearchResults: AsyncStream<HTMLSearchResults> {
        AsyncStream { continuation in
            onHTMLSearchResults { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_CanGoBackAndForward_t` callbacks
    var htmlCanGoBackAndForward: AsyncStream<HTMLCanGoBackAndForward> {
        AsyncStream { continuation in
            onHTMLCanGoBackAndForward { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_HorizontalScroll_t` callbacks
    var htmlHorizontalScroll: AsyncStream<HTMLHorizontalScroll> {
        AsyncStream { continuation in
            onHTMLHorizontalScroll { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_VerticalScroll_t` callbacks
    var htmlVerticalScroll: AsyncStream<HTMLVerticalScroll> {
        AsyncStream { continuation in
            onHTMLVerticalScroll { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_LinkAtPosition_t` callbacks
    var htmlLinkAtPosition: AsyncStream<HTMLLinkAtPosition> {
        AsyncStream { continuation in
            onHTMLLinkAtPosition { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_JSAlert_t` callbacks
    var htmljsAlert: AsyncStream<HTMLJSAlert> {
        AsyncStream { continuation in
            onHTMLJSAlert { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_JSConfirm_t` callbacks
    var htmljsConfirm: AsyncStream<HTMLJSConfirm> {
        AsyncStream { continuation in
            onHTMLJSConfirm { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_FileOpenDialog_t` callbacks
    var htmlFileOpenDialog: AsyncStream<HTMLFileOpenDialog> {
        AsyncStream { continuation in
            onHTMLFileOpenDialog { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_NewWindow_t` callbacks
    var htmlNewWindow: AsyncStream<HTMLNewWindow> {
        AsyncStream { continuation in
            onHTMLNewWindow { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_SetCursor_t` callbacks
    var htmlSetCursor: AsyncStream<HTMLSetCursor> {
        AsyncStream { continuation in
            onHTMLSetCursor { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_StatusText_t` callbacks
    var htmlStatusText: AsyncStream<HTMLStatusText> {
        AsyncStream { continuation in
            onHTMLStatusText { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_ShowToolTip_t` callbacks
    var htmlShowToolTip: AsyncStream<HTMLShowToolTip> {
        AsyncStream { continuation in
            onHTMLShowToolTip { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_UpdateToolTip_t` callbacks
    var htmlUpdateToolTip: AsyncStream<HTMLUpdateToolTip> {
        AsyncStream { continuation in
            onHTMLUpdateToolTip { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_HideToolTip_t` callbacks
    var htmlHideToolTip: AsyncStream<HTMLHideToolTip> {
        AsyncStream { continuation in
            onHTMLHideToolTip { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `HTML_BrowserRestarted_t` callbacks
    var htmlBrowserRestarted: AsyncStream<HTMLBrowserRestarted> {
        AsyncStream { continuation in
            onHTMLBrowserRestarted { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamInventoryResultReady_t` callbacks
    var steamInventoryResultReady: AsyncStream<SteamInventoryResultReady> {
        AsyncStream { continuation in
            onSteamInventoryResultReady { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamInventoryFullUpdate_t` callbacks
    var steamInventoryFullUpdate: AsyncStream<SteamInventoryFullUpdate> {
        AsyncStream { continuation in
            onSteamInventoryFullUpdate { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamInventoryDefinitionUpdate_t` callbacks
    var steamInventoryDefinitionUpdate: AsyncStream<SteamInventoryDefinitionUpdate> {
        AsyncStream { continuation in
            onSteamInventoryDefinitionUpdate { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GetVideoURLResult_t` callbacks
    var getVideoURLResult: AsyncStream<GetVideoURLResult> {
        AsyncStream { continuation in
            onGetVideoURLResult { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GetOPFSettingsResult_t` callbacks
    var getOPFSettingsResult: AsyncStream<GetOPFSettingsResult> {
        AsyncStream { continuation in
            onGetOPFSettingsResult { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamParentalSettingsChanged_t` callbacks
    var steamParentalSettingsChanged: AsyncStream<SteamParentalSettingsChanged> {
        AsyncStream { continuation in
            onSteamParentalSettingsChanged { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamRemotePlaySessionConnected_t` callbacks
    var steamRemotePlaySessionConnected: AsyncStream<SteamRemotePlaySessionConnected> {
        AsyncStream { continuation in
            onSteamRemotePlaySessionConnected { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamRemotePlaySessionDisconnected_t` callbacks
    var steamRemotePlaySessionDisconnected: AsyncStream<SteamRemotePlaySessionDisconnected> {
        AsyncStream { continuation in
            onSteamRemotePlaySessionDisconnected { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamNetworkingMessagesSessionRequest_t` callbacks
    var steamNetworkingMessagesSessionRequest: AsyncStream<SteamNetworkingMessagesSessionRequest> {
        AsyncStream { continuation in
            onSteamNetworkingMessagesSessionRequest { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamNetworkingMessagesSessionFailed_t` callbacks
    var steamNetworkingMessagesSessionFailed: AsyncStream<SteamNetworkingMessagesSessionFailed> {
        AsyncStream { continuation in
            onSteamNetworkingMessagesSessionFailed { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamNetConnectionStatusChangedCallback_t` callbacks
    var steamNetConnectionStatusChangedCallback: AsyncStream<SteamNetConnectionStatusChangedCallback> {
        AsyncStream { continuation in
            onSteamNetConnectionStatusChangedCallback { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamNetAuthenticationStatus_t` callbacks
    var steamNetAuthenticationStatus: AsyncStream<SteamNetAuthenticationStatus> {
        AsyncStream { continuation in
            onSteamNetAuthenticationStatus { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `SteamRelayNetworkStatus_t` callbacks
    var steamRelayNetworkStatus: AsyncStream<SteamRelayNetworkStatus> {
        AsyncStream { continuation in
            onSteamRelayNetworkStatus { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GSClientApprove_t` callbacks
    var gsClientApprove: AsyncStream<GSClientApprove> {
        AsyncStream { continuation in
            onGSClientApprove { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GSClientDeny_t` callbacks
    var gsClientDeny: AsyncStream<GSClientDeny> {
        AsyncStream { continuation in
            onGSClientDeny { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GSClientKick_t` callbacks
    var gsClientKick: AsyncStream<GSClientKick> {
        AsyncStream { continuation in
            onGSClientKick { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GSClientAchievementStatus_t` callbacks
    var gsClientAchievementStatus: AsyncStream<GSClientAchievementStatus> {
        AsyncStream { continuation in
            onGSClientAchievementStatus { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GSPolicyResponse_t` callbacks
    var gsPolicyResponse: AsyncStream<GSPolicyResponse> {
        AsyncStream { continuation in
            onGSPolicyResponse { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GSGameplayStats_t` callbacks
    var gsGameplayStats: AsyncStream<GSGameplayStats> {
        AsyncStream { continuation in
            onGSGameplayStats { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GSClientGroupStatus_t` callbacks
    var gsClientGroupStatus: AsyncStream<GSClientGroupStatus> {
        AsyncStream { continuation in
            onGSClientGroupStatus { continuation.yield($0) }
        }
    }

    /// Async stream of Steamworks `GSStatsUnloaded_t` callbacks
    var gsStatsUnloaded: AsyncStream<GSStatsUnloaded> {
        AsyncStream { continuation in
            onGSStatsUnloaded { continuation.yield($0) }
        }
    }
}
