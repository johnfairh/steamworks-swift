//
//  SteamHTTP.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamHTTP`](https://partner.steamgames.com/doc/api/ISteamHTTP)
///
/// Access via `SteamBaseAPI.http` through a `SteamAPI` or `SteamGameServerAPI` instance.
public struct SteamHTTP {
    private let isServer: Bool
    var interface: UnsafeMutablePointer<ISteamHTTP> {
        isServer ? SteamAPI_SteamGameServerHTTP_v003() : SteamAPI_SteamHTTP_v003()
    }

    init(isServer: Bool) {
        self.isServer = isServer
    }

    /// Steamworks `ISteamHTTP::CreateCookieContainer()`
    public func createCookieContainer(allowResponsesToModify: Bool) -> HTTPCookieContainerHandle {
        HTTPCookieContainerHandle(SteamAPI_ISteamHTTP_CreateCookieContainer(interface, allowResponsesToModify))
    }

    /// Steamworks `ISteamHTTP::CreateHTTPRequest()`
    public func createHTTPRequest(httpRequestMethod: HTTPMethod, absoluteURL: String) -> HTTPRequestHandle {
        HTTPRequestHandle(SteamAPI_ISteamHTTP_CreateHTTPRequest(interface, EHTTPMethod(httpRequestMethod), absoluteURL))
    }

    /// Steamworks `ISteamHTTP::DeferHTTPRequest()`
    @discardableResult
    public func deferHTTPRequest(request: HTTPRequestHandle) -> Bool {
        SteamAPI_ISteamHTTP_DeferHTTPRequest(interface, CSteamworks.HTTPRequestHandle(request))
    }

    /// Steamworks `ISteamHTTP::GetHTTPDownloadProgressPct()`
    public func getHTTPDownloadProgressPct(request: HTTPRequestHandle) -> (rc: Bool, percent: Float) {
        var tmpPercent = CFloat()
        let rc = SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct(interface, CSteamworks.HTTPRequestHandle(request), &tmpPercent)
        return (rc: rc, percent: tmpPercent)
    }

    /// Steamworks `ISteamHTTP::GetHTTPRequestWasTimedOut()`
    public func getHTTPRequestWasTimedOut(request: HTTPRequestHandle) -> (rc: Bool, wasTimedOut: Bool) {
        var tmpWasTimedOut = CBool()
        let rc = SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut(interface, CSteamworks.HTTPRequestHandle(request), &tmpWasTimedOut)
        return (rc: rc, wasTimedOut: tmpWasTimedOut)
    }

    /// Steamworks `ISteamHTTP::GetHTTPResponseBodyData()`
    public func getHTTPResponseBodyData(request: HTTPRequestHandle, bufferSize: Int) -> (rc: Bool, bodyDataBuffer: [UInt8]) {
        var tmpBodyDataBuffer = SteamTransOutArray<UInt8>(bufferSize)
        let rc = tmpBodyDataBuffer.setContent { nstBodyDataBuffer in
            SteamAPI_ISteamHTTP_GetHTTPResponseBodyData(interface, CSteamworks.HTTPRequestHandle(request), nstBodyDataBuffer, uint32(bufferSize))
        }
        return (rc: rc, bodyDataBuffer: tmpBodyDataBuffer.swiftArray())
    }

    /// Steamworks `ISteamHTTP::GetHTTPResponseBodySize()`
    public func getHTTPResponseBodySize(request: HTTPRequestHandle) -> (rc: Bool, bodySize: Int) {
        var tmpBodySize = uint32()
        let rc = SteamAPI_ISteamHTTP_GetHTTPResponseBodySize(interface, CSteamworks.HTTPRequestHandle(request), &tmpBodySize)
        return (rc: rc, bodySize: Int(tmpBodySize))
    }

    /// Steamworks `ISteamHTTP::GetHTTPResponseHeaderSize()`
    public func getHTTPResponseHeaderSize(request: HTTPRequestHandle, headerName: String) -> (rc: Bool, responseHeaderSize: Int) {
        var tmpResponseHeaderSize = uint32()
        let rc = SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize(interface, CSteamworks.HTTPRequestHandle(request), headerName, &tmpResponseHeaderSize)
        return (rc: rc, responseHeaderSize: Int(tmpResponseHeaderSize))
    }

    /// Steamworks `ISteamHTTP::GetHTTPResponseHeaderValue()`
    public func getHTTPResponseHeaderValue(request: HTTPRequestHandle, headerName: String, bufferSize: Int) -> (rc: Bool, headerValueBuffer: [UInt8]) {
        var tmpHeaderValueBuffer = SteamTransOutArray<UInt8>(bufferSize)
        let rc = tmpHeaderValueBuffer.setContent { nstHeaderValueBuffer in
            SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue(interface, CSteamworks.HTTPRequestHandle(request), headerName, nstHeaderValueBuffer, uint32(bufferSize))
        }
        return (rc: rc, headerValueBuffer: tmpHeaderValueBuffer.swiftArray())
    }

