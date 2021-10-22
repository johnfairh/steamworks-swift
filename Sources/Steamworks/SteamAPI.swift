//
//  SteamAPI.swift
//  Steamworks
//
//  Created by John on 22/10/2021.
//

@_implementationOnly import CSteamworks

public final class SteamAPI {
    public init?() {
        guard SteamAPI_Init() else {
            return nil
        }
    }

    deinit {
        SteamAPI_Shutdown()
    }
}
