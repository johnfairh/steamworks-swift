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
    public func getAppInstallDir(appID: AppID, nameMaxSize: Int) -> (rc: Int, directory: String) {
        let tmp_directory = SteamString(length: nameMaxSize)
        let rc = Int(SteamAPI_ISteamAppList_GetAppInstallDir(interface, AppId_t(appID), tmp_directory.charBuffer, Int32(nameMaxSize)))
        if rc != -1 {
            return (rc: rc, directory: tmp_directory.swiftString)
        } else {
            return (rc: rc, directory: "")
        }
    }

    /// Steamworks `ISteamAppList::GetAppName()`
    public func getAppName(appID: AppID, nameMaxSize: Int) -> (rc: Int, name: String) {
        let tmp_name = SteamString(length: nameMaxSize)
        let rc = Int(SteamAPI_ISteamAppList_GetAppName(interface, AppId_t(appID), tmp_name.charBuffer, Int32(nameMaxSize)))
        if rc != -1 {
            return (rc: rc, name: tmp_name.swiftString)
        } else {
            return (rc: rc, name: "")
        }
    }

    /// Steamworks `ISteamAppList::GetInstalledApps()`
    public func getInstalledApps(maxAppIDs: Int) -> (rc: Int, appID: [AppID]) {
        let tmp_appID = SteamOutArray<AppId_t>(maxAppIDs)
        let rc = Int(SteamAPI_ISteamAppList_GetInstalledApps(interface, tmp_appID.steamArray, uint32(maxAppIDs)))
        return (rc: rc, appID: tmp_appID.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamAppList::GetNumInstalledApps()`
    public func getNumInstalledApps() -> Int {
        Int(SteamAPI_ISteamAppList_GetNumInstalledApps(interface))
    }
}
