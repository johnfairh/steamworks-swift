//
//  Callbacks.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//


public extension SteamCallbacks {
    func onSteamServersConnected(_ client: @escaping (SteamServersConnected) -> Void) {
        callbacks.add(rawClient: SteamCallbacks.makeRaw(client), callbackID: CallbackID(2) /* Generated */)
    }

    func onPersonaStateChange(_ client: @escaping (PersonaStateChange) -> Void) {
        callbacks.add(rawClient: SteamCallbacks.makeRaw(client), callbackID: CallbackID(304) /* Generated */)
    }
}

@available(macOS 12.0, *)
public extension SteamCallbacks {
    var steamServersConnected: AsyncStream<SteamServersConnected> {
        AsyncStream<SteamServersConnected> { continuation in
            onSteamServersConnected { continuation.yield($0) }
        }
    }
}
