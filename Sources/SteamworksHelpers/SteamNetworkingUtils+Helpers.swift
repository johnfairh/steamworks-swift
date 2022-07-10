//
//  SteamNetworkingUtils+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamNetworkingUtils {
    /// Steamworks `ISteamNetworkingUtils::GetPOPList()`
    public func getPOPList() -> (rc: Int, list: [SteamNetworkingPOPID]) {
        getPOPList(listSz: getPOPCount())
    }
}
