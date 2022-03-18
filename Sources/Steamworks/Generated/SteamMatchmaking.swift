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
public struct SteamMatchmaking {
    var interface: UnsafeMutablePointer<ISteamMatchmaking> {
        SteamAPI_SteamMatchmaking_v009()
    }

    init() {
    }

    /// Steamworks `ISteamMatchmaking::AddFavoriteGame()`
    public func addFavoriteGame(appID: AppID, ip: Int, connPort: Int, queryPort: Int, flags: FavoriteFlags, time32LastPlayedOnServer: RTime32) -> Int {
        Int(CSteamAPI_ISteamMatchmaking_AddFavoriteGame(interface, AppId_t(appID), uint32(ip), uint16(connPort), uint16(queryPort), EFavoriteFlags(flags), CSteamworks.RTime32(time32LastPlayedOnServer)))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListCompatibleMembersFilter()`
    public func addRequestLobbyListCompatibleMembersFilter(lobby: SteamID) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(interface, UInt64(lobby))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListDistanceFilter()`
    public func addRequestLobbyListDistanceFilter(lobbyDistanceFilter: LobbyDistanceFilter) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter(interface, ELobbyDistanceFilter(lobbyDistanceFilter))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListFilterSlotsAvailable()`
    public func addRequestLobbyListFilterSlotsAvailable(slotsAvailable: Int) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(interface, Int32(slotsAvailable))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListNearValueFilter()`
    public func addRequestLobbyListNearValueFilter(keyToMatch: String, valueToBeCloseTo: Int) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter(interface, keyToMatch, Int32(valueToBeCloseTo))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListNumericalFilter()`
    public func addRequestLobbyListNumericalFilter(keyToMatch: String, valueToMatch: Int, comparisonType: LobbyComparison) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter(interface, keyToMatch, Int32(valueToMatch), ELobbyComparison(comparisonType))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListResultCountFilter()`
    public func addRequestLobbyListResultCountFilter(maxResults: Int) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter(interface, Int32(maxResults))
    }

    /// Steamworks `ISteamMatchmaking::AddRequestLobbyListStringFilter()`
    public func addRequestLobbyListStringFilter(keyToMatch: String, valueToMatch: String, comparisonType: LobbyComparison) {
        SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter(interface, keyToMatch, valueToMatch, ELobbyComparison(comparisonType))
    }

    /// Steamworks `ISteamMatchmaking::CreateLobby()`, callback
    public func createLobby(lobbyType: LobbyType, maxMembers: Int, completion: @escaping (LobbyCreated?) -> Void) {
        let rc = SteamAPI_ISteamMatchmaking_CreateLobby(interface, ELobbyType(lobbyType), Int32(maxMembers))
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
        SteamAPI_ISteamMatchmaking_DeleteLobbyData(interface, UInt64(lobby), key)
    }

    /// Steamworks `ISteamMatchmaking::GetFavoriteGame()`
    public func getFavoriteGame(gameIndex: Int, appID: inout AppID, ip: inout Int, connPort: inout Int, queryPort: inout Int, flags: inout FavoriteFlags, rTime32LastPlayedOnServer: inout RTime32) -> Bool {
        var tmp_appID = AppId_t()
        var tmp_ip = uint32()
        var tmp_connPort = uint16()
        var tmp_queryPort = uint16()
        var tmp_flags = EFavoriteFlags(rawValue: 0)
        var tmp_rTime32LastPlayedOnServer = CSteamworks.RTime32()
        let rc = CSteamAPI_ISteamMatchmaking_GetFavoriteGame(interface, Int32(gameIndex), &tmp_appID, &tmp_ip, &tmp_connPort, &tmp_queryPort, &tmp_flags, &tmp_rTime32LastPlayedOnServer)
        appID = AppID(tmp_appID)
        ip = Int(tmp_ip)
        connPort = Int(tmp_connPort)
        queryPort = Int(tmp_queryPort)
        flags = FavoriteFlags(tmp_flags)
        rTime32LastPlayedOnServer = RTime32(tmp_rTime32LastPlayedOnServer)
        return rc
    }

