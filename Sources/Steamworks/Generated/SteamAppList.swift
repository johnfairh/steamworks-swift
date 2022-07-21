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
public struct SteamAppList: Sendable {
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
    public func getAppInstallDir(appID: AppID, nameMaxSize: Int = SteamConstants.filenameMaxSize) -> (rc: Int, directory: String) {
        var tmpDirectory = SteamOutString(length: nameMaxSize)
        let rc = tmpDirectory.setContent { nstDirectory in
            Int(SteamAPI_ISteamAppList_GetAppInstallDir(interface, AppId_t(appID), nstDirectory, CInt(nameMaxSize)))
        }
        if rc != -1 {
            return (rc: rc, directory: tmpDirectory.swiftString)
        } else {
            return (rc: rc, directory: "")
        }
    }

    /// Steamworks `ISteamAppList::GetAppName()`
    public func getAppName(appID: AppID, nameMaxSize: Int) -> (rc: Int, name: String) {
        var tmpName = SteamOutString(length: nameMaxSize)
        let rc = tmpName.setContent { nstName in
            Int(SteamAPI_ISteamAppList_GetAppName(interface, AppId_t(appID), nstName, CInt(nameMaxSize)))
        }
        if rc != -1 {
            return (rc: rc, name: tmpName.swiftString)
        } else {
            return (rc: rc, name: "")
        }
    }

    /// Steamworks `ISteamAppList::GetInstalledApps()`
    public func getInstalledApps(maxAppIDs: Int) -> (rc: Int, appID: [AppID]) {
        let tmpAppID = SteamOutArray<AppId_t>(maxAppIDs)
        let rc = Int(SteamAPI_ISteamAppList_GetInstalledApps(interface, tmpAppID.steamArray, uint32(maxAppIDs)))
        return (rc: rc, appID: tmpAppID.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamAppList::GetNumInstalledApps()`
    public func getNumInstalledApps() -> Int {
        Int(SteamAPI_ISteamAppList_GetNumInstalledApps(interface))
    }
}
