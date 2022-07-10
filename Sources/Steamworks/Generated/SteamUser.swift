//
//  SteamUser.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamUser`](https://partner.steamgames.com/doc/api/ISteamUser)
///
/// Access via `SteamAPI.user`.
public struct SteamUser {
    var interface: UnsafeMutablePointer<ISteamUser> {
        SteamAPI_SteamUser_v021()
    }

    init() {
    }

    /// Steamworks `ISteamUser::AdvertiseGame()`
    public func advertiseGame(gameServer: SteamID, ipServer: Int, portServer: Int) {
        SteamAPI_ISteamUser_AdvertiseGame(interface, CUnsignedLongLong(gameServer), uint32(ipServer), uint16(portServer))
    }

    /// Steamworks `ISteamUser::BIsBehindNAT()`
    public func isBehindNAT() -> Bool {
        SteamAPI_ISteamUser_BIsBehindNAT(interface)
    }

    /// Steamworks `ISteamUser::BIsPhoneIdentifying()`
    public func isPhoneIdentifying() -> Bool {
        SteamAPI_ISteamUser_BIsPhoneIdentifying(interface)
    }

    /// Steamworks `ISteamUser::BIsPhoneRequiringVerification()`
    public func isPhoneRequiringVerification() -> Bool {
        SteamAPI_ISteamUser_BIsPhoneRequiringVerification(interface)
    }

    /// Steamworks `ISteamUser::BIsPhoneVerified()`
    public func isPhoneVerified() -> Bool {
        SteamAPI_ISteamUser_BIsPhoneVerified(interface)
    }

    /// Steamworks `ISteamUser::BIsTwoFactorEnabled()`
    public func isTwoFactorEnabled() -> Bool {
        SteamAPI_ISteamUser_BIsTwoFactorEnabled(interface)
    }

    /// Steamworks `ISteamUser::BLoggedOn()`
    public func loggedOn() -> Bool {
        SteamAPI_ISteamUser_BLoggedOn(interface)
    }

    /// Steamworks `ISteamUser::BSetDurationControlOnlineState()`
    public func setDurationControlOnlineState(newState: DurationControlOnlineState) -> Bool {
        SteamAPI_ISteamUser_BSetDurationControlOnlineState(interface, EDurationControlOnlineState(newState))
    }

    /// Steamworks `ISteamUser::BeginAuthSession()`
    public func beginAuthSession(authTicket: UnsafeRawPointer, authTicketSize: Int, steamID: SteamID) -> BeginAuthSessionResult {
        BeginAuthSessionResult(SteamAPI_ISteamUser_BeginAuthSession(interface, authTicket, CInt(authTicketSize), CUnsignedLongLong(steamID)))
    }

    /// Steamworks `ISteamUser::CancelAuthTicket()`
    public func cancelAuthTicket(authTicket: HAuthTicket) {
        SteamAPI_ISteamUser_CancelAuthTicket(interface, CSteamworks.HAuthTicket(authTicket))
    }

    /// Steamworks `ISteamUser::DecompressVoice()`
    public func decompressVoice(compressed: UnsafeRawPointer, compressedSize: Int, destBuffer: UnsafeMutableRawPointer, destBufferSize: Int, desiredSampleRate: Int) -> (rc: VoiceResult, bytesWritten: Int) {
        var tmpBytesWritten = uint32()
        let rc = VoiceResult(SteamAPI_ISteamUser_DecompressVoice(interface, compressed, uint32(compressedSize), destBuffer, uint32(destBufferSize), &tmpBytesWritten, uint32(desiredSampleRate)))
        return (rc: rc, bytesWritten: Int(tmpBytesWritten))
    }

    /// Steamworks `ISteamUser::EndAuthSession()`
    public func endAuthSession(steamID: SteamID) {
        SteamAPI_ISteamUser_EndAuthSession(interface, CUnsignedLongLong(steamID))
    }

    /// Steamworks `ISteamUser::GetAuthSessionTicket()`
    public func getAuthSessionTicket(ticket: UnsafeMutableRawPointer, maxTicketSize: Int) -> (rc: HAuthTicket, ticketSize: Int) {
        var tmpTicketSize = uint32()
        let rc = HAuthTicket(SteamAPI_ISteamUser_GetAuthSessionTicket(interface, ticket, CInt(maxTicketSize), &tmpTicketSize))
        return (rc: rc, ticketSize: Int(tmpTicketSize))
    }

