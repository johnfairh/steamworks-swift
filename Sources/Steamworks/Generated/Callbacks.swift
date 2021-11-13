//
//  Callbacks.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

public extension SteamBaseAPI {
    // MARK: Callback registration

    func onSteamServersConnected(_ client: @escaping (SteamServersConnected) -> Void) {
        callbacks.add(callbackID: CallbackID(2) /* Generated */, rawClient: SteamBaseAPI.makeRaw(client))
    }

    func onPersonaStateChange(_ client: @escaping (PersonaStateChange) -> Void) {
        callbacks.add(callbackID: CallbackID(304) /* Generated */, rawClient: SteamBaseAPI.makeRaw(client))
    }

    func onUserStatsReceived(_ client: @escaping (UserStatsReceived) -> Void) {
        callbacks.add(callbackID: CallbackID(1101) /* Generated */, rawClient: SteamBaseAPI.makeRaw(client))
    }
}

public extension SteamBaseAPI {
    // MARK: Callback async streams

    var steamServersConnected: AsyncStream<SteamServersConnected> {
        AsyncStream<SteamServersConnected> { continuation in
            onSteamServersConnected { continuation.yield($0) }
        }
    }
}
