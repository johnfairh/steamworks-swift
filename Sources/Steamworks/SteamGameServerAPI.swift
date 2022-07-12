//
//  SteamGameServerAPI.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

// Leaving out:
// * `SteamGameServer_GetSteamID()`, `_BSecure()` - use the isteamgameserver version instead
// * `SteamGameServer_ReleaseCurrentThreadMemory()` - just calls the normal version

@_implementationOnly import CSteamworks

/// An instance of the Steamworks game server API
///
/// Create and retain one of these to access and use the Steamworks game server APIs.
///
/// Steamworks ref: [steam_gameserver.h](https://partner.steamgames.com/doc/api/steam_gameserver)
public final class SteamGameServerAPI: SteamBaseAPI {
    // MARK: Lifecycle

    /// Initialize the Steamworks game server API.
    ///
    /// The game server API is shut down when this object goes out of scope.  See `SteamGameServer_Init()`.
    ///
    /// - parameter ip: IPv4 address to bind.  Default is 0, `INADDR_ANY`.
    /// - parameter port: Port clients connect to for gameplay.
    /// - parameter queryPort: Port clients use for browser etc.  Default of `nil` means `STEAMGAMESERVER_QUERY_PORT_SHARED`, see docs.
    /// - parameter serverMode: Authentication mode.
    /// - parameter version: Server version.
    /// - returns: `nil` if the API failed to initialize.
    public init?(ip: Int = 0, port: UInt16, queryPort: UInt16? = nil, serverMode: ServerMode, version: String) {
        let qPort = queryPort ?? STEAMGAMESERVER_QUERY_PORT_SHARED
        guard SteamGameServer_Init(UInt32(ip), port, qPort, EServerMode(serverMode), version) else {
            logError("SteamGameServerAPI.init() failed: SteamGameServer_Init() returned false")
            return nil
        }

        super.init(steamPipe: HSteamPipe(SteamGameServer_GetHSteamPipe()), isServer: true)
    }

    deinit {
        SteamGameServer_Shutdown()
    }

    // MARK: Interfaces

    /// Access the Steamworks `ISteamGameServer` interface
    public let gameServer = SteamGameServer()
    /// Access the Steamworks `ISteamGameServerStats` interface
    public let gameServerStats = SteamGameServerStats()
}
