//
//  SteamTimeline.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

internal import CSteamworks

/// Steamworks [`ISteamTimeline`](https://partner.steamgames.com/doc/api/ISteamTimeline)
///
/// Access via ``SteamAPI/timeline``.
public struct SteamTimeline: Sendable {
    var interface: UnsafeMutablePointer<ISteamTimeline> {
        SteamAPI_SteamTimeline_v001()
    }

    init() {
    }

    /// Steamworks `ISteamTimeline::AddTimelineEvent()`
    public func addTimelineEvent(icon: String, title: String, description: String, priority: Int, startOffsetSeconds: Float, durationSeconds: Float, possibleClip: TimelineEventClipPriority) {
        SteamAPI_ISteamTimeline_AddTimelineEvent(interface, icon, title, description, uint32(priority), startOffsetSeconds, durationSeconds, ETimelineEventClipPriority(possibleClip))
    }

    /// Steamworks `ISteamTimeline::ClearTimelineStateDescription()`
    public func clearTimelineStateDescription(timeDelta: Float) {
        SteamAPI_ISteamTimeline_ClearTimelineStateDescription(interface, timeDelta)
    }

    /// Steamworks `ISteamTimeline::SetTimelineGameMode()`
    public func setTimelineGameMode(mode: TimelineGameMode) {
        SteamAPI_ISteamTimeline_SetTimelineGameMode(interface, ETimelineGameMode(mode))
    }

    /// Steamworks `ISteamTimeline::SetTimelineStateDescription()`
    public func setTimelineStateDescription(description: String, timeDelta: Float) {
        SteamAPI_ISteamTimeline_SetTimelineStateDescription(interface, description, timeDelta)
    }
}
