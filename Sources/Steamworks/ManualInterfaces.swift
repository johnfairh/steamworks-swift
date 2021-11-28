//
//  ManualInterfaces.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

// Interfaces that are so unusually formed and rare that there's no point
// teaching the generator how to deal with them.


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

// Not sure how to systemically deal with function pointers yet

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
