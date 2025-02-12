//
//  SteamBaseAPI+Callbacks.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

internal import CSteamworks

public extension SteamBaseAPI {
    // MARK: Callbacks

    /// Registration for Steamworks `ActiveBeaconsUpdated_t` callback
    func onActiveBeaconsUpdated(_ client: @Sendable @escaping (sending ActiveBeaconsUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(5306), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `AppProofOfPurchaseKeyResponse_t` callback
    func onAppProofOfPurchaseKeyResponse(_ client: @Sendable @escaping (sending AppProofOfPurchaseKeyResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(1021), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `AppResumingFromSuspend_t` callback
    func onAppResumingFromSuspend(_ client: @Sendable @escaping (sending AppResumingFromSuspend) -> Void) {
        callbacks.add(callbackID: CallbackID(736), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `AvailableBeaconLocationsUpdated_t` callback
    func onAvailableBeaconLocationsUpdated(_ client: @Sendable @escaping (sending AvailableBeaconLocationsUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(5305), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `AvatarImageLoaded_t` callback
    func onAvatarImageLoaded(_ client: @Sendable @escaping (sending AvatarImageLoaded) -> Void) {
        callbacks.add(callbackID: CallbackID(334), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `BroadcastUploadStart_t` callback
    func onBroadcastUploadStart(_ client: @Sendable @escaping (sending BroadcastUploadStart) -> Void) {
        callbacks.add(callbackID: CallbackID(4604), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `BroadcastUploadStop_t` callback
    func onBroadcastUploadStop(_ client: @Sendable @escaping (sending BroadcastUploadStop) -> Void) {
        callbacks.add(callbackID: CallbackID(4605), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ClientGameServerDeny_t` callback
    func onClientGameServerDeny(_ client: @Sendable @escaping (sending ClientGameServerDeny) -> Void) {
        callbacks.add(callbackID: CallbackID(113), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `DlcInstalled_t` callback
    func onDlcInstalled(_ client: @Sendable @escaping (sending DlcInstalled) -> Void) {
        callbacks.add(callbackID: CallbackID(1005), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `DownloadItemResult_t` callback
    func onDownloadItemResult(_ client: @Sendable @escaping (sending DownloadItemResult) -> Void) {
        callbacks.add(callbackID: CallbackID(3406), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `DurationControl_t` callback
    func onDurationControl(_ client: @Sendable @escaping (sending DurationControl) -> Void) {
        callbacks.add(callbackID: CallbackID(167), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `EndGameResultCallback_t` callback
    func onEndGameResultCallback(_ client: @Sendable @escaping (sending EndGameResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5215), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `EquippedProfileItemsChanged_t` callback
    func onEquippedProfileItemsChanged(_ client: @Sendable @escaping (sending EquippedProfileItemsChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(350), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FavoritesListAccountsUpdated_t` callback
    func onFavoritesListAccountsUpdated(_ client: @Sendable @escaping (sending FavoritesListAccountsUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(516), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FavoritesListChanged_t` callback
    func onFavoritesListChanged(_ client: @Sendable @escaping (sending FavoritesListChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(502), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FilterTextDictionaryChanged_t` callback
    func onFilterTextDictionaryChanged(_ client: @Sendable @escaping (sending FilterTextDictionaryChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(739), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FloatingGamepadTextInputDismissed_t` callback
    func onFloatingGamepadTextInputDismissed(_ client: @Sendable @escaping (sending FloatingGamepadTextInputDismissed) -> Void) {
        callbacks.add(callbackID: CallbackID(738), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `FriendRichPresenceUpdate_t` callback
    func onFriendRichPresenceUpdate(_ client: @Sendable @escaping (sending FriendRichPresenceUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(336), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientAchievementStatus_t` callback
    func onGSClientAchievementStatus(_ client: @Sendable @escaping (sending GSClientAchievementStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(206), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientApprove_t` callback
    func onGSClientApprove(_ client: @Sendable @escaping (sending GSClientApprove) -> Void) {
        callbacks.add(callbackID: CallbackID(201), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientDeny_t` callback
    func onGSClientDeny(_ client: @Sendable @escaping (sending GSClientDeny) -> Void) {
        callbacks.add(callbackID: CallbackID(202), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientGroupStatus_t` callback
    func onGSClientGroupStatus(_ client: @Sendable @escaping (sending GSClientGroupStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(208), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSClientKick_t` callback
    func onGSClientKick(_ client: @Sendable @escaping (sending GSClientKick) -> Void) {
        callbacks.add(callbackID: CallbackID(203), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSGameplayStats_t` callback
    func onGSGameplayStats(_ client: @Sendable @escaping (sending GSGameplayStats) -> Void) {
        callbacks.add(callbackID: CallbackID(207), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSPolicyResponse_t` callback
    func onGSPolicyResponse(_ client: @Sendable @escaping (sending GSPolicyResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(115), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GSStatsUnloaded_t` callback
    func onGSStatsUnloaded(_ client: @Sendable @escaping (sending GSStatsUnloaded) -> Void) {
        callbacks.add(callbackID: CallbackID(1108), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameConnectedChatJoin_t` callback
    func onGameConnectedChatJoin(_ client: @Sendable @escaping (sending GameConnectedChatJoin) -> Void) {
        callbacks.add(callbackID: CallbackID(339), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameConnectedChatLeave_t` callback
    func onGameConnectedChatLeave(_ client: @Sendable @escaping (sending GameConnectedChatLeave) -> Void) {
        callbacks.add(callbackID: CallbackID(340), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameConnectedClanChatMsg_t` callback
    func onGameConnectedClanChatMsg(_ client: @Sendable @escaping (sending GameConnectedClanChatMsg) -> Void) {
        callbacks.add(callbackID: CallbackID(338), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameConnectedFriendChatMsg_t` callback
    func onGameConnectedFriendChatMsg(_ client: @Sendable @escaping (sending GameConnectedFriendChatMsg) -> Void) {
        callbacks.add(callbackID: CallbackID(343), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameLobbyJoinRequested_t` callback
    func onGameLobbyJoinRequested(_ client: @Sendable @escaping (sending GameLobbyJoinRequested) -> Void) {
        callbacks.add(callbackID: CallbackID(333), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameOverlayActivated_t` callback
    func onGameOverlayActivated(_ client: @Sendable @escaping (sending GameOverlayActivated) -> Void) {
        callbacks.add(callbackID: CallbackID(331), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameRichPresenceJoinRequested_t` callback
    func onGameRichPresenceJoinRequested(_ client: @Sendable @escaping (sending GameRichPresenceJoinRequested) -> Void) {
        callbacks.add(callbackID: CallbackID(337), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameServerChangeRequested_t` callback
    func onGameServerChangeRequested(_ client: @Sendable @escaping (sending GameServerChangeRequested) -> Void) {
        callbacks.add(callbackID: CallbackID(332), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GameWebCallback_t` callback
    func onGameWebCallback(_ client: @Sendable @escaping (sending GameWebCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(164), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GamepadTextInputDismissed_t` callback
    func onGamepadTextInputDismissed(_ client: @Sendable @escaping (sending GamepadTextInputDismissed) -> Void) {
        callbacks.add(callbackID: CallbackID(714), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GetAuthSessionTicketResponse_t` callback
    func onGetAuthSessionTicketResponse(_ client: @Sendable @escaping (sending GetAuthSessionTicketResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(163), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GetOPFSettingsResult_t` callback
    func onGetOPFSettingsResult(_ client: @Sendable @escaping (sending GetOPFSettingsResult) -> Void) {
        callbacks.add(callbackID: CallbackID(4624), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GetTicketForWebApiResponse_t` callback
    func onGetTicketForWebApiResponse(_ client: @Sendable @escaping (sending GetTicketForWebApiResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(168), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `GetVideoURLResult_t` callback
    func onGetVideoURLResult(_ client: @Sendable @escaping (sending GetVideoURLResult) -> Void) {
        callbacks.add(callbackID: CallbackID(4611), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_BrowserRestarted_t` callback
    func onHTMLBrowserRestarted(_ client: @Sendable @escaping (sending HTMLBrowserRestarted) -> Void) {
        callbacks.add(callbackID: CallbackID(4527), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_CanGoBackAndForward_t` callback
    func onHTMLCanGoBackAndForward(_ client: @Sendable @escaping (sending HTMLCanGoBackAndForward) -> Void) {
        callbacks.add(callbackID: CallbackID(4510), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_ChangedTitle_t` callback
    func onHTMLChangedTitle(_ client: @Sendable @escaping (sending HTMLChangedTitle) -> Void) {
        callbacks.add(callbackID: CallbackID(4508), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_CloseBrowser_t` callback
    func onHTMLCloseBrowser(_ client: @Sendable @escaping (sending HTMLCloseBrowser) -> Void) {
        callbacks.add(callbackID: CallbackID(4504), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_FileOpenDialog_t` callback
    func onHTMLFileOpenDialog(_ client: @Sendable @escaping (sending HTMLFileOpenDialog) -> Void) {
        callbacks.add(callbackID: CallbackID(4516), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_FinishedRequest_t` callback
    func onHTMLFinishedRequest(_ client: @Sendable @escaping (sending HTMLFinishedRequest) -> Void) {
        callbacks.add(callbackID: CallbackID(4506), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_HideToolTip_t` callback
    func onHTMLHideToolTip(_ client: @Sendable @escaping (sending HTMLHideToolTip) -> Void) {
        callbacks.add(callbackID: CallbackID(4526), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_HorizontalScroll_t` callback
    func onHTMLHorizontalScroll(_ client: @Sendable @escaping (sending HTMLHorizontalScroll) -> Void) {
        callbacks.add(callbackID: CallbackID(4511), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_JSAlert_t` callback
    func onHTMLJSAlert(_ client: @Sendable @escaping (sending HTMLJSAlert) -> Void) {
        callbacks.add(callbackID: CallbackID(4514), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_JSConfirm_t` callback
    func onHTMLJSConfirm(_ client: @Sendable @escaping (sending HTMLJSConfirm) -> Void) {
        callbacks.add(callbackID: CallbackID(4515), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_LinkAtPosition_t` callback
    func onHTMLLinkAtPosition(_ client: @Sendable @escaping (sending HTMLLinkAtPosition) -> Void) {
        callbacks.add(callbackID: CallbackID(4513), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_NeedsPaint_t` callback
    func onHTMLNeedsPaint(_ client: @Sendable @escaping (sending HTMLNeedsPaint) -> Void) {
        callbacks.add(callbackID: CallbackID(4502), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_NewWindow_t` callback
    func onHTMLNewWindow(_ client: @Sendable @escaping (sending HTMLNewWindow) -> Void) {
        callbacks.add(callbackID: CallbackID(4521), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_OpenLinkInNewTab_t` callback
    func onHTMLOpenLinkInNewTab(_ client: @Sendable @escaping (sending HTMLOpenLinkInNewTab) -> Void) {
        callbacks.add(callbackID: CallbackID(4507), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_SearchResults_t` callback
    func onHTMLSearchResults(_ client: @Sendable @escaping (sending HTMLSearchResults) -> Void) {
        callbacks.add(callbackID: CallbackID(4509), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_SetCursor_t` callback
    func onHTMLSetCursor(_ client: @Sendable @escaping (sending HTMLSetCursor) -> Void) {
        callbacks.add(callbackID: CallbackID(4522), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_ShowToolTip_t` callback
    func onHTMLShowToolTip(_ client: @Sendable @escaping (sending HTMLShowToolTip) -> Void) {
        callbacks.add(callbackID: CallbackID(4524), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_StartRequest_t` callback
    func onHTMLStartRequest(_ client: @Sendable @escaping (sending HTMLStartRequest) -> Void) {
        callbacks.add(callbackID: CallbackID(4503), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_StatusText_t` callback
    func onHTMLStatusText(_ client: @Sendable @escaping (sending HTMLStatusText) -> Void) {
        callbacks.add(callbackID: CallbackID(4523), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_URLChanged_t` callback
    func onHTMLURLChanged(_ client: @Sendable @escaping (sending HTMLURLChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(4505), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_UpdateToolTip_t` callback
    func onHTMLUpdateToolTip(_ client: @Sendable @escaping (sending HTMLUpdateToolTip) -> Void) {
        callbacks.add(callbackID: CallbackID(4525), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTML_VerticalScroll_t` callback
    func onHTMLVerticalScroll(_ client: @Sendable @escaping (sending HTMLVerticalScroll) -> Void) {
        callbacks.add(callbackID: CallbackID(4512), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTTPRequestDataReceived_t` callback
    func onHTTPRequestDataReceived(_ client: @Sendable @escaping (sending HTTPRequestDataReceived) -> Void) {
        callbacks.add(callbackID: CallbackID(2103), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `HTTPRequestHeadersReceived_t` callback
    func onHTTPRequestHeadersReceived(_ client: @Sendable @escaping (sending HTTPRequestHeadersReceived) -> Void) {
        callbacks.add(callbackID: CallbackID(2102), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `IPCFailure_t` callback
    func onIPCFailure(_ client: @Sendable @escaping (sending IPCFailure) -> Void) {
        callbacks.add(callbackID: CallbackID(117), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `IPCountry_t` callback
    func onIPCountry(_ client: @Sendable @escaping (sending IPCountry) -> Void) {
        callbacks.add(callbackID: CallbackID(701), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ItemInstalled_t` callback
    func onItemInstalled(_ client: @Sendable @escaping (sending ItemInstalled) -> Void) {
        callbacks.add(callbackID: CallbackID(3405), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LicensesUpdated_t` callback
    func onLicensesUpdated(_ client: @Sendable @escaping (sending LicensesUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(125), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyChatMsg_t` callback
    func onLobbyChatMsg(_ client: @Sendable @escaping (sending LobbyChatMsg) -> Void) {
        callbacks.add(callbackID: CallbackID(507), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyChatUpdate_t` callback
    func onLobbyChatUpdate(_ client: @Sendable @escaping (sending LobbyChatUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(506), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyDataUpdate_t` callback
    func onLobbyDataUpdate(_ client: @Sendable @escaping (sending LobbyDataUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(505), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyEnter_t` callback
    func onLobbyEnter(_ client: @Sendable @escaping (sending LobbyEnter) -> Void) {
        callbacks.add(callbackID: CallbackID(504), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyGameCreated_t` callback
    func onLobbyGameCreated(_ client: @Sendable @escaping (sending LobbyGameCreated) -> Void) {
        callbacks.add(callbackID: CallbackID(509), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyInvite_t` callback
    func onLobbyInvite(_ client: @Sendable @escaping (sending LobbyInvite) -> Void) {
        callbacks.add(callbackID: CallbackID(503), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LobbyKicked_t` callback
    func onLobbyKicked(_ client: @Sendable @escaping (sending LobbyKicked) -> Void) {
        callbacks.add(callbackID: CallbackID(512), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `LowBatteryPower_t` callback
    func onLowBatteryPower(_ client: @Sendable @escaping (sending LowBatteryPower) -> Void) {
        callbacks.add(callbackID: CallbackID(702), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MicroTxnAuthorizationResponse_t` callback
    func onMicroTxnAuthorizationResponse(_ client: @Sendable @escaping (sending MicroTxnAuthorizationResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(152), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerRemoteToFront_t` callback
    func onMusicPlayerRemoteToFront(_ client: @Sendable @escaping (sending MusicPlayerRemoteToFront) -> Void) {
        callbacks.add(callbackID: CallbackID(4103), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerRemoteWillActivate_t` callback
    func onMusicPlayerRemoteWillActivate(_ client: @Sendable @escaping (sending MusicPlayerRemoteWillActivate) -> Void) {
        callbacks.add(callbackID: CallbackID(4101), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerRemoteWillDeactivate_t` callback
    func onMusicPlayerRemoteWillDeactivate(_ client: @Sendable @escaping (sending MusicPlayerRemoteWillDeactivate) -> Void) {
        callbacks.add(callbackID: CallbackID(4102), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerSelectsPlaylistEntry_t` callback
    func onMusicPlayerSelectsPlaylistEntry(_ client: @Sendable @escaping (sending MusicPlayerSelectsPlaylistEntry) -> Void) {
        callbacks.add(callbackID: CallbackID(4013), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerSelectsQueueEntry_t` callback
    func onMusicPlayerSelectsQueueEntry(_ client: @Sendable @escaping (sending MusicPlayerSelectsQueueEntry) -> Void) {
        callbacks.add(callbackID: CallbackID(4012), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsLooped_t` callback
    func onMusicPlayerWantsLooped(_ client: @Sendable @escaping (sending MusicPlayerWantsLooped) -> Void) {
        callbacks.add(callbackID: CallbackID(4110), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPause_t` callback
    func onMusicPlayerWantsPause(_ client: @Sendable @escaping (sending MusicPlayerWantsPause) -> Void) {
        callbacks.add(callbackID: CallbackID(4106), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPlayNext_t` callback
    func onMusicPlayerWantsPlayNext(_ client: @Sendable @escaping (sending MusicPlayerWantsPlayNext) -> Void) {
        callbacks.add(callbackID: CallbackID(4108), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPlayPrevious_t` callback
    func onMusicPlayerWantsPlayPrevious(_ client: @Sendable @escaping (sending MusicPlayerWantsPlayPrevious) -> Void) {
        callbacks.add(callbackID: CallbackID(4107), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPlay_t` callback
    func onMusicPlayerWantsPlay(_ client: @Sendable @escaping (sending MusicPlayerWantsPlay) -> Void) {
        callbacks.add(callbackID: CallbackID(4105), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsPlayingRepeatStatus_t` callback
    func onMusicPlayerWantsPlayingRepeatStatus(_ client: @Sendable @escaping (sending MusicPlayerWantsPlayingRepeatStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(4114), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsShuffled_t` callback
    func onMusicPlayerWantsShuffled(_ client: @Sendable @escaping (sending MusicPlayerWantsShuffled) -> Void) {
        callbacks.add(callbackID: CallbackID(4109), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWantsVolume_t` callback
    func onMusicPlayerWantsVolume(_ client: @Sendable @escaping (sending MusicPlayerWantsVolume) -> Void) {
        callbacks.add(callbackID: CallbackID(4011), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `MusicPlayerWillQuit_t` callback
    func onMusicPlayerWillQuit(_ client: @Sendable @escaping (sending MusicPlayerWillQuit) -> Void) {
        callbacks.add(callbackID: CallbackID(4104), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `NewUrlLaunchParameters_t` callback
    func onNewUrlLaunchParameters(_ client: @Sendable @escaping (sending NewUrlLaunchParameters) -> Void) {
        callbacks.add(callbackID: CallbackID(1014), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `OverlayBrowserProtocolNavigation_t` callback
    func onOverlayBrowserProtocolNavigation(_ client: @Sendable @escaping (sending OverlayBrowserProtocolNavigation) -> Void) {
        callbacks.add(callbackID: CallbackID(349), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `PS3TrophiesInstalled_t` callback
    func onPS3TrophiesInstalled(_ client: @Sendable @escaping (sending PS3TrophiesInstalled) -> Void) {
        callbacks.add(callbackID: CallbackID(1112), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `PSNGameBootInviteResult_t` callback
    func onPSNGameBootInviteResult(_ client: @Sendable @escaping (sending PSNGameBootInviteResult) -> Void) {
        callbacks.add(callbackID: CallbackID(515), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `PersonaStateChange_t` callback
    func onPersonaStateChange(_ client: @Sendable @escaping (sending PersonaStateChange) -> Void) {
        callbacks.add(callbackID: CallbackID(304), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `PlaybackStatusHasChanged_t` callback
    func onPlaybackStatusHasChanged(_ client: @Sendable @escaping (sending PlaybackStatusHasChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(4001), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStorageEnumerateUserSharedWorkshopFilesResult_t` callback
    func onRemoteStorageEnumerateUserSharedWorkshopFilesResult(_ client: @Sendable @escaping (sending RemoteStorageEnumerateUserSharedWorkshopFilesResult) -> Void) {
        callbacks.add(callbackID: CallbackID(1326), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStorageLocalFileChange_t` callback
    func onRemoteStorageLocalFileChange(_ client: @Sendable @escaping (sending RemoteStorageLocalFileChange) -> Void) {
        callbacks.add(callbackID: CallbackID(1333), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishFileResult_t` callback
    func onRemoteStoragePublishFileResult(_ client: @Sendable @escaping (sending RemoteStoragePublishFileResult) -> Void) {
        callbacks.add(callbackID: CallbackID(1309), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishedFileDeleted_t` callback
    func onRemoteStoragePublishedFileDeleted(_ client: @Sendable @escaping (sending RemoteStoragePublishedFileDeleted) -> Void) {
        callbacks.add(callbackID: CallbackID(1323), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishedFileSubscribed_t` callback
    func onRemoteStoragePublishedFileSubscribed(_ client: @Sendable @escaping (sending RemoteStoragePublishedFileSubscribed) -> Void) {
        callbacks.add(callbackID: CallbackID(1321), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishedFileUnsubscribed_t` callback
    func onRemoteStoragePublishedFileUnsubscribed(_ client: @Sendable @escaping (sending RemoteStoragePublishedFileUnsubscribed) -> Void) {
        callbacks.add(callbackID: CallbackID(1322), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStoragePublishedFileUpdated_t` callback
    func onRemoteStoragePublishedFileUpdated(_ client: @Sendable @escaping (sending RemoteStoragePublishedFileUpdated) -> Void) {
        callbacks.add(callbackID: CallbackID(1330), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RemoteStorageUserVoteDetails_t` callback
    func onRemoteStorageUserVoteDetails(_ client: @Sendable @escaping (sending RemoteStorageUserVoteDetails) -> Void) {
        callbacks.add(callbackID: CallbackID(1325), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RequestPlayersForGameFinalResultCallback_t` callback
    func onRequestPlayersForGameFinalResultCallback(_ client: @Sendable @escaping (sending RequestPlayersForGameFinalResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5213), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RequestPlayersForGameProgressCallback_t` callback
    func onRequestPlayersForGameProgressCallback(_ client: @Sendable @escaping (sending RequestPlayersForGameProgressCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5211), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `RequestPlayersForGameResultCallback_t` callback
    func onRequestPlayersForGameResultCallback(_ client: @Sendable @escaping (sending RequestPlayersForGameResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5212), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ReservationNotificationCallback_t` callback
    func onReservationNotificationCallback(_ client: @Sendable @escaping (sending ReservationNotificationCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5303), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ScreenshotReady_t` callback
    func onScreenshotReady(_ client: @Sendable @escaping (sending ScreenshotReady) -> Void) {
        callbacks.add(callbackID: CallbackID(2301), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ScreenshotRequested_t` callback
    func onScreenshotRequested(_ client: @Sendable @escaping (sending ScreenshotRequested) -> Void) {
        callbacks.add(callbackID: CallbackID(2302), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SearchForGameProgressCallback_t` callback
    func onSearchForGameProgressCallback(_ client: @Sendable @escaping (sending SearchForGameProgressCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5201), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SearchForGameResultCallback_t` callback
    func onSearchForGameResultCallback(_ client: @Sendable @escaping (sending SearchForGameResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5202), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamAPICallCompleted_t` callback
    func onSteamAPICallCompleted(_ client: @Sendable @escaping (sending SteamAPICallCompleted) -> Void) {
        callbacks.add(callbackID: CallbackID(703), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInputConfigurationLoaded_t` callback
    func onSteamInputConfigurationLoaded(_ client: @Sendable @escaping (sending SteamInputConfigurationLoaded) -> Void) {
        callbacks.add(callbackID: CallbackID(2803), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInputDeviceConnected_t` callback
    func onSteamInputDeviceConnected(_ client: @Sendable @escaping (sending SteamInputDeviceConnected) -> Void) {
        callbacks.add(callbackID: CallbackID(2801), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInputDeviceDisconnected_t` callback
    func onSteamInputDeviceDisconnected(_ client: @Sendable @escaping (sending SteamInputDeviceDisconnected) -> Void) {
        callbacks.add(callbackID: CallbackID(2802), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInputGamepadSlotChange_t` callback
    func onSteamInputGamepadSlotChange(_ client: @Sendable @escaping (sending SteamInputGamepadSlotChange) -> Void) {
        callbacks.add(callbackID: CallbackID(2804), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInventoryDefinitionUpdate_t` callback
    func onSteamInventoryDefinitionUpdate(_ client: @Sendable @escaping (sending SteamInventoryDefinitionUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(4702), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInventoryFullUpdate_t` callback
    func onSteamInventoryFullUpdate(_ client: @Sendable @escaping (sending SteamInventoryFullUpdate) -> Void) {
        callbacks.add(callbackID: CallbackID(4701), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamInventoryResultReady_t` callback
    func onSteamInventoryResultReady(_ client: @Sendable @escaping (sending SteamInventoryResultReady) -> Void) {
        callbacks.add(callbackID: CallbackID(4700), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetAuthenticationStatus_t` callback
    func onSteamNetAuthenticationStatus(_ client: @Sendable @escaping (sending SteamNetAuthenticationStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(1222), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetConnectionStatusChangedCallback_t` callback
    func onSteamNetConnectionStatusChangedCallback(_ client: @Sendable @escaping (sending SteamNetConnectionStatusChangedCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(1221), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetworkingFakeIPResult_t` callback
    func onSteamNetworkingFakeIPResult(_ client: @Sendable @escaping (sending SteamNetworkingFakeIPResult) -> Void) {
        callbacks.add(callbackID: CallbackID(1223), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetworkingMessagesSessionFailed_t` callback
    func onSteamNetworkingMessagesSessionFailed(_ client: @Sendable @escaping (sending SteamNetworkingMessagesSessionFailed) -> Void) {
        callbacks.add(callbackID: CallbackID(1252), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamNetworkingMessagesSessionRequest_t` callback
    func onSteamNetworkingMessagesSessionRequest(_ client: @Sendable @escaping (sending SteamNetworkingMessagesSessionRequest) -> Void) {
        callbacks.add(callbackID: CallbackID(1251), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamParentalSettingsChanged_t` callback
    func onSteamParentalSettingsChanged(_ client: @Sendable @escaping (sending SteamParentalSettingsChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(5001), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamRelayNetworkStatus_t` callback
    func onSteamRelayNetworkStatus(_ client: @Sendable @escaping (sending SteamRelayNetworkStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(1281), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamRemotePlaySessionConnected_t` callback
    func onSteamRemotePlaySessionConnected(_ client: @Sendable @escaping (sending SteamRemotePlaySessionConnected) -> Void) {
        callbacks.add(callbackID: CallbackID(5701), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamRemotePlaySessionDisconnected_t` callback
    func onSteamRemotePlaySessionDisconnected(_ client: @Sendable @escaping (sending SteamRemotePlaySessionDisconnected) -> Void) {
        callbacks.add(callbackID: CallbackID(5702), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamRemotePlayTogetherGuestInvite_t` callback
    func onSteamRemotePlayTogetherGuestInvite(_ client: @Sendable @escaping (sending SteamRemotePlayTogetherGuestInvite) -> Void) {
        callbacks.add(callbackID: CallbackID(5703), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamServerConnectFailure_t` callback
    func onSteamServerConnectFailure(_ client: @Sendable @escaping (sending SteamServerConnectFailure) -> Void) {
        callbacks.add(callbackID: CallbackID(102), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamServersConnected_t` callback
    func onSteamServersConnected(_ client: @Sendable @escaping (sending SteamServersConnected) -> Void) {
        callbacks.add(callbackID: CallbackID(101), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamServersDisconnected_t` callback
    func onSteamServersDisconnected(_ client: @Sendable @escaping (sending SteamServersDisconnected) -> Void) {
        callbacks.add(callbackID: CallbackID(103), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SteamShutdown_t` callback
    func onSteamShutdown(_ client: @Sendable @escaping (sending SteamShutdown) -> Void) {
        callbacks.add(callbackID: CallbackID(704), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `SubmitPlayerResultResultCallback_t` callback
    func onSubmitPlayerResultResultCallback(_ client: @Sendable @escaping (sending SubmitPlayerResultResultCallback) -> Void) {
        callbacks.add(callbackID: CallbackID(5214), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `TimedTrialStatus_t` callback
    func onTimedTrialStatus(_ client: @Sendable @escaping (sending TimedTrialStatus) -> Void) {
        callbacks.add(callbackID: CallbackID(1030), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UnreadChatMessagesChanged_t` callback
    func onUnreadChatMessagesChanged(_ client: @Sendable @escaping (sending UnreadChatMessagesChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(348), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserAchievementIconFetched_t` callback
    func onUserAchievementIconFetched(_ client: @Sendable @escaping (sending UserAchievementIconFetched) -> Void) {
        callbacks.add(callbackID: CallbackID(1109), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserAchievementStored_t` callback
    func onUserAchievementStored(_ client: @Sendable @escaping (sending UserAchievementStored) -> Void) {
        callbacks.add(callbackID: CallbackID(1103), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserStatsStored_t` callback
    func onUserStatsStored(_ client: @Sendable @escaping (sending UserStatsStored) -> Void) {
        callbacks.add(callbackID: CallbackID(1102), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserStatsUnloaded_t` callback
    func onUserStatsUnloaded(_ client: @Sendable @escaping (sending UserStatsUnloaded) -> Void) {
        callbacks.add(callbackID: CallbackID(1108), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `UserSubscribedItemsListChanged_t` callback
    func onUserSubscribedItemsListChanged(_ client: @Sendable @escaping (sending UserSubscribedItemsListChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(3418), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `ValidateAuthTicketResponse_t` callback
    func onValidateAuthTicketResponse(_ client: @Sendable @escaping (sending ValidateAuthTicketResponse) -> Void) {
        callbacks.add(callbackID: CallbackID(143), rawClient: SteamBaseAPI.makeRaw(client))
    }

    /// Registration for Steamworks `VolumeHasChanged_t` callback
    func onVolumeHasChanged(_ client: @Sendable @escaping (sending VolumeHasChanged) -> Void) {
        callbacks.add(callbackID: CallbackID(4002), rawClient: SteamBaseAPI.makeRaw(client))
    }
}

public extension SteamBaseAPI {
    // MARK: `AsyncStream` callbacks

    /// Async stream of Steamworks `ActiveBeaconsUpdated_t` callbacks
    var activeBeaconsUpdated: AsyncStream<ActiveBeaconsUpdated> {
        AsyncStream { onActiveBeaconsUpdated($0.yield0) }
    }

    /// Async stream of Steamworks `AppProofOfPurchaseKeyResponse_t` callbacks
    var appProofOfPurchaseKeyResponse: AsyncStream<AppProofOfPurchaseKeyResponse> {
        AsyncStream { onAppProofOfPurchaseKeyResponse($0.yield0) }
    }

    /// Async stream of Steamworks `AppResumingFromSuspend_t` callbacks
    var appResumingFromSuspend: AsyncStream<AppResumingFromSuspend> {
        AsyncStream { onAppResumingFromSuspend($0.yield0) }
    }

    /// Async stream of Steamworks `AvailableBeaconLocationsUpdated_t` callbacks
    var availableBeaconLocationsUpdated: AsyncStream<AvailableBeaconLocationsUpdated> {
        AsyncStream { onAvailableBeaconLocationsUpdated($0.yield0) }
    }

    /// Async stream of Steamworks `AvatarImageLoaded_t` callbacks
    var avatarImageLoaded: AsyncStream<AvatarImageLoaded> {
        AsyncStream { onAvatarImageLoaded($0.yield0) }
    }

    /// Async stream of Steamworks `BroadcastUploadStart_t` callbacks
    var broadcastUploadStart: AsyncStream<BroadcastUploadStart> {
        AsyncStream { onBroadcastUploadStart($0.yield0) }
    }

    /// Async stream of Steamworks `BroadcastUploadStop_t` callbacks
    var broadcastUploadStop: AsyncStream<BroadcastUploadStop> {
        AsyncStream { onBroadcastUploadStop($0.yield0) }
    }

    /// Async stream of Steamworks `ClientGameServerDeny_t` callbacks
    var clientGameServerDeny: AsyncStream<ClientGameServerDeny> {
        AsyncStream { onClientGameServerDeny($0.yield0) }
    }

    /// Async stream of Steamworks `DlcInstalled_t` callbacks
    var dlcInstalled: AsyncStream<DlcInstalled> {
        AsyncStream { onDlcInstalled($0.yield0) }
    }

    /// Async stream of Steamworks `DownloadItemResult_t` callbacks
    var downloadItemResult: AsyncStream<DownloadItemResult> {
        AsyncStream { onDownloadItemResult($0.yield0) }
    }

    /// Async stream of Steamworks `DurationControl_t` callbacks
    var durationControl: AsyncStream<DurationControl> {
        AsyncStream { onDurationControl($0.yield0) }
    }

    /// Async stream of Steamworks `EndGameResultCallback_t` callbacks
    var endGameResultCallback: AsyncStream<EndGameResultCallback> {
        AsyncStream { onEndGameResultCallback($0.yield0) }
    }

    /// Async stream of Steamworks `EquippedProfileItemsChanged_t` callbacks
    var equippedProfileItemsChanged: AsyncStream<EquippedProfileItemsChanged> {
        AsyncStream { onEquippedProfileItemsChanged($0.yield0) }
    }

    /// Async stream of Steamworks `FavoritesListAccountsUpdated_t` callbacks
    var favoritesListAccountsUpdated: AsyncStream<FavoritesListAccountsUpdated> {
        AsyncStream { onFavoritesListAccountsUpdated($0.yield0) }
    }

    /// Async stream of Steamworks `FavoritesListChanged_t` callbacks
    var favoritesListChanged: AsyncStream<FavoritesListChanged> {
        AsyncStream { onFavoritesListChanged($0.yield0) }
    }

    /// Async stream of Steamworks `FilterTextDictionaryChanged_t` callbacks
    var filterTextDictionaryChanged: AsyncStream<FilterTextDictionaryChanged> {
        AsyncStream { onFilterTextDictionaryChanged($0.yield0) }
    }

    /// Async stream of Steamworks `FloatingGamepadTextInputDismissed_t` callbacks
    var floatingGamepadTextInputDismissed: AsyncStream<FloatingGamepadTextInputDismissed> {
        AsyncStream { onFloatingGamepadTextInputDismissed($0.yield0) }
    }

    /// Async stream of Steamworks `FriendRichPresenceUpdate_t` callbacks
    var friendRichPresenceUpdate: AsyncStream<FriendRichPresenceUpdate> {
        AsyncStream { onFriendRichPresenceUpdate($0.yield0) }
    }

    /// Async stream of Steamworks `GSClientAchievementStatus_t` callbacks
    var gsClientAchievementStatus: AsyncStream<GSClientAchievementStatus> {
        AsyncStream { onGSClientAchievementStatus($0.yield0) }
    }

    /// Async stream of Steamworks `GSClientApprove_t` callbacks
    var gsClientApprove: AsyncStream<GSClientApprove> {
        AsyncStream { onGSClientApprove($0.yield0) }
    }

    /// Async stream of Steamworks `GSClientDeny_t` callbacks
    var gsClientDeny: AsyncStream<GSClientDeny> {
        AsyncStream { onGSClientDeny($0.yield0) }
    }

    /// Async stream of Steamworks `GSClientGroupStatus_t` callbacks
    var gsClientGroupStatus: AsyncStream<GSClientGroupStatus> {
        AsyncStream { onGSClientGroupStatus($0.yield0) }
    }

    /// Async stream of Steamworks `GSClientKick_t` callbacks
    var gsClientKick: AsyncStream<GSClientKick> {
        AsyncStream { onGSClientKick($0.yield0) }
    }

    /// Async stream of Steamworks `GSGameplayStats_t` callbacks
    var gsGameplayStats: AsyncStream<GSGameplayStats> {
        AsyncStream { onGSGameplayStats($0.yield0) }
    }

    /// Async stream of Steamworks `GSPolicyResponse_t` callbacks
    var gsPolicyResponse: AsyncStream<GSPolicyResponse> {
        AsyncStream { onGSPolicyResponse($0.yield0) }
    }

    /// Async stream of Steamworks `GSStatsUnloaded_t` callbacks
    var gsStatsUnloaded: AsyncStream<GSStatsUnloaded> {
        AsyncStream { onGSStatsUnloaded($0.yield0) }
    }

    /// Async stream of Steamworks `GameConnectedChatJoin_t` callbacks
    var gameConnectedChatJoin: AsyncStream<GameConnectedChatJoin> {
        AsyncStream { onGameConnectedChatJoin($0.yield0) }
    }

    /// Async stream of Steamworks `GameConnectedChatLeave_t` callbacks
    var gameConnectedChatLeave: AsyncStream<GameConnectedChatLeave> {
        AsyncStream { onGameConnectedChatLeave($0.yield0) }
    }

    /// Async stream of Steamworks `GameConnectedClanChatMsg_t` callbacks
    var gameConnectedClanChatMsg: AsyncStream<GameConnectedClanChatMsg> {
        AsyncStream { onGameConnectedClanChatMsg($0.yield0) }
    }

    /// Async stream of Steamworks `GameConnectedFriendChatMsg_t` callbacks
    var gameConnectedFriendChatMsg: AsyncStream<GameConnectedFriendChatMsg> {
        AsyncStream { onGameConnectedFriendChatMsg($0.yield0) }
    }

    /// Async stream of Steamworks `GameLobbyJoinRequested_t` callbacks
    var gameLobbyJoinRequested: AsyncStream<GameLobbyJoinRequested> {
        AsyncStream { onGameLobbyJoinRequested($0.yield0) }
    }

    /// Async stream of Steamworks `GameOverlayActivated_t` callbacks
    var gameOverlayActivated: AsyncStream<GameOverlayActivated> {
        AsyncStream { onGameOverlayActivated($0.yield0) }
    }

    /// Async stream of Steamworks `GameRichPresenceJoinRequested_t` callbacks
    var gameRichPresenceJoinRequested: AsyncStream<GameRichPresenceJoinRequested> {
        AsyncStream { onGameRichPresenceJoinRequested($0.yield0) }
    }

    /// Async stream of Steamworks `GameServerChangeRequested_t` callbacks
    var gameServerChangeRequested: AsyncStream<GameServerChangeRequested> {
        AsyncStream { onGameServerChangeRequested($0.yield0) }
    }

    /// Async stream of Steamworks `GameWebCallback_t` callbacks
    var gameWebCallback: AsyncStream<GameWebCallback> {
        AsyncStream { onGameWebCallback($0.yield0) }
    }

    /// Async stream of Steamworks `GamepadTextInputDismissed_t` callbacks
    var gamepadTextInputDismissed: AsyncStream<GamepadTextInputDismissed> {
        AsyncStream { onGamepadTextInputDismissed($0.yield0) }
    }

    /// Async stream of Steamworks `GetAuthSessionTicketResponse_t` callbacks
    var getAuthSessionTicketResponse: AsyncStream<GetAuthSessionTicketResponse> {
        AsyncStream { onGetAuthSessionTicketResponse($0.yield0) }
    }

    /// Async stream of Steamworks `GetOPFSettingsResult_t` callbacks
    var getOPFSettingsResult: AsyncStream<GetOPFSettingsResult> {
        AsyncStream { onGetOPFSettingsResult($0.yield0) }
    }

    /// Async stream of Steamworks `GetTicketForWebApiResponse_t` callbacks
    var getTicketForWebApiResponse: AsyncStream<GetTicketForWebApiResponse> {
        AsyncStream { onGetTicketForWebApiResponse($0.yield0) }
    }

    /// Async stream of Steamworks `GetVideoURLResult_t` callbacks
    var getVideoURLResult: AsyncStream<GetVideoURLResult> {
        AsyncStream { onGetVideoURLResult($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_BrowserRestarted_t` callbacks
    var htmlBrowserRestarted: AsyncStream<HTMLBrowserRestarted> {
        AsyncStream { onHTMLBrowserRestarted($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_CanGoBackAndForward_t` callbacks
    var htmlCanGoBackAndForward: AsyncStream<HTMLCanGoBackAndForward> {
        AsyncStream { onHTMLCanGoBackAndForward($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_ChangedTitle_t` callbacks
    var htmlChangedTitle: AsyncStream<HTMLChangedTitle> {
        AsyncStream { onHTMLChangedTitle($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_CloseBrowser_t` callbacks
    var htmlCloseBrowser: AsyncStream<HTMLCloseBrowser> {
        AsyncStream { onHTMLCloseBrowser($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_FileOpenDialog_t` callbacks
    var htmlFileOpenDialog: AsyncStream<HTMLFileOpenDialog> {
        AsyncStream { onHTMLFileOpenDialog($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_FinishedRequest_t` callbacks
    var htmlFinishedRequest: AsyncStream<HTMLFinishedRequest> {
        AsyncStream { onHTMLFinishedRequest($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_HideToolTip_t` callbacks
    var htmlHideToolTip: AsyncStream<HTMLHideToolTip> {
        AsyncStream { onHTMLHideToolTip($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_HorizontalScroll_t` callbacks
    var htmlHorizontalScroll: AsyncStream<HTMLHorizontalScroll> {
        AsyncStream { onHTMLHorizontalScroll($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_JSAlert_t` callbacks
    var htmljsAlert: AsyncStream<HTMLJSAlert> {
        AsyncStream { onHTMLJSAlert($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_JSConfirm_t` callbacks
    var htmljsConfirm: AsyncStream<HTMLJSConfirm> {
        AsyncStream { onHTMLJSConfirm($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_LinkAtPosition_t` callbacks
    var htmlLinkAtPosition: AsyncStream<HTMLLinkAtPosition> {
        AsyncStream { onHTMLLinkAtPosition($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_NeedsPaint_t` callbacks
    var htmlNeedsPaint: AsyncStream<HTMLNeedsPaint> {
        AsyncStream { onHTMLNeedsPaint($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_NewWindow_t` callbacks
    var htmlNewWindow: AsyncStream<HTMLNewWindow> {
        AsyncStream { onHTMLNewWindow($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_OpenLinkInNewTab_t` callbacks
    var htmlOpenLinkInNewTab: AsyncStream<HTMLOpenLinkInNewTab> {
        AsyncStream { onHTMLOpenLinkInNewTab($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_SearchResults_t` callbacks
    var htmlSearchResults: AsyncStream<HTMLSearchResults> {
        AsyncStream { onHTMLSearchResults($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_SetCursor_t` callbacks
    var htmlSetCursor: AsyncStream<HTMLSetCursor> {
        AsyncStream { onHTMLSetCursor($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_ShowToolTip_t` callbacks
    var htmlShowToolTip: AsyncStream<HTMLShowToolTip> {
        AsyncStream { onHTMLShowToolTip($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_StartRequest_t` callbacks
    var htmlStartRequest: AsyncStream<HTMLStartRequest> {
        AsyncStream { onHTMLStartRequest($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_StatusText_t` callbacks
    var htmlStatusText: AsyncStream<HTMLStatusText> {
        AsyncStream { onHTMLStatusText($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_URLChanged_t` callbacks
    var htmlurlChanged: AsyncStream<HTMLURLChanged> {
        AsyncStream { onHTMLURLChanged($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_UpdateToolTip_t` callbacks
    var htmlUpdateToolTip: AsyncStream<HTMLUpdateToolTip> {
        AsyncStream { onHTMLUpdateToolTip($0.yield0) }
    }

    /// Async stream of Steamworks `HTML_VerticalScroll_t` callbacks
    var htmlVerticalScroll: AsyncStream<HTMLVerticalScroll> {
        AsyncStream { onHTMLVerticalScroll($0.yield0) }
    }

    /// Async stream of Steamworks `HTTPRequestDataReceived_t` callbacks
    var httpRequestDataReceived: AsyncStream<HTTPRequestDataReceived> {
        AsyncStream { onHTTPRequestDataReceived($0.yield0) }
    }

    /// Async stream of Steamworks `HTTPRequestHeadersReceived_t` callbacks
    var httpRequestHeadersReceived: AsyncStream<HTTPRequestHeadersReceived> {
        AsyncStream { onHTTPRequestHeadersReceived($0.yield0) }
    }

    /// Async stream of Steamworks `IPCFailure_t` callbacks
    var ipcFailure: AsyncStream<IPCFailure> {
        AsyncStream { onIPCFailure($0.yield0) }
    }

    /// Async stream of Steamworks `IPCountry_t` callbacks
    var ipCountry: AsyncStream<IPCountry> {
        AsyncStream { onIPCountry($0.yield0) }
    }

    /// Async stream of Steamworks `ItemInstalled_t` callbacks
    var itemInstalled: AsyncStream<ItemInstalled> {
        AsyncStream { onItemInstalled($0.yield0) }
    }

    /// Async stream of Steamworks `LicensesUpdated_t` callbacks
    var licensesUpdated: AsyncStream<LicensesUpdated> {
        AsyncStream { onLicensesUpdated($0.yield0) }
    }

    /// Async stream of Steamworks `LobbyChatMsg_t` callbacks
    var lobbyChatMsg: AsyncStream<LobbyChatMsg> {
        AsyncStream { onLobbyChatMsg($0.yield0) }
    }

    /// Async stream of Steamworks `LobbyChatUpdate_t` callbacks
    var lobbyChatUpdate: AsyncStream<LobbyChatUpdate> {
        AsyncStream { onLobbyChatUpdate($0.yield0) }
    }

    /// Async stream of Steamworks `LobbyDataUpdate_t` callbacks
    var lobbyDataUpdate: AsyncStream<LobbyDataUpdate> {
        AsyncStream { onLobbyDataUpdate($0.yield0) }
    }

    /// Async stream of Steamworks `LobbyEnter_t` callbacks
    var lobbyEnter: AsyncStream<LobbyEnter> {
        AsyncStream { onLobbyEnter($0.yield0) }
    }

    /// Async stream of Steamworks `LobbyGameCreated_t` callbacks
    var lobbyGameCreated: AsyncStream<LobbyGameCreated> {
        AsyncStream { onLobbyGameCreated($0.yield0) }
    }

    /// Async stream of Steamworks `LobbyInvite_t` callbacks
    var lobbyInvite: AsyncStream<LobbyInvite> {
        AsyncStream { onLobbyInvite($0.yield0) }
    }

    /// Async stream of Steamworks `LobbyKicked_t` callbacks
    var lobbyKicked: AsyncStream<LobbyKicked> {
        AsyncStream { onLobbyKicked($0.yield0) }
    }

    /// Async stream of Steamworks `LowBatteryPower_t` callbacks
    var lowBatteryPower: AsyncStream<LowBatteryPower> {
        AsyncStream { onLowBatteryPower($0.yield0) }
    }

    /// Async stream of Steamworks `MicroTxnAuthorizationResponse_t` callbacks
    var microTxnAuthorizationResponse: AsyncStream<MicroTxnAuthorizationResponse> {
        AsyncStream { onMicroTxnAuthorizationResponse($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerRemoteToFront_t` callbacks
    var musicPlayerRemoteToFront: AsyncStream<MusicPlayerRemoteToFront> {
        AsyncStream { onMusicPlayerRemoteToFront($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerRemoteWillActivate_t` callbacks
    var musicPlayerRemoteWillActivate: AsyncStream<MusicPlayerRemoteWillActivate> {
        AsyncStream { onMusicPlayerRemoteWillActivate($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerRemoteWillDeactivate_t` callbacks
    var musicPlayerRemoteWillDeactivate: AsyncStream<MusicPlayerRemoteWillDeactivate> {
        AsyncStream { onMusicPlayerRemoteWillDeactivate($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerSelectsPlaylistEntry_t` callbacks
    var musicPlayerSelectsPlaylistEntry: AsyncStream<MusicPlayerSelectsPlaylistEntry> {
        AsyncStream { onMusicPlayerSelectsPlaylistEntry($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerSelectsQueueEntry_t` callbacks
    var musicPlayerSelectsQueueEntry: AsyncStream<MusicPlayerSelectsQueueEntry> {
        AsyncStream { onMusicPlayerSelectsQueueEntry($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWantsLooped_t` callbacks
    var musicPlayerWantsLooped: AsyncStream<MusicPlayerWantsLooped> {
        AsyncStream { onMusicPlayerWantsLooped($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPause_t` callbacks
    var musicPlayerWantsPause: AsyncStream<MusicPlayerWantsPause> {
        AsyncStream { onMusicPlayerWantsPause($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPlayNext_t` callbacks
    var musicPlayerWantsPlayNext: AsyncStream<MusicPlayerWantsPlayNext> {
        AsyncStream { onMusicPlayerWantsPlayNext($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPlayPrevious_t` callbacks
    var musicPlayerWantsPlayPrevious: AsyncStream<MusicPlayerWantsPlayPrevious> {
        AsyncStream { onMusicPlayerWantsPlayPrevious($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPlay_t` callbacks
    var musicPlayerWantsPlay: AsyncStream<MusicPlayerWantsPlay> {
        AsyncStream { onMusicPlayerWantsPlay($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWantsPlayingRepeatStatus_t` callbacks
    var musicPlayerWantsPlayingRepeatStatus: AsyncStream<MusicPlayerWantsPlayingRepeatStatus> {
        AsyncStream { onMusicPlayerWantsPlayingRepeatStatus($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWantsShuffled_t` callbacks
    var musicPlayerWantsShuffled: AsyncStream<MusicPlayerWantsShuffled> {
        AsyncStream { onMusicPlayerWantsShuffled($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWantsVolume_t` callbacks
    var musicPlayerWantsVolume: AsyncStream<MusicPlayerWantsVolume> {
        AsyncStream { onMusicPlayerWantsVolume($0.yield0) }
    }

    /// Async stream of Steamworks `MusicPlayerWillQuit_t` callbacks
    var musicPlayerWillQuit: AsyncStream<MusicPlayerWillQuit> {
        AsyncStream { onMusicPlayerWillQuit($0.yield0) }
    }

    /// Async stream of Steamworks `NewUrlLaunchParameters_t` callbacks
    var newUrlLaunchParameters: AsyncStream<NewUrlLaunchParameters> {
        AsyncStream { onNewUrlLaunchParameters($0.yield0) }
    }

    /// Async stream of Steamworks `OverlayBrowserProtocolNavigation_t` callbacks
    var overlayBrowserProtocolNavigation: AsyncStream<OverlayBrowserProtocolNavigation> {
        AsyncStream { onOverlayBrowserProtocolNavigation($0.yield0) }
    }

    /// Async stream of Steamworks `PS3TrophiesInstalled_t` callbacks
    var ps3TrophiesInstalled: AsyncStream<PS3TrophiesInstalled> {
        AsyncStream { onPS3TrophiesInstalled($0.yield0) }
    }

    /// Async stream of Steamworks `PSNGameBootInviteResult_t` callbacks
    var psnGameBootInviteResult: AsyncStream<PSNGameBootInviteResult> {
        AsyncStream { onPSNGameBootInviteResult($0.yield0) }
    }

    /// Async stream of Steamworks `PersonaStateChange_t` callbacks
    var personaStateChange: AsyncStream<PersonaStateChange> {
        AsyncStream { onPersonaStateChange($0.yield0) }
    }

    /// Async stream of Steamworks `PlaybackStatusHasChanged_t` callbacks
    var playbackStatusHasChanged: AsyncStream<PlaybackStatusHasChanged> {
        AsyncStream { onPlaybackStatusHasChanged($0.yield0) }
    }

    /// Async stream of Steamworks `RemoteStorageEnumerateUserSharedWorkshopFilesResult_t` callbacks
    var remoteStorageEnumerateUserSharedWorkshopFilesResult: AsyncStream<RemoteStorageEnumerateUserSharedWorkshopFilesResult> {
        AsyncStream { onRemoteStorageEnumerateUserSharedWorkshopFilesResult($0.yield0) }
    }

    /// Async stream of Steamworks `RemoteStorageLocalFileChange_t` callbacks
    var remoteStorageLocalFileChange: AsyncStream<RemoteStorageLocalFileChange> {
        AsyncStream { onRemoteStorageLocalFileChange($0.yield0) }
    }

    /// Async stream of Steamworks `RemoteStoragePublishFileResult_t` callbacks
    var remoteStoragePublishFileResult: AsyncStream<RemoteStoragePublishFileResult> {
        AsyncStream { onRemoteStoragePublishFileResult($0.yield0) }
    }

    /// Async stream of Steamworks `RemoteStoragePublishedFileDeleted_t` callbacks
    var remoteStoragePublishedFileDeleted: AsyncStream<RemoteStoragePublishedFileDeleted> {
        AsyncStream { onRemoteStoragePublishedFileDeleted($0.yield0) }
    }

    /// Async stream of Steamworks `RemoteStoragePublishedFileSubscribed_t` callbacks
    var remoteStoragePublishedFileSubscribed: AsyncStream<RemoteStoragePublishedFileSubscribed> {
        AsyncStream { onRemoteStoragePublishedFileSubscribed($0.yield0) }
    }

    /// Async stream of Steamworks `RemoteStoragePublishedFileUnsubscribed_t` callbacks
    var remoteStoragePublishedFileUnsubscribed: AsyncStream<RemoteStoragePublishedFileUnsubscribed> {
        AsyncStream { onRemoteStoragePublishedFileUnsubscribed($0.yield0) }
    }

    /// Async stream of Steamworks `RemoteStoragePublishedFileUpdated_t` callbacks
    var remoteStoragePublishedFileUpdated: AsyncStream<RemoteStoragePublishedFileUpdated> {
        AsyncStream { onRemoteStoragePublishedFileUpdated($0.yield0) }
    }

    /// Async stream of Steamworks `RemoteStorageUserVoteDetails_t` callbacks
    var remoteStorageUserVoteDetails: AsyncStream<RemoteStorageUserVoteDetails> {
        AsyncStream { onRemoteStorageUserVoteDetails($0.yield0) }
    }

    /// Async stream of Steamworks `RequestPlayersForGameFinalResultCallback_t` callbacks
    var requestPlayersForGameFinalResultCallback: AsyncStream<RequestPlayersForGameFinalResultCallback> {
        AsyncStream { onRequestPlayersForGameFinalResultCallback($0.yield0) }
    }

    /// Async stream of Steamworks `RequestPlayersForGameProgressCallback_t` callbacks
    var requestPlayersForGameProgressCallback: AsyncStream<RequestPlayersForGameProgressCallback> {
        AsyncStream { onRequestPlayersForGameProgressCallback($0.yield0) }
    }

    /// Async stream of Steamworks `RequestPlayersForGameResultCallback_t` callbacks
    var requestPlayersForGameResultCallback: AsyncStream<RequestPlayersForGameResultCallback> {
        AsyncStream { onRequestPlayersForGameResultCallback($0.yield0) }
    }

    /// Async stream of Steamworks `ReservationNotificationCallback_t` callbacks
    var reservationNotificationCallback: AsyncStream<ReservationNotificationCallback> {
        AsyncStream { onReservationNotificationCallback($0.yield0) }
    }

    /// Async stream of Steamworks `ScreenshotReady_t` callbacks
    var screenshotReady: AsyncStream<ScreenshotReady> {
        AsyncStream { onScreenshotReady($0.yield0) }
    }

    /// Async stream of Steamworks `ScreenshotRequested_t` callbacks
    var screenshotRequested: AsyncStream<ScreenshotRequested> {
        AsyncStream { onScreenshotRequested($0.yield0) }
    }

    /// Async stream of Steamworks `SearchForGameProgressCallback_t` callbacks
    var searchForGameProgressCallback: AsyncStream<SearchForGameProgressCallback> {
        AsyncStream { onSearchForGameProgressCallback($0.yield0) }
    }

    /// Async stream of Steamworks `SearchForGameResultCallback_t` callbacks
    var searchForGameResultCallback: AsyncStream<SearchForGameResultCallback> {
        AsyncStream { onSearchForGameResultCallback($0.yield0) }
    }

    /// Async stream of Steamworks `SteamAPICallCompleted_t` callbacks
    var steamAPICallCompleted: AsyncStream<SteamAPICallCompleted> {
        AsyncStream { onSteamAPICallCompleted($0.yield0) }
    }

    /// Async stream of Steamworks `SteamInputConfigurationLoaded_t` callbacks
    var steamInputConfigurationLoaded: AsyncStream<SteamInputConfigurationLoaded> {
        AsyncStream { onSteamInputConfigurationLoaded($0.yield0) }
    }

    /// Async stream of Steamworks `SteamInputDeviceConnected_t` callbacks
    var steamInputDeviceConnected: AsyncStream<SteamInputDeviceConnected> {
        AsyncStream { onSteamInputDeviceConnected($0.yield0) }
    }

    /// Async stream of Steamworks `SteamInputDeviceDisconnected_t` callbacks
    var steamInputDeviceDisconnected: AsyncStream<SteamInputDeviceDisconnected> {
        AsyncStream { onSteamInputDeviceDisconnected($0.yield0) }
    }

    /// Async stream of Steamworks `SteamInputGamepadSlotChange_t` callbacks
    var steamInputGamepadSlotChange: AsyncStream<SteamInputGamepadSlotChange> {
        AsyncStream { onSteamInputGamepadSlotChange($0.yield0) }
    }

    /// Async stream of Steamworks `SteamInventoryDefinitionUpdate_t` callbacks
    var steamInventoryDefinitionUpdate: AsyncStream<SteamInventoryDefinitionUpdate> {
        AsyncStream { onSteamInventoryDefinitionUpdate($0.yield0) }
    }

    /// Async stream of Steamworks `SteamInventoryFullUpdate_t` callbacks
    var steamInventoryFullUpdate: AsyncStream<SteamInventoryFullUpdate> {
        AsyncStream { onSteamInventoryFullUpdate($0.yield0) }
    }

    /// Async stream of Steamworks `SteamInventoryResultReady_t` callbacks
    var steamInventoryResultReady: AsyncStream<SteamInventoryResultReady> {
        AsyncStream { onSteamInventoryResultReady($0.yield0) }
    }

    /// Async stream of Steamworks `SteamNetAuthenticationStatus_t` callbacks
    var steamNetAuthenticationStatus: AsyncStream<SteamNetAuthenticationStatus> {
        AsyncStream { onSteamNetAuthenticationStatus($0.yield0) }
    }

    /// Async stream of Steamworks `SteamNetConnectionStatusChangedCallback_t` callbacks
    var steamNetConnectionStatusChangedCallback: AsyncStream<SteamNetConnectionStatusChangedCallback> {
        AsyncStream { onSteamNetConnectionStatusChangedCallback($0.yield0) }
    }

    /// Async stream of Steamworks `SteamNetworkingFakeIPResult_t` callbacks
    var steamNetworkingFakeIPResult: AsyncStream<SteamNetworkingFakeIPResult> {
        AsyncStream { onSteamNetworkingFakeIPResult($0.yield0) }
    }

    /// Async stream of Steamworks `SteamNetworkingMessagesSessionFailed_t` callbacks
    var steamNetworkingMessagesSessionFailed: AsyncStream<SteamNetworkingMessagesSessionFailed> {
        AsyncStream { onSteamNetworkingMessagesSessionFailed($0.yield0) }
    }

    /// Async stream of Steamworks `SteamNetworkingMessagesSessionRequest_t` callbacks
    var steamNetworkingMessagesSessionRequest: AsyncStream<SteamNetworkingMessagesSessionRequest> {
        AsyncStream { onSteamNetworkingMessagesSessionRequest($0.yield0) }
    }

    /// Async stream of Steamworks `SteamParentalSettingsChanged_t` callbacks
    var steamParentalSettingsChanged: AsyncStream<SteamParentalSettingsChanged> {
        AsyncStream { onSteamParentalSettingsChanged($0.yield0) }
    }

    /// Async stream of Steamworks `SteamRelayNetworkStatus_t` callbacks
    var steamRelayNetworkStatus: AsyncStream<SteamRelayNetworkStatus> {
        AsyncStream { onSteamRelayNetworkStatus($0.yield0) }
    }

    /// Async stream of Steamworks `SteamRemotePlaySessionConnected_t` callbacks
    var steamRemotePlaySessionConnected: AsyncStream<SteamRemotePlaySessionConnected> {
        AsyncStream { onSteamRemotePlaySessionConnected($0.yield0) }
    }

    /// Async stream of Steamworks `SteamRemotePlaySessionDisconnected_t` callbacks
    var steamRemotePlaySessionDisconnected: AsyncStream<SteamRemotePlaySessionDisconnected> {
        AsyncStream { onSteamRemotePlaySessionDisconnected($0.yield0) }
    }

    /// Async stream of Steamworks `SteamRemotePlayTogetherGuestInvite_t` callbacks
    var steamRemotePlayTogetherGuestInvite: AsyncStream<SteamRemotePlayTogetherGuestInvite> {
        AsyncStream { onSteamRemotePlayTogetherGuestInvite($0.yield0) }
    }

    /// Async stream of Steamworks `SteamServerConnectFailure_t` callbacks
    var steamServerConnectFailure: AsyncStream<SteamServerConnectFailure> {
        AsyncStream { onSteamServerConnectFailure($0.yield0) }
    }

    /// Async stream of Steamworks `SteamServersConnected_t` callbacks
    var steamServersConnected: AsyncStream<SteamServersConnected> {
        AsyncStream { onSteamServersConnected($0.yield0) }
    }

    /// Async stream of Steamworks `SteamServersDisconnected_t` callbacks
    var steamServersDisconnected: AsyncStream<SteamServersDisconnected> {
        AsyncStream { onSteamServersDisconnected($0.yield0) }
    }

    /// Async stream of Steamworks `SteamShutdown_t` callbacks
    var steamShutdown: AsyncStream<SteamShutdown> {
        AsyncStream { onSteamShutdown($0.yield0) }
    }

    /// Async stream of Steamworks `SubmitPlayerResultResultCallback_t` callbacks
    var submitPlayerResultResultCallback: AsyncStream<SubmitPlayerResultResultCallback> {
        AsyncStream { onSubmitPlayerResultResultCallback($0.yield0) }
    }

    /// Async stream of Steamworks `TimedTrialStatus_t` callbacks
    var timedTrialStatus: AsyncStream<TimedTrialStatus> {
        AsyncStream { onTimedTrialStatus($0.yield0) }
    }

    /// Async stream of Steamworks `UnreadChatMessagesChanged_t` callbacks
    var unreadChatMessagesChanged: AsyncStream<UnreadChatMessagesChanged> {
        AsyncStream { onUnreadChatMessagesChanged($0.yield0) }
    }

    /// Async stream of Steamworks `UserAchievementIconFetched_t` callbacks
    var userAchievementIconFetched: AsyncStream<UserAchievementIconFetched> {
        AsyncStream { onUserAchievementIconFetched($0.yield0) }
    }

    /// Async stream of Steamworks `UserAchievementStored_t` callbacks
    var userAchievementStored: AsyncStream<UserAchievementStored> {
        AsyncStream { onUserAchievementStored($0.yield0) }
    }

    /// Async stream of Steamworks `UserStatsStored_t` callbacks
    var userStatsStored: AsyncStream<UserStatsStored> {
        AsyncStream { onUserStatsStored($0.yield0) }
    }

    /// Async stream of Steamworks `UserStatsUnloaded_t` callbacks
    var userStatsUnloaded: AsyncStream<UserStatsUnloaded> {
        AsyncStream { onUserStatsUnloaded($0.yield0) }
    }

    /// Async stream of Steamworks `UserSubscribedItemsListChanged_t` callbacks
    var userSubscribedItemsListChanged: AsyncStream<UserSubscribedItemsListChanged> {
        AsyncStream { onUserSubscribedItemsListChanged($0.yield0) }
    }

    /// Async stream of Steamworks `ValidateAuthTicketResponse_t` callbacks
    var validateAuthTicketResponse: AsyncStream<ValidateAuthTicketResponse> {
        AsyncStream { onValidateAuthTicketResponse($0.yield0) }
    }

    /// Async stream of Steamworks `VolumeHasChanged_t` callbacks
    var volumeHasChanged: AsyncStream<VolumeHasChanged> {
        AsyncStream { onVolumeHasChanged($0.yield0) }
    }
}
