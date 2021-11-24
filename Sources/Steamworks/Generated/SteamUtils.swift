//
//  SteamUtils.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamUtils`](https://partner.steamgames.com/doc/api/ISteamUtils)
///
/// Access via `SteamBaseAPI.Utils` through a `SteamAPI` or `SteamGameServerAPI` instance.
public struct SteamUtils {
    private let isServer: Bool
    var interface: UnsafeMutablePointer<ISteamUtils> {
        isServer ? SteamAPI_SteamGameServerUtils_v010() : SteamAPI_SteamUtils_v010()
    }

    init(isServer: Bool) {
        self.isServer = isServer
    }

    /// Steamworks `ISteamUtils::BOverlayNeedsPresent()`
    public func overlayNeedsPresent() -> Bool {
        SteamAPI_ISteamUtils_BOverlayNeedsPresent(interface)
    }

    /// Steamworks `ISteamUtils::CheckFileSignature()`, callback
    public func checkFileSignature(fileName: String, completion: @escaping (CheckFileSignature?) -> Void) {
        let rc = SteamAPI_ISteamUtils_CheckFileSignature(interface, fileName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUtils::CheckFileSignature()`, async
    func checkFileSignature(fileName: String) async -> CheckFileSignature? {
        await withUnsafeContinuation {
            checkFileSignature(fileName: fileName, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUtils::FilterText()`
    public func filterText(context: TextFilteringContext, steamID: SteamID, inputMessage: String, outFilteredText: inout String, byteSizeOutFilteredText: Int) -> Int {
        let tmp_outFilteredText = UnsafeMutableBufferPointer<CChar>.allocate(capacity: byteSizeOutFilteredText)
        defer { tmp_outFilteredText.deallocate() }
        let rc = Int(SteamAPI_ISteamUtils_FilterText(interface, ETextFilteringContext(context), UInt64(steamID), inputMessage, tmp_outFilteredText.baseAddress, uint32(byteSizeOutFilteredText)))
        outFilteredText = String(tmp_outFilteredText)
        return rc
    }

    /// Steamworks `ISteamUtils::GetAPICallFailureReason()`
    public func getAPICallFailureReason(steamAPICall: SteamAPICall) -> SteamAPICallFailure {
        SteamAPICallFailure(SteamAPI_ISteamUtils_GetAPICallFailureReason(interface, SteamAPICall_t(steamAPICall)))
    }

    /// Steamworks `ISteamUtils::GetAPICallResult()`
    public func getAPICallResult(steamAPICall: SteamAPICall, callback: UnsafeMutableRawPointer, callbackSize: Int, callbackExpectedIndex: Int, failed: inout Bool) -> Bool {
        SteamAPI_ISteamUtils_GetAPICallResult(interface, SteamAPICall_t(steamAPICall), callback, Int32(callbackSize), Int32(callbackExpectedIndex), &failed)
    }

    /// Steamworks `ISteamUtils::GetAppID()`
    public func getAppID() -> AppID {
        AppID(SteamAPI_ISteamUtils_GetAppID(interface))
    }

    /// Steamworks `ISteamUtils::GetConnectedUniverse()`
    public func getConnectedUniverse() -> Universe {
        Universe(SteamAPI_ISteamUtils_GetConnectedUniverse(interface))
    }

    /// Steamworks `ISteamUtils::GetCurrentBatteryPower()`
    public func getCurrentBatteryPower() -> Int {
        Int(SteamAPI_ISteamUtils_GetCurrentBatteryPower(interface))
    }

    /// Steamworks `ISteamUtils::GetEnteredGamepadTextInput()`
    public func getEnteredGamepadTextInput(text: inout String, textSize: Int) -> Bool {
        let tmp_text = UnsafeMutableBufferPointer<CChar>.allocate(capacity: textSize)
        defer { tmp_text.deallocate() }
        let rc = SteamAPI_ISteamUtils_GetEnteredGamepadTextInput(interface, tmp_text.baseAddress, uint32(textSize))
        text = String(tmp_text)
        return rc
    }

    /// Steamworks `ISteamUtils::GetEnteredGamepadTextLength()`
    public func getEnteredGamepadTextLength() -> Int {
        Int(SteamAPI_ISteamUtils_GetEnteredGamepadTextLength(interface))
    }

    /// Steamworks `ISteamUtils::GetIPCCallCount()`
    public func getIPCCallCount() -> Int {
        Int(SteamAPI_ISteamUtils_GetIPCCallCount(interface))
    }

    /// Steamworks `ISteamUtils::GetIPCountry()`
    public func getIPCountry() -> String {
        String(SteamAPI_ISteamUtils_GetIPCountry(interface))
    }

    /// Steamworks `ISteamUtils::GetIPv6ConnectivityState()`
    public func getIPv6ConnectivityState(`protocol`: SteamIPv6ConnectivityProtocol) -> SteamIPv6ConnectivityState {
        SteamIPv6ConnectivityState(SteamAPI_ISteamUtils_GetIPv6ConnectivityState(interface, ESteamIPv6ConnectivityProtocol(`protocol`)))
    }

    /// Steamworks `ISteamUtils::GetImageRGBA()`
    public func getImageRGBA(imageIndex: Int, dest: UnsafeMutablePointer<UInt8>, destBufferSize: Int) -> Bool {
        SteamAPI_ISteamUtils_GetImageRGBA(interface, Int32(imageIndex), dest, Int32(destBufferSize))
    }

    /// Steamworks `ISteamUtils::GetImageSize()`
    public func getImageSize(imageIndex: Int, width: inout Int, height: inout Int) -> Bool {
        var tmp_width = uint32()
        var tmp_height = uint32()
        let rc = SteamAPI_ISteamUtils_GetImageSize(interface, Int32(imageIndex), &tmp_width, &tmp_height)
        if rc {
            width = Int(tmp_width)
            height = Int(tmp_height)
        }
        return rc
    }

    /// Steamworks `ISteamUtils::GetSecondsSinceAppActive()`
    public func getSecondsSinceAppActive() -> Int {
        Int(SteamAPI_ISteamUtils_GetSecondsSinceAppActive(interface))
    }

    /// Steamworks `ISteamUtils::GetSecondsSinceComputerActive()`
    public func getSecondsSinceComputerActive() -> Int {
        Int(SteamAPI_ISteamUtils_GetSecondsSinceComputerActive(interface))
    }

    /// Steamworks `ISteamUtils::GetServerRealTime()`
    public func getServerRealTime() -> RTime32 {
        RTime32(SteamAPI_ISteamUtils_GetServerRealTime(interface))
    }

    /// Steamworks `ISteamUtils::GetSteamUILanguage()`
    public func getSteamUILanguage() -> String {
        String(SteamAPI_ISteamUtils_GetSteamUILanguage(interface))
    }

    /// Steamworks `ISteamUtils::InitFilterText()`
    public func initFilterText(filterOptions: Int) -> Bool {
        SteamAPI_ISteamUtils_InitFilterText(interface, uint32(filterOptions))
    }

    /// Steamworks `ISteamUtils::IsAPICallCompleted()`
    public func isAPICallCompleted(steamAPICall: SteamAPICall, failed: inout Bool) -> Bool {
        SteamAPI_ISteamUtils_IsAPICallCompleted(interface, SteamAPICall_t(steamAPICall), &failed)
    }

    /// Steamworks `ISteamUtils::IsOverlayEnabled()`
    public func isOverlayEnabled() -> Bool {
        SteamAPI_ISteamUtils_IsOverlayEnabled(interface)
    }

    /// Steamworks `ISteamUtils::IsSteamChinaLauncher()`
    public func isSteamChinaLauncher() -> Bool {
        SteamAPI_ISteamUtils_IsSteamChinaLauncher(interface)
    }

    /// Steamworks `ISteamUtils::IsSteamInBigPictureMode()`
    public func isSteamInBigPictureMode() -> Bool {
        SteamAPI_ISteamUtils_IsSteamInBigPictureMode(interface)
    }

    /// Steamworks `ISteamUtils::IsSteamRunningInVR()`
    public func isSteamRunningInVR() -> Bool {
        SteamAPI_ISteamUtils_IsSteamRunningInVR(interface)
    }

    /// Steamworks `ISteamUtils::IsSteamRunningOnSteamDeck()`
    public func isSteamRunningOnSteamDeck() -> Bool {
        SteamAPI_ISteamUtils_IsSteamRunningOnSteamDeck(interface)
    }

    /// Steamworks `ISteamUtils::IsVRHeadsetStreamingEnabled()`
    public func isVRHeadsetStreamingEnabled() -> Bool {
        SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled(interface)
    }

    /// Steamworks `ISteamUtils::SetGameLauncherMode()`
    public func setGameLauncherMode(launcherMode: Bool) {
        SteamAPI_ISteamUtils_SetGameLauncherMode(interface, launcherMode)
    }

    /// Steamworks `ISteamUtils::SetOverlayNotificationInset()`
    public func setOverlayNotificationInset(horizontalInset: Int, verticalInset: Int) {
        SteamAPI_ISteamUtils_SetOverlayNotificationInset(interface, Int32(horizontalInset), Int32(verticalInset))
    }

    /// Steamworks `ISteamUtils::SetOverlayNotificationPosition()`
    public func setOverlayNotificationPosition(notificationPosition: NotificationPosition) {
        SteamAPI_ISteamUtils_SetOverlayNotificationPosition(interface, ENotificationPosition(notificationPosition))
    }

    /// Steamworks `ISteamUtils::SetVRHeadsetStreamingEnabled()`
    public func setVRHeadsetStreamingEnabled(enabled: Bool) {
        SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled(interface, enabled)
    }

    /// Steamworks `ISteamUtils::ShowGamepadTextInput()`
    public func showGamepadTextInput(inputMode: GamepadTextInputMode, lineInputMode: GamepadTextInputLineMode, description: String, charMax: Int, existingText: String) -> Bool {
        SteamAPI_ISteamUtils_ShowGamepadTextInput(interface, EGamepadTextInputMode(inputMode), EGamepadTextInputLineMode(lineInputMode), description, uint32(charMax), existingText)
    }

    /// Steamworks `ISteamUtils::ShowModalGamepadTextInput()`
    public func showModalGamepadTextInput(lineInputMode: GamepadTextInputLineMode) -> Bool {
        SteamAPI_ISteamUtils_ShowModalGamepadTextInput(interface, EGamepadTextInputLineMode(lineInputMode))
    }

    /// Steamworks `ISteamUtils::StartVRDashboard()`
    public func startVRDashboard() {
        SteamAPI_ISteamUtils_StartVRDashboard(interface)
    }
}
