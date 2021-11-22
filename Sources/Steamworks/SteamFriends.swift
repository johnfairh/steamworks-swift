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
    /// someone (debug info?) is generating refs to the class vtable which Swift forgets to link.
    /// Workaround so far is to never store anything of that type!
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
    let interface: UnsafeMutablePointer<ISteamUtils>

    init(isServer: Bool) {
        interface = isServer ? SteamAPI_SteamGameServerUtils_v010() : SteamAPI_SteamUtils_v010()
    }
}
