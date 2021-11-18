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

    /// Steamworks `IPCFailure_t::EFailureType`
    public enum FailureType: UInt32 {
        /// Steamworks `k_EFailureFlushedCallbackQueue`
        case kEFailureFlushedCallbackQueue = 0
        /// Steamworks `k_EFailurePipeFail`
        case kEFailurePipeFail = 1
        /// Some undocumented value
        case unrepresentedInSwift = 2
    }
}

extension IPCFailure_t.EFailureType: RawConvertible { typealias From = IPCFailure.FailureType }
extension IPCFailure.FailureType: EnumWithUnrepresented { typealias From = IPCFailure_t.EFailureType }

extension IPCFailure: SteamCreatable {
    init(_ steam: CSteamworks.IPCFailure_t) {
        failureType = .init(steam.m_eFailureType)
        success = .init(steam.m_bSuccess)
        user = .init(steam.m_steamIDUser)
        name = .init(steam.m_achName_ptr)
        data = .init(steam.m_abData_ptr, 12)
        struct = .init(steam.m_aStruct_ptr, 4) { .init($0) }
    }
}
