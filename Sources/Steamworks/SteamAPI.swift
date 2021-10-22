//
//  SteamAPI.swift
//  Steamworks
//
//  Created by John on 22/10/2021.
//

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

    public func dispatchMessages() {
        messageDispatch.dispatch()
    }

    public func releaseCurrentThreadMemory() {
        SteamAPI_ReleaseCurrentThreadMemory()
    }

    deinit {
        SteamAPI_Shutdown()
    }
}
