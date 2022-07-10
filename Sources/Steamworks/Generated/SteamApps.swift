//
//  SteamApps.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamApps`](https://partner.steamgames.com/doc/api/ISteamApps)
///
/// Access via `SteamAPI.apps`.
public struct SteamApps {
    var interface: UnsafeMutablePointer<ISteamApps> {
        SteamAPI_SteamApps_v008()
    }

    init() {
    }

    /// Steamworks `ISteamApps::BGetDLCDataByIndex()`
    public func getDLCDataByIndex(dlcIndex: Int, nameBufferSize: Int) -> (rc: Bool, appID: AppID, available: Bool, name: String) {
        var tmpAppID = AppId_t()
        var tmpAvailable = CBool()
        let tmpName = SteamString(length: nameBufferSize) /* OUT_STR */
        let rc = SteamAPI_ISteamApps_BGetDLCDataByIndex(interface, CInt(dlcIndex), &tmpAppID, &tmpAvailable, tmpName.charBuffer, CInt(nameBufferSize))
        if rc {
            return (rc: rc, appID: AppID(tmpAppID), available: tmpAvailable, name: tmpName.swiftString)
        } else {
            return (rc: rc, appID: 0, available: false, name: "")
        }
    }

    /// Steamworks `ISteamApps::BIsAppInstalled()`
    public func isAppInstalled(id: AppID) -> Bool {
        SteamAPI_ISteamApps_BIsAppInstalled(interface, AppId_t(id))
    }

    /// Steamworks `ISteamApps::BIsCybercafe()`
    public func isCybercafe() -> Bool {
        SteamAPI_ISteamApps_BIsCybercafe(interface)
    }

    /// Steamworks `ISteamApps::BIsDlcInstalled()`
    public func isDlcInstalled(id: AppID) -> Bool {
        SteamAPI_ISteamApps_BIsDlcInstalled(interface, AppId_t(id))
    }

    /// Steamworks `ISteamApps::BIsLowViolence()`
    public func isLowViolence() -> Bool {
        SteamAPI_ISteamApps_BIsLowViolence(interface)
    }

    /// Steamworks `ISteamApps::BIsSubscribed()`
    public func isSubscribed() -> Bool {
        SteamAPI_ISteamApps_BIsSubscribed(interface)
    }

    /// Steamworks `ISteamApps::BIsSubscribedApp()`
    public func isSubscribedApp(id: AppID) -> Bool {
        SteamAPI_ISteamApps_BIsSubscribedApp(interface, AppId_t(id))
    }

    /// Steamworks `ISteamApps::BIsSubscribedFromFamilySharing()`
    public func isSubscribedFromFamilySharing() -> Bool {
        SteamAPI_ISteamApps_BIsSubscribedFromFamilySharing(interface)
    }

    /// Steamworks `ISteamApps::BIsSubscribedFromFreeWeekend()`
    public func isSubscribedFromFreeWeekend() -> Bool {
        SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend(interface)
    }

    /// Steamworks `ISteamApps::BIsTimedTrial()`
    public func isTimedTrial() -> (rc: Bool, secondsAllowed: Int, secondsPlayed: Int) {
        var tmpSecondsAllowed = uint32()
        var tmpSecondsPlayed = uint32()
        let rc = SteamAPI_ISteamApps_BIsTimedTrial(interface, &tmpSecondsAllowed, &tmpSecondsPlayed)
        return (rc: rc, secondsAllowed: Int(tmpSecondsAllowed), secondsPlayed: Int(tmpSecondsPlayed))
    }

    /// Steamworks `ISteamApps::BIsVACBanned()`
    public func isVACBanned() -> Bool {
        SteamAPI_ISteamApps_BIsVACBanned(interface)
    }

    /// Steamworks `ISteamApps::GetAppBuildId()`
    public func getAppBuildId() -> Int {
        Int(SteamAPI_ISteamApps_GetAppBuildId(interface))
    }

    /// Steamworks `ISteamApps::GetAppInstallDir()`
    public func getAppInstallDir(id: AppID, folderBufferSize: Int) -> (rc: Int, folder: String) {
        let tmpFolder = SteamString(length: folderBufferSize) /* OUT_STR */
        let rc = Int(SteamAPI_ISteamApps_GetAppInstallDir(interface, AppId_t(id), tmpFolder.charBuffer, uint32(folderBufferSize)))
        return (rc: rc, folder: tmpFolder.swiftString)
    }

    /// Steamworks `ISteamApps::GetAppOwner()`
    public func getAppOwner() -> SteamID {
        SteamID(SteamAPI_ISteamApps_GetAppOwner(interface))
    }

