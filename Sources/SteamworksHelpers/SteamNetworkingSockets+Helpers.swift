//
//  SteamNetworkingSockets+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks

extension SteamNetworkingSockets {
    /// Steamworks `ISteamNetworkingSockets::GetCertificateRequest()`
    public func getCertificateRequest() -> (rc: Bool, blob: [UInt8], msg: String) {
        let (rc, size, _, msg) = getCertificateRequest(blobSize: 0, returnBlob: false)
        guard rc else {
            return (rc, [], msg)
        }
        let certReq = getCertificateRequest(blobSize: size)
        return (certReq.rc, certReq.blob, certReq.msg)
    }

    /// Steamworks `ISteamNetworkingSockets::GetDetailedConnectionStatus()`
    public func getDetailedConnectionStatus(conn: HSteamNetConnection) -> (rc: Int, buf: String) {
        let (rc, _) = getDetailedConnectionStatus(conn: conn, returnBuf: false, bufSize: 0)
        guard rc > 0 else {
            return (rc, "")
        }
        return getDetailedConnectionStatus(conn: conn, bufSize: rc)
    }

    /// Steamworks `ISteamNetworkingSockets::CloseConnection()` -- for built-in end-reasons
    @discardableResult
    public func closeConnection(peer: HSteamNetConnection, reason: SteamNetConnectionEnd, debug: String?, enableLinger: Bool) -> Bool {
        closeConnection(peer: peer, reason: Int(reason.rawValue), debug: debug, enableLinger: enableLinger)
    }
}
