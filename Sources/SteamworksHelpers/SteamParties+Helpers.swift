//
//  SteamParties+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks

extension SteamParties {
    /// Steamworks `ISteamParties::GetAvailableBeaconLocations()`
    public func getAvailableBeaconLocations() -> (rc: Bool, locationList: [SteamPartyBeaconLocation]) {
        let (rc, count) = getNumAvailableBeaconLocations()
        guard rc else {
            return (rc, [])
        }
        return getAvailableBeaconLocations(maxNumLocations: count)
    }
}
