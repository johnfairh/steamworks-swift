//
//  SteamNetworkingSockets+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamNetworkingSockets {
    /// Steamworks `ISteamNetworkingSockets::GetDetailedConnectionStatus()`
    public func getDetailedConnectionStatus(conn: HSteamNetConnection) -> (rc: Int, buf: String) {
        let (rc, _) = getDetailedConnectionStatus(conn: conn, returnBuf: false, bufSize: 0)
        guard rc > 0 else {
            return (rc, "")
        }
        return getDetailedConnectionStatus(conn: conn, bufSize: rc)
    }
}