    /// Steamworks `ISteamApps::GetAvailableGameLanguages()`
    public func getAvailableGameLanguages() -> String {
        String(SteamAPI_ISteamApps_GetAvailableGameLanguages(interface))
    }

    /// Steamworks `ISteamApps::GetCurrentBetaName()`
    public func getCurrentBetaName(nameBufferSize: Int) -> (rc: Bool, name: String) {
        let tmpName = SteamString(length: nameBufferSize) /* OUT_STR */
        let rc = SteamAPI_ISteamApps_GetCurrentBetaName(interface, tmpName.charBuffer, CInt(nameBufferSize))
        if rc {
            return (rc: rc, name: tmpName.swiftString)
        } else {
            return (rc: rc, name: "")
        }
    }

    /// Steamworks `ISteamApps::GetCurrentGameLanguage()`
    public func getCurrentGameLanguage() -> String {
        String(SteamAPI_ISteamApps_GetCurrentGameLanguage(interface))
    }

    /// Steamworks `ISteamApps::GetDLCCount()`
    public func getDLCCount() -> Int {
        Int(SteamAPI_ISteamApps_GetDLCCount(interface))
    }

    /// Steamworks `ISteamApps::GetDlcDownloadProgress()`
    public func getDlcDownloadProgress(appID: AppID) -> (rc: Bool, bytesDownloaded: UInt64, bytesTotal: UInt64) {
        var tmpBytesDownloaded = uint64()
        var tmpBytesTotal = uint64()
        let rc = SteamAPI_ISteamApps_GetDlcDownloadProgress(interface, AppId_t(appID), &tmpBytesDownloaded, &tmpBytesTotal)
        return (rc: rc, bytesDownloaded: tmpBytesDownloaded, bytesTotal: tmpBytesTotal)
    }

    /// Steamworks `ISteamApps::GetEarliestPurchaseUnixTime()`
    public func getEarliestPurchaseUnixTime(appID: AppID) -> RTime32 {
        RTime32(SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime(interface, AppId_t(appID)))
    }

    /// Steamworks `ISteamApps::GetFileDetails()`, callback
    public func getFileDetails(fileName: String, completion: @escaping (FileDetailsResult?) -> Void) {
        let rc = SteamAPI_ISteamApps_GetFileDetails(interface, fileName)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamApps::GetFileDetails()`, async
    public func getFileDetails(fileName: String) async -> FileDetailsResult? {
        await withUnsafeContinuation {
            getFileDetails(fileName: fileName, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamApps::GetInstalledDepots()`
    public func getInstalledDepots(id: AppID, maxDepots: Int) -> (rc: Int, depots: [DepotID]) {
        let tmpDepots = SteamOutArray<DepotId_t>(maxDepots)
        let rc = Int(SteamAPI_ISteamApps_GetInstalledDepots(interface, AppId_t(id), tmpDepots.steamArray, uint32(maxDepots)))
        return (rc: rc, depots: tmpDepots.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamApps::GetLaunchCommandLine()`
    public func getLaunchCommandLine(commandLineSize: Int) -> (rc: Int, commandLine: String) {
        let tmpCommandLine = SteamString(length: commandLineSize) /* OUT_STR */
        let rc = Int(SteamAPI_ISteamApps_GetLaunchCommandLine(interface, tmpCommandLine.charBuffer, CInt(commandLineSize)))
        return (rc: rc, commandLine: tmpCommandLine.swiftString)
    }

    /// Steamworks `ISteamApps::GetLaunchQueryParam()`
    public func getLaunchQueryParam(key: String) -> String {
        String(SteamAPI_ISteamApps_GetLaunchQueryParam(interface, key))
    }

    /// Steamworks `ISteamApps::InstallDLC()`
    public func installDLC(appID: AppID) {
        SteamAPI_ISteamApps_InstallDLC(interface, AppId_t(appID))
    }

    /// Steamworks `ISteamApps::MarkContentCorrupt()`
    public func markContentCorrupt(missingFilesOnly: Bool) -> Bool {
        SteamAPI_ISteamApps_MarkContentCorrupt(interface, missingFilesOnly)
    }

    /// Steamworks `ISteamApps::RequestAllProofOfPurchaseKeys()`
    public func requestAllProofOfPurchaseKeys() {
        SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys(interface)
    }

    /// Steamworks `ISteamApps::RequestAppProofOfPurchaseKey()`
    public func requestAppProofOfPurchaseKey(appID: AppID) {
        SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey(interface, AppId_t(appID))
    }

    /// Steamworks `ISteamApps::UninstallDLC()`
    public func uninstallDLC(appID: AppID) {
        SteamAPI_ISteamApps_UninstallDLC(interface, AppId_t(appID))
    }
}
