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
        SteamNetworkingMessage(SteamAPI_ISteamNetworkingUtils_AllocateMessage(interface, CInt(allocateBufferSize)))
    }

    /// Steamworks `ISteamNetworkingUtils::CheckPingDataUpToDate()`
    public func checkPingDataUpToDate(maxAgeSeconds: Float) -> Bool {
        SteamAPI_ISteamNetworkingUtils_CheckPingDataUpToDate(interface, maxAgeSeconds)
    }

    /// Steamworks `ISteamNetworkingUtils::ConvertPingLocationToString()`
    public func convertPingLocationToString(location: SteamNetworkPingLocation, bufSize: Int = SteamConstants.maxSteamNetworkingPingLocationStringSize) -> String {
        var tmpBuf = SteamOutString(length: bufSize)
        tmpBuf.setContent { nstBuf in
            SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString(interface, SteamNetworkPingLocation_t(location), nstBuf, CInt(bufSize))
        }
        return tmpBuf.swiftString
    }

    /// Steamworks `ISteamNetworkingUtils::EstimatePingTimeBetweenTwoLocations()`
    public func estimatePingTimeBetweenTwoLocations(location1: SteamNetworkPingLocation, location2: SteamNetworkPingLocation) -> Int {
        Int(SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations(interface, SteamNetworkPingLocation_t(location1), SteamNetworkPingLocation_t(location2)))
    }

    /// Steamworks `ISteamNetworkingUtils::EstimatePingTimeFromLocalHost()`
    public func estimatePingTimeFromLocalHost(location: SteamNetworkPingLocation) -> Int {
        Int(SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost(interface, SteamNetworkPingLocation_t(location)))
    }

    /// Steamworks `ISteamNetworkingUtils::GetConfigValue()`
    public func getConfigValue(value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, result: UnsafeMutableRawPointer?, resultSize: Int) -> (rc: SteamNetworkingGetConfigValueResult, dataType: SteamNetworkingConfigDataType, resultSize: Int) {
        var tmpDataType = ESteamNetworkingConfigDataType(rawValue: 0)
        var tmpResultSize = size_t(resultSize)
        let rc = SteamNetworkingGetConfigValueResult(SteamAPI_ISteamNetworkingUtils_GetConfigValue(interface, ESteamNetworkingConfigValue(value), ESteamNetworkingConfigScope(scopeType), intptr_t(obj), &tmpDataType, result, &tmpResultSize))
        return (rc: rc, dataType: SteamNetworkingConfigDataType(tmpDataType), resultSize: Int(tmpResultSize))
    }

    /// Steamworks `ISteamNetworkingUtils::GetConfigValueInfo()`
    public func getConfigValueInfo(value: SteamNetworkingConfigValueSetting) -> (rc: String, dataType: SteamNetworkingConfigDataType, scope: SteamNetworkingConfigScope) {
        var tmpDataType = ESteamNetworkingConfigDataType(rawValue: 0)
        var tmpScope = ESteamNetworkingConfigScope(rawValue: 0)
        let rc = String(SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo(interface, ESteamNetworkingConfigValue(value), &tmpDataType, &tmpScope))
        return (rc: rc, dataType: SteamNetworkingConfigDataType(tmpDataType), scope: SteamNetworkingConfigScope(tmpScope))
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
        var tmpResult = SteamNetworkPingLocation_t()
        let rc = Float(SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation(interface, &tmpResult))
        return (rc: rc, result: SteamNetworkPingLocation(tmpResult))
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
        let tmpList = SteamOutArray<CSteamworks.SteamNetworkingPOPID>(listSz)
        let rc = Int(SteamAPI_ISteamNetworkingUtils_GetPOPList(interface, tmpList.steamArray, CInt(listSz)))
        return (rc: rc, list: tmpList.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamNetworkingUtils::GetPingToDataCenter()`
    public func getPingToDataCenter(id: SteamNetworkingPOPID) -> (rc: Int, viaRelayPoP: SteamNetworkingPOPID) {
        var tmpViaRelayPoP = CSteamworks.SteamNetworkingPOPID()
        let rc = Int(SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter(interface, CSteamworks.SteamNetworkingPOPID(id), &tmpViaRelayPoP))
        return (rc: rc, viaRelayPoP: SteamNetworkingPOPID(tmpViaRelayPoP))
    }

    /// Steamworks `ISteamNetworkingUtils::GetRealIdentityForFakeIP()`
    public func getRealIdentityForFakeIP(ip: SteamNetworkingIPAddr) -> (rc: Result, realIdentity: SteamNetworkingIdentity) {
        var tmpRealIdentity = CSteamworks.SteamNetworkingIdentity()
        let rc = Result(SteamAPI_ISteamNetworkingUtils_GetRealIdentityForFakeIP(interface, CSteamworks.SteamNetworkingIPAddr(ip), &tmpRealIdentity))
        if rc == .ok {
            return (rc: rc, realIdentity: SteamNetworkingIdentity(tmpRealIdentity))
        } else {
            return (rc: rc, realIdentity: SteamNetworkingIdentity())
        }
    }

    /// Steamworks `ISteamNetworkingUtils::GetRelayNetworkStatus()`
    public func getRelayNetworkStatus(returnDetails: Bool = true) -> (rc: SteamNetworkingAvailability, details: SteamRelayNetworkStatus) {
        let tmpDetails = SteamNullable<SteamRelayNetworkStatus_t>(isReal: returnDetails)
        defer { tmpDetails.deallocate() }
        let rc = SteamNetworkingAvailability(SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus(interface, tmpDetails.steamValue))
        return (rc: rc, details: tmpDetails.swiftValue(dummy: SteamRelayNetworkStatus()))
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
    public func parsePingLocationString(string: String) -> (rc: Bool, result: SteamNetworkPingLocation) {
        var tmpResult = SteamNetworkPingLocation_t()
        let rc = SteamAPI_ISteamNetworkingUtils_ParsePingLocationString(interface, string, &tmpResult)
        if rc {
            return (rc: rc, result: SteamNetworkPingLocation(tmpResult))
        } else {
            return (rc: rc, result: SteamNetworkPingLocation())
        }
    }

    /// Steamworks `ISteamNetworkingUtils::SetConfigValue()`
    @discardableResult
    public func setConfigValue(value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, dataType: SteamNetworkingConfigDataType, arg: UnsafeRawPointer) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConfigValue(interface, ESteamNetworkingConfigValue(value), ESteamNetworkingConfigScope(scopeType), intptr_t(obj), ESteamNetworkingConfigDataType(dataType), arg)
    }

    /// Steamworks `ISteamNetworkingUtils::SetConfigValueStruct()`
    @discardableResult
    public func setConfigValueStruct(opt: SteamNetworkingConfigValue, scopeType: SteamNetworkingConfigScope, obj: Int) -> Bool {
        SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct(interface, SteamNetworkingConfigValue_t(opt), ESteamNetworkingConfigScope(scopeType), intptr_t(obj))
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
        SteamNetworkingFakeIPType(SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_GetFakeIPType(interface, CSteamworks.SteamNetworkingIPAddr(addr)))
    }
}
