//
//  SteamMusicRemote.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamMusicRemote`](https://partner.steamgames.com/doc/api/ISteamMusicRemote)
///
/// Access via `SteamAPI.musicRemote`.
public struct SteamMusicRemote: Sendable {
    var interface: UnsafeMutablePointer<ISteamMusicRemote> {
        SteamAPI_SteamMusicRemote_v001()
    }

    init() {
    }

    /// Steamworks `ISteamMusicRemote::BActivationSuccess()`
    @discardableResult
    public func activationSuccess(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_BActivationSuccess(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::BIsCurrentMusicRemote()`
    public func isCurrentMusicRemote() -> Bool {
        SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote(interface)
    }

    /// Steamworks `ISteamMusicRemote::CurrentEntryDidChange()`
    @discardableResult
    public func currentEntryDidChange() -> Bool {
        SteamAPI_ISteamMusicRemote_CurrentEntryDidChange(interface)
    }

    /// Steamworks `ISteamMusicRemote::CurrentEntryIsAvailable()`
    @discardableResult
    public func currentEntryIsAvailable(available: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable(interface, available)
    }

    /// Steamworks `ISteamMusicRemote::CurrentEntryWillChange()`
    @discardableResult
    public func currentEntryWillChange() -> Bool {
        SteamAPI_ISteamMusicRemote_CurrentEntryWillChange(interface)
    }

    /// Steamworks `ISteamMusicRemote::DeregisterSteamMusicRemote()`
    @discardableResult
    public func deregisterSteamMusicRemote() -> Bool {
        SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote(interface)
    }

    /// Steamworks `ISteamMusicRemote::EnableLooped()`
    @discardableResult
    public func enableLooped(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_EnableLooped(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::EnablePlayNext()`
    @discardableResult
    public func enablePlayNext(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_EnablePlayNext(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::EnablePlayPrevious()`
    @discardableResult
    public func enablePlayPrevious(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_EnablePlayPrevious(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::EnablePlaylists()`
    @discardableResult
    public func enablePlaylists(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_EnablePlaylists(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::EnableQueue()`
    @discardableResult
    public func enableQueue(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_EnableQueue(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::EnableShuffled()`
    @discardableResult
    public func enableShuffled(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_EnableShuffled(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::PlaylistDidChange()`
    @discardableResult
    public func playlistDidChange() -> Bool {
        SteamAPI_ISteamMusicRemote_PlaylistDidChange(interface)
    }

    /// Steamworks `ISteamMusicRemote::PlaylistWillChange()`
    @discardableResult
    public func playlistWillChange() -> Bool {
        SteamAPI_ISteamMusicRemote_PlaylistWillChange(interface)
    }

    /// Steamworks `ISteamMusicRemote::QueueDidChange()`
    @discardableResult
    public func queueDidChange() -> Bool {
        SteamAPI_ISteamMusicRemote_QueueDidChange(interface)
    }

    /// Steamworks `ISteamMusicRemote::QueueWillChange()`
    @discardableResult
    public func queueWillChange() -> Bool {
        SteamAPI_ISteamMusicRemote_QueueWillChange(interface)
    }

    /// Steamworks `ISteamMusicRemote::RegisterSteamMusicRemote()`
    public func registerSteamMusicRemote(name: String) -> Bool {
        SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote(interface, name)
    }

    /// Steamworks `ISteamMusicRemote::ResetPlaylistEntries()`
    @discardableResult
    public func resetPlaylistEntries() -> Bool {
        SteamAPI_ISteamMusicRemote_ResetPlaylistEntries(interface)
    }

    /// Steamworks `ISteamMusicRemote::ResetQueueEntries()`
    @discardableResult
    public func resetQueueEntries() -> Bool {
        SteamAPI_ISteamMusicRemote_ResetQueueEntries(interface)
    }

    /// Steamworks `ISteamMusicRemote::SetCurrentPlaylistEntry()`
    public func setCurrentPlaylistEntry(id: Int) -> Bool {
        SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry(interface, CInt(id))
    }

    /// Steamworks `ISteamMusicRemote::SetCurrentQueueEntry()`
    public func setCurrentQueueEntry(id: Int) -> Bool {
        SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry(interface, CInt(id))
    }

    /// Steamworks `ISteamMusicRemote::SetDisplayName()`
    public func setDisplayName(displayName: String) -> Bool {
        SteamAPI_ISteamMusicRemote_SetDisplayName(interface, displayName)
    }

    /// Steamworks `ISteamMusicRemote::SetPNGIcon_64x64()`
    public func setPNGIcon64x64(buffer: UnsafeRawPointer, bufferSize: Int) -> Bool {
        SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64(interface, .init(mutating: buffer), uint32(bufferSize))
    }

    /// Steamworks `ISteamMusicRemote::SetPlaylistEntry()`
    public func setPlaylistEntry(id: Int, position: Int, entryText: String) -> Bool {
        SteamAPI_ISteamMusicRemote_SetPlaylistEntry(interface, CInt(id), CInt(position), entryText)
    }

    /// Steamworks `ISteamMusicRemote::SetQueueEntry()`
    public func setQueueEntry(id: Int, position: Int, entryText: String) -> Bool {
        SteamAPI_ISteamMusicRemote_SetQueueEntry(interface, CInt(id), CInt(position), entryText)
    }

    /// Steamworks `ISteamMusicRemote::UpdateCurrentEntryCoverArt()`
    @discardableResult
    public func updateCurrentEntryCoverArt(buffer: UnsafeRawPointer, bufferSize: Int) -> Bool {
        SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt(interface, .init(mutating: buffer), uint32(bufferSize))
    }

    /// Steamworks `ISteamMusicRemote::UpdateCurrentEntryElapsedSeconds()`
    @discardableResult
    public func updateCurrentEntryElapsedSeconds(value: Int) -> Bool {
        SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds(interface, CInt(value))
    }

    /// Steamworks `ISteamMusicRemote::UpdateCurrentEntryText()`
    public func updateCurrentEntryText(text: String) -> Bool {
        SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText(interface, text)
    }

    /// Steamworks `ISteamMusicRemote::UpdateLooped()`
    @discardableResult
    public func updateLooped(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_UpdateLooped(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::UpdatePlaybackStatus()`
    @discardableResult
    public func updatePlaybackStatus(status: AudioPlaybackStatus) -> Bool {
        SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus(interface, AudioPlayback_Status(status))
    }

    /// Steamworks `ISteamMusicRemote::UpdateShuffled()`
    @discardableResult
    public func updateShuffled(value: Bool) -> Bool {
        SteamAPI_ISteamMusicRemote_UpdateShuffled(interface, value)
    }

    /// Steamworks `ISteamMusicRemote::UpdateVolume()`
    @discardableResult
    public func updateVolume(value: Float) -> Bool {
        SteamAPI_ISteamMusicRemote_UpdateVolume(interface, value)
    }
}
