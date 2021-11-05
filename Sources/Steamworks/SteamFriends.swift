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

// tmp bringup

extension SteamFriends {
    public func getFollowerCount(steamID: UInt64, completion: @escaping (FriendsGetFollowerCount) -> Void) {
        let rc = SteamAPI_ISteamFriends_GetFollowerCount(interface, steamID)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }
}
