//
//  SteamGameServerStats.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamGameServerStats`](https://partner.steamgames.com/doc/api/ISteamGameServerStats)
///
/// Access via `SteamGameServerAPI.gameServerStats`.
public struct SteamGameServerStats {
    var interface: UnsafeMutablePointer<ISteamGameServerStats> {
        SteamAPI_SteamGameServerStats_v001()
    }

    init() {
    }

    /// Steamworks `ISteamGameServerStats::ClearUserAchievement()`
    public func clearUserAchievement(user: SteamID, name: String) -> Bool {
        SteamAPI_ISteamGameServerStats_ClearUserAchievement(interface, UInt64(user), name)
    }

    /// Steamworks `ISteamGameServerStats::GetUserAchievement()`
    public func getUserAchievement(user: SteamID, name: String, achieved: inout Bool) -> Bool {
        SteamAPI_ISteamGameServerStats_GetUserAchievement(interface, UInt64(user), name, &achieved)
    }

    /// Steamworks `ISteamGameServerStats::GetUserStat()`
    public func getUserStat(user: SteamID, name: String, data: inout Float) -> Bool {
        SteamAPI_ISteamGameServerStats_GetUserStatFloat(interface, UInt64(user), name, &data)
    }

    /// Steamworks `ISteamGameServerStats::GetUserStat()`
    public func getUserStat(user: SteamID, name: String, data: inout Int) -> Bool {
        var tmp_data = int32()
        let rc = SteamAPI_ISteamGameServerStats_GetUserStatInt32(interface, UInt64(user), name, &tmp_data)
        data = Int(tmp_data)
        return rc
    }

    /// Steamworks `ISteamGameServerStats::RequestUserStats()`, callback
    public func requestUserStats(user: SteamID, completion: @escaping (GSStatsReceived?) -> Void) {
        let rc = SteamAPI_ISteamGameServerStats_RequestUserStats(interface, UInt64(user))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamGameServerStats::RequestUserStats()`, async
    func requestUserStats(user: SteamID) async -> GSStatsReceived? {
        await withUnsafeContinuation {
            requestUserStats(user: user, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamGameServerStats::SetUserAchievement()`
    public func setUserAchievement(user: SteamID, name: String) -> Bool {
        SteamAPI_ISteamGameServerStats_SetUserAchievement(interface, UInt64(user), name)
    }

    /// Steamworks `ISteamGameServerStats::SetUserStat()`
    public func setUserStat(user: SteamID, name: String, data: Float) -> Bool {
        SteamAPI_ISteamGameServerStats_SetUserStatFloat(interface, UInt64(user), name, data)
    }

    /// Steamworks `ISteamGameServerStats::SetUserStat()`
    public func setUserStat(user: SteamID, name: String, data: Int) -> Bool {
        SteamAPI_ISteamGameServerStats_SetUserStatInt32(interface, UInt64(user), name, int32(data))
    }

    /// Steamworks `ISteamGameServerStats::StoreUserStats()`, callback
    public func storeUserStats(user: SteamID, completion: @escaping (GSStatsStored?) -> Void) {
        let rc = SteamAPI_ISteamGameServerStats_StoreUserStats(interface, UInt64(user))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamGameServerStats::StoreUserStats()`, async
    func storeUserStats(user: SteamID) async -> GSStatsStored? {
        await withUnsafeContinuation {
            storeUserStats(user: user, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamGameServerStats::UpdateUserAvgRateStat()`
    public func updateUserAvgRateStat(user: SteamID, name: String, countThisSession: Float, sessionLength: Double) -> Bool {
        SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat(interface, UInt64(user), name, countThisSession, sessionLength)
    }
}