    /// Steamworks `ISteamUser::GetAvailableVoice()`
    public func getAvailableVoice(uncompressedVoiceDesiredSampleRateDeprecated: Int = 0) -> (rc: VoiceResult, compressedSize: Int, uncompressedDeprecatedSize: Int) {
        var tmpCompressedSize = uint32()
        var tmpUncompressedDeprecatedSize = uint32()
        let rc = VoiceResult(SteamAPI_ISteamUser_GetAvailableVoice(interface, &tmpCompressedSize, &tmpUncompressedDeprecatedSize, uint32(uncompressedVoiceDesiredSampleRateDeprecated)))
        return (rc: rc, compressedSize: Int(tmpCompressedSize), uncompressedDeprecatedSize: Int(tmpUncompressedDeprecatedSize))
    }

    /// Steamworks `ISteamUser::GetDurationControl()`, callback
    public func getDurationControl(completion: @escaping (DurationControl?) -> Void) {
        let rc = SteamAPI_ISteamUser_GetDurationControl(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUser::GetDurationControl()`, async
    public func getDurationControl() async -> DurationControl? {
        await withUnsafeContinuation {
            getDurationControl(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUser::GetEncryptedAppTicket()`
    public func getEncryptedAppTicket(ticket: UnsafeMutableRawPointer, maxTicketSize: Int) -> (rc: Bool, ticketSize: Int) {
        var tmpTicketSize = uint32()
        let rc = SteamAPI_ISteamUser_GetEncryptedAppTicket(interface, ticket, CInt(maxTicketSize), &tmpTicketSize)
        return (rc: rc, ticketSize: Int(tmpTicketSize))
    }

    /// Steamworks `ISteamUser::GetGameBadgeLevel()`
    public func getGameBadgeLevel(series: Int, foil: Bool) -> Int {
        Int(SteamAPI_ISteamUser_GetGameBadgeLevel(interface, CInt(series), foil))
    }

    /// Steamworks `ISteamUser::GetHSteamUser()`
    public func getHSteamUser() -> HSteamUser {
        HSteamUser(SteamAPI_ISteamUser_GetHSteamUser(interface))
    }

    /// Steamworks `ISteamUser::GetMarketEligibility()`, callback
    public func getMarketEligibility(completion: @escaping (MarketEligibilityResponse?) -> Void) {
        let rc = SteamAPI_ISteamUser_GetMarketEligibility(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUser::GetMarketEligibility()`, async
    public func getMarketEligibility() async -> MarketEligibilityResponse? {
        await withUnsafeContinuation {
            getMarketEligibility(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUser::GetPlayerSteamLevel()`
    public func getPlayerSteamLevel() -> Int {
        Int(SteamAPI_ISteamUser_GetPlayerSteamLevel(interface))
    }

    /// Steamworks `ISteamUser::GetSteamID()`
    public func getSteamID() -> SteamID {
        SteamID(SteamAPI_ISteamUser_GetSteamID(interface))
    }

    /// Steamworks `ISteamUser::GetUserDataFolder()`
    public func getUserDataFolder(bufferSize: Int) -> (rc: Bool, buffer: String) {
        let tmpBuffer = SteamString(length: bufferSize) /* OUT_STR */
        let rc = SteamAPI_ISteamUser_GetUserDataFolder(interface, tmpBuffer.charBuffer, CInt(bufferSize))
        if rc {
            return (rc: rc, buffer: tmpBuffer.swiftString)
        } else {
            return (rc: rc, buffer: "")
        }
    }

    /// Steamworks `ISteamUser::GetVoice()`
    public func getVoice(wantCompressed: Bool, destBuffer: UnsafeMutableRawPointer, destBufferSize: Int, wantUncompressedDeprecated: Bool = false, uncompressedDestBufferDeprecated: UnsafeMutableRawPointer? = nil, uncompressedDestBufferSizeDeprecatedSize: Int = 0, uncompressedVoiceDesiredSampleRateDeprecated: Int = 0) -> (rc: VoiceResult, bytesWritten: Int, uncompressBytesWrittenDeprecated: Int) {
        var tmpBytesWritten = uint32()
        var tmpUncompressBytesWrittenDeprecated = uint32()
        let rc = VoiceResult(SteamAPI_ISteamUser_GetVoice(interface, wantCompressed, destBuffer, uint32(destBufferSize), &tmpBytesWritten, wantUncompressedDeprecated, uncompressedDestBufferDeprecated, uint32(uncompressedDestBufferSizeDeprecatedSize), &tmpUncompressBytesWrittenDeprecated, uint32(uncompressedVoiceDesiredSampleRateDeprecated)))
        return (rc: rc, bytesWritten: Int(tmpBytesWritten), uncompressBytesWrittenDeprecated: Int(tmpUncompressBytesWrittenDeprecated))
    }

    /// Steamworks `ISteamUser::GetVoiceOptimalSampleRate()`
    public func getVoiceOptimalSampleRate() -> Int {
        Int(SteamAPI_ISteamUser_GetVoiceOptimalSampleRate(interface))
    }

    /// Steamworks `ISteamUser::InitiateGameConnection_DEPRECATED()`
    public func initiateGameConnectionDEPRECATED(authBlob: UnsafeMutableRawPointer, maxAuthBlobSize: Int, gameServer: SteamID, ipServer: Int, portServer: Int, secure: Bool) -> Int {
        Int(SteamAPI_ISteamUser_InitiateGameConnection_DEPRECATED(interface, authBlob, CInt(maxAuthBlobSize), CUnsignedLongLong(gameServer), uint32(ipServer), uint16(portServer), secure))
    }

    /// Steamworks `ISteamUser::RequestEncryptedAppTicket()`, callback
    public func requestEncryptedAppTicket(dataToInclude: UnsafeMutableRawPointer, dataToIncludeSize: Int, completion: @escaping (EncryptedAppTicketResponse?) -> Void) {
        let rc = SteamAPI_ISteamUser_RequestEncryptedAppTicket(interface, dataToInclude, CInt(dataToIncludeSize))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUser::RequestEncryptedAppTicket()`, async
    public func requestEncryptedAppTicket(dataToInclude: UnsafeMutableRawPointer, dataToIncludeSize: Int) async -> EncryptedAppTicketResponse? {
        await withUnsafeContinuation {
            requestEncryptedAppTicket(dataToInclude: dataToInclude, dataToIncludeSize: dataToIncludeSize, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUser::RequestStoreAuthURL()`, callback
    public func requestStoreAuthURL(redirectURL: String, completion: @escaping (StoreAuthURLResponse?) -> Void) {
        let rc = SteamAPI_ISteamUser_RequestStoreAuthURL(interface, redirectURL)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUser::RequestStoreAuthURL()`, async
    public func requestStoreAuthURL(redirectURL: String) async -> StoreAuthURLResponse? {
        await withUnsafeContinuation {
            requestStoreAuthURL(redirectURL: redirectURL, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUser::StartVoiceRecording()`
    public func startVoiceRecording() {
        SteamAPI_ISteamUser_StartVoiceRecording(interface)
    }

    /// Steamworks `ISteamUser::StopVoiceRecording()`
    public func stopVoiceRecording() {
        SteamAPI_ISteamUser_StopVoiceRecording(interface)
    }

    /// Steamworks `ISteamUser::TerminateGameConnection_DEPRECATED()`
    public func terminateGameConnectionDEPRECATED(ipServer: Int, portServer: Int) {
        SteamAPI_ISteamUser_TerminateGameConnection_DEPRECATED(interface, uint32(ipServer), uint16(portServer))
    }

    /// Steamworks `ISteamUser::TrackAppUsageEvent()`
    public func trackAppUsageEvent(id: GameID, appUsageEvent: Int, extraInfo: String) {
        SteamAPI_ISteamUser_TrackAppUsageEvent(interface, CUnsignedLongLong(id), CInt(appUsageEvent), extraInfo)
    }

    /// Steamworks `ISteamUser::UserHasLicenseForApp()`
    public func userHasLicenseForApp(steamID: SteamID, id: AppID) -> UserHasLicenseForAppResult {
        UserHasLicenseForAppResult(SteamAPI_ISteamUser_UserHasLicenseForApp(interface, CUnsignedLongLong(steamID), AppId_t(id)))
    }
}
