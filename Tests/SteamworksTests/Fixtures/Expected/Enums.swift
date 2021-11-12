//
//  Enums.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks `ESteamEnum`
public enum SteamEnum: Int32 {
    /// Steamworks `k_ESteamEnumIPv6`
    case ipv6 = 1
    /// Steamworks `k_ESteamEnum_Straight`
    case straight = 2
    /// Steamworks `k_ESteamEnum_A`
    case a = 3
    /// Steamworks `k_ESteamEnumPublic`
    case `public` = -4
    /// Steamworks `k_ESteamEnumHTTPFailure`
    case httpFailure = 5
    /// Steamworks `k_ESteamEnumOK`
    case ok = 6
    /// Steamworks `esteamEnumLower_Case`
    case lowerCase = 7
}

extension ESteamEnum: EnumConvertible { typealias From = SteamEnum }
extension SteamEnum: EnumConvertible { typealias From = ESteamEnum }

/// Steamworks `ESteamMiscFlags`
public enum SteamMiscFlags: UInt32 {
    /// Steamworks `k_ESteamMiscFlagsNone`
    case none = 0
    /// Steamworks `k_ESteamMiscFlagsSome`
    case some = 4
    /// Steamworks `k_ESteamMiscFlagsLoads`
    case loads = 512
}

extension ESteamMiscFlags: EnumConvertible { typealias From = SteamMiscFlags }
extension SteamMiscFlags: EnumConvertible { typealias From = ESteamMiscFlags }
