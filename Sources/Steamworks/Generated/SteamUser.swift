//
//  SteamUser.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

internal import CSteamworks

/// Steamworks [`ISteamUser`](https://partner.steamgames.com/doc/api/ISteamUser)
///
/// Access via ``SteamAPI/user``.
public struct SteamUser: Sendable {
    var interface: UnsafeMutablePointer<ISteamUser> {
        SteamAPI_SteamUser_v023()
    }

    init() {
    }

    /// Steamworks `ISteamUser::AdvertiseGame()`
    public func advertiseGame(gameServer: SteamID, ipServer: Int, portServer: UInt16) {
        SteamAPI_ISteamUser_AdvertiseGame(interface, CUnsignedLongLong(gameServer), uint32(ipServer), portServer)
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
    @discardableResult
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
    public func getAuthSessionTicket(maxTicketSize: Int = 1024, steamNetworkingIdentity: SteamNetworkingIdentity?) -> (rc: HAuthTicket, ticket: [UInt8], ticketSize: Int) {
        var tmpTicket = SteamTransOutArray<UInt8>(maxTicketSize)
        var tmpTicketSize = uint32()
        let tmpSteamNetworkingIdentity = SteamNullable<CSteamworks.SteamNetworkingIdentity>(steamNetworkingIdentity)
        defer { tmpSteamNetworkingIdentity.deallocate() }
        let rc = tmpTicket.setContent { nstTicket in
            HAuthTicket(SteamAPI_ISteamUser_GetAuthSessionTicket(interface, nstTicket, CInt(maxTicketSize), &tmpTicketSize, tmpSteamNetworkingIdentity.steamValue))
        }
        return (rc: rc, ticket: tmpTicket.swiftArray(Int(tmpTicketSize)), ticketSize: Int(tmpTicketSize))
    }

    /// Steamworks `ISteamUser::GetAuthTicketForWebApi()`
    public func getAuthTicketForWebApi(identity: String?) -> HAuthTicket {
        HAuthTicket(SteamAPI_ISteamUser_GetAuthTicketForWebApi(interface, identity))
    }

    /// Steamworks `ISteamUser::GetAvailableVoice()`
    public func getAvailableVoice(uncompressedVoiceDesiredSampleRateDeprecated: Int = 0) -> (rc: VoiceResult, compressedSize: Int, uncompressedDeprecatedSize: Int) {
        var tmpCompressedSize = uint32()
        var tmpUncompressedDeprecatedSize = uint32()
        let rc = VoiceResult(SteamAPI_ISteamUser_GetAvailableVoice(interface, &tmpCompressedSize, &tmpUncompressedDeprecatedSize, uint32(uncompressedVoiceDesiredSampleRateDeprecated)))
        return (rc: rc, compressedSize: Int(tmpCompressedSize), uncompressedDeprecatedSize: Int(tmpUncompressedDeprecatedSize))
    }

    /// Steamworks `ISteamUser::GetDurationControl()`, callback
    public func getDurationControl(completion: @Sendable @escaping (sending DurationControl?) -> Void) {
        let rc = SteamAPI_ISteamUser_GetDurationControl(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUser::GetDurationControl()`, async
    public func getDurationControl(isolation: isolated (any Actor)? = #isolation) async -> DurationControl? {
        await withUnsafeContinuation {
            getDurationControl(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUser::GetEncryptedAppTicket()`
    public func getEncryptedAppTicket(returnTicket: Bool = true, maxTicketSize: Int) -> (rc: Bool, ticket: [UInt8], ticketSize: Int) {
        var tmpTicket = SteamTransOutArray<UInt8>(maxTicketSize, returnTicket)
        var tmpTicketSize = uint32()
        let rc = tmpTicket.setContent { nstTicket in
            SteamAPI_ISteamUser_GetEncryptedAppTicket(interface, nstTicket, CInt(maxTicketSize), &tmpTicketSize)
        }
        return (rc: rc, ticket: tmpTicket.swiftArray(Int(tmpTicketSize)), ticketSize: Int(tmpTicketSize))
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
    public func getMarketEligibility(completion: @Sendable @escaping (sending MarketEligibilityResponse?) -> Void) {
        let rc = SteamAPI_ISteamUser_GetMarketEligibility(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUser::GetMarketEligibility()`, async
    public func getMarketEligibility(isolation: isolated (any Actor)? = #isolation) async -> MarketEligibilityResponse? {
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
    public func getUserDataFolder(bufferSize: Int = SteamConstants.filenameMaxSize) -> (rc: Bool, buffer: String) {
        var tmpBuffer = SteamOutString(length: bufferSize)
        let rc = tmpBuffer.setContent { nstBuffer in
            SteamAPI_ISteamUser_GetUserDataFolder(interface, nstBuffer, CInt(bufferSize))
        }
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
    public func initiateGameConnectionDEPRECATED(authBlob: UnsafeMutableRawPointer, maxAuthBlobSize: Int, gameServer: SteamID, ipServer: Int, portServer: UInt16, secure: Bool) -> Int {
        Int(SteamAPI_ISteamUser_InitiateGameConnection_DEPRECATED(interface, authBlob, CInt(maxAuthBlobSize), CUnsignedLongLong(gameServer), uint32(ipServer), portServer, secure))
    }

    /// Steamworks `ISteamUser::RequestEncryptedAppTicket()`, callback
    public func requestEncryptedAppTicket(dataToInclude: [UInt8], completion: @Sendable @escaping (sending EncryptedAppTicketResponse?) -> Void) {
        let rc = CSteamAPI_ISteamUser_RequestEncryptedAppTicket(interface, dataToInclude, CInt(dataToInclude.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUser::RequestEncryptedAppTicket()`, async
    public func requestEncryptedAppTicket(isolation: isolated (any Actor)? = #isolation, dataToInclude: [UInt8]) async -> EncryptedAppTicketResponse? {
        await withUnsafeContinuation {
            requestEncryptedAppTicket(dataToInclude: dataToInclude, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUser::RequestStoreAuthURL()`, callback
    public func requestStoreAuthURL(redirectURL: String, completion: @Sendable @escaping (sending StoreAuthURLResponse?) -> Void) {
        let rc = SteamAPI_ISteamUser_RequestStoreAuthURL(interface, redirectURL)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUser::RequestStoreAuthURL()`, async
    public func requestStoreAuthURL(isolation: isolated (any Actor)? = #isolation, redirectURL: String) async -> StoreAuthURLResponse? {
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
    public func terminateGameConnectionDEPRECATED(ipServer: Int, portServer: UInt16) {
        SteamAPI_ISteamUser_TerminateGameConnection_DEPRECATED(interface, uint32(ipServer), portServer)
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
