//
//  SteamMusic.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamMusic`](https://partner.steamgames.com/doc/api/ISteamMusic)
///
/// Access via `SteamAPI.music`.
public struct SteamMusic: Sendable {
    var interface: UnsafeMutablePointer<ISteamMusic> {
        SteamAPI_SteamMusic_v001()
    }

    init() {
    }

    /// Steamworks `ISteamMusic::BIsEnabled()`
    public func isEnabled() -> Bool {
        SteamAPI_ISteamMusic_BIsEnabled(interface)
    }

    /// Steamworks `ISteamMusic::BIsPlaying()`
    public func isPlaying() -> Bool {
        SteamAPI_ISteamMusic_BIsPlaying(interface)
    }

    /// Steamworks `ISteamMusic::GetPlaybackStatus()`
    public func getPlaybackStatus() -> AudioPlaybackStatus {
        AudioPlaybackStatus(SteamAPI_ISteamMusic_GetPlaybackStatus(interface))
    }

    /// Steamworks `ISteamMusic::GetVolume()`
    public func getVolume() -> Float {
        Float(SteamAPI_ISteamMusic_GetVolume(interface))
    }

    /// Steamworks `ISteamMusic::Pause()`
    public func pause() {
        SteamAPI_ISteamMusic_Pause(interface)
    }

    /// Steamworks `ISteamMusic::Play()`
    public func play() {
        SteamAPI_ISteamMusic_Play(interface)
    }

    /// Steamworks `ISteamMusic::PlayNext()`
    public func playNext() {
        SteamAPI_ISteamMusic_PlayNext(interface)
    }

    /// Steamworks `ISteamMusic::PlayPrevious()`
    public func playPrevious() {
        SteamAPI_ISteamMusic_PlayPrevious(interface)
    }

    /// Steamworks `ISteamMusic::SetVolume()`
    public func setVolume(volume: Float) {
        SteamAPI_ISteamMusic_SetVolume(interface, volume)
    }
}
