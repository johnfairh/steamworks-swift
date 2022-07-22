//
//  SteamInput.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamInput`](https://partner.steamgames.com/doc/api/ISteamInput)
///
/// Access via `SteamAPI.input`.
public struct SteamInput: Sendable {
    var interface: UnsafeMutablePointer<ISteamInput> {
        SteamAPI_SteamInput_v006()
    }

    init() {
    }

    /// Steamworks `ISteamInput::ActivateActionSet()`
    public func activateActionSet(handle: InputHandle, setHandle: InputActionSetHandle) {
        SteamAPI_ISteamInput_ActivateActionSet(interface, InputHandle_t(handle), InputActionSetHandle_t(setHandle))
    }

    /// Steamworks `ISteamInput::ActivateActionSetLayer()`
    public func activateActionSetLayer(handle: InputHandle, setLayerHandle: InputActionSetHandle) {
        SteamAPI_ISteamInput_ActivateActionSetLayer(interface, InputHandle_t(handle), InputActionSetHandle_t(setLayerHandle))
    }

    /// Steamworks `ISteamInput::BNewDataAvailable()`
    public func newDataAvailable() -> Bool {
        SteamAPI_ISteamInput_BNewDataAvailable(interface)
    }

    /// Steamworks `ISteamInput::BWaitForData()`
    public func waitForData(waitForever: Bool, timeout: Int) -> Bool {
        SteamAPI_ISteamInput_BWaitForData(interface, waitForever, uint32(timeout))
    }

    /// Steamworks `ISteamInput::DeactivateActionSetLayer()`
    public func deactivateActionSetLayer(handle: InputHandle, setLayerHandle: InputActionSetHandle) {
        SteamAPI_ISteamInput_DeactivateActionSetLayer(interface, InputHandle_t(handle), InputActionSetHandle_t(setLayerHandle))
    }

    /// Steamworks `ISteamInput::DeactivateAllActionSetLayers()`
    public func deactivateAllActionSetLayers(handle: InputHandle) {
        SteamAPI_ISteamInput_DeactivateAllActionSetLayers(interface, InputHandle_t(handle))
    }

    /// Steamworks `ISteamInput::EnableDeviceCallbacks()`
    public func enableDeviceCallbacks() {
        SteamAPI_ISteamInput_EnableDeviceCallbacks(interface)
    }

    /// Steamworks `ISteamInput::GetActionOriginFromXboxOrigin()`
    public func getActionOriginFromXboxOrigin(handle: InputHandle, origin: XboxOrigin) -> InputActionOrigin {
        InputActionOrigin(SteamAPI_ISteamInput_GetActionOriginFromXboxOrigin(interface, InputHandle_t(handle), EXboxOrigin(origin)))
    }

    /// Steamworks `ISteamInput::GetActionSetHandle()`
    public func getActionSetHandle(actionSetName: String) -> InputActionSetHandle {
        InputActionSetHandle(SteamAPI_ISteamInput_GetActionSetHandle(interface, actionSetName))
    }

