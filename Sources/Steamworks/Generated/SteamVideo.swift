//
//  SteamVideo.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamVideo`](https://partner.steamgames.com/doc/api/ISteamVideo)
///
/// Access via `SteamAPI.video`.
public struct SteamVideo: Sendable {
    var interface: UnsafeMutablePointer<ISteamVideo> {
        SteamAPI_SteamVideo_v002()
    }

    init() {
    }

    /// Steamworks `ISteamVideo::GetOPFSettings()`
    public func getOPFSettings(videoAppID: AppID) {
        SteamAPI_ISteamVideo_GetOPFSettings(interface, AppId_t(videoAppID))
    }

    /// Steamworks `ISteamVideo::GetOPFStringForApp()`
    public func getOPFStringForApp(videoAppID: AppID, bufferSize: Int = 48000) -> (rc: Bool, buffer: String, bufferSize: Int) {
        var tmpBuffer = SteamOutString(length: bufferSize)
        var tmpBufferSize = int32(bufferSize)
        let rc = tmpBuffer.setContent { nstBuffer in
            SteamAPI_ISteamVideo_GetOPFStringForApp(interface, AppId_t(videoAppID), nstBuffer, &tmpBufferSize)
        }
        if rc {
            return (rc: rc, buffer: tmpBuffer.swiftString, bufferSize: Int(tmpBufferSize))
        } else {
            return (rc: rc, buffer: "", bufferSize: 0)
        }
    }

    /// Steamworks `ISteamVideo::GetVideoURL()`
    public func getVideoURL(videoAppID: AppID) {
        SteamAPI_ISteamVideo_GetVideoURL(interface, AppId_t(videoAppID))
    }

    /// Steamworks `ISteamVideo::IsBroadcasting()`
    public func isBroadcasting() -> (rc: Bool, numViewers: Int) {
        var tmpNumViewers = CInt()
        let rc = SteamAPI_ISteamVideo_IsBroadcasting(interface, &tmpNumViewers)
        return (rc: rc, numViewers: Int(tmpNumViewers))
    }
}
