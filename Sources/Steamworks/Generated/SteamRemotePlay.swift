//
//  SteamRemotePlay.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

internal import CSteamworks

/// Steamworks [`ISteamRemotePlay`](https://partner.steamgames.com/doc/api/ISteamRemotePlay)
///
/// Access via ``SteamAPI/remotePlay``.
public struct SteamRemotePlay: Sendable {
    var interface: UnsafeMutablePointer<ISteamRemotePlay> {
        SteamAPI_SteamRemotePlay_v003()
    }

    init() {
    }

    /// Steamworks `ISteamRemotePlay::BEnableRemotePlayTogetherDirectInput()`
    public func enableRemotePlayTogetherDirectInput() -> Bool {
        SteamAPI_ISteamRemotePlay_BEnableRemotePlayTogetherDirectInput(interface)
    }

    /// Steamworks `ISteamRemotePlay::BGetSessionClientResolution()`
    public func getSessionClientResolution(sessionID: RemotePlaySessionID) -> (rc: Bool, resolutionX: Int, resolutionY: Int) {
        var tmpResolutionX = CInt()
        var tmpResolutionY = CInt()
        let rc = SteamAPI_ISteamRemotePlay_BGetSessionClientResolution(interface, RemotePlaySessionID_t(sessionID), &tmpResolutionX, &tmpResolutionY)
        return (rc: rc, resolutionX: Int(tmpResolutionX), resolutionY: Int(tmpResolutionY))
    }

    /// Steamworks `ISteamRemotePlay::BSendRemotePlayTogetherInvite()`
    public func sendRemotePlayTogetherInvite(friend: SteamID) -> Bool {
        SteamAPI_ISteamRemotePlay_BSendRemotePlayTogetherInvite(interface, CUnsignedLongLong(friend))
    }

    /// Steamworks `ISteamRemotePlay::CreateMouseCursor()`
    public func createMouseCursor(width: Int, height: Int, hotX: Int, hotY: Int, bgra: UnsafeRawPointer, pitch: Int = 0) -> RemotePlayCursorID {
        RemotePlayCursorID(SteamAPI_ISteamRemotePlay_CreateMouseCursor(interface, CInt(width), CInt(height), CInt(hotX), CInt(hotY), bgra, CInt(pitch)))
    }

    /// Steamworks `ISteamRemotePlay::DisableRemotePlayTogetherDirectInput()`
    public func disableRemotePlayTogetherDirectInput() {
        SteamAPI_ISteamRemotePlay_DisableRemotePlayTogetherDirectInput(interface)
    }

    /// Steamworks `ISteamRemotePlay::GetInput()`
    public func getInput(returnInput: Bool = true, maxEvents: Int) -> (rc: Int, input: [RemotePlayInput]) {
        let tmpInput = SteamOutArray<RemotePlayInput_t>(maxEvents, returnInput)
        let rc = Int(SteamAPI_ISteamRemotePlay_GetInput(interface, tmpInput.steamArray, uint32(maxEvents)))
        return (rc: rc, input: tmpInput.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamRemotePlay::GetSessionClientFormFactor()`
    public func getSessionClientFormFactor(sessionID: RemotePlaySessionID) -> SteamDeviceFormFactor {
        SteamDeviceFormFactor(SteamAPI_ISteamRemotePlay_GetSessionClientFormFactor(interface, RemotePlaySessionID_t(sessionID)))
    }

    /// Steamworks `ISteamRemotePlay::GetSessionClientName()`
    public func getSessionClientName(sessionID: RemotePlaySessionID) -> String? {
        SteamAPI_ISteamRemotePlay_GetSessionClientName(interface, RemotePlaySessionID_t(sessionID)).map { String($0) }
    }

    /// Steamworks `ISteamRemotePlay::GetSessionCount()`
    public func getSessionCount() -> Int {
        Int(SteamAPI_ISteamRemotePlay_GetSessionCount(interface))
    }

    /// Steamworks `ISteamRemotePlay::GetSessionID()`
    public func getSessionID(sessionIndex: Int) -> RemotePlaySessionID {
        RemotePlaySessionID(SteamAPI_ISteamRemotePlay_GetSessionID(interface, CInt(sessionIndex)))
    }

    /// Steamworks `ISteamRemotePlay::GetSessionSteamID()`
    public func getSessionSteamID(sessionID: RemotePlaySessionID) -> SteamID {
        SteamID(SteamAPI_ISteamRemotePlay_GetSessionSteamID(interface, RemotePlaySessionID_t(sessionID)))
    }

    /// Steamworks `ISteamRemotePlay::SetMouseCursor()`
    public func setMouseCursor(sessionID: RemotePlaySessionID, cursorID: RemotePlayCursorID) {
        SteamAPI_ISteamRemotePlay_SetMouseCursor(interface, RemotePlaySessionID_t(sessionID), RemotePlayCursorID_t(cursorID))
    }

    /// Steamworks `ISteamRemotePlay::SetMousePosition()`
    public func setMousePosition(sessionID: RemotePlaySessionID, normalizedX: Float, normalizedY: Float) {
        SteamAPI_ISteamRemotePlay_SetMousePosition(interface, RemotePlaySessionID_t(sessionID), normalizedX, normalizedY)
    }

    /// Steamworks `ISteamRemotePlay::SetMouseVisibility()`
    public func setMouseVisibility(sessionID: RemotePlaySessionID, visible: Bool) {
        SteamAPI_ISteamRemotePlay_SetMouseVisibility(interface, RemotePlaySessionID_t(sessionID), visible)
    }

    /// Steamworks `ISteamRemotePlay::ShowRemotePlayTogetherUI()`
    public func showRemotePlayTogetherUI() -> Bool {
        SteamAPI_ISteamRemotePlay_ShowRemotePlayTogetherUI(interface)
    }
}
