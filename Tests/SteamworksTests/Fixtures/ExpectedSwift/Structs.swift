//
//  Structs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks `IPCFailure_t`
public struct IPCFailure {
    /// Steamworks `m_eFailureType`
    public let failureType: Int
    /// Steamworks `m_bSuccess`
    public let success: Bool
    /// Steamworks `m_steamIDUser`
    public let user: SteamID
    /// Steamworks `m_achName`
    public let name: String
    /// Steamworks `m_abData`
    public let data: [UInt8]
    /// Steamworks `m_aStruct`
    public let struct: [Something]

    /// Create a customized `IPCFailure`
    public init(failureType: Int = 0, success: Bool = false, user: SteamID = SteamID(), name: String = "", data: [UInt8] = [], struct: [Something] = []) {
        self.failureType = failureType
        self.success = success
        self.user = user
        self.name = name
        self.data = data
        self.struct = struct
    }
}

extension IPCFailure: SteamCreatable {
    typealias SteamType = CSteamworks.IPCFailure_t
    init(_ steam: CSteamworks.IPCFailure_t) {
        failureType = .init(steam.m_eFailureType)
        success = .init(steam.m_bSuccess)
        user = .init(steam.m_steamIDUser)
        name = .init(steam.m_achName_ptr)
        data = .init(steam.m_abData_ptr, 12)
        struct = .init(steam.m_aStruct_ptr, 4) { .init($0) }
    }
}