    /// Steamworks `ISteamInput::GetActiveActionSetLayers()`
    public func getActiveActionSetLayers(handle: InputHandle) -> (rc: Int, handles: [InputActionSetHandle]) {
        let tmpHandles = SteamOutArray<InputActionSetHandle_t>(Int(STEAM_INPUT_MAX_ACTIVE_LAYERS))
        let rc = Int(SteamAPI_ISteamInput_GetActiveActionSetLayers(interface, InputHandle_t(handle), tmpHandles.steamArray))
        return (rc: rc, handles: tmpHandles.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamInput::GetAnalogActionData()`
    public func getAnalogActionData(handle: InputHandle, actionHandle: InputAnalogActionHandle) -> InputAnalogActionData {
        InputAnalogActionData(SteamAPI_ISteamInput_GetAnalogActionData(interface, InputHandle_t(handle), InputAnalogActionHandle_t(actionHandle)))
    }

    /// Steamworks `ISteamInput::GetAnalogActionHandle()`
    public func getAnalogActionHandle(actionName: String) -> InputAnalogActionHandle {
        InputAnalogActionHandle(SteamAPI_ISteamInput_GetAnalogActionHandle(interface, actionName))
    }

    /// Steamworks `ISteamInput::GetAnalogActionOrigins()`
    public func getAnalogActionOrigins(handle: InputHandle, setHandle: InputActionSetHandle, actionHandle: InputAnalogActionHandle) -> (rc: Int, origins: [InputActionOrigin]) {
        let tmpOrigins = SteamOutArray<EInputActionOrigin>(Int(STEAM_INPUT_MAX_ORIGINS))
        let rc = Int(SteamAPI_ISteamInput_GetAnalogActionOrigins(interface, InputHandle_t(handle), InputActionSetHandle_t(setHandle), InputAnalogActionHandle_t(actionHandle), tmpOrigins.steamArray))
        return (rc: rc, origins: tmpOrigins.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamInput::GetConnectedControllers()`
    public func getConnectedControllers() -> (rc: Int, handles: [InputHandle]) {
        let tmpHandles = SteamOutArray<InputHandle_t>(Int(STEAM_INPUT_MAX_COUNT))
        let rc = Int(SteamAPI_ISteamInput_GetConnectedControllers(interface, tmpHandles.steamArray))
        return (rc: rc, handles: tmpHandles.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamInput::GetControllerForGamepadIndex()`
    public func getControllerForGamepadIndex(index: Int) -> InputHandle {
        InputHandle(SteamAPI_ISteamInput_GetControllerForGamepadIndex(interface, CInt(index)))
    }

    /// Steamworks `ISteamInput::GetCurrentActionSet()`
    public func getCurrentActionSet(handle: InputHandle) -> InputActionSetHandle {
        InputActionSetHandle(SteamAPI_ISteamInput_GetCurrentActionSet(interface, InputHandle_t(handle)))
    }

    /// Steamworks `ISteamInput::GetDeviceBindingRevision()`
    public func getDeviceBindingRevision(handle: InputHandle) -> (rc: Bool, major: Int, minor: Int) {
        var tmpMajor = CInt()
        var tmpMinor = CInt()
        let rc = SteamAPI_ISteamInput_GetDeviceBindingRevision(interface, InputHandle_t(handle), &tmpMajor, &tmpMinor)
        return (rc: rc, major: Int(tmpMajor), minor: Int(tmpMinor))
    }

    /// Steamworks `ISteamInput::GetDigitalActionData()`
    public func getDigitalActionData(handle: InputHandle, actionHandle: InputDigitalActionHandle) -> InputDigitalActionData {
        InputDigitalActionData(SteamAPI_ISteamInput_GetDigitalActionData(interface, InputHandle_t(handle), InputDigitalActionHandle_t(actionHandle)))
    }

    /// Steamworks `ISteamInput::GetDigitalActionHandle()`
    public func getDigitalActionHandle(actionName: String) -> InputDigitalActionHandle {
        InputDigitalActionHandle(SteamAPI_ISteamInput_GetDigitalActionHandle(interface, actionName))
    }

    /// Steamworks `ISteamInput::GetDigitalActionOrigins()`
    public func getDigitalActionOrigins(handle: InputHandle, setHandle: InputActionSetHandle, actionHandle: InputDigitalActionHandle) -> (rc: Int, origins: [InputActionOrigin]) {
        let tmpOrigins = SteamOutArray<EInputActionOrigin>(Int(STEAM_INPUT_MAX_ORIGINS))
        let rc = Int(SteamAPI_ISteamInput_GetDigitalActionOrigins(interface, InputHandle_t(handle), InputActionSetHandle_t(setHandle), InputDigitalActionHandle_t(actionHandle), tmpOrigins.steamArray))
        return (rc: rc, origins: tmpOrigins.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamInput::GetGamepadIndexForController()`
    public func getGamepadIndexForController(handle: InputHandle) -> Int {
        Int(SteamAPI_ISteamInput_GetGamepadIndexForController(interface, InputHandle_t(handle)))
    }

    /// Steamworks `ISteamInput::GetGlyphForActionOrigin_Legacy()`
    public func getGlyphForActionOriginLegacy(origin: InputActionOrigin) -> String {
        String(SteamAPI_ISteamInput_GetGlyphForActionOrigin_Legacy(interface, EInputActionOrigin(origin)))
    }

    /// Steamworks `ISteamInput::GetGlyphForXboxOrigin()`
    public func getGlyphForXboxOrigin(origin: XboxOrigin) -> String {
        String(SteamAPI_ISteamInput_GetGlyphForXboxOrigin(interface, EXboxOrigin(origin)))
    }

    /// Steamworks `ISteamInput::GetGlyphPNGForActionOrigin()`
    public func getGlyphPNGForActionOrigin(origin: InputActionOrigin, size: SteamInputGlyphSize, flags: Int) -> String {
        String(SteamAPI_ISteamInput_GetGlyphPNGForActionOrigin(interface, EInputActionOrigin(origin), ESteamInputGlyphSize(size), uint32(flags)))
    }

    /// Steamworks `ISteamInput::GetGlyphSVGForActionOrigin()`
    public func getGlyphSVGForActionOrigin(origin: InputActionOrigin, flags: Int) -> String {
        String(SteamAPI_ISteamInput_GetGlyphSVGForActionOrigin(interface, EInputActionOrigin(origin), uint32(flags)))
    }

    /// Steamworks `ISteamInput::GetInputTypeForHandle()`
    public func getInputTypeForHandle(handle: InputHandle) -> SteamInputType {
        SteamInputType(SteamAPI_ISteamInput_GetInputTypeForHandle(interface, InputHandle_t(handle)))
    }

    /// Steamworks `ISteamInput::GetMotionData()`
    public func getMotionData(handle: InputHandle) -> InputMotionData {
        InputMotionData(SteamAPI_ISteamInput_GetMotionData(interface, InputHandle_t(handle)))
    }

    /// Steamworks `ISteamInput::GetRemotePlaySessionID()`
    public func getRemotePlaySessionID(handle: InputHandle) -> RemotePlaySessionID {
        RemotePlaySessionID(SteamAPI_ISteamInput_GetRemotePlaySessionID(interface, InputHandle_t(handle)))
    }

    /// Steamworks `ISteamInput::GetSessionInputConfigurationSettings()`
    public func getSessionInputConfigurationSettings() -> SteamInputConfigurationEnableType {
        SteamInputConfigurationEnableType(SteamAPI_ISteamInput_GetSessionInputConfigurationSettings(interface))
    }

    /// Steamworks `ISteamInput::GetStringForActionOrigin()`
    public func getStringForActionOrigin(origin: InputActionOrigin) -> String {
        String(SteamAPI_ISteamInput_GetStringForActionOrigin(interface, EInputActionOrigin(origin)))
    }

    /// Steamworks `ISteamInput::GetStringForAnalogActionName()`
    public func getStringForAnalogActionName(actionHandle: InputAnalogActionHandle) -> String {
        String(SteamAPI_ISteamInput_GetStringForAnalogActionName(interface, InputAnalogActionHandle_t(actionHandle)))
    }

    /// Steamworks `ISteamInput::GetStringForDigitalActionName()`
    public func getStringForDigitalActionName(actionHandle: InputDigitalActionHandle) -> String {
        String(SteamAPI_ISteamInput_GetStringForDigitalActionName(interface, InputDigitalActionHandle_t(actionHandle)))
    }

    /// Steamworks `ISteamInput::GetStringForXboxOrigin()`
    public func getStringForXboxOrigin(origin: XboxOrigin) -> String {
        String(SteamAPI_ISteamInput_GetStringForXboxOrigin(interface, EXboxOrigin(origin)))
    }

    /// Steamworks `ISteamInput::Initialize()`
    public func initialize(explicitlyCallRunFrame: Bool) -> Bool {
        SteamAPI_ISteamInput_Init(interface, explicitlyCallRunFrame)
    }

    /// Steamworks `ISteamInput::Legacy_TriggerHapticPulse()`
    public func legacyTriggerHapticPulse(handle: InputHandle, targetPad: SteamControllerPad, durationMicroSec: Int) {
        SteamAPI_ISteamInput_Legacy_TriggerHapticPulse(interface, InputHandle_t(handle), ESteamControllerPad(targetPad), CUnsignedShort(durationMicroSec))
    }

    /// Steamworks `ISteamInput::Legacy_TriggerRepeatedHapticPulse()`
    public func legacyTriggerRepeatedHapticPulse(handle: InputHandle, targetPad: SteamControllerPad, durationMicroSec: Int, offMicroSec: Int, `repeat`: Int, flags: Int) {
        SteamAPI_ISteamInput_Legacy_TriggerRepeatedHapticPulse(interface, InputHandle_t(handle), ESteamControllerPad(targetPad), CUnsignedShort(durationMicroSec), CUnsignedShort(offMicroSec), CUnsignedShort(`repeat`), CUnsignedInt(flags))
    }

    /// Steamworks `ISteamInput::RunFrame()`
    public func runFrame(reservedValue: Bool = true) {
        SteamAPI_ISteamInput_RunFrame(interface, reservedValue)
    }

    /// Steamworks `ISteamInput::SetInputActionManifestFilePath()`
    public func setInputActionManifestFilePath(inputActionManifestAbsolutePath: String) -> Bool {
        SteamAPI_ISteamInput_SetInputActionManifestFilePath(interface, inputActionManifestAbsolutePath)
    }

    /// Steamworks `ISteamInput::SetLEDColor()`
    public func setLEDColor(handle: InputHandle, colorR: UInt8, colorG: UInt8, colorB: UInt8, flags: SteamControllerLEDFlag) {
        SteamAPI_ISteamInput_SetLEDColor(interface, InputHandle_t(handle), colorR, colorG, colorB, UInt32(flags))
    }

    /// Steamworks `ISteamInput::ShowBindingPanel()`
    public func showBindingPanel(handle: InputHandle) -> Bool {
        SteamAPI_ISteamInput_ShowBindingPanel(interface, InputHandle_t(handle))
    }

    /// Steamworks `ISteamInput::Shutdown()`
    @discardableResult
    public func shutdown() -> Bool {
        SteamAPI_ISteamInput_Shutdown(interface)
    }

    /// Steamworks `ISteamInput::StopAnalogActionMomentum()`
    public func stopAnalogActionMomentum(handle: InputHandle, action: InputAnalogActionHandle) {
        SteamAPI_ISteamInput_StopAnalogActionMomentum(interface, InputHandle_t(handle), InputAnalogActionHandle_t(action))
    }

    /// Steamworks `ISteamInput::TranslateActionOrigin()`
    public func translateActionOrigin(destinationInputType: SteamInputType, sourceOrigin: InputActionOrigin) -> InputActionOrigin {
        InputActionOrigin(SteamAPI_ISteamInput_TranslateActionOrigin(interface, ESteamInputType(destinationInputType), EInputActionOrigin(sourceOrigin)))
    }

    /// Steamworks `ISteamInput::TriggerSimpleHapticEvent()`
    public func triggerSimpleHapticEvent(handle: InputHandle, hapticLocation: ControllerHapticLocation, intensity: UInt8, gainDB: Int, otherIntensity: UInt8, otherGainDB: Int) {
        SteamAPI_ISteamInput_TriggerSimpleHapticEvent(interface, InputHandle_t(handle), EControllerHapticLocation(hapticLocation), intensity, CChar(gainDB), otherIntensity, CChar(otherGainDB))
    }

    /// Steamworks `ISteamInput::TriggerVibration()`
    public func triggerVibration(handle: InputHandle, leftSpeed: Int, rightSpeed: Int) {
        SteamAPI_ISteamInput_TriggerVibration(interface, InputHandle_t(handle), CUnsignedShort(leftSpeed), CUnsignedShort(rightSpeed))
    }

    /// Steamworks `ISteamInput::TriggerVibrationExtended()`
    public func triggerVibrationExtended(handle: InputHandle, leftSpeed: Int, rightSpeed: Int, leftTriggerSpeed: Int, rightTriggerSpeed: Int) {
        SteamAPI_ISteamInput_TriggerVibrationExtended(interface, InputHandle_t(handle), CUnsignedShort(leftSpeed), CUnsignedShort(rightSpeed), CUnsignedShort(leftTriggerSpeed), CUnsignedShort(rightTriggerSpeed))
    }
}
