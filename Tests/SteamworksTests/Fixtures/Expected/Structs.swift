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
