//
//  SteamScreenshots.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamScreenshots`](https://partner.steamgames.com/doc/api/ISteamScreenshots)
///
/// Access via `SteamAPI.screenshots`.
public struct SteamScreenshots {
    var interface: UnsafeMutablePointer<ISteamScreenshots> {
        SteamAPI_SteamScreenshots_v003()
    }

    init() {
    }

    /// Steamworks `ISteamScreenshots::AddScreenshotToLibrary()`
    public func addScreenshotToLibrary(filename: String, thumbnailFilename: String?, width: Int, height: Int) -> ScreenshotHandle {
        ScreenshotHandle(SteamAPI_ISteamScreenshots_AddScreenshotToLibrary(interface, filename, thumbnailFilename, CInt(width), CInt(height)))
    }

    /// Steamworks `ISteamScreenshots::AddVRScreenshotToLibrary()`
    public func addVRScreenshotToLibrary(type: VRScreenshotType, filename: String, vrFilename: String) -> ScreenshotHandle {
        ScreenshotHandle(SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary(interface, EVRScreenshotType(type), filename, vrFilename))
    }

    /// Steamworks `ISteamScreenshots::HookScreenshots()`
    public func hookScreenshots(hook: Bool) {
        SteamAPI_ISteamScreenshots_HookScreenshots(interface, hook)
    }

    /// Steamworks `ISteamScreenshots::IsScreenshotsHooked()`
    public func isScreenshotsHooked() -> Bool {
        SteamAPI_ISteamScreenshots_IsScreenshotsHooked(interface)
    }

    /// Steamworks `ISteamScreenshots::SetLocation()`
    public func setLocation(screenshot: ScreenshotHandle, location: String) -> Bool {
        SteamAPI_ISteamScreenshots_SetLocation(interface, CSteamworks.ScreenshotHandle(screenshot), location)
    }

    /// Steamworks `ISteamScreenshots::TagPublishedFile()`
    public func tagPublishedFile(screenshot: ScreenshotHandle, publishedFileID: PublishedFileID) -> Bool {
        SteamAPI_ISteamScreenshots_TagPublishedFile(interface, CSteamworks.ScreenshotHandle(screenshot), PublishedFileId_t(publishedFileID))
    }

    /// Steamworks `ISteamScreenshots::TagUser()`
    public func tagUser(screenshot: ScreenshotHandle, steamID: SteamID) -> Bool {
        SteamAPI_ISteamScreenshots_TagUser(interface, CSteamworks.ScreenshotHandle(screenshot), CUnsignedLongLong(steamID))
    }

    /// Steamworks `ISteamScreenshots::TriggerScreenshot()`
    public func triggerScreenshot() {
        SteamAPI_ISteamScreenshots_TriggerScreenshot(interface)
    }

    /// Steamworks `ISteamScreenshots::WriteScreenshot()`
    public func writeScreenshot(rgb: UnsafeRawPointer, rgbSize: Int, width: Int, height: Int) -> ScreenshotHandle {
        ScreenshotHandle(SteamAPI_ISteamScreenshots_WriteScreenshot(interface, .init(mutating: rgb), uint32(rgbSize), CInt(width), CInt(height)))
    }
}
