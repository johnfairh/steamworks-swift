//
//  SteamMatchmaking.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamMatchmaking`](https://partner.steamgames.com/doc/api/ISteamMatchmaking)
///
/// Access via `SteamAPI.matchmaking`.
public struct SteamMatchmaking: Sendable {
    var interface: UnsafeMutablePointer<ISteamMatchmaking> {
        SteamAPI_SteamMatchmaking_v009()
    }

    init() {
    }

    /// Steamworks `ISteamMatchmaking::AddFavoriteGame()`
    public func addFavoriteGame(appID: AppID, ip: Int, connPort: UInt16, queryPort: UInt16, flags: FavoriteFlags, time32LastPlayedOnServer: RTime32) -> Int {
        Int(CSteamAPI_ISteamMatchmaking_AddFavoriteGame(interface, AppId_t(appID), uint32(ip), connPort, queryPort, EFavoriteFlags(flags), CSteamworks.RTime32(time32LastPlayedOnServer)))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListCompatibleMembersFilter()`
    public func addRequestLobbyListCompatibleMembersFilter(lobby: SteamID) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(interface, CUnsignedLongLong(lobby))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListDistanceFilter()`
    public func addRequestLobbyListDistanceFilter(lobbyDistanceFilter: LobbyDistanceFilter) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter(interface, ELobbyDistanceFilter(lobbyDistanceFilter))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListFilterSlotsAvailable()`
    public func addRequestLobbyListFilterSlotsAvailable(slotsAvailable: Int) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(interface, CInt(slotsAvailable))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListNearValueFilter()`
    public func addRequestLobbyListNearValueFilter(keyToMatch: String, valueToBeCloseTo: Int) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter(interface, keyToMatch, CInt(valueToBeCloseTo))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListNumericalFilter()`
    public func addRequestLobbyListNumericalFilter(keyToMatch: String, valueToMatch: Int, comparisonType: LobbyComparison) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter(interface, keyToMatch, CInt(valueToMatch), ELobbyComparison(comparisonType))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListResultCountFilter()`
    public func addRequestLobbyListResultCountFilter(maxResults: Int) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter(interface, CInt(maxResults))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListStringFilter()`
    public func addRequestLobbyListStringFilter(keyToMatch: String, valueToMatch: String, comparisonType: LobbyComparison) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter(interface, keyToMatch, valueToMatch, ELobbyComparison(comparisonType))
    }

    /// Steamworks `ISteamMatchmaking::CreateLobby()`, callback
    public func createLobby(lobbyType: LobbyType, maxMembers: Int, completion: @escaping (LobbyCreated?) -> Void) {
        let rc = SteamAPI_ISteamMatchmaking_CreateLobby(interface, ELobbyType(lobbyType), CInt(maxMembers))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamMatchmaking::CreateLobby()`, async
    public func createLobby(lobbyType: LobbyType, maxMembers: Int) async -> LobbyCreated? {
        await withUnsafeContinuation {
            createLobby(lobbyType: lobbyType, maxMembers: maxMembers, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamMatchmaking::DeleteLobbyData()`
    @discardableResult
    public func deleteLobbyData(lobby: SteamID, key: String) -> Bool {
        SteamAPI_ISteamMatchmaking_DeleteLobbyData(interface, CUnsignedLongLong(lobby), key)
    }

    /// Steamworks `ISteamMatchmaking::GetFavoriteGame()`
    public func getFavoriteGame(gameIndex: Int) -> (rc: Bool, appID: AppID, ip: Int, connPort: UInt16, queryPort: UInt16, flags: FavoriteFlags, rTime32LastPlayedOnServer: RTime32) {
        var tmpAppID = AppId_t()
        var tmpIp = uint32()
        var tmpConnPort = uint16()
        var tmpQueryPort = uint16()
        var tmpFlags = EFavoriteFlags(rawValue: 0)
        var tmpRTime32LastPlayedOnServer = CSteamworks.RTime32()
        let rc = CSteamAPI_ISteamMatchmaking_GetFavoriteGame(interface, CInt(gameIndex), &tmpAppID, &tmpIp, &tmpConnPort, &tmpQueryPort, &tmpFlags, &tmpRTime32LastPlayedOnServer)
        if rc {
            return (rc: rc, appID: AppID(tmpAppID), ip: Int(tmpIp), connPort: tmpConnPort, queryPort: tmpQueryPort, flags: FavoriteFlags(tmpFlags), rTime32LastPlayedOnServer: RTime32(tmpRTime32LastPlayedOnServer))
        } else {
            return (rc: rc, appID: 0, ip: 0, connPort: 0, queryPort: 0, flags: .none, rTime32LastPlayedOnServer: 0)
        }
    }

    /// Steamworks `ISteamMatchmaking::GetFavoriteGameCount()`
    public func getFavoriteGameCount() -> Int {
        Int(SteamAPI_ISteamMatchmaking_GetFavoriteGameCount(interface))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyByIndex()`
    public func getLobbyByIndex(lobbyIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamMatchmaking_GetLobbyByIndex(interface, CInt(lobbyIndex)))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyChatEntry()`
    public func getLobbyChatEntry(lobby: SteamID, chatIDIndex: Int, data: UnsafeMutableRawPointer, dataSize: Int) -> (rc: Int, user: SteamID, chatEntryType: ChatEntryType) {
        var tmpUser = CSteamID()
        var tmpChatEntryType = EChatEntryType(rawValue: 0)
        let rc = Int(SteamAPI_ISteamMatchmaking_GetLobbyChatEntry(interface, CUnsignedLongLong(lobby), CInt(chatIDIndex), &tmpUser, data, CInt(dataSize), &tmpChatEntryType))
        return (rc: rc, user: SteamID(tmpUser), chatEntryType: ChatEntryType(tmpChatEntryType))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyData()`
    public func getLobbyData(lobby: SteamID, key: String) -> String {
        String(SteamAPI_ISteamMatchmaking_GetLobbyData(interface, CUnsignedLongLong(lobby), key))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyDataByIndex()`
    public func getLobbyDataByIndex(lobby: SteamID, lobbyDataIndex: Int, keyBufferSize: Int = SteamConstants.maxLobbyKeyLength + 1, valueBufferSize: Int) -> (rc: Bool, key: String, value: String) {
        var tmpKey = SteamOutString(length: keyBufferSize)
        var tmpValue = SteamOutString(length: valueBufferSize)
        let rc = tmpKey.setContent { nstKey in
            tmpValue.setContent { nstValue in
                SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex(interface, CUnsignedLongLong(lobby), CInt(lobbyDataIndex), nstKey, CInt(keyBufferSize), nstValue, CInt(valueBufferSize))
            }
        }
        return (rc: rc, key: tmpKey.swiftString, value: tmpValue.swiftString)
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyDataCount()`
    public func getLobbyDataCount(lobby: SteamID) -> Int {
        Int(SteamAPI_ISteamMatchmaking_GetLobbyDataCount(interface, CUnsignedLongLong(lobby)))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyGameServer()`
    public func getLobbyGameServer(lobby: SteamID) -> (rc: Bool, gameServerIP: Int, gameServerPort: UInt16, gameServer: SteamID) {
        var tmpGameServerIP = uint32()
        var tmpGameServerPort = uint16()
        var tmpGameServer = CSteamID()
        let rc = SteamAPI_ISteamMatchmaking_GetLobbyGameServer(interface, CUnsignedLongLong(lobby), &tmpGameServerIP, &tmpGameServerPort, &tmpGameServer)
        if rc {
            return (rc: rc, gameServerIP: Int(tmpGameServerIP), gameServerPort: tmpGameServerPort, gameServer: SteamID(tmpGameServer))
        } else {
            return (rc: rc, gameServerIP: 0, gameServerPort: 0, gameServer: SteamID())
        }
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyMemberByIndex()`
    public func getLobbyMemberByIndex(lobby: SteamID, memberIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex(interface, CUnsignedLongLong(lobby), CInt(memberIndex)))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyMemberData()`
    public func getLobbyMemberData(lobby: SteamID, user: SteamID, key: String) -> String? {
        SteamAPI_ISteamMatchmaking_GetLobbyMemberData(interface, CUnsignedLongLong(lobby), CUnsignedLongLong(user), key).map { String($0) }
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyMemberLimit()`
    public func getLobbyMemberLimit(lobby: SteamID) -> Int {
        Int(SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit(interface, CUnsignedLongLong(lobby)))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyOwner()`
    public func getLobbyOwner(lobby: SteamID) -> SteamID {
        SteamID(SteamAPI_ISteamMatchmaking_GetLobbyOwner(interface, CUnsignedLongLong(lobby)))
    }

    /// Steamworks `ISteamMatchmaking::GetNumLobbyMembers()`
    public func getNumLobbyMembers(lobby: SteamID) -> Int {
        Int(SteamAPI_ISteamMatchmaking_GetNumLobbyMembers(interface, CUnsignedLongLong(lobby)))
    }

    /// Steamworks `ISteamMatchmaking::InviteUserToLobby()`
    @discardableResult
    public func inviteUserToLobby(lobby: SteamID, invitee: SteamID) -> Bool {
        SteamAPI_ISteamMatchmaking_InviteUserToLobby(interface, CUnsignedLongLong(lobby), CUnsignedLongLong(invitee))
    }

    /// Steamworks `ISteamMatchmaking::JoinLobby()`, callback
    public func joinLobby(lobby: SteamID, completion: @escaping (LobbyEnter?) -> Void) {
        let rc = SteamAPI_ISteamMatchmaking_JoinLobby(interface, CUnsignedLongLong(lobby))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamMatchmaking::JoinLobby()`, async
    public func joinLobby(lobby: SteamID) async -> LobbyEnter? {
        await withUnsafeContinuation {
            joinLobby(lobby: lobby, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamMatchmaking::LeaveLobby()`
    public func leaveLobby(lobby: SteamID) {
        SteamAPI_ISteamMatchmaking_LeaveLobby(interface, CUnsignedLongLong(lobby))
    }

    /// Steamworks `ISteamMatchmaking::RemoveFavoriteGame()`
    @discardableResult
    public func removeFavoriteGame(appID: AppID, ip: Int, connPort: UInt16, queryPort: UInt16, flags: FavoriteFlags) -> Bool {
        CSteamAPI_ISteamMatchmaking_RemoveFavoriteGame(interface, AppId_t(appID), uint32(ip), connPort, queryPort, EFavoriteFlags(flags))
    }

    /// Steamworks `ISteamMatchmaking::RequestLobbyData()`
    @discardableResult
    public func requestLobbyData(lobby: SteamID) -> Bool {
        SteamAPI_ISteamMatchmaking_RequestLobbyData(interface, CUnsignedLongLong(lobby))
    }

    /// Steamworks `ISteamMatchmaking::RequestLobbyList()`, callback
    public func requestLobbyList(completion: @escaping (LobbyMatchList?) -> Void) {
        let rc = SteamAPI_ISteamMatchmaking_RequestLobbyList(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamMatchmaking::RequestLobbyList()`, async
    public func requestLobbyList() async -> LobbyMatchList? {
        await withUnsafeContinuation {
            requestLobbyList(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamMatchmaking::SendLobbyChatMsg()`
    @discardableResult
    public func sendLobbyChatMsg(lobby: SteamID, msgBody: UnsafeRawPointer, msgBodySize: Int) -> Bool {
        SteamAPI_ISteamMatchmaking_SendLobbyChatMsg(interface, CUnsignedLongLong(lobby), msgBody, CInt(msgBodySize))
    }

    /// Steamworks `ISteamMatchmaking::SetLinkedLobby()`
    public func setLinkedLobby(lobby: SteamID, lobbyDependent: SteamID) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLinkedLobby(interface, CUnsignedLongLong(lobby), CUnsignedLongLong(lobbyDependent))
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyData()`
    public func setLobbyData(lobby: SteamID, key: String, value: String) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyData(interface, CUnsignedLongLong(lobby), key, value)
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyGameServer()`
    public func setLobbyGameServer(lobby: SteamID, gameServerIP: Int, gameServerPort: UInt16, gameServer: SteamID) {
        SteamAPI_ISteamMatchmaking_SetLobbyGameServer(interface, CUnsignedLongLong(lobby), uint32(gameServerIP), gameServerPort, CUnsignedLongLong(gameServer))
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyJoinable()`
    @discardableResult
    public func setLobbyJoinable(lobby: SteamID, lobbyJoinable: Bool) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyJoinable(interface, CUnsignedLongLong(lobby), lobbyJoinable)
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyMemberData()`
    public func setLobbyMemberData(lobby: SteamID, key: String, value: String) {
        SteamAPI_ISteamMatchmaking_SetLobbyMemberData(interface, CUnsignedLongLong(lobby), key, value)
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyMemberLimit()`
    @discardableResult
    public func setLobbyMemberLimit(lobby: SteamID, maxMembers: Int) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit(interface, CUnsignedLongLong(lobby), CInt(maxMembers))
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyOwner()`
    public func setLobbyOwner(lobby: SteamID, newOwner: SteamID) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyOwner(interface, CUnsignedLongLong(lobby), CUnsignedLongLong(newOwner))
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyType()`
    @discardableResult
    public func setLobbyType(lobby: SteamID, lobbyType: LobbyType) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyType(interface, CUnsignedLongLong(lobby), ELobbyType(lobbyType))
    }
}
