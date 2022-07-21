//
//  Typedefs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks `AccountID_t`
public struct AccountID: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension AccountID: SteamTypeAlias, SteamCreatable {}
extension AccountID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `AppId_t`
public struct AppID: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension AppID: SteamTypeAlias, SteamCreatable {}
extension AppID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `ControllerActionSetHandle_t`
public struct ControllerActionSetHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension ControllerActionSetHandle: SteamTypeAlias, SteamCreatable {}
extension ControllerActionSetHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `ControllerAnalogActionHandle_t`
public struct ControllerAnalogActionHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension ControllerAnalogActionHandle: SteamTypeAlias, SteamCreatable {}
extension ControllerAnalogActionHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `ControllerDigitalActionHandle_t`
public struct ControllerDigitalActionHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension ControllerDigitalActionHandle: SteamTypeAlias, SteamCreatable {}
extension ControllerDigitalActionHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `ControllerHandle_t`
public struct ControllerHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension ControllerHandle: SteamTypeAlias, SteamCreatable {}
extension ControllerHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `DepotId_t`
public struct DepotID: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension DepotID: SteamTypeAlias, SteamCreatable {}
extension DepotID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `FriendsGroupID_t`
public struct FriendsGroupID: Hashable, Sendable {
    public let value: CShort
    public init(_ value: CShort) { self.value = value }
}

extension FriendsGroupID: SteamTypeAlias, SteamCreatable {}
extension FriendsGroupID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CShort) { self.init(value) }
}

/// Steamworks `HAuthTicket`
public struct HAuthTicket: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension HAuthTicket: SteamTypeAlias, SteamCreatable {}
extension HAuthTicket: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `HHTMLBrowser`
public struct HHTMLBrowser: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension HHTMLBrowser: SteamTypeAlias, SteamCreatable {}
extension HHTMLBrowser: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `HServerListRequest`
public struct HServerListRequest: Hashable, Sendable {
    public let value: UnsafeMutableRawPointer
    public init(_ value: UnsafeMutableRawPointer) { self.value = value }
}

extension HServerListRequest: SteamTypeAlias, SteamCreatable {}

/// Steamworks `HServerQuery`
public struct HServerQuery: Hashable, Sendable {
    public let value: CInt
    public init(_ value: CInt) { self.value = value }
}

extension HServerQuery: SteamTypeAlias, SteamCreatable {}
extension HServerQuery: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CInt) { self.init(value) }
}

/// Steamworks `HSteamListenSocket`
public struct HSteamListenSocket: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension HSteamListenSocket: SteamTypeAlias, SteamCreatable {}
extension HSteamListenSocket: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `HSteamNetConnection`
public struct HSteamNetConnection: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension HSteamNetConnection: SteamTypeAlias, SteamCreatable {}
extension HSteamNetConnection: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `HSteamNetPollGroup`
public struct HSteamNetPollGroup: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension HSteamNetPollGroup: SteamTypeAlias, SteamCreatable {}
extension HSteamNetPollGroup: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `HSteamPipe`
public struct HSteamPipe: Hashable, Sendable {
    public let value: CInt
    public init(_ value: CInt) { self.value = value }
}

extension HSteamPipe: SteamTypeAlias, SteamCreatable {}
extension HSteamPipe: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CInt) { self.init(value) }
}

/// Steamworks `HSteamUser`
public struct HSteamUser: Hashable, Sendable {
    public let value: CInt
    public init(_ value: CInt) { self.value = value }
}

extension HSteamUser: SteamTypeAlias, SteamCreatable {}
extension HSteamUser: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CInt) { self.init(value) }
}

