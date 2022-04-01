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
    public func getConfigValue(value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, result: UnsafeMutableRawPointer?, resultSize: inout Int) -> (rc: SteamNetworkingGetConfigValueResult, outDataType: SteamNetworkingConfigDataType) {
        var tmp_outDataType = ESteamNetworkingConfigDataType(rawValue: 0)
        var tmp_resultSize = size_t(resultSize)
        let rc = SteamNetworkingGetConfigValueResult(SteamAPI_ISteamNetworkingUtils_GetConfigValue(interface, ESteamNetworkingConfigValue(value), ESteamNetworkingConfigScope(scopeType), intptr_t(obj), &tmp_outDataType, result, &tmp_resultSize))
        resultSize = Int(tmp_resultSize)
        return (rc: rc, outDataType: SteamNetworkingConfigDataType(tmp_outDataType))
    }

    /// Steamworks `ISteamNetworkingUtils::GetConfigValueInfo()`
    public func getConfigValueInfo(value: SteamNetworkingConfigValueSetting) -> (rc: String, outDataType: SteamNetworkingConfigDataType, outScope: SteamNetworkingConfigScope) {
        var tmp_outDataType = ESteamNetworkingConfigDataType(rawValue: 0)
        var tmp_outScope = ESteamNetworkingConfigScope(rawValue: 0)
        let rc = String(SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo(interface, ESteamNetworkingConfigValue(value), &tmp_outDataType, &tmp_outScope))
        return (rc: rc, outDataType: SteamNetworkingConfigDataType(tmp_outDataType), outScope: SteamNetworkingConfigScope(tmp_outScope))
    }

    /// Steamworks `ISteamNetworkingUtils::GetDirectPingToPOP()`
    public func getDirectPingToPOP(id: SteamNetworkingPOPID) -> Int {
        Int(SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP(interface, CSteamworks.SteamNetworkingPOPID(id)))
    }

    /// Steamworks `ISteamNetworkingUtils::GetIPv4FakeIPType()`
    public func getIPv4FakeIPType(ipv4: Int) -> SteamNetworkingFakeIPType {
        SteamNetworkingFakeIPType(SteamAPI_ISteamNetworkingUtils_GetIPv4FakeIPType(interface, uint32(ipv4)))
    }

    /// Steamworks `ISteamNetworkingUtils::GetLocalPingLocation()`
    public func getLocalPingLocation() -> (rc: Float, result: SteamNetworkPingLocation) {
        var tmp_result = SteamNetworkPingLocation_t()
        let rc = Float(SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation(interface, &tmp_result))
        return (rc: rc, result: SteamNetworkPingLocation(tmp_result))
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
    public func getPOPList(listSz: Int) -> (rc: Int, list: [SteamNetworkingPOPID]) {
        let tmp_list = SteamOutArray<CSteamworks.SteamNetworkingPOPID>(listSz)
        let rc = Int(SteamAPI_ISteamNetworkingUtils_GetPOPList(interface, tmp_list.steamArray, Int32(listSz)))
        return (rc: rc, list: tmp_list.swiftArray(rc))
    }

    /// Steamworks `ISteamNetworkingUtils::GetPingToDataCenter()`
    public func getPingToDataCenter(id: SteamNetworkingPOPID) -> (rc: Int, viaRelayPoP: SteamNetworkingPOPID) {
        var tmp_viaRelayPoP = CSteamworks.SteamNetworkingPOPID()
        let rc = Int(SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter(interface, CSteamworks.SteamNetworkingPOPID(id), &tmp_viaRelayPoP))
        return (rc: rc, viaRelayPoP: SteamNetworkingPOPID(tmp_viaRelayPoP))
    }

    /// Steamworks `ISteamNetworkingUtils::GetRealIdentityForFakeIP()`
    public func getRealIdentityForFakeIP(ip: SteamNetworkingIPAddr) -> (rc: Result, outRealIdentity: SteamNetworkingIdentity) {
        var tmp_ip = CSteamworks.SteamNetworkingIPAddr(ip)
        var tmp_outRealIdentity = CSteamworks.SteamNetworkingIdentity()
        let rc = Result(SteamAPI_ISteamNetworkingUtils_GetRealIdentityForFakeIP(interface, &tmp_ip, &tmp_outRealIdentity))
        if rc == .ok {
            return (rc: rc, outRealIdentity: SteamNetworkingIdentity(tmp_outRealIdentity))
        } else {
            return (rc: rc, outRealIdentity: SteamNetworkingIdentity())
        }
    }

    /// Steamworks `ISteamNetworkingUtils::GetRelayNetworkStatus()`
    public func getRelayNetworkStatus(returnDetails: Bool = true) -> (rc: SteamNetworkingAvailability, details: SteamRelayNetworkStatus) {
        let tmp_details = returnDetails ? UnsafeMutablePointer<SteamRelayNetworkStatus_t>.allocate(capacity: 1) : nil
        defer { tmp_details?.deallocate() }
        let rc = SteamNetworkingAvailability(SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus(interface, tmp_details))
        return (rc: rc, details: tmp_details.map { SteamRelayNetworkStatus($0.pointee) } ?? SteamRelayNetworkStatus())
    }

    /// Steamworks `ISteamNetworkingUtils::InitRelayNetworkAccess()`
    public func initRelayNetworkAccess() {
        SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess(interface)
    }

    /// Steamworks `ISteamNetworkingUtils::IsFakeIPv4()`
    public func isFakeIPv4(ipv4: Int) -> Bool {
        SteamAPI_ISteamNetworkingUtils_IsFakeIPv4(interface, uint32(ipv4))
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
    @discardableResult
    public func setConfigValue(value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, dataType: SteamNetworkingConfigDataType, arg: UnsafeRawPointer) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConfigValue(interface, ESteamNetworkingConfigValue(value), ESteamNetworkingConfigScope(scopeType), intptr_t(obj), ESteamNetworkingConfigDataType(dataType), arg)
    }

    /// Steamworks `ISteamNetworkingUtils::SetConfigValueStruct()`
    @discardableResult
    public func setConfigValueStruct(opt: SteamNetworkingConfigValue, scopeType: SteamNetworkingConfigScope, obj: Int) -> Bool {
        var tmp_opt = SteamNetworkingConfigValue_t(opt)
        return SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct(interface, &tmp_opt, ESteamNetworkingConfigScope(scopeType), intptr_t(obj))
    }

    /// Steamworks `ISteamNetworkingUtils::SetConnectionConfigValueFloat()`
    @discardableResult
    public func setConnectionConfigValueFloat(conn: HSteamNetConnection, value: SteamNetworkingConfigValueSetting, val: Float) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueFloat(interface, CSteamworks.HSteamNetConnection(conn), ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetConnectionConfigValueInt32()`
    @discardableResult
    public func setConnectionConfigValueInt32(conn: HSteamNetConnection, value: SteamNetworkingConfigValueSetting, val: Int) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueInt32(interface, CSteamworks.HSteamNetConnection(conn), ESteamNetworkingConfigValue(value), int32(val))
    }

    /// Steamworks `ISteamNetworkingUtils::SetConnectionConfigValueString()`
    @discardableResult
    public func setConnectionConfigValueString(conn: HSteamNetConnection, value: SteamNetworkingConfigValueSetting, val: String) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueString(interface, CSteamworks.HSteamNetConnection(conn), ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetGlobalConfigValueFloat()`
    @discardableResult
    public func setGlobalConfigValueFloat(value: SteamNetworkingConfigValueSetting, val: Float) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueFloat(interface, ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetGlobalConfigValueInt32()`
    @discardableResult
    public func setGlobalConfigValueInt32(value: SteamNetworkingConfigValueSetting, val: Int) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueInt32(interface, ESteamNetworkingConfigValue(value), int32(val))
    }

    /// Steamworks `ISteamNetworkingUtils::SetGlobalConfigValuePtr()`
    @discardableResult
    public func setGlobalConfigValuePtr(value: SteamNetworkingConfigValueSetting, val: UnsafeMutableRawPointer) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValuePtr(interface, ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetGlobalConfigValueString()`
    @discardableResult
    public func setGlobalConfigValueString(value: SteamNetworkingConfigValueSetting, val: String) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueString(interface, ESteamNetworkingConfigValue(value), val)
    }

    /// Steamworks `ISteamNetworkingUtils::SteamNetworkingIPAddr_GetFakeIPType()`
    public func steamNetworkingIPAddrGetFakeIPType(addr: SteamNetworkingIPAddr) -> SteamNetworkingFakeIPType {
        var tmp_addr = CSteamworks.SteamNetworkingIPAddr(addr)
        return SteamNetworkingFakeIPType(SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType(interface, &tmp_addr))
    }
}
