//
//  SteamAPI.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

// Leaving out:
// * cegclient.h stuff eg. `Steamworks_InitCEGLibrary()` -- these seem to be
//   legacy or at least unobtainable by mortals
// * Windows 32-bit error reporting eg. `SteamAPI_WriteMiniDump()`
// * Deprecated `SteamAPI_GetSteamInstallPath()`, `SteamAPI_InitSafe()`
// * Breakpad stuff eg. `SteamAPI_SetBreakpadAppID()` -- undocumented
// * `SteamAPI_SetTryCatchCallbacks()` - not required because manual dispatch

@_implementationOnly import CSteamworks
import Logging

/// An instance of the Steamworks user API
///
/// Create and retain one of these to access and use the Steamworks APIs.
///
/// Steamworks ref: [steam_api.h](https://partner.steamgames.com/doc/api/steam_api)
public final class SteamAPI: SteamBaseAPI {

    // MARK: Lifecycle

    /// Initialize the Steamworks API.
    ///
    /// Calls `SteamAPI_Init()` and also, if `appID` is non-`nil`, `SteamAPI_RestartAppIfNecessary()`.
    ///
    /// The Steamworks API is shut down when this object goes out of scope.
    ///
    /// - returns: `nil` if the Steam API connection failed or app restart is necessary.
    public init?(appID: UInt32? = nil) {
        if let appID = appID, SteamAPI_RestartAppIfNecessary(appID) {
            logError("SteamAPI.init() failed: SteamAPI_RestartAppIfNecessary(\(appID)) returned true")
            return nil
        }
        guard SteamAPI_Init() else {
            logError("SteamAPI.init() failed: SteamAPI_Init() returned false")
            return nil
        }

        super.init(steamPipe: SteamAPI_GetHSteamPipe())
    }

    /// Calls `SteamAPI_IsSteamRunning()`.
    public var isSteamRunning: Bool {
        SteamAPI_IsSteamRunning()
    }

    deinit {
        SteamAPI_Shutdown()
    }
}
