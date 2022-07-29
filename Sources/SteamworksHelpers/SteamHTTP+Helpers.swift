//
//  SteamHTTP+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks

extension SteamHTTP {
    /// Steamworks `ISteamHTTP::GetHTTPResponseBodyData()`
    public func getHTTPResponseBodyData(request: HTTPRequestHandle) -> (rc: Bool, bodyDataBuffer: [UInt8]) {
        let (rc, bodySize) = getHTTPResponseBodySize(request: request)
        guard rc else {
            return (false, [])
        }
        return getHTTPResponseBodyData(request: request, bufferSize: bodySize)
    }

    /// Steamworks `ISteamHTTP::GetHTTPResponseHeaderValue()`
    public func getHTTPResponseHeaderValue(request: HTTPRequestHandle, headerName: String) -> (rc: Bool, headerValueBuffer: [UInt8]) {
        let (rc, headerSize) = getHTTPResponseHeaderSize(request: request, headerName: headerName)
        guard rc else {
            return (false, [])
        }
        return getHTTPResponseHeaderValue(request: request, headerName: headerName, bufferSize: headerSize)
    }
}
