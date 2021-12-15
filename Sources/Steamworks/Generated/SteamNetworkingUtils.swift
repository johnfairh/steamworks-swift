//
//  SteamNetworkingUtils.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamNetworkingUtils`](https://partner.steamgames.com/doc/api/ISteamNetworkingUtils)
///
/// Access via `SteamBaseAPI.networkingUtils` through a `SteamAPI` or `SteamGameServerAPI` instance.
public struct SteamNetworkingUtils {
    var interface: OpaquePointer {
        SteamAPI_SteamNetworkingUtils_SteamAPI_v004()
    }

    init() {
    }

    /// Steamworks `ISteamNetworkingUtils::AllocateMessage()`
    public func allocateMessage(allocateBufferSize: Int) -> SteamNetworkingMessage {
        SteamNetworkingMessage(SteamAPI_ISteamNetworkingUtils_AllocateMessage(interface, Int32(allocateBufferSize)))
    }

    /// Steamworks `ISteamNetworkingUtils::CheckPingDataUpToDate()`
    public func checkPingDataUpToDate(maxAgeSeconds: Float) -> Bool {
        SteamAPI_ISteamNetworkingUtils_CheckPingDataUpToDate(interface, maxAgeSeconds)
    }

    /// Steamworks `ISteamNetworkingUtils::ConvertPingLocationToString()`
    public func convertPingLocationToString(location: SteamNetworkPingLocation, buf: inout String, bufSize: Int) {
        var tmp_location = SteamNetworkPingLocation_t(location)
        let tmp_buf = UnsafeMutableBufferPointer<CChar>.allocate(capacity: bufSize)
        defer { tmp_buf.deallocate() }
        SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString(interface, &tmp_location, tmp_buf.baseAddress, Int32(bufSize))
        buf = String(tmp_buf)
    }

    /// Steamworks `ISteamNetworkingUtils::EstimatePingTimeBetweenTwoLocations()`
    public func estimatePingTimeBetweenTwoLocations(location1: SteamNetworkPingLocation, location2: SteamNetworkPingLocation) -> Int {
        var tmp_location1 = SteamNetworkPingLocation_t(location1)
        var tmp_location2 = SteamNetworkPingLocation_t(location2)
        return Int(SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations(interface, &tmp_location1, &tmp_location2))
    }

    /// Steamworks `ISteamNetworkingUtils::EstimatePingTimeFromLocalHost()`
    public func estimatePingTimeFromLocalHost(location: SteamNetworkPingLocation) -> Int {
        var tmp_location = SteamNetworkPingLocation_t(location)
        return Int(SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost(interface, &tmp_location))
    }

    /// Steamworks `ISteamNetworkingUtils::GetConfigValue()`
    public func getConfigValue(value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, outDataType: inout SteamNetworkingConfigDataType, result: UnsafeMutableRawPointer?, resultSize: inout Int) -> SteamNetworkingGetConfigValueResult {
        var tmp_outDataType = ESteamNetworkingConfigDataType(rawValue: 0)
        var tmp_resultSize = size_t(resultSize)
        let rc = SteamNetworkingGetConfigValueResult(SteamAPI_ISteamNetworkingUtils_GetConfigValue(interface, ESteamNetworkingConfigValue(value), ESteamNetworkingConfigScope(scopeType), intptr_t(obj), &tmp_outDataType, result, &tmp_resultSize))
        outDataType = SteamNetworkingConfigDataType(tmp_outDataType)
        resultSize = Int(tmp_resultSize)
        return rc
    }

    /// Steamworks `ISteamNetworkingUtils::GetConfigValueInfo()`
    public func getConfigValueInfo(value: SteamNetworkingConfigValueSetting, outDataType: inout SteamNetworkingConfigDataType, outScope: inout SteamNetworkingConfigScope) -> String {
        var tmp_outDataType = ESteamNetworkingConfigDataType(rawValue: 0)
        var tmp_outScope = ESteamNetworkingConfigScope(rawValue: 0)
        let rc = String(SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo(interface, ESteamNetworkingConfigValue(value), &tmp_outDataType, &tmp_outScope))
        outDataType = SteamNetworkingConfigDataType(tmp_outDataType)
        outScope = SteamNetworkingConfigScope(tmp_outScope)
        return rc
    }

    /// Steamworks `ISteamNetworkingUtils::GetDirectPingToPOP()`
    public func getDirectPingToPOP(id: SteamNetworkingPOPID) -> Int {
        Int(SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP(interface, CSteamworks.SteamNetworkingPOPID(id)))
    }

    /// Steamworks `ISteamNetworkingUtils::GetLocalPingLocation()`
    public func getLocalPingLocation(result: SteamNetworkPingLocation) -> Float {
        var tmp_result = SteamNetworkPingLocation_t(result)
        return Float(SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation(interface, &tmp_result))
    }

    /// Steamworks `ISteamNetworkingUtils::GetLocalTimestamp()`
    public func getLocalTimestamp() -> SteamNetworkingMicroseconds {
        SteamNetworkingMicroseconds(SteamAPI_ISteamNetworkingUtils_GetLocalTimestamp(interface))
    }

    /// Steamworks `ISteamNetworkingUtils::GetPOPCount()`
    public func getPOPCount() -> Int {
        Int(SteamAPI_ISteamNetworkingUtils_GetPOPCount(interface))
    }

