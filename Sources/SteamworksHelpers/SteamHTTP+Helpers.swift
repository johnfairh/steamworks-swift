//
//  SteamHTTP+Helpers.swift
//  steamworks-swift
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamHTTP {
    /// Steamworks `ISteamHTTP::GetHTTPResponseBodyData()`
    public func getHTTPResponseBodyData(request: HTTPRequestHandle) -> String? {
        let bodySize = getHTTPResponseBodySize(request: request)
        guard bodySize.rc else {
            return nil
        }
        let body = getHTTPResponseBodyData(request: request, bufferSize: bodySize.bodySize)
        guard body.rc else {
            return nil
        }
        return String(cString: body.bodyDataBuffer + [0])
    }

    /// Steamworks `ISteamHTTP::GetHTTPResponseHeaderValue()`
    public func getHTTPResponseHeaderValue(request: HTTPRequestHandle, headerName: String) -> String? {
        let headerSize = getHTTPResponseHeaderSize(request: request, headerName: headerName)
        guard headerSize.rc else {
            return nil
        }
        let header = getHTTPResponseHeaderValue(request: request, headerName: headerName, bufferSize: headerSize.responseHeaderSize)
        guard header.rc else {
            return nil
        }
        return String(cString: header.headerValueBuffer + [0])
    }

//    // bit different here, think there is a missing 'const', surely the body can't be changed...
//
//    /// Steamworks `ISteamHTTP::SetHTTPRequestRawPostBody()`
//    public func setHTTPRequestRawPostBody(request: HTTPRequestHandle, contentType: String, body: String) -> Bool {
//        var body = body
//        let count = body.utf8.count
//        return body.withUTF8 {
//            let mutable = UnsafeMutablePointer(mutating: $0.baseAddress!)
//            return setHTTPRequestRawPostBody(request: request, contentType: contentType, body: mutable, bodyLen: count)
//        }
//    }
}
