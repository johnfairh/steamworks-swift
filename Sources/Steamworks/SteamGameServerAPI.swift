//
//  SteamGameServerAPI.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

// Leaving out:
// * `SteamGameServer_GetSteamID()`, `_BSecure()` - use the isteamgameserver version instead

@_implementationOnly import CSteamworks

public final class SteamGameServerAPI: SteamBaseAPI {
    public init?(ip: UInt32 = 0, port: UInt16, queryPort: UInt16? = nil, serverMode: Int = 0 /* XXX */, version: String) {
        guard SteamGameServer_Init(ip, port, queryPort ?? STEAMGAMESERVER_QUERY_PORT_SHARED, eServerModeNoAuthentication, version) else {
            return nil
        }

        super.init(steamPipe: SteamGameServer_GetHSteamPipe())
    }

    public func releaseCurrentThreadMemory() {
        SteamGameServer_ReleaseCurrentThreadMemory()
    }

    deinit {
        SteamGameServer_Shutdown()
    }
}

