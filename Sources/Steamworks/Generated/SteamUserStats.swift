//
//  SteamUserStats.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamUserStats`](https://partner.steamgames.com/doc/api/ISteamUserStats)
///
/// Access via `SteamAPI.userStats`.
public struct SteamUserStats {
    var interface: UnsafeMutablePointer<ISteamUserStats> {
        SteamAPI_SteamUserStats_v012()
    }

    init() {
    }

    /// Steamworks `ISteamUserStats::AttachLeaderboardUGC()`, callback
    public func attachLeaderboardUGC(steamLeaderboard: SteamLeaderboard, ugc: UGCHandle, completion: @escaping (LeaderboardUGCSet?) -> Void) {
        let rc = SteamAPI_ISteamUserStats_AttachLeaderboardUGC(interface, SteamLeaderboard_t(steamLeaderboard), UGCHandle_t(ugc))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::AttachLeaderboardUGC()`, async
    public func attachLeaderboardUGC(steamLeaderboard: SteamLeaderboard, ugc: UGCHandle) async -> LeaderboardUGCSet? {
        await withUnsafeContinuation {
            attachLeaderboardUGC(steamLeaderboard: steamLeaderboard, ugc: ugc, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::ClearAchievement()`
    public func clearAchievement(name: String) -> Bool {
        SteamAPI_ISteamUserStats_ClearAchievement(interface, name)
    }

    /// Steamworks `ISteamUserStats::DownloadLeaderboardEntries()`, callback
    public func downloadLeaderboardEntries(steamLeaderboard: SteamLeaderboard, leaderboardDataRequest: LeaderboardDataRequest, rangeStart: Int, rangeEnd: Int, completion: @escaping (LeaderboardScoresDownloaded?) -> Void) {
        let rc = SteamAPI_ISteamUserStats_DownloadLeaderboardEntries(interface, SteamLeaderboard_t(steamLeaderboard), ELeaderboardDataRequest(leaderboardDataRequest), Int32(rangeStart), Int32(rangeEnd))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::DownloadLeaderboardEntries()`, async
    public func downloadLeaderboardEntries(steamLeaderboard: SteamLeaderboard, leaderboardDataRequest: LeaderboardDataRequest, rangeStart: Int, rangeEnd: Int) async -> LeaderboardScoresDownloaded? {
        await withUnsafeContinuation {
            downloadLeaderboardEntries(steamLeaderboard: steamLeaderboard, leaderboardDataRequest: leaderboardDataRequest, rangeStart: rangeStart, rangeEnd: rangeEnd, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::DownloadLeaderboardEntriesForUsers()`, callback
    public func downloadLeaderboardEntriesForUsers(steamLeaderboard: SteamLeaderboard, users: [SteamID], completion: @escaping (LeaderboardScoresDownloaded?) -> Void) {
        var tmpUsers = users.map { CSteamID($0) }
        let rc = SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers(interface, SteamLeaderboard_t(steamLeaderboard), &tmpUsers, Int32(users.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::DownloadLeaderboardEntriesForUsers()`, async
    public func downloadLeaderboardEntriesForUsers(steamLeaderboard: SteamLeaderboard, users: [SteamID]) async -> LeaderboardScoresDownloaded? {
        await withUnsafeContinuation {
            downloadLeaderboardEntriesForUsers(steamLeaderboard: steamLeaderboard, users: users, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::FindLeaderboard()`, callback
    public func findLeaderboard(leaderboardName: String, completion: @escaping (LeaderboardFindResult?) -> Void) {
        let rc = SteamAPI_ISteamUserStats_FindLeaderboard(interface, leaderboardName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::FindLeaderboard()`, async
    public func findLeaderboard(leaderboardName: String) async -> LeaderboardFindResult? {
        await withUnsafeContinuation {
            findLeaderboard(leaderboardName: leaderboardName, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::FindOrCreateLeaderboard()`, callback
    public func findOrCreateLeaderboard(leaderboardName: String, leaderboardSortMethod: LeaderboardSortMethod, leaderboardDisplayType: LeaderboardDisplayType, completion: @escaping (LeaderboardFindResult?) -> Void) {
        let rc = SteamAPI_ISteamUserStats_FindOrCreateLeaderboard(interface, leaderboardName, ELeaderboardSortMethod(leaderboardSortMethod), ELeaderboardDisplayType(leaderboardDisplayType))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::FindOrCreateLeaderboard()`, async
    public func findOrCreateLeaderboard(leaderboardName: String, leaderboardSortMethod: LeaderboardSortMethod, leaderboardDisplayType: LeaderboardDisplayType) async -> LeaderboardFindResult? {
        await withUnsafeContinuation {
            findOrCreateLeaderboard(leaderboardName: leaderboardName, leaderboardSortMethod: leaderboardSortMethod, leaderboardDisplayType: leaderboardDisplayType, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::GetAchievement()`
    public func getAchievement(name: String) -> (rc: Bool, achieved: Bool) {
        var tmpAchieved = Bool()
        let rc = SteamAPI_ISteamUserStats_GetAchievement(interface, name, &tmpAchieved)
        return (rc: rc, achieved: tmpAchieved)
    }

    /// Steamworks `ISteamUserStats::GetAchievementAchievedPercent()`
    public func getAchievementAchievedPercent(name: String) -> (rc: Bool, percent: Float) {
        var tmpPercent = Float()
        let rc = SteamAPI_ISteamUserStats_GetAchievementAchievedPercent(interface, name, &tmpPercent)
        return (rc: rc, percent: tmpPercent)
    }

    /// Steamworks `ISteamUserStats::GetAchievementAndUnlockTime()`
    public func getAchievementAndUnlockTime(name: String) -> (rc: Bool, achieved: Bool, unlockTime: RTime32) {
        var tmpAchieved = Bool()
        var tmpUnlockTime = CSteamworks.RTime32()
        let rc = SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime(interface, name, &tmpAchieved, &tmpUnlockTime)
        if rc {
            return (rc: rc, achieved: tmpAchieved, unlockTime: RTime32(tmpUnlockTime))
        } else {
            return (rc: rc, achieved: false, unlockTime: 0)
        }
    }

    /// Steamworks `ISteamUserStats::GetAchievementDisplayAttribute()`
    public func getAchievementDisplayAttribute(name: String, key: String) -> String {
        String(SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute(interface, name, key))
    }

    /// Steamworks `ISteamUserStats::GetAchievementIcon()`
    public func getAchievementIcon(name: String) -> Int {
        Int(SteamAPI_ISteamUserStats_GetAchievementIcon(interface, name))
    }

    /// Steamworks `ISteamUserStats::GetAchievementName()`
    public func getAchievementName(achievementIndex: Int) -> String {
        String(SteamAPI_ISteamUserStats_GetAchievementName(interface, uint32(achievementIndex)))
    }

    /// Steamworks `ISteamUserStats::GetAchievementProgressLimits()`
    public func getAchievementProgressLimitsFloat(name: String) -> (rc: Bool, minProgress: Float, maxProgress: Float) {
        var tmpMinProgress = Float()
        var tmpMaxProgress = Float()
        let rc = SteamAPI_ISteamUserStats_GetAchievementProgressLimitsFloat(interface, name, &tmpMinProgress, &tmpMaxProgress)
        return (rc: rc, minProgress: tmpMinProgress, maxProgress: tmpMaxProgress)
    }

    /// Steamworks `ISteamUserStats::GetAchievementProgressLimits()`
    public func getAchievementProgressLimitsInt(name: String) -> (rc: Bool, minProgress: Int, maxProgress: Int) {
        var tmpMinProgress = int32()
        var tmpMaxProgress = int32()
        let rc = SteamAPI_ISteamUserStats_GetAchievementProgressLimitsInt32(interface, name, &tmpMinProgress, &tmpMaxProgress)
        if rc {
            return (rc: rc, minProgress: Int(tmpMinProgress), maxProgress: Int(tmpMaxProgress))
        } else {
            return (rc: rc, minProgress: 0, maxProgress: 0)
        }
    }

    /// Steamworks `ISteamUserStats::GetDownloadedLeaderboardEntry()`
    public func getDownloadedLeaderboardEntry(steamLeaderboardEntries: SteamLeaderboardEntries, index: Int, detailsMax: Int) -> (rc: Bool, leaderboardEntry: LeaderboardEntry, details: [Int]) {
        var tmpLeaderboardEntry = LeaderboardEntry_t()
        let tmpDetails = SteamOutArray<int32>(detailsMax)
        let rc = SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry(interface, SteamLeaderboardEntries_t(steamLeaderboardEntries), Int32(index), &tmpLeaderboardEntry, tmpDetails.steamArray, Int32(detailsMax))
        if rc {
            return (rc: rc, leaderboardEntry: LeaderboardEntry(tmpLeaderboardEntry), details: tmpDetails.swiftArray())
        } else {
            return (rc: rc, leaderboardEntry: LeaderboardEntry(), details: [])
        }
    }

    /// Steamworks `ISteamUserStats::GetGlobalStat()`
    public func getGlobalStatDouble(statName: String) -> (rc: Bool, data: Double) {
        var tmpData = Double()
        let rc = SteamAPI_ISteamUserStats_GetGlobalStatDouble(interface, statName, &tmpData)
        return (rc: rc, data: tmpData)
    }

    /// Steamworks `ISteamUserStats::GetGlobalStatHistory()`
    public func getGlobalStatHistoryDouble(statName: String, dataSize: Int) -> (rc: Int, data: [Double]) {
        var data = [Double](repeating: .init(), count: dataSize / 8)
        let rc = Int(SteamAPI_ISteamUserStats_GetGlobalStatHistoryDouble(interface, statName, &data, uint32(dataSize)))
        return (rc: rc, data: data.safePrefix(rc))
    }

    /// Steamworks `ISteamUserStats::GetGlobalStatHistory()`
    public func getGlobalStatHistoryInt(statName: String, dataSize: Int) -> (rc: Int, data: [Int]) {
        let tmpData = SteamOutArray<int64>(dataSize / 8)
        let rc = Int(SteamAPI_ISteamUserStats_GetGlobalStatHistoryInt64(interface, statName, tmpData.steamArray, uint32(dataSize)))
        return (rc: rc, data: tmpData.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamUserStats::GetGlobalStat()`
    public func getGlobalStatInt(statName: String) -> (rc: Bool, data: Int) {
        var tmpData = int64()
        let rc = SteamAPI_ISteamUserStats_GetGlobalStatInt64(interface, statName, &tmpData)
        if rc {
            return (rc: rc, data: Int(tmpData))
        } else {
            return (rc: rc, data: 0)
        }
    }

    /// Steamworks `ISteamUserStats::GetLeaderboardDisplayType()`
    public func getLeaderboardDisplayType(steamLeaderboard: SteamLeaderboard) -> LeaderboardDisplayType {
        LeaderboardDisplayType(SteamAPI_ISteamUserStats_GetLeaderboardDisplayType(interface, SteamLeaderboard_t(steamLeaderboard)))
    }

    /// Steamworks `ISteamUserStats::GetLeaderboardEntryCount()`
    public func getLeaderboardEntryCount(steamLeaderboard: SteamLeaderboard) -> Int {
        Int(SteamAPI_ISteamUserStats_GetLeaderboardEntryCount(interface, SteamLeaderboard_t(steamLeaderboard)))
    }

    /// Steamworks `ISteamUserStats::GetLeaderboardName()`
    public func getLeaderboardName(steamLeaderboard: SteamLeaderboard) -> String {
        String(SteamAPI_ISteamUserStats_GetLeaderboardName(interface, SteamLeaderboard_t(steamLeaderboard)))
    }

    /// Steamworks `ISteamUserStats::GetLeaderboardSortMethod()`
    public func getLeaderboardSortMethod(steamLeaderboard: SteamLeaderboard) -> LeaderboardSortMethod {
        LeaderboardSortMethod(SteamAPI_ISteamUserStats_GetLeaderboardSortMethod(interface, SteamLeaderboard_t(steamLeaderboard)))
    }

    /// Steamworks `ISteamUserStats::GetMostAchievedAchievementInfo()`
    public func getMostAchievedAchievementInfo(nameBufLen: Int) -> (rc: Int, name: String, percent: Float, achieved: Bool) {
        let tmpName = SteamString(length: nameBufLen)
        var tmpPercent = Float()
        var tmpAchieved = Bool()
        let rc = Int(SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo(interface, tmpName.charBuffer, uint32(nameBufLen), &tmpPercent, &tmpAchieved))
        return (rc: rc, name: tmpName.swiftString, percent: tmpPercent, achieved: tmpAchieved)
    }

    /// Steamworks `ISteamUserStats::GetNextMostAchievedAchievementInfo()`
    public func getNextMostAchievedAchievementInfo(iteratorPreviousIndex: Int, nameBufLen: Int) -> (rc: Int, name: String, percent: Float, achieved: Bool) {
        let tmpName = SteamString(length: nameBufLen)
        var tmpPercent = Float()
        var tmpAchieved = Bool()
        let rc = Int(SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo(interface, Int32(iteratorPreviousIndex), tmpName.charBuffer, uint32(nameBufLen), &tmpPercent, &tmpAchieved))
        return (rc: rc, name: tmpName.swiftString, percent: tmpPercent, achieved: tmpAchieved)
    }

    /// Steamworks `ISteamUserStats::GetNumAchievements()`
    public func getNumAchievements() -> Int {
        Int(SteamAPI_ISteamUserStats_GetNumAchievements(interface))
    }

    /// Steamworks `ISteamUserStats::GetNumberOfCurrentPlayers()`, callback
    public func getNumberOfCurrentPlayers(completion: @escaping (NumberOfCurrentPlayers?) -> Void) {
        let rc = SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::GetNumberOfCurrentPlayers()`, async
    public func getNumberOfCurrentPlayers() async -> NumberOfCurrentPlayers? {
        await withUnsafeContinuation {
            getNumberOfCurrentPlayers(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::GetStat()`
    public func getStatFloat(name: String) -> (rc: Bool, data: Float) {
        var tmpData = Float()
        let rc = SteamAPI_ISteamUserStats_GetStatFloat(interface, name, &tmpData)
        return (rc: rc, data: tmpData)
    }

    /// Steamworks `ISteamUserStats::GetStat()`
    public func getStatInt(name: String) -> (rc: Bool, data: Int) {
        var tmpData = int32()
        let rc = SteamAPI_ISteamUserStats_GetStatInt32(interface, name, &tmpData)
        if rc {
            return (rc: rc, data: Int(tmpData))
        } else {
            return (rc: rc, data: 0)
        }
    }

    /// Steamworks `ISteamUserStats::GetUserAchievement()`
    public func getUserAchievement(user: SteamID, name: String) -> (rc: Bool, achieved: Bool) {
        var tmpAchieved = Bool()
        let rc = SteamAPI_ISteamUserStats_GetUserAchievement(interface, UInt64(user), name, &tmpAchieved)
        return (rc: rc, achieved: tmpAchieved)
    }

    /// Steamworks `ISteamUserStats::GetUserAchievementAndUnlockTime()`
    public func getUserAchievementAndUnlockTime(user: SteamID, name: String) -> (rc: Bool, achieved: Bool, unlockTime: RTime32) {
        var tmpAchieved = Bool()
        var tmpUnlockTime = CSteamworks.RTime32()
        let rc = SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime(interface, UInt64(user), name, &tmpAchieved, &tmpUnlockTime)
        if rc {
            return (rc: rc, achieved: tmpAchieved, unlockTime: RTime32(tmpUnlockTime))
        } else {
            return (rc: rc, achieved: false, unlockTime: 0)
        }
    }

    /// Steamworks `ISteamUserStats::GetUserStat()`
    public func getUserStatFloat(user: SteamID, name: String) -> (rc: Bool, data: Float) {
        var tmpData = Float()
        let rc = SteamAPI_ISteamUserStats_GetUserStatFloat(interface, UInt64(user), name, &tmpData)
        return (rc: rc, data: tmpData)
    }

    /// Steamworks `ISteamUserStats::GetUserStat()`
    public func getUserStatInt(user: SteamID, name: String) -> (rc: Bool, data: Int) {
        var tmpData = int32()
        let rc = SteamAPI_ISteamUserStats_GetUserStatInt32(interface, UInt64(user), name, &tmpData)
        if rc {
            return (rc: rc, data: Int(tmpData))
        } else {
            return (rc: rc, data: 0)
        }
    }

    /// Steamworks `ISteamUserStats::IndicateAchievementProgress()`
    public func indicateAchievementProgress(name: String, curProgress: Int, maxProgress: Int) -> Bool {
        SteamAPI_ISteamUserStats_IndicateAchievementProgress(interface, name, uint32(curProgress), uint32(maxProgress))
    }

    /// Steamworks `ISteamUserStats::RequestCurrentStats()`
    public func requestCurrentStats() -> Bool {
        SteamAPI_ISteamUserStats_RequestCurrentStats(interface)
    }

    /// Steamworks `ISteamUserStats::RequestGlobalAchievementPercentages()`, callback
    public func requestGlobalAchievementPercentages(completion: @escaping (GlobalAchievementPercentagesReady?) -> Void) {
        let rc = SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::RequestGlobalAchievementPercentages()`, async
    public func requestGlobalAchievementPercentages() async -> GlobalAchievementPercentagesReady? {
        await withUnsafeContinuation {
            requestGlobalAchievementPercentages(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::RequestGlobalStats()`, callback
    public func requestGlobalStats(historyDays: Int, completion: @escaping (GlobalStatsReceived?) -> Void) {
        let rc = SteamAPI_ISteamUserStats_RequestGlobalStats(interface, Int32(historyDays))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::RequestGlobalStats()`, async
    public func requestGlobalStats(historyDays: Int) async -> GlobalStatsReceived? {
        await withUnsafeContinuation {
            requestGlobalStats(historyDays: historyDays, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::RequestUserStats()`, callback
    public func requestUserStats(user: SteamID, completion: @escaping (UserStatsReceived?) -> Void) {
        let rc = SteamAPI_ISteamUserStats_RequestUserStats(interface, UInt64(user))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::RequestUserStats()`, async
    public func requestUserStats(user: SteamID) async -> UserStatsReceived? {
        await withUnsafeContinuation {
            requestUserStats(user: user, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUserStats::ResetAllStats()`
    public func resetAllStats(achievementsToo: Bool) -> Bool {
        SteamAPI_ISteamUserStats_ResetAllStats(interface, achievementsToo)
    }

    /// Steamworks `ISteamUserStats::SetAchievement()`
    public func setAchievement(name: String) -> Bool {
        SteamAPI_ISteamUserStats_SetAchievement(interface, name)
    }

    /// Steamworks `ISteamUserStats::SetStat()`
    public func setStat(name: String, data: Float) -> Bool {
        SteamAPI_ISteamUserStats_SetStatFloat(interface, name, data)
    }

    /// Steamworks `ISteamUserStats::SetStat()`
    public func setStat(name: String, data: Int) -> Bool {
        SteamAPI_ISteamUserStats_SetStatInt32(interface, name, int32(data))
    }

    /// Steamworks `ISteamUserStats::StoreStats()`
    public func storeStats() -> Bool {
        SteamAPI_ISteamUserStats_StoreStats(interface)
    }

    /// Steamworks `ISteamUserStats::UpdateAvgRateStat()`
    public func updateAvgRateStat(name: String, countThisSession: Float, sessionLength: Double) -> Bool {
        SteamAPI_ISteamUserStats_UpdateAvgRateStat(interface, name, countThisSession, sessionLength)
    }

    /// Steamworks `ISteamUserStats::UploadLeaderboardScore()`, callback
    public func uploadLeaderboardScore(steamLeaderboard: SteamLeaderboard, leaderboardUploadScoreMethod: LeaderboardUploadScoreMethod, score: Int, scoreDetails: [Int], completion: @escaping (LeaderboardScoreUploaded?) -> Void) {
        var tmpScoreDetails = scoreDetails.map { int32($0) }
        let rc = SteamAPI_ISteamUserStats_UploadLeaderboardScore(interface, SteamLeaderboard_t(steamLeaderboard), ELeaderboardUploadScoreMethod(leaderboardUploadScoreMethod), int32(score), &tmpScoreDetails, Int32(scoreDetails.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUserStats::UploadLeaderboardScore()`, async
    public func uploadLeaderboardScore(steamLeaderboard: SteamLeaderboard, leaderboardUploadScoreMethod: LeaderboardUploadScoreMethod, score: Int, scoreDetails: [Int]) async -> LeaderboardScoreUploaded? {
        await withUnsafeContinuation {
            uploadLeaderboardScore(steamLeaderboard: steamLeaderboard, leaderboardUploadScoreMethod: leaderboardUploadScoreMethod, score: score, scoreDetails: scoreDetails, completion: $0.resume)
        }
    }
}