/// Steamworks `HTTPCookieContainerHandle`
public struct HTTPCookieContainerHandle: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension HTTPCookieContainerHandle: SteamTypeAlias, SteamCreatable {}
extension HTTPCookieContainerHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `HTTPRequestHandle`
public struct HTTPRequestHandle: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension HTTPRequestHandle: SteamTypeAlias, SteamCreatable {}
extension HTTPRequestHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `InputActionSetHandle_t`
public struct InputActionSetHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension InputActionSetHandle: SteamTypeAlias, SteamCreatable {}
extension InputActionSetHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `InputAnalogActionHandle_t`
public struct InputAnalogActionHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension InputAnalogActionHandle: SteamTypeAlias, SteamCreatable {}
extension InputAnalogActionHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `InputDigitalActionHandle_t`
public struct InputDigitalActionHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension InputDigitalActionHandle: SteamTypeAlias, SteamCreatable {}
extension InputDigitalActionHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `InputHandle_t`
public struct InputHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension InputHandle: SteamTypeAlias, SteamCreatable {}
extension InputHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `PartyBeaconID_t`
public struct PartyBeaconID: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension PartyBeaconID: SteamTypeAlias, SteamCreatable {}
extension PartyBeaconID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `PublishedFileId_t`
public struct PublishedFileID: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension PublishedFileID: SteamTypeAlias, SteamCreatable {}
extension PublishedFileID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `PublishedFileUpdateHandle_t`
public struct PublishedFileUpdateHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension PublishedFileUpdateHandle: SteamTypeAlias, SteamCreatable {}
extension PublishedFileUpdateHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `RTime32`
public struct RTime32: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension RTime32: SteamTypeAlias, SteamCreatable {}
extension RTime32: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `RemotePlaySessionID_t`
public struct RemotePlaySessionID: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension RemotePlaySessionID: SteamTypeAlias, SteamCreatable {}
extension RemotePlaySessionID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `SNetListenSocket_t`
public struct SNetListenSocket: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension SNetListenSocket: SteamTypeAlias, SteamCreatable {}
extension SNetListenSocket: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `SNetSocket_t`
public struct SNetSocket: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension SNetSocket: SteamTypeAlias, SteamCreatable {}
extension SNetSocket: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `ScreenshotHandle`
public struct ScreenshotHandle: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension ScreenshotHandle: SteamTypeAlias, SteamCreatable {}
extension ScreenshotHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `SteamAPICall_t`
public struct SteamAPICall: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension SteamAPICall: SteamTypeAlias, SteamCreatable {}
extension SteamAPICall: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `SteamInputActionEventCallbackPointer`
public typealias SteamInputActionEventCallbackPointer = (SteamInputActionEvent) -> Void

/// Steamworks `SteamInventoryResult_t`
public struct SteamInventoryResult: Hashable, Sendable {
    public let value: CInt
    public init(_ value: CInt) { self.value = value }
}

extension SteamInventoryResult: SteamTypeAlias, SteamCreatable {}
extension SteamInventoryResult: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CInt) { self.init(value) }
}

/// Steamworks `SteamInventoryUpdateHandle_t`
public struct SteamInventoryUpdateHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension SteamInventoryUpdateHandle: SteamTypeAlias, SteamCreatable {}
extension SteamInventoryUpdateHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `SteamItemDef_t`
public struct SteamItemDef: Hashable, Sendable {
    public let value: CInt
    public init(_ value: CInt) { self.value = value }
}

extension SteamItemDef: SteamTypeAlias, SteamCreatable {}
extension SteamItemDef: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CInt) { self.init(value) }
}

/// Steamworks `SteamItemInstanceID_t`
public struct SteamItemInstanceID: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension SteamItemInstanceID: SteamTypeAlias, SteamCreatable {}
extension SteamItemInstanceID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `SteamLeaderboardEntries_t`
public struct SteamLeaderboardEntries: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension SteamLeaderboardEntries: SteamTypeAlias, SteamCreatable {}
extension SteamLeaderboardEntries: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `SteamLeaderboard_t`
public struct SteamLeaderboard: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension SteamLeaderboard: SteamTypeAlias, SteamCreatable {}
extension SteamLeaderboard: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `SteamNetworkingErrMsg`
public struct SteamNetworkingErrMsg: Hashable, Sendable {
    public let value: String
    public init(_ value: String) { self.value = value }
}

extension SteamNetworkingErrMsg: SteamTypeAlias, SteamCreatable {}

/// Steamworks `SteamNetworkingMicroseconds`
public struct SteamNetworkingMicroseconds: Hashable, Sendable {
    public let value: CLongLong
    public init(_ value: CLongLong) { self.value = value }
}

extension SteamNetworkingMicroseconds: SteamTypeAlias, SteamCreatable {}
extension SteamNetworkingMicroseconds: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CLongLong) { self.init(value) }
}

/// Steamworks `SteamNetworkingPOPID`
public struct SteamNetworkingPOPID: Hashable, Sendable {
    public let value: CUnsignedInt
    public init(_ value: CUnsignedInt) { self.value = value }
}

extension SteamNetworkingPOPID: SteamTypeAlias, SteamCreatable {}
extension SteamNetworkingPOPID: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedInt) { self.init(value) }
}

/// Steamworks `UGCFileWriteStreamHandle_t`
public struct UGCFileWriteStreamHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension UGCFileWriteStreamHandle: SteamTypeAlias, SteamCreatable {}
extension UGCFileWriteStreamHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `UGCHandle_t`
public struct UGCHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension UGCHandle: SteamTypeAlias, SteamCreatable {}
extension UGCHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `UGCQueryHandle_t`
public struct UGCQueryHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension UGCQueryHandle: SteamTypeAlias, SteamCreatable {}
extension UGCQueryHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}

/// Steamworks `UGCUpdateHandle_t`
public struct UGCUpdateHandle: Hashable, Sendable {
    public let value: CUnsignedLongLong
    public init(_ value: CUnsignedLongLong) { self.value = value }
}

extension UGCUpdateHandle: SteamTypeAlias, SteamCreatable {}
extension UGCUpdateHandle: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: CUnsignedLongLong) { self.init(value) }
}
