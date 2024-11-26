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
        SteamAPI_SteamTimeline_v004()
    }

    init() {
    }

    /// Steamworks `ISteamTimeline::AddGamePhaseTag()`
    public func addGamePhaseTag(tagName: String, tagIcon: String, tagGroup: String, priority: Int) {
        SteamAPI_ISteamTimeline_AddGamePhaseTag(interface, tagName, tagIcon, tagGroup, uint32(priority))
    }

    /// Steamworks `ISteamTimeline::AddInstantaneousTimelineEvent()`
    public func addInstantaneousTimelineEvent(title: String, description: String, icon: String, iconPriority: Int, startOffsetSeconds: Float, possibleClip: TimelineEventClipPriority) -> TimelineEventHandle {
        TimelineEventHandle(SteamAPI_ISteamTimeline_AddInstantaneousTimelineEvent(interface, title, description, icon, uint32(iconPriority), startOffsetSeconds, ETimelineEventClipPriority(possibleClip)))
    }

    /// Steamworks `ISteamTimeline::AddRangeTimelineEvent()`
    public func addRangeTimelineEvent(title: String, description: String, icon: String, iconPriority: Int, startOffsetSeconds: Float, duration: Float, possibleClip: TimelineEventClipPriority) -> TimelineEventHandle {
        TimelineEventHandle(SteamAPI_ISteamTimeline_AddRangeTimelineEvent(interface, title, description, icon, uint32(iconPriority), startOffsetSeconds, duration, ETimelineEventClipPriority(possibleClip)))
    }

    /// Steamworks `ISteamTimeline::ClearTimelineTooltip()`
    public func clearTimelineTooltip(timeDelta: Float) {
        SteamAPI_ISteamTimeline_ClearTimelineTooltip(interface, timeDelta)
    }

    /// Steamworks `ISteamTimeline::DoesEventRecordingExist()`, callback
    public func doesEventRecordingExist(event: TimelineEventHandle, completion: @Sendable @escaping (sending SteamTimelineEventRecordingExists?) -> Void) {
        let rc = SteamAPI_ISteamTimeline_DoesEventRecordingExist(interface, TimelineEventHandle_t(event))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamTimeline::DoesEventRecordingExist()`, async
    public func doesEventRecordingExist(isolation: isolated (any Actor)? = #isolation, event: TimelineEventHandle) async -> SteamTimelineEventRecordingExists? {
        await withUnsafeContinuation {
            doesEventRecordingExist(event: event, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamTimeline::DoesGamePhaseRecordingExist()`, callback
    public func doesGamePhaseRecordingExist(phaseID: String, completion: @Sendable @escaping (sending SteamTimelineGamePhaseRecordingExists?) -> Void) {
        let rc = SteamAPI_ISteamTimeline_DoesGamePhaseRecordingExist(interface, phaseID)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamTimeline::DoesGamePhaseRecordingExist()`, async
    public func doesGamePhaseRecordingExist(isolation: isolated (any Actor)? = #isolation, phaseID: String) async -> SteamTimelineGamePhaseRecordingExists? {
        await withUnsafeContinuation {
            doesGamePhaseRecordingExist(phaseID: phaseID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamTimeline::EndGamePhase()`
    public func endGamePhase() {
        SteamAPI_ISteamTimeline_EndGamePhase(interface)
    }

    /// Steamworks `ISteamTimeline::EndRangeTimelineEvent()`
    public func endRangeTimelineEvent(event: TimelineEventHandle, endOffsetSeconds: Float) {
        SteamAPI_ISteamTimeline_EndRangeTimelineEvent(interface, TimelineEventHandle_t(event), endOffsetSeconds)
    }

    /// Steamworks `ISteamTimeline::OpenOverlayToGamePhase()`
    public func openOverlayToGamePhase(phaseID: String) {
        SteamAPI_ISteamTimeline_OpenOverlayToGamePhase(interface, phaseID)
    }

    /// Steamworks `ISteamTimeline::OpenOverlayToTimelineEvent()`
    public func openOverlayToTimelineEvent(event: TimelineEventHandle) {
        SteamAPI_ISteamTimeline_OpenOverlayToTimelineEvent(interface, TimelineEventHandle_t(event))
    }

    /// Steamworks `ISteamTimeline::RemoveTimelineEvent()`
    public func removeTimelineEvent(event: TimelineEventHandle) {
        SteamAPI_ISteamTimeline_RemoveTimelineEvent(interface, TimelineEventHandle_t(event))
    }

    /// Steamworks `ISteamTimeline::SetGamePhaseAttribute()`
    public func setGamePhaseAttribute(attributeGroup: String, attributeValue: String, priority: Int) {
        SteamAPI_ISteamTimeline_SetGamePhaseAttribute(interface, attributeGroup, attributeValue, uint32(priority))
    }

    /// Steamworks `ISteamTimeline::SetGamePhaseID()`
    public func setGamePhaseID(phaseID: String) {
        SteamAPI_ISteamTimeline_SetGamePhaseID(interface, phaseID)
    }

    /// Steamworks `ISteamTimeline::SetTimelineGameMode()`
    public func setTimelineGameMode(mode: TimelineGameMode) {
        SteamAPI_ISteamTimeline_SetTimelineGameMode(interface, ETimelineGameMode(mode))
    }

    /// Steamworks `ISteamTimeline::SetTimelineTooltip()`
    public func setTimelineTooltip(description: String, timeDelta: Float) {
        SteamAPI_ISteamTimeline_SetTimelineTooltip(interface, description, timeDelta)
    }

    /// Steamworks `ISteamTimeline::StartGamePhase()`
    public func startGamePhase() {
        SteamAPI_ISteamTimeline_StartGamePhase(interface)
    }

    /// Steamworks `ISteamTimeline::StartRangeTimelineEvent()`
    public func startRangeTimelineEvent(title: String, description: String, icon: String, priority: Int, startOffsetSeconds: Float, possibleClip: TimelineEventClipPriority) -> TimelineEventHandle {
        TimelineEventHandle(SteamAPI_ISteamTimeline_StartRangeTimelineEvent(interface, title, description, icon, uint32(priority), startOffsetSeconds, ETimelineEventClipPriority(possibleClip)))
    }

    /// Steamworks `ISteamTimeline::UpdateRangeTimelineEvent()`
    public func updateRangeTimelineEvent(event: TimelineEventHandle, title: String, description: String, icon: String, priority: Int, possibleClip: TimelineEventClipPriority) {
        SteamAPI_ISteamTimeline_UpdateRangeTimelineEvent(interface, TimelineEventHandle_t(event), title, description, icon, uint32(priority), ETimelineEventClipPriority(possibleClip))
    }
}