    /// Steamworks `ISteamNetworkingUtils::GetPOPList()`
    public func getPOPList(list: inout [SteamNetworkingPOPID], listSz: Int) -> Int {
        let tmp_list = UnsafeMutableBufferPointer<CSteamworks.SteamNetworkingPOPID>.allocate(capacity: listSz)
        defer { tmp_list.deallocate() }
        let rc = Int(SteamAPI_ISteamNetworkingUtils_GetPOPList(interface, tmp_list.baseAddress, Int32(listSz)))
        list = tmp_list[0..<rc].map { SteamNetworkingPOPID($0) }
        return rc
    }

    /// Steamworks `ISteamNetworkingUtils::GetPingToDataCenter()`
    public func getPingToDataCenter(id: SteamNetworkingPOPID, viaRelayPoP: inout SteamNetworkingPOPID) -> Int {
        var tmp_viaRelayPoP = CSteamworks.SteamNetworkingPOPID()
        let rc = Int(SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter(interface, CSteamworks.SteamNetworkingPOPID(id), &tmp_viaRelayPoP))
        viaRelayPoP = SteamNetworkingPOPID(tmp_viaRelayPoP)
        return rc
    }

    /// Steamworks `ISteamNetworkingUtils::GetRelayNetworkStatus()`
    public func getRelayNetworkStatus(details: inout SteamRelayNetworkStatus) -> SteamNetworkingAvailability {
        var tmp_details = SteamRelayNetworkStatus_t()
        let rc = SteamNetworkingAvailability(SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus(interface, &tmp_details))
        details = SteamRelayNetworkStatus(tmp_details)
        return rc
    }

    /// Steamworks `ISteamNetworkingUtils::InitRelayNetworkAccess()`
    public func initRelayNetworkAccess() {
        SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess(interface)
    }

    /// Steamworks `ISteamNetworkingUtils::IterateGenericEditableConfigValues()`
    public func iterateGenericEditableConfigValues(current: SteamNetworkingConfigValueSetting, enumerateDevVars: Bool) -> SteamNetworkingConfigValueSetting {
        SteamNetworkingConfigValueSetting(SteamAPI_ISteamNetworkingUtils_IterateGenericEditableConfigValues(interface, ESteamNetworkingConfigValue(current), enumerateDevVars))
    }

    /// Steamworks `ISteamNetworkingUtils::ParsePingLocationString()`
    public func parsePingLocationString(string: String, result: SteamNetworkPingLocation) -> Bool {
        var tmp_result = SteamNetworkPingLocation_t(result)
        return SteamAPI_ISteamNetworkingUtils_ParsePingLocationString(interface, string, &tmp_result)
    }

    /// Steamworks `ISteamNetworkingUtils::SetConfigValue()`
    public func setConfigValue(value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, dataType: SteamNetworkingConfigDataType, arg: UnsafeRawPointer) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConfigValue(interface, ESteamNetworkingConfigValue(value), ESteamNetworkingConfigScope(scopeType), intptr_t(obj), ESteamNetworkingConfigDataType(dataType), arg)
    }

    /// Steamworks `ISteamNetworkingUtils::SetConfigValueStruct()`
    public func setConfigValueStruct(opt: SteamNetworkingConfigValue, scopeType: SteamNetworkingConfigScope, obj: Int) -> Bool {
        var tmp_opt = SteamNetworkingConfigValue_t(opt)
        return SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct(interface, &tmp_opt, ESteamNetworkingConfigScope(scopeType), intptr_t(obj))
    }

    /// Steamworks `ISteamNetworkingUtils::SetConnectionConfigValueFloat()`
    public func setConnectionConfigValueFloat(conn: HSteamNetConnection, value: SteamNetworkingConfigValueSetting, val: Float) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueFloat(interface, CSteamworks.HSteamNetConnection(conn), ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetConnectionConfigValueInt32()`
    public func setConnectionConfigValueInt32(conn: HSteamNetConnection, value: SteamNetworkingConfigValueSetting, val: Int) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueInt32(interface, CSteamworks.HSteamNetConnection(conn), ESteamNetworkingConfigValue(value), int32(val))
    }

    /// Steamworks `ISteamNetworkingUtils::SetConnectionConfigValueString()`
    public func setConnectionConfigValueString(conn: HSteamNetConnection, value: SteamNetworkingConfigValueSetting, val: String) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueString(interface, CSteamworks.HSteamNetConnection(conn), ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetGlobalConfigValueFloat()`
    public func setGlobalConfigValueFloat(value: SteamNetworkingConfigValueSetting, val: Float) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueFloat(interface, ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetGlobalConfigValueInt32()`
    public func setGlobalConfigValueInt32(value: SteamNetworkingConfigValueSetting, val: Int) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueInt32(interface, ESteamNetworkingConfigValue(value), int32(val))
    }

    /// Steamworks `ISteamNetworkingUtils::SetGlobalConfigValuePtr()`
    public func setGlobalConfigValuePtr(value: SteamNetworkingConfigValueSetting, val: UnsafeMutableRawPointer) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValuePtr(interface, ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetGlobalConfigValueString()`
    public func setGlobalConfigValueString(value: SteamNetworkingConfigValueSetting, val: String) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueString(interface, ESteamNetworkingConfigValue(value), val)
    }
}
