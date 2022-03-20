//
//  Typedefs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks `AccountID_t`
public struct AccountID: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension AccountID: SteamTypeAlias {}
extension AccountID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `AppId_t`
public struct AppID: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension AppID: SteamTypeAlias {}
extension AppID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `ControllerActionSetHandle_t`
public struct ControllerActionSetHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension ControllerActionSetHandle: SteamTypeAlias {}
extension ControllerActionSetHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `ControllerAnalogActionHandle_t`
public struct ControllerAnalogActionHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension ControllerAnalogActionHandle: SteamTypeAlias {}
extension ControllerAnalogActionHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `ControllerDigitalActionHandle_t`
public struct ControllerDigitalActionHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension ControllerDigitalActionHandle: SteamTypeAlias {}
extension ControllerDigitalActionHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `ControllerHandle_t`
public struct ControllerHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension ControllerHandle: SteamTypeAlias {}
extension ControllerHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `DepotId_t`
public struct DepotID: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension DepotID: SteamTypeAlias {}
extension DepotID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `FriendsGroupID_t`
public struct FriendsGroupID: Hashable {
    public let value: Int16
    public init(_ value: Int16) { self.value = value }
}

extension FriendsGroupID: SteamTypeAlias {}
extension FriendsGroupID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int16) { self.init(value) }
}

/// Steamworks `HAuthTicket`
public struct HAuthTicket: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension HAuthTicket: SteamTypeAlias {}
extension HAuthTicket: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `HHTMLBrowser`
public struct HHTMLBrowser: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension HHTMLBrowser: SteamTypeAlias {}
extension HHTMLBrowser: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `HServerListRequest`
public struct HServerListRequest: Hashable {
    public let value: UnsafeMutableRawPointer
    public init(_ value: UnsafeMutableRawPointer) { self.value = value }
}

extension HServerListRequest: SteamTypeAlias {}

/// Steamworks `HServerQuery`
public struct HServerQuery: Hashable {
    public let value: Int32
    public init(_ value: Int32) { self.value = value }
}

extension HServerQuery: SteamTypeAlias {}
extension HServerQuery: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int32) { self.init(value) }
}

/// Steamworks `HSteamListenSocket`
public struct HSteamListenSocket: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension HSteamListenSocket: SteamTypeAlias {}
extension HSteamListenSocket: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `HSteamNetConnection`
public struct HSteamNetConnection: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension HSteamNetConnection: SteamTypeAlias {}
extension HSteamNetConnection: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `HSteamNetPollGroup`
public struct HSteamNetPollGroup: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension HSteamNetPollGroup: SteamTypeAlias {}
extension HSteamNetPollGroup: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `HSteamPipe`
public struct HSteamPipe: Hashable {
    public let value: Int32
    public init(_ value: Int32) { self.value = value }
}

extension HSteamPipe: SteamTypeAlias {}
extension HSteamPipe: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int32) { self.init(value) }
}

/// Steamworks `HSteamUser`
public struct HSteamUser: Hashable {
    public let value: Int32
    public init(_ value: Int32) { self.value = value }
}

extension HSteamUser: SteamTypeAlias {}
extension HSteamUser: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int32) { self.init(value) }
}

