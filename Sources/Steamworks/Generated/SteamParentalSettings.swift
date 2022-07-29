//
//  SteamParentalSettings.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamParentalSettings`](https://partner.steamgames.com/doc/api/ISteamParentalSettings)
///
/// Access via `SteamAPI.parentalSettings`.
public struct SteamParentalSettings: Sendable {
    var interface: UnsafeMutablePointer<ISteamParentalSettings> {
        SteamAPI_SteamParentalSettings_v001()
    }

    init() {
    }

    /// Steamworks `ISteamParentalSettings::BIsAppBlocked()`
    public func isAppBlocked(appID: AppID) -> Bool {
        SteamAPI_ISteamParentalSettings_BIsAppBlocked(interface, AppId_t(appID))
    }

    /// Steamworks `ISteamParentalSettings::BIsAppInBlockList()`
    public func isAppInBlockList(appID: AppID) -> Bool {
        SteamAPI_ISteamParentalSettings_BIsAppInBlockList(interface, AppId_t(appID))
    }

    /// Steamworks `ISteamParentalSettings::BIsFeatureBlocked()`
    public func isFeatureBlocked(feature: ParentalFeature) -> Bool {
        SteamAPI_ISteamParentalSettings_BIsFeatureBlocked(interface, EParentalFeature(feature))
    }

    /// Steamworks `ISteamParentalSettings::BIsFeatureInBlockList()`
    public func isFeatureInBlockList(feature: ParentalFeature) -> Bool {
        SteamAPI_ISteamParentalSettings_BIsFeatureInBlockList(interface, EParentalFeature(feature))
    }

    /// Steamworks `ISteamParentalSettings::BIsParentalLockEnabled()`
    public func isParentalLockEnabled() -> Bool {
        SteamAPI_ISteamParentalSettings_BIsParentalLockEnabled(interface)
    }

    /// Steamworks `ISteamParentalSettings::BIsParentalLockLocked()`
    public func isParentalLockLocked() -> Bool {
        SteamAPI_ISteamParentalSettings_BIsParentalLockLocked(interface)
    }
}
