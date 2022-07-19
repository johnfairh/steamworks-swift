//
//  SteamGameServer.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamGameServer`](https://partner.steamgames.com/doc/api/ISteamGameServer)
///
/// Access via `SteamGameServerAPI.gameServer`.
public struct SteamGameServer {
    var interface: UnsafeMutablePointer<ISteamGameServer> {
        SteamAPI_SteamGameServer_v014()
    }

    init() {
    }

    /// Steamworks `ISteamGameServer::AssociateWithClan()`, callback
    public func associateWithClan(clan: SteamID, completion: @escaping (AssociateWithClanResult?) -> Void) {
        let rc = SteamAPI_ISteamGameServer_AssociateWithClan(interface, CUnsignedLongLong(clan))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamGameServer::AssociateWithClan()`, async
    public func associateWithClan(clan: SteamID) async -> AssociateWithClanResult? {
        await withUnsafeContinuation {
            associateWithClan(clan: clan, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamGameServer::BLoggedOn()`
    public func loggedOn() -> Bool {
        SteamAPI_ISteamGameServer_BLoggedOn(interface)
    }

    /// Steamworks `ISteamGameServer::BSecure()`
    public func secure() -> Bool {
        SteamAPI_ISteamGameServer_BSecure(interface)
    }

    /// Steamworks `ISteamGameServer::BUpdateUserData()`
    public func updateUserData(user: SteamID, playerName: String, score: Int) -> Bool {
        SteamAPI_ISteamGameServer_BUpdateUserData(interface, CUnsignedLongLong(user), playerName, uint32(score))
    }

    /// Steamworks `ISteamGameServer::BeginAuthSession()`
    public func beginAuthSession(authTicket: [UInt8], steamID: SteamID) -> BeginAuthSessionResult {
        BeginAuthSessionResult(SteamAPI_ISteamGameServer_BeginAuthSession(interface, authTicket, CInt(authTicket.count), CUnsignedLongLong(steamID)))
    }

    /// Steamworks `ISteamGameServer::CancelAuthTicket()`
    public func cancelAuthTicket(authTicket: HAuthTicket) {
        SteamAPI_ISteamGameServer_CancelAuthTicket(interface, CSteamworks.HAuthTicket(authTicket))
    }

    /// Steamworks `ISteamGameServer::ClearAllKeyValues()`
    public func clearAllKeyValues() {
        SteamAPI_ISteamGameServer_ClearAllKeyValues(interface)
    }

    /// Steamworks `ISteamGameServer::ComputeNewPlayerCompatibility()`, callback
    public func computeNewPlayerCompatibility(newPlayer: SteamID, completion: @escaping (ComputeNewPlayerCompatibilityResult?) -> Void) {
        let rc = SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility(interface, CUnsignedLongLong(newPlayer))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamGameServer::ComputeNewPlayerCompatibility()`, async
    public func computeNewPlayerCompatibility(newPlayer: SteamID) async -> ComputeNewPlayerCompatibilityResult? {
        await withUnsafeContinuation {
            computeNewPlayerCompatibility(newPlayer: newPlayer, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamGameServer::CreateUnauthenticatedUserConnection()`
    public func createUnauthenticatedUserConnection() -> SteamID {
        SteamID(SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection(interface))
    }

    /// Steamworks `ISteamGameServer::EndAuthSession()`
    public func endAuthSession(steamID: SteamID) {
        SteamAPI_ISteamGameServer_EndAuthSession(interface, CUnsignedLongLong(steamID))
    }

    /// Steamworks `ISteamGameServer::GetAuthSessionTicket()`
    public func getAuthSessionTicket(maxTicketSize: Int = 1024) -> (rc: HAuthTicket, ticket: [UInt8], ticketSize: Int) {
        var tmpTicket = SteamTransOutArray<UInt8>(maxTicketSize)
        var tmpTicketSize = uint32()
        let rc = tmpTicket.setContent { nstTicket in
            HAuthTicket(SteamAPI_ISteamGameServer_GetAuthSessionTicket(interface, nstTicket, CInt(maxTicketSize), &tmpTicketSize))
        }
        return (rc: rc, ticket: tmpTicket.swiftArray.safePrefix(tmpTicketSize), ticketSize: Int(tmpTicketSize))
    }

    /// Steamworks `ISteamGameServer::GetGameplayStats()`
    public func getGameplayStats() {
        SteamAPI_ISteamGameServer_GetGameplayStats(interface)
    }

    /// Steamworks `ISteamGameServer::GetNextOutgoingPacket()`
    public func getNextOutgoingPacket(out: /*OUT_BUF*/UnsafeMutableRawPointer, maxOutSize: Int) -> (rc: Int, netAdr: Int, port: UInt16) {
        var tmpNetAdr = uint32()
        var tmpPort = uint16()
        let rc = Int(SteamAPI_ISteamGameServer_GetNextOutgoingPacket(interface, out, CInt(maxOutSize), &tmpNetAdr, &tmpPort))
        return (rc: rc, netAdr: Int(tmpNetAdr), port: tmpPort)
    }

    /// Steamworks `ISteamGameServer::GetPublicIP()`
    public func getPublicIP() -> SteamIPAddress {
        SteamIPAddress(SteamAPI_ISteamGameServer_GetPublicIP(interface))
    }

    /// Steamworks `ISteamGameServer::GetServerReputation()`, callback
    public func getServerReputation(completion: @escaping (GSReputation?) -> Void) {
        let rc = SteamAPI_ISteamGameServer_GetServerReputation(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamGameServer::GetServerReputation()`, async
    public func getServerReputation() async -> GSReputation? {
        await withUnsafeContinuation {
            getServerReputation(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamGameServer::GetSteamID()`
    public func getSteamID() -> SteamID {
        SteamID(SteamAPI_ISteamGameServer_GetSteamID(interface))
    }

    /// Steamworks `ISteamGameServer::HandleIncomingPacket()`
    public func handleIncomingPacket(data: UnsafeRawPointer, dataSize: Int, srcIP: Int, srcPort: UInt16) -> Bool {
        SteamAPI_ISteamGameServer_HandleIncomingPacket(interface, data, CInt(dataSize), uint32(srcIP), srcPort)
    }

    /// Steamworks `ISteamGameServer::LogOff()`
    public func logOff() {
        SteamAPI_ISteamGameServer_LogOff(interface)
    }

    /// Steamworks `ISteamGameServer::LogOn()`
    public func logOn(token: String) {
        SteamAPI_ISteamGameServer_LogOn(interface, token)
    }

    /// Steamworks `ISteamGameServer::LogOnAnonymous()`
    public func logOnAnonymous() {
        SteamAPI_ISteamGameServer_LogOnAnonymous(interface)
    }

    /// Steamworks `ISteamGameServer::RequestUserGroupStatus()`
    public func requestUserGroupStatus(user: SteamID, group: SteamID) -> Bool {
        SteamAPI_ISteamGameServer_RequestUserGroupStatus(interface, CUnsignedLongLong(user), CUnsignedLongLong(group))
    }

    /// Steamworks `ISteamGameServer::SendUserConnectAndAuthenticate_DEPRECATED()`
    public func sendUserConnectAndAuthenticateDEPRECATED(ipClient: Int, authBlob: UnsafeRawPointer, authBlobSize: Int) -> (rc: Bool, user: SteamID) {
        var tmpUser = CSteamID()
        let rc = SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate_DEPRECATED(interface, uint32(ipClient), authBlob, uint32(authBlobSize), &tmpUser)
        return (rc: rc, user: SteamID(tmpUser))
    }

    /// Steamworks `ISteamGameServer::SendUserDisconnect_DEPRECATED()`
    public func sendUserDisconnectDEPRECATED(user: SteamID) {
        SteamAPI_ISteamGameServer_SendUserDisconnect_DEPRECATED(interface, CUnsignedLongLong(user))
    }

    /// Steamworks `ISteamGameServer::SetAdvertiseServerActive()`
    public func setAdvertiseServerActive(active: Bool) {
        SteamAPI_ISteamGameServer_SetAdvertiseServerActive(interface, active)
    }

    /// Steamworks `ISteamGameServer::SetBotPlayerCount()`
    public func setBotPlayerCount(botplayers: Int) {
        SteamAPI_ISteamGameServer_SetBotPlayerCount(interface, CInt(botplayers))
    }

    /// Steamworks `ISteamGameServer::SetDedicatedServer()`
    public func setDedicatedServer(dedicated: Bool) {
        SteamAPI_ISteamGameServer_SetDedicatedServer(interface, dedicated)
    }

    /// Steamworks `ISteamGameServer::SetGameData()`
    public func setGameData(gameData: String) {
        SteamAPI_ISteamGameServer_SetGameData(interface, gameData)
    }

    /// Steamworks `ISteamGameServer::SetGameDescription()`
    public func setGameDescription(gameDescription: String) {
        SteamAPI_ISteamGameServer_SetGameDescription(interface, gameDescription)
    }

    /// Steamworks `ISteamGameServer::SetGameTags()`
    public func setGameTags(gameTags: String) {
        SteamAPI_ISteamGameServer_SetGameTags(interface, gameTags)
    }

    /// Steamworks `ISteamGameServer::SetKeyValue()`
    public func setKeyValue(key: String, value: String) {
        SteamAPI_ISteamGameServer_SetKeyValue(interface, key, value)
    }

    /// Steamworks `ISteamGameServer::SetMapName()`
    public func setMapName(mapName: String) {
        SteamAPI_ISteamGameServer_SetMapName(interface, mapName)
    }

    /// Steamworks `ISteamGameServer::SetMaxPlayerCount()`
    public func setMaxPlayerCount(playersMax: Int) {
        SteamAPI_ISteamGameServer_SetMaxPlayerCount(interface, CInt(playersMax))
    }

    /// Steamworks `ISteamGameServer::SetModDir()`
    public func setModDir(modDir: String) {
        SteamAPI_ISteamGameServer_SetModDir(interface, modDir)
    }

    /// Steamworks `ISteamGameServer::SetPasswordProtected()`
    public func setPasswordProtected(passwordProtected: Bool) {
        SteamAPI_ISteamGameServer_SetPasswordProtected(interface, passwordProtected)
    }

    /// Steamworks `ISteamGameServer::SetProduct()`
    public func setProduct(product: String) {
        SteamAPI_ISteamGameServer_SetProduct(interface, product)
    }

    /// Steamworks `ISteamGameServer::SetRegion()`
    public func setRegion(region: String) {
        SteamAPI_ISteamGameServer_SetRegion(interface, region)
    }

    /// Steamworks `ISteamGameServer::SetServerName()`
    public func setServerName(serverName: String) {
        SteamAPI_ISteamGameServer_SetServerName(interface, serverName)
    }

    /// Steamworks `ISteamGameServer::SetSpectatorPort()`
    public func setSpectatorPort(spectatorPort: UInt16) {
        SteamAPI_ISteamGameServer_SetSpectatorPort(interface, spectatorPort)
    }

    /// Steamworks `ISteamGameServer::SetSpectatorServerName()`
    public func setSpectatorServerName(spectatorServerName: String) {
        SteamAPI_ISteamGameServer_SetSpectatorServerName(interface, spectatorServerName)
    }

    /// Steamworks `ISteamGameServer::UserHasLicenseForApp()`
    public func userHasLicenseForApp(steamID: SteamID, id: AppID) -> UserHasLicenseForAppResult {
        UserHasLicenseForAppResult(SteamAPI_ISteamGameServer_UserHasLicenseForApp(interface, CUnsignedLongLong(steamID), AppId_t(id)))
    }

    /// Steamworks `ISteamGameServer::WasRestartRequested()`
    public func wasRestartRequested() -> Bool {
        SteamAPI_ISteamGameServer_WasRestartRequested(interface)
    }
}
