//
//  ManualInterfaces.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks
import Logging

// Interfaces that are so unusually formed and rare that there's no point
// teaching the generator how to deal with them.


/// These SteamHTTP interfaces are weird because they want to be call-returns but insist on returning
/// a boolean to indicate failure instead of using `k_uAPICallInvalid`.  Fix them up.
extension SteamHTTP {
    /// Steamworks `ISteamHTTP::SendHTTPRequest()`
    public func sendHTTPRequest(request: HTTPRequestHandle, completion: @escaping (HTTPRequestCompleted?) -> Void) {
        var callHandle = SteamAPICall_t()
        if !SteamAPI_ISteamHTTP_SendHTTPRequest(interface, CSteamworks.HTTPRequestHandle(request), &callHandle) {
            callHandle = k_uAPICallInvalid
        }
        SteamBaseAPI.CallResults.shared.add(callID: callHandle, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamHTTP::SendHTTPRequestAndStreamResponse()`
    public func sendHTTPRequestAndStreamResponse(request: HTTPRequestHandle, completion: @escaping (HTTPRequestCompleted?) -> Void) {
        var callHandle = SteamAPICall_t()
        if !SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse(interface, CSteamworks.HTTPRequestHandle(request), &callHandle) {
            callHandle = k_uAPICallInvalid
        }
        SteamBaseAPI.CallResults.shared.add(callID: callHandle, rawClient: SteamBaseAPI.makeRaw(completion))
    }
}

/// Not sure how to systematically deal with function pointers yet.
extension SteamInput {
    /// Steamworks `ISteamInput::EnableActionEventCallbacks()`
    public func enableActionEventCallbacks(callback: SteamInputActionEventCallbackPointer?) {
        Self.actionEventCallback = callback
        if callback != nil {
            SteamAPI_ISteamInput_EnableActionEventCallbacks(interface) { evt in
                evt.map { Self.actionEventCallback?(.init($0.pointee)) }
            }
        } else {
            SteamAPI_ISteamInput_EnableActionEventCallbacks(interface, nil)
        }
    }

    static var actionEventCallback: SteamInputActionEventCallbackPointer?
}

/// This one API has a really dumb design that returns a `char *` to some internal storage instead
/// of just copying the string like a normal program.  This might work.
extension SteamRemoteStorage {
    /// Steamworks `ISteamRemoteStorage::GetUGCDetails()`
    public func getUGCDetails(content: UGCHandle, appID: inout AppID, name: inout String, fileSizeInBytes: inout Int, owner: inout SteamID) -> Bool {
        var tmp_appID = AppId_t()
        let name_ptr = UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>.allocate(capacity: 1) // as in, space for one pointer-to-char
        defer { name_ptr.deallocate() }
        var tmp_fileSizeInBytes = int32()
        var tmp_owner = CSteamID()
        let rc = SteamAPI_ISteamRemoteStorage_GetUGCDetails(interface, UGCHandle_t(content), &tmp_appID, name_ptr, &tmp_fileSizeInBytes, &tmp_owner)
        if rc {
            appID = AppID(tmp_appID)
            name = String(name_ptr.pointee) // yikes
            fileSizeInBytes = Int(tmp_fileSizeInBytes)
            owner = SteamID(tmp_owner)
        }
        return rc
    }
}

/// Some SteamNetworkingUtils additions to cope with the complicated config API
extension SteamNetworkingUtils {
    /// Steamworks `ISteamNetworkingUtils::SetListenSocketConfigValueFloat()`
    @discardableResult
    public func setListenSocketConfigValueFloat(sock: HSteamListenSocket, value: SteamNetworkingConfigValueSetting, val: Float) -> Bool {
        var val = val
        return setConfigValue(value: value, scopeType: .listenSocket, obj: .init(sock.value), dataType: .float, arg: &val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetListenSocketConfigValueInt32()`
    @discardableResult
    public func setListenSocketConfigValueInt32(sock: HSteamListenSocket, value: SteamNetworkingConfigValueSetting, val: Int) -> Bool {
        var val = Int32(val)
        return setConfigValue(value: value, scopeType: .listenSocket, obj: .init(sock.value), dataType: .int32, arg: &val)
    }

    /// Steamworks `ISteamNetworkingUtils::SetListenSocketConfigValueString()`
    @discardableResult
    public func setListenSocketConfigValueString(sock: HSteamListenSocket, value: SteamNetworkingConfigValueSetting, val: String) -> Bool {
        val.withCString { ptr in
            setConfigValue(value: value, scopeType: .listenSocket, obj: .init(sock.value), dataType: .string, arg: ptr)
        }
    }

    /// Steamworks `ISteamNetworkingUtils::GetConfigValue()` for `Float`
    public func getConfigValue(_ value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, outValue: inout Float) -> SteamNetworkingGetConfigValueResult {
        var size = MemoryLayout<Float>.size
        var dummy = SteamNetworkingConfigDataType.unrepresentedInSwift
        return getConfigValue(value: value,
                              scopeType: scopeType, obj: obj,
                              outDataType: &dummy,
                              result: &outValue, resultSize: &size)
    }

    /// Steamworks `ISteamNetworkingUtils::GetConfigValue()` for `Int`
    public func getConfigValue(_ value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, outValue: inout Int) -> SteamNetworkingGetConfigValueResult {
        var int32Val = Int32(0)
        var size = MemoryLayout<Int32>.size
        var dummy = SteamNetworkingConfigDataType.unrepresentedInSwift
        let rc = getConfigValue(value: value,
                                scopeType: scopeType, obj: obj,
                                outDataType: &dummy,
                                result: &int32Val, resultSize: &size)
        outValue = Int(int32Val)
        return rc
    }

    /// Steamworks `ISteamNetworkingUtils::GetConfigValue()` for `String`
    public func getConfigValue(_ value: SteamNetworkingConfigValueSetting, scopeType: SteamNetworkingConfigScope, obj: Int, outValue: inout String) -> SteamNetworkingGetConfigValueResult {
        var bufSize = Int(0)
        var dummy = SteamNetworkingConfigDataType.unrepresentedInSwift
        let rc1 = getConfigValue(value: value,
                                 scopeType: scopeType, obj: obj,
                                 outDataType: &dummy,
                                 result: nil, resultSize: &bufSize)
        if rc1 != .bufferTooSmall {
            return rc1 // hmm
        }

        var rc2 = SteamNetworkingGetConfigValueResult.badValue
        outValue = String(unsafeUninitializedCapacity: bufSize) { buf in
            rc2 = getConfigValue(value: value,
                                 scopeType: scopeType, obj: obj,
                                 outDataType: &dummy,
                                 result: buf.baseAddress!, resultSize: &bufSize)
            return bufSize - 1 // don't tell Swift about the null?
        }
        return rc2
    }
}

/// SteamNetworkingUtils custom message-logging
extension SteamNetworkingUtils {
    /// Use `ISteamNetworkingUtils::SetDebugOutputFunction()` to send networking debug tracing
    /// through the `SteamBaseAPI.logger` logger.
    public func useLoggerForDebug(detailLevel: SteamNetworkingSocketsDebugOutputType) {
        SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction(interface,
                                                              ESteamNetworkingSocketsDebugOutputType(detailLevel),
                                                              networkingUtilsDebugCallback)
    }
}

private func networkingUtilsDebugCallback(type: ESteamNetworkingSocketsDebugOutputType, msg: UnsafePointer<Int8>?) {
    let metadata: Logger.Metadata = [
        "layer" : "SteamworksNetworking API",
        "type" : "\(SteamNetworkingSocketsDebugOutputType(type))"
    ]
    SteamBaseAPI.logger.debug(.init(stringLiteral: String(msg)), metadata: metadata)
}
