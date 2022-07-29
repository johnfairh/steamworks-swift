//
//  SteamGameServerStats.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamGameServerStats`](https://partner.steamgames.com/doc/api/ISteamGameServerStats)
///
/// Access via `SteamGameServerAPI.gameServerStats`.
public struct SteamGameServerStats: Sendable {
    var interface: UnsafeMutablePointer<ISteamGameServerStats> {
        SteamAPI_SteamGameServerStats_v001()
    }

    init() {
    }

    /// Steamworks `ISteamGameServerStats::ClearUserAchievement()`
    public func clearUserAchievement(user: SteamID, name: String) -> Bool {
        SteamAPI_ISteamGameServerStats_ClearUserAchievement(interface, CUnsignedLongLong(user), name)
    }

    /// Steamworks `ISteamGameServerStats::GetUserAchievement()`
    public func getUserAchievement(user: SteamID, name: String) -> (rc: Bool, achieved: Bool) {
        var tmpAchieved = CBool()
        let rc = SteamAPI_ISteamGameServerStats_GetUserAchievement(interface, CUnsignedLongLong(user), name, &tmpAchieved)
        return (rc: rc, achieved: tmpAchieved)
    }

    /// Steamworks `ISteamGameServerStats::GetUserStat()`
    public func getUserStatFloat(user: SteamID, name: String) -> (rc: Bool, data: Float) {
        var tmpData = CFloat()
        let rc = SteamAPI_ISteamGameServerStats_GetUserStatFloat(interface, CUnsignedLongLong(user), name, &tmpData)
        return (rc: rc, data: tmpData)
    }

    /// Steamworks `ISteamGameServerStats::GetUserStat()`
    public func getUserStatInt(user: SteamID, name: String) -> (rc: Bool, data: Int) {
        var tmpData = int32()
        let rc = SteamAPI_ISteamGameServerStats_GetUserStatInt32(interface, CUnsignedLongLong(user), name, &tmpData)
        return (rc: rc, data: Int(tmpData))
    }

    /// Steamworks `ISteamGameServerStats::RequestUserStats()`, callback
    public func requestUserStats(user: SteamID, completion: @escaping (GSStatsReceived?) -> Void) {
        let rc = SteamAPI_ISteamGameServerStats_RequestUserStats(interface, CUnsignedLongLong(user))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamGameServerStats::RequestUserStats()`, async
    public func requestUserStats(user: SteamID) async -> GSStatsReceived? {
        await withUnsafeContinuation {
            requestUserStats(user: user, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamGameServerStats::SetUserAchievement()`
    public func setUserAchievement(user: SteamID, name: String) -> Bool {
        SteamAPI_ISteamGameServerStats_SetUserAchievement(interface, CUnsignedLongLong(user), name)
    }

    /// Steamworks `ISteamGameServerStats::SetUserStat()`
    public func setUserStat(user: SteamID, name: String, data: Float) -> Bool {
        SteamAPI_ISteamGameServerStats_SetUserStatFloat(interface, CUnsignedLongLong(user), name, data)
    }

    /// Steamworks `ISteamGameServerStats::SetUserStat()`
    public func setUserStat(user: SteamID, name: String, data: Int) -> Bool {
        SteamAPI_ISteamGameServerStats_SetUserStatInt32(interface, CUnsignedLongLong(user), name, int32(data))
    }

    /// Steamworks `ISteamGameServerStats::StoreUserStats()`, callback
    public func storeUserStats(user: SteamID, completion: @escaping (GSStatsStored?) -> Void) {
        let rc = SteamAPI_ISteamGameServerStats_StoreUserStats(interface, CUnsignedLongLong(user))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamGameServerStats::StoreUserStats()`, async
    public func storeUserStats(user: SteamID) async -> GSStatsStored? {
        await withUnsafeContinuation {
            storeUserStats(user: user, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamGameServerStats::UpdateUserAvgRateStat()`
    public func updateUserAvgRateStat(user: SteamID, name: String, countThisSession: Float, sessionLength: Double) -> Bool {
        SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat(interface, CUnsignedLongLong(user), name, countThisSession, sessionLength)
    }
}