    /// Steamworks `ISteamHTTP::GetHTTPStreamingResponseBodyData()`
    public func getHTTPStreamingResponseBodyData(request: HTTPRequestHandle, offset: Int, bodyDataBuffer: UnsafeMutablePointer<UInt8>, bufferSize: Int) -> Bool {
        SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData(interface, CSteamworks.HTTPRequestHandle(request), uint32(offset), bodyDataBuffer, uint32(bufferSize))
    }

    /// Steamworks `ISteamHTTP::PrioritizeHTTPRequest()`
    @discardableResult
    public func prioritizeHTTPRequest(request: HTTPRequestHandle) -> Bool {
        SteamAPI_ISteamHTTP_PrioritizeHTTPRequest(interface, CSteamworks.HTTPRequestHandle(request))
    }

    /// Steamworks `ISteamHTTP::ReleaseCookieContainer()`
    @discardableResult
    public func releaseCookieContainer(cookieContainer: HTTPCookieContainerHandle) -> Bool {
        SteamAPI_ISteamHTTP_ReleaseCookieContainer(interface, CSteamworks.HTTPCookieContainerHandle(cookieContainer))
    }

    /// Steamworks `ISteamHTTP::ReleaseHTTPRequest()`
    @discardableResult
    public func releaseHTTPRequest(request: HTTPRequestHandle) -> Bool {
        SteamAPI_ISteamHTTP_ReleaseHTTPRequest(interface, CSteamworks.HTTPRequestHandle(request))
    }

    /// Steamworks `ISteamHTTP::SetCookie()`
    public func setCookie(cookieContainer: HTTPCookieContainerHandle, host: String, url: String, cookie: String) -> Bool {
        SteamAPI_ISteamHTTP_SetCookie(interface, CSteamworks.HTTPCookieContainerHandle(cookieContainer), host, url, cookie)
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestAbsoluteTimeoutMS()`
    public func setHTTPRequestAbsoluteTimeoutMS(request: HTTPRequestHandle, milliseconds: Int) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS(interface, CSteamworks.HTTPRequestHandle(request), uint32(milliseconds))
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestContextValue()`
    public func setHTTPRequestContextValue(request: HTTPRequestHandle, contextValue: UInt64) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestContextValue(interface, CSteamworks.HTTPRequestHandle(request), contextValue)
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestCookieContainer()`
    @discardableResult
    public func setHTTPRequestCookieContainer(request: HTTPRequestHandle, cookieContainer: HTTPCookieContainerHandle) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer(interface, CSteamworks.HTTPRequestHandle(request), CSteamworks.HTTPCookieContainerHandle(cookieContainer))
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestGetOrPostParameter()`
    public func setHTTPRequestGetOrPostParameter(request: HTTPRequestHandle, paramName: String, paramValue: String) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter(interface, CSteamworks.HTTPRequestHandle(request), paramName, paramValue)
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestHeaderValue()`
    public func setHTTPRequestHeaderValue(request: HTTPRequestHandle, headerName: String, headerValue: String) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue(interface, CSteamworks.HTTPRequestHandle(request), headerName, headerValue)
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestNetworkActivityTimeout()`
    public func setHTTPRequestNetworkActivityTimeout(request: HTTPRequestHandle, timeoutSeconds: Int) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout(interface, CSteamworks.HTTPRequestHandle(request), uint32(timeoutSeconds))
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestRawPostBody()`
    public func setHTTPRequestRawPostBody(request: HTTPRequestHandle, contentType: String, body: UnsafePointer<UInt8>, bodyLen: Int) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody(interface, CSteamworks.HTTPRequestHandle(request), contentType, .init(mutating: body), uint32(bodyLen))
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestRequiresVerifiedCertificate()`
    public func setHTTPRequestRequiresVerifiedCertificate(request: HTTPRequestHandle, requireVerifiedCertificate: Bool) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate(interface, CSteamworks.HTTPRequestHandle(request), requireVerifiedCertificate)
    }

    /// Steamworks `ISteamHTTP::SetHTTPRequestUserAgentInfo()`
    @discardableResult
    public func setHTTPRequestUserAgentInfo(request: HTTPRequestHandle, userAgentInfo: String) -> Bool {
        SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo(interface, CSteamworks.HTTPRequestHandle(request), userAgentInfo)
    }
}
