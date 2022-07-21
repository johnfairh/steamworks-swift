//
//  SteamMatchmakingServers.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamMatchmakingServers`](https://partner.steamgames.com/doc/api/ISteamMatchmakingServers)
///
/// Access via `SteamAPI.matchmakingServers`.
public struct SteamMatchmakingServers: Sendable {
    var interface: UnsafeMutablePointer<ISteamMatchmakingServers> {
        SteamAPI_SteamMatchmakingServers_v002()
    }

    init() {
    }

    /// Steamworks `ISteamMatchmakingServers::CancelQuery()`
    public func cancelQuery(request: HServerListRequest) {
        SteamAPI_ISteamMatchmakingServers_CancelQuery(interface, CSteamworks.HServerListRequest(request))
    }

    /// Steamworks `ISteamMatchmakingServers::GetServerCount()`
    public func getServerCount(request: HServerListRequest) -> Int {
        Int(SteamAPI_ISteamMatchmakingServers_GetServerCount(interface, CSteamworks.HServerListRequest(request)))
    }

    /// Steamworks `ISteamMatchmakingServers::GetServerDetails()`
    public func getServerDetails(request: HServerListRequest, serverIndex: Int) -> GameServerItem {
        GameServerItem(SteamAPI_ISteamMatchmakingServers_GetServerDetails(interface, CSteamworks.HServerListRequest(request), CInt(serverIndex)))
    }

    /// Steamworks `ISteamMatchmakingServers::IsRefreshing()`
    public func isRefreshing(request: HServerListRequest) -> Bool {
        SteamAPI_ISteamMatchmakingServers_IsRefreshing(interface, CSteamworks.HServerListRequest(request))
    }

    /// Steamworks `ISteamMatchmakingServers::RefreshQuery()`
    public func refreshQuery(request: HServerListRequest) {
        SteamAPI_ISteamMatchmakingServers_RefreshQuery(interface, CSteamworks.HServerListRequest(request))
    }

    /// Steamworks `ISteamMatchmakingServers::RefreshServer()`
    public func refreshServer(request: HServerListRequest, serverIndex: Int) {
        SteamAPI_ISteamMatchmakingServers_RefreshServer(interface, CSteamworks.HServerListRequest(request), CInt(serverIndex))
    }
}