    /// Steamworks `ISteamMatchmaking::GetFavoriteGameCount()`
    public func getFavoriteGameCount() -> Int {
        Int(SteamAPI_ISteamMatchmaking_GetFavoriteGameCount(interface))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyByIndex()`
    public func getLobbyByIndex(lobbyIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamMatchmaking_GetLobbyByIndex(interface, Int32(lobbyIndex)))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyChatEntry()`
    public func getLobbyChatEntry(lobby: SteamID, chatIDIndex: Int, user: inout SteamID, data: UnsafeMutableRawPointer, dataSize: Int, chatEntryType: inout ChatEntryType) -> Int {
        var tmp_user = CSteamID()
        var tmp_chatEntryType = EChatEntryType(rawValue: 0)
        let rc = Int(SteamAPI_ISteamMatchmaking_GetLobbyChatEntry(interface, UInt64(lobby), Int32(chatIDIndex), &tmp_user, data, Int32(dataSize), &tmp_chatEntryType))
        user = SteamID(tmp_user)
        chatEntryType = ChatEntryType(tmp_chatEntryType)
        return rc
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyData()`
    public func getLobbyData(lobby: SteamID, key: String) -> String {
        String(SteamAPI_ISteamMatchmaking_GetLobbyData(interface, UInt64(lobby), key))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyDataByIndex()`
    public func getLobbyDataByIndex(lobby: SteamID, lobbyDataIndex: Int, key: inout String, keyBufferSize: Int, value: inout String, valueBufferSize: Int) -> Bool {
        let tmp_key = UnsafeMutableBufferPointer<CChar>.allocate(capacity: keyBufferSize)
        defer { tmp_key.deallocate() }
        let tmp_value = UnsafeMutableBufferPointer<CChar>.allocate(capacity: valueBufferSize)
        defer { tmp_value.deallocate() }
        let rc = SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex(interface, UInt64(lobby), Int32(lobbyDataIndex), tmp_key.baseAddress, Int32(keyBufferSize), tmp_value.baseAddress, Int32(valueBufferSize))
        key = String(tmp_key)
        value = String(tmp_value)
        return rc
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyDataCount()`
    public func getLobbyDataCount(lobby: SteamID) -> Int {
        Int(SteamAPI_ISteamMatchmaking_GetLobbyDataCount(interface, UInt64(lobby)))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyGameServer()`
    public func getLobbyGameServer(lobby: SteamID, gameServerIP: inout Int, gameServerPort: inout Int, gameServer: inout SteamID) -> Bool {
        var tmp_gameServerIP = uint32()
        var tmp_gameServerPort = uint16()
        var tmp_gameServer = CSteamID()
        let rc = SteamAPI_ISteamMatchmaking_GetLobbyGameServer(interface, UInt64(lobby), &tmp_gameServerIP, &tmp_gameServerPort, &tmp_gameServer)
        gameServerIP = Int(tmp_gameServerIP)
        gameServerPort = Int(tmp_gameServerPort)
        gameServer = SteamID(tmp_gameServer)
        return rc
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyMemberByIndex()`
    public func getLobbyMemberByIndex(lobby: SteamID, memberIndex: Int) -> SteamID {
        SteamID(SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex(interface, UInt64(lobby), Int32(memberIndex)))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyMemberData()`
    public func getLobbyMemberData(lobby: SteamID, user: SteamID, key: String) -> String? {
        SteamAPI_ISteamMatchmaking_GetLobbyMemberData(interface, UInt64(lobby), UInt64(user), key).map { String($0) }
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyMemberLimit()`
    public func getLobbyMemberLimit(lobby: SteamID) -> Int {
        Int(SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit(interface, UInt64(lobby)))
    }

    /// Steamworks `ISteamMatchmaking::GetLobbyOwner()`
    public func getLobbyOwner(lobby: SteamID) -> SteamID {
        SteamID(SteamAPI_ISteamMatchmaking_GetLobbyOwner(interface, UInt64(lobby)))
    }

    /// Steamworks `ISteamMatchmaking::GetNumLobbyMembers()`
    public func getNumLobbyMembers(lobby: SteamID) -> Int {
        Int(SteamAPI_ISteamMatchmaking_GetNumLobbyMembers(interface, UInt64(lobby)))
    }

    /// Steamworks `ISteamMatchmaking::InviteUserToLobby()`
    @discardableResult
    public func inviteUserToLobby(lobby: SteamID, invitee: SteamID) -> Bool {
        SteamAPI_ISteamMatchmaking_InviteUserToLobby(interface, UInt64(lobby), UInt64(invitee))
    }

    /// Steamworks `ISteamMatchmaking::JoinLobby()`, callback
    public func joinLobby(lobby: SteamID, completion: @escaping (LobbyEnter?) -> Void) {
        let rc = SteamAPI_ISteamMatchmaking_JoinLobby(interface, UInt64(lobby))
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
        SteamAPI_ISteamMatchmaking_LeaveLobby(interface, UInt64(lobby))
    }

    /// Steamworks `ISteamMatchmaking::RemoveFavoriteGame()`
    @discardableResult
    public func removeFavoriteGame(appID: AppID, ip: Int, connPort: Int, queryPort: Int, flags: FavoriteFlags) -> Bool {
        CSteamAPI_ISteamMatchmaking_RemoveFavoriteGame(interface, AppId_t(appID), uint32(ip), uint16(connPort), uint16(queryPort), EFavoriteFlags(flags))
    }

    /// Steamworks `ISteamMatchmaking::RequestLobbyData()`
    @discardableResult
    public func requestLobbyData(lobby: SteamID) -> Bool {
        SteamAPI_ISteamMatchmaking_RequestLobbyData(interface, UInt64(lobby))
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
        SteamAPI_ISteamMatchmaking_SendLobbyChatMsg(interface, UInt64(lobby), msgBody, Int32(msgBodySize))
    }

    /// Steamworks `ISteamMatchmaking::SetLinkedLobby()`
    public func setLinkedLobby(lobby: SteamID, lobbyDependent: SteamID) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLinkedLobby(interface, UInt64(lobby), UInt64(lobbyDependent))
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyData()`
    public func setLobbyData(lobby: SteamID, key: String, value: String) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyData(interface, UInt64(lobby), key, value)
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyGameServer()`
    public func setLobbyGameServer(lobby: SteamID, gameServerIP: Int, gameServerPort: Int, gameServer: SteamID) {
        SteamAPI_ISteamMatchmaking_SetLobbyGameServer(interface, UInt64(lobby), uint32(gameServerIP), uint16(gameServerPort), UInt64(gameServer))
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyJoinable()`
    @discardableResult
    public func setLobbyJoinable(lobby: SteamID, lobbyJoinable: Bool) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyJoinable(interface, UInt64(lobby), lobbyJoinable)
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyMemberData()`
    public func setLobbyMemberData(lobby: SteamID, key: String, value: String) {
        SteamAPI_ISteamMatchmaking_SetLobbyMemberData(interface, UInt64(lobby), key, value)
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyMemberLimit()`
    @discardableResult
    public func setLobbyMemberLimit(lobby: SteamID, maxMembers: Int) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit(interface, UInt64(lobby), Int32(maxMembers))
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyOwner()`
    public func setLobbyOwner(lobby: SteamID, newOwner: SteamID) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyOwner(interface, UInt64(lobby), UInt64(newOwner))
    }

    /// Steamworks `ISteamMatchmaking::SetLobbyType()`
    @discardableResult
    public func setLobbyType(lobby: SteamID, lobbyType: LobbyType) -> Bool {
        SteamAPI_ISteamMatchmaking_SetLobbyType(interface, UInt64(lobby), ELobbyType(lobbyType))
    }
}