/// Steamworks `HTTPCookieContainerHandle`
public struct HTTPCookieContainerHandle: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension HTTPCookieContainerHandle: SteamTypeAlias {}
extension HTTPCookieContainerHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `HTTPRequestHandle`
public struct HTTPRequestHandle: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension HTTPRequestHandle: SteamTypeAlias {}
extension HTTPRequestHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `InputActionSetHandle_t`
public struct InputActionSetHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension InputActionSetHandle: SteamTypeAlias {}
extension InputActionSetHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `InputAnalogActionHandle_t`
public struct InputAnalogActionHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension InputAnalogActionHandle: SteamTypeAlias {}
extension InputAnalogActionHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `InputDigitalActionHandle_t`
public struct InputDigitalActionHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension InputDigitalActionHandle: SteamTypeAlias {}
extension InputDigitalActionHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `InputHandle_t`
public struct InputHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension InputHandle: SteamTypeAlias {}
extension InputHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `PartyBeaconID_t`
public struct PartyBeaconID: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension PartyBeaconID: SteamTypeAlias {}
extension PartyBeaconID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `PublishedFileId_t`
public struct PublishedFileID: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension PublishedFileID: SteamTypeAlias {}
extension PublishedFileID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `PublishedFileUpdateHandle_t`
public struct PublishedFileUpdateHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension PublishedFileUpdateHandle: SteamTypeAlias {}
extension PublishedFileUpdateHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `RTime32`
public struct RTime32: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension RTime32: SteamTypeAlias {}
extension RTime32: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `RemotePlaySessionID_t`
public struct RemotePlaySessionID: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension RemotePlaySessionID: SteamTypeAlias {}
extension RemotePlaySessionID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `SNetListenSocket_t`
public struct SNetListenSocket: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension SNetListenSocket: SteamTypeAlias {}
extension SNetListenSocket: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `SNetSocket_t`
public struct SNetSocket: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension SNetSocket: SteamTypeAlias {}
extension SNetSocket: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `ScreenshotHandle`
public struct ScreenshotHandle: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension ScreenshotHandle: SteamTypeAlias {}
extension ScreenshotHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `SteamAPICall_t`
public struct SteamAPICall: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension SteamAPICall: SteamTypeAlias {}
extension SteamAPICall: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `SteamInputActionEventCallbackPointer`
public typealias SteamInputActionEventCallbackPointer = (SteamInputActionEvent) -> Void

/// Steamworks `SteamInventoryResult_t`
public struct SteamInventoryResult: Hashable {
    public let value: Int32
    public init(_ value: Int32) { self.value = value }
}

extension SteamInventoryResult: SteamTypeAlias {}
extension SteamInventoryResult: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int32) { self.init(value) }
}

/// Steamworks `SteamInventoryUpdateHandle_t`
public struct SteamInventoryUpdateHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension SteamInventoryUpdateHandle: SteamTypeAlias {}
extension SteamInventoryUpdateHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `SteamItemDef_t`
public struct SteamItemDef: Hashable {
    public let value: Int32
    public init(_ value: Int32) { self.value = value }
}

extension SteamItemDef: SteamTypeAlias {}
extension SteamItemDef: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int32) { self.init(value) }
}

/// Steamworks `SteamItemInstanceID_t`
public struct SteamItemInstanceID: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension SteamItemInstanceID: SteamTypeAlias {}
extension SteamItemInstanceID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `SteamLeaderboardEntries_t`
public struct SteamLeaderboardEntries: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension SteamLeaderboardEntries: SteamTypeAlias {}
extension SteamLeaderboardEntries: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `SteamLeaderboard_t`
public struct SteamLeaderboard: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension SteamLeaderboard: SteamTypeAlias {}
extension SteamLeaderboard: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `SteamNetworkingErrMsg`
public struct SteamNetworkingErrMsg: Hashable {
    public let value: String
    public init(_ value: String) { self.value = value }
}

extension SteamNetworkingErrMsg: SteamTypeAlias {}

/// Steamworks `SteamNetworkingMicroseconds`
public struct SteamNetworkingMicroseconds: Hashable {
    public let value: Int64
    public init(_ value: Int64) { self.value = value }
}

extension SteamNetworkingMicroseconds: SteamTypeAlias {}
extension SteamNetworkingMicroseconds: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int64) { self.init(value) }
}

/// Steamworks `SteamNetworkingPOPID`
public struct SteamNetworkingPOPID: Hashable {
    public let value: UInt32
    public init(_ value: UInt32) { self.value = value }
}

extension SteamNetworkingPOPID: SteamTypeAlias {}
extension SteamNetworkingPOPID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt32) { self.init(value) }
}

/// Steamworks `UGCFileWriteStreamHandle_t`
public struct UGCFileWriteStreamHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension UGCFileWriteStreamHandle: SteamTypeAlias {}
extension UGCFileWriteStreamHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `UGCHandle_t`
public struct UGCHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension UGCHandle: SteamTypeAlias {}
extension UGCHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `UGCQueryHandle_t`
public struct UGCQueryHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension UGCQueryHandle: SteamTypeAlias {}
extension UGCQueryHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}

/// Steamworks `UGCUpdateHandle_t`
public struct UGCUpdateHandle: Hashable {
    public let value: UInt64
    public init(_ value: UInt64) { self.value = value }
}

extension UGCUpdateHandle: SteamTypeAlias {}
extension UGCUpdateHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: UInt64) { self.init(value) }
}
