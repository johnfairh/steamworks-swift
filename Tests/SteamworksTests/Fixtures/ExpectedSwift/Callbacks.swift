//
//  Callbacks.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

public extension SteamBaseAPI {
    // MARK: Callback registration
    /// Registration for Steamworks `IPCFailure_t` callback
    func onIPCFailure(_ client: @escaping (IPCFailure) -> Void) {
        callbacks.add(callbackID: CallbackID(117), rawClient: SteamBaseAPI.makeRaw(client))
    }
}

public extension SteamBaseAPI {
    // MARK: AsyncStream callback registration
    /// Async stream of Steamworks `IPCFailure_t` callbacks
    var ipcFailure: AsyncStream<IPCFailure> {
        AsyncStream { continuation in
            onIPCFailure { continuation.yield($0) }
        }
    }
}
