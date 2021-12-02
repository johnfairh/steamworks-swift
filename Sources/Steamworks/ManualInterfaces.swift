//
//  ManualInterfaces.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

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
