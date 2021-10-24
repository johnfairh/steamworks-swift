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

public final class SteamAPI: @unchecked Sendable {
    let messageDispatch: MessageDispatch

    public init?(appID: UInt32? = nil) {
        if let appID = appID, SteamAPI_RestartAppIfNecessary(appID) {
            return nil
        }
        guard SteamAPI_Init() else {
            return nil
        }

        SteamAPI_ManualDispatch_Init()

        messageDispatch = MessageDispatch(steamPipe: SteamAPI_GetHSteamPipe())
    }

    public var isSteamRunning: Bool {
        SteamAPI_IsSteamRunning()
    }

    public func runCallbacks() {
        messageDispatch.runCallbacks()
    }

    public func releaseCurrentThreadMemory() {
        SteamAPI_ReleaseCurrentThreadMemory()
    }

    deinit {
        SteamAPI_Shutdown()
    }
}
