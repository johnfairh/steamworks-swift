//
//  SteamFriends.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamFriends`](https://partner.steamgames.com/doc/api/ISteamFriends)
///
/// Access via `SteamAPI.friends`.
public struct SteamFriends {
    /// So.... if we actually have storage of type `ISteamWhatever` then the link fails because
    /// nobody links libc++.  We add that lib and the link works, but then runtime goes horribly
    /// wrong somehow and the pointer gets corrupted.
    /// Only safe way rn is to not cache it but query it each time.
    var interface: UnsafeMutablePointer<ISteamFriends> {
        SteamAPI_SteamFriends_v017()
    }

    init() {
    }
}

/// Steamworks [`ISteamUtils`](https://partner.steamgames.com/doc/api/ISteamUtils)
///
/// Access via `SteamAPI.utils` or `SteamGameServerAPI.utils`
public struct SteamUtils {
    private let isServer: Bool

    var interface: UnsafeMutablePointer<ISteamUtils> {
        isServer ? SteamAPI_SteamGameServerUtils_v010() : SteamAPI_SteamUtils_v010()
    }

    init(isServer: Bool) {
        self.isServer = isServer
    }
}
