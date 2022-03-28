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
public struct SteamVideo {
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
    public func getOPFStringForApp(videoAppID: AppID, buffer: inout String, bufferSize: inout Int) -> Bool {
        let tmp_buffer = UnsafeMutableBufferPointer<CChar>.allocate(capacity: bufferSize)
        defer { tmp_buffer.deallocate() }
        var tmp_bufferSize = int32(bufferSize)
        let rc = SteamAPI_ISteamVideo_GetOPFStringForApp(interface, AppId_t(videoAppID), tmp_buffer.baseAddress, &tmp_bufferSize)
        if rc {
            buffer = String(tmp_buffer)
            bufferSize = Int(tmp_bufferSize)
        }
        if rc {
            return rc
        } else {
            return rc
        }
    }

    /// Steamworks `ISteamVideo::GetVideoURL()`
    public func getVideoURL(videoAppID: AppID) {
        SteamAPI_ISteamVideo_GetVideoURL(interface, AppId_t(videoAppID))
    }

    /// Steamworks `ISteamVideo::IsBroadcasting()`
    public func isBroadcasting() -> (rc: Bool, numViewers: Int) {
        var tmp_numViewers = Int32()
        let rc = SteamAPI_ISteamVideo_IsBroadcasting(interface, &tmp_numViewers)
        return (rc: rc, numViewers: Int(tmp_numViewers))
    }
}
