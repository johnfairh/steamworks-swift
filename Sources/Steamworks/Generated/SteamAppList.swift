//
//  SteamAppList.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamAppList`](https://partner.steamgames.com/doc/api/ISteamAppList)
///
/// Access via `SteamAPI.appList`.
public struct SteamAppList {
    var interface: UnsafeMutablePointer<ISteamAppList> {
        SteamAPI_SteamAppList_v001()
    }

    init() {
    }

    /// Steamworks `ISteamAppList::GetAppBuildId()`
    public func getAppBuildId(appID: AppID) -> Int {
        Int(SteamAPI_ISteamAppList_GetAppBuildId(interface, AppId_t(appID)))
    }

    /// Steamworks `ISteamAppList::GetAppInstallDir()`
    public func getAppInstallDir(appID: AppID, directory: inout String, nameMaxSize: Int) -> Int {
        let tmp_directory = UnsafeMutableBufferPointer<CChar>.allocate(capacity: nameMaxSize)
        defer { tmp_directory.deallocate() }
        let rc = Int(SteamAPI_ISteamAppList_GetAppInstallDir(interface, AppId_t(appID), tmp_directory.baseAddress, Int32(nameMaxSize)))
        if rc != -1 {
            directory = String(tmp_directory)
        }
        return rc
    }

    /// Steamworks `ISteamAppList::GetAppName()`
    public func getAppName(appID: AppID, name: inout String, nameMaxSize: Int) -> Int {
        let tmp_name = UnsafeMutableBufferPointer<CChar>.allocate(capacity: nameMaxSize)
        defer { tmp_name.deallocate() }
        let rc = Int(SteamAPI_ISteamAppList_GetAppName(interface, AppId_t(appID), tmp_name.baseAddress, Int32(nameMaxSize)))
        if rc != -1 {
            name = String(tmp_name)
        }
        return rc
    }

    /// Steamworks `ISteamAppList::GetInstalledApps()`
    public func getInstalledApps(appID: inout [AppID], maxAppIDs: Int) -> Int {
        let tmp_appID = UnsafeMutableBufferPointer<AppId_t>.allocate(capacity: maxAppIDs)
        defer { tmp_appID.deallocate() }
        let rc = Int(SteamAPI_ISteamAppList_GetInstalledApps(interface, tmp_appID.baseAddress, uint32(maxAppIDs)))
        appID = tmp_appID.map { AppID($0) }
        return rc
    }

    /// Steamworks `ISteamAppList::GetNumInstalledApps()`
    public func getNumInstalledApps() -> Int {
        Int(SteamAPI_ISteamAppList_GetNumInstalledApps(interface))
    }
}
