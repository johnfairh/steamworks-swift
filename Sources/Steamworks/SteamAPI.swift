//
//  SteamAPI.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
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

// setenv()
#if canImport(Glibc)
import Glibc
#endif
#if canImport(Darwin)
import Darwin
#endif

/// An instance of the Steamworks user API
///
/// Create and retain one of these to access and use the Steamworks APIs.
///
/// Steamworks ref: [steam_api.h](https://partner.steamgames.com/doc/api/steam_api)
public final class SteamAPI: SteamBaseAPI, Sendable {

    // MARK: Lifecycle

    /// Initialize the Steamworks API.
    ///
    /// Calls `SteamAPI_RestartAppIfNecessary()` and `SteamAPI_Init()`.
    ///
    /// If you installed a hook with `Steamworks_InstallCEGHooks()` then the CEG init
    /// hook is called before `SteamAPI_Init()`.
    ///
    /// If you set`fakeAppIdTxtFile` to `true` then the system behaves as though you
    /// have a `steam_appid.txt` file in the correct location containing your appID:
    /// 1. `SteamAPI_RestartAppIfNecessary()` never returns `true`;
    /// 2. `SteamAPI_Init()` uses the passed-in App ID.
    /// ...so it's a development assist to stop you having to manage the text file.
    ///
    /// The Steamworks API is shut down when this object goes out of scope.
    ///
    /// - returns: `nil` if the Steam API connection failed or app restart is necessary.
    public init?(appID: AppID, fakeAppIdTxtFile: Bool = false) {
        if !fakeAppIdTxtFile && SteamAPI_RestartAppIfNecessary(UInt32(appID)) {
            logError("SteamAPI.init() failed: SteamAPI_RestartAppIfNecessary(\(appID)) returned true")
            return nil
        }
        if fakeAppIdTxtFile {
            setenv("SteamAppId", "\(appID.value)", 1)
        }
        if let initSteamCEG, !initSteamCEG() {
            logError("SteamAPI.init() failed: Steamworks_InitCEGLibrary() returned false")
            return nil
        }
        guard SteamAPI_Init() else {
            logError("SteamAPI.init() failed: SteamAPI_Init() returned false")
            return nil
        }

        super.init(steamPipe: HSteamPipe(SteamAPI_GetHSteamPipe()), isServer: false)
    }

    /// Calls `SteamAPI_IsSteamRunning()`.
    public var isSteamRunning: Bool {
        SteamAPI_IsSteamRunning()
    }

    deinit {
        SteamAPI_Shutdown()

        if let termSteamCEG {
            termSteamCEG()
        }
    }

    // MARK: Interfaces

    /// Access the Steamworks `ISteamAppList` interface
    public let appList = SteamAppList()
    /// Access the Steamworks `ISteamApps` interface
    public let apps = SteamApps()
    /// Access the Steamworks `ISteamFriends` interface
    public let friends = SteamFriends()
    /// Access the Steamworks `ISteamGameSearch` interface
    public let gameSearch = SteamGameSearch()
    /// Access the Steamworks `ISteamHTMLSurface` interface
    public let htmlSurface = SteamHTMLSurface()
    /// Access the Steamworks `ISteamInput` interface
    public let input = SteamInput()
    /// Access the Steamworks `ISteamMatchmaking` interface
    public let matchmaking = SteamMatchmaking()
    /// Access the Steamworks `ISteamMatchmakingServers` interface
    public let matchmakingServers = SteamMatchmakingServers()
    /// Access the Steamworks `ISteamMusic` interface
    public let music = SteamMusic()
    /// Access the Steamworks `ISteamMusicRemote` interface
    public let musicRemote = SteamMusicRemote()
    /// Access the Steamworks `ISteamParentalSettings` interface
    public let parentalSettings = SteamParentalSettings()
    /// Access the Steamworks `ISteamParties` interface
    public let parties = SteamParties()
    /// Access the Steamworks `ISteamRemotePlay` interface
    public let remotePlay = SteamRemotePlay()
    /// Access the Steamworks `ISteamRemoteStorage` interface
    public let remoteStorage = SteamRemoteStorage()
    /// Access the Steamworks `ISteamUser` interface
    public let user = SteamUser()
    /// Access the Steamworks `ISteamUserStats` interface
    public let userStats = SteamUserStats()
    /// Access the Steamworks `ISteamVideo` interface
    public let video = SteamVideo()
}

private var initSteamCEG: (() -> Bool)? = nil
private var termSteamCEG: (() -> Void)? = nil

/// Initialize Steam DRM hooks - you can call these manually or pass them in here to let the library
/// call them at the right time around `SteamAPI_Init()` and `SteamAPI_Term()`.
public func Steamworks_InstallCEGHooks(initCEG: @escaping () -> Bool, termCEG: @escaping () -> Void) {
    initSteamCEG = initCEG
    termSteamCEG = termCEG
}
