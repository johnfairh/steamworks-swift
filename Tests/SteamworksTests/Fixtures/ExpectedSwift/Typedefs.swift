//
//  Typedefs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks `AppId_t`
public struct AppID: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension AppID: SteamTypeAlias {}
extension AppID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `Callback_t`
public typealias Callback = (SteamType, SteamEnum) -> Void

/// Steamworks `FriendID_t`
public struct FriendID: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension FriendID: SteamTypeAlias {}
extension FriendID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}
