//
//  SteamRemotePlay+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks

extension SteamRemotePlay {
    /// Steamworks `ISteamRemotePlay::GetInput()`
    public func getInput() -> [RemotePlayInput] {
        let (count, _) = getInput(returnInput: false, maxEvents: 0)
        guard count > 0 else {
            return []
        }
        return getInput(maxEvents: count).input
    }
}
