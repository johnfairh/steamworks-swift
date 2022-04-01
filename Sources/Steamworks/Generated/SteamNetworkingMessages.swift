//
//  SteamNetworkingMessages.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamNetworkingMessages`](https://partner.steamgames.com/doc/api/ISteamNetworkingMessages)
///
/// Access via `SteamBaseAPI.networkingMessages` through a `SteamAPI` or `SteamGameServerAPI` instance.
public struct SteamNetworkingMessages {
    private let isServer: Bool
    var interface: UnsafeMutablePointer<ISteamNetworkingMessages> {
        isServer ? SteamAPI_SteamGameServerNetworkingMessages_SteamAPI_v002() : SteamAPI_SteamNetworkingMessages_SteamAPI_v002()
    }

    init(isServer: Bool) {
        self.isServer = isServer
    }

    /// Steamworks `ISteamNetworkingMessages::AcceptSessionWithUser()`
    @discardableResult
    public func acceptSessionWithUser(identityRemote: SteamNetworkingIdentity) -> Bool {
        var tmp_identityRemote = CSteamworks.SteamNetworkingIdentity(identityRemote)
        return SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser(interface, &tmp_identityRemote)
    }

    /// Steamworks `ISteamNetworkingMessages::CloseChannelWithUser()`
    @discardableResult
    public func closeChannelWithUser(identityRemote: SteamNetworkingIdentity, localChannel: Int) -> Bool {
        var tmp_identityRemote = CSteamworks.SteamNetworkingIdentity(identityRemote)
        return SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser(interface, &tmp_identityRemote, Int32(localChannel))
    }

    /// Steamworks `ISteamNetworkingMessages::CloseSessionWithUser()`
    @discardableResult
    public func closeSessionWithUser(identityRemote: SteamNetworkingIdentity) -> Bool {
        var tmp_identityRemote = CSteamworks.SteamNetworkingIdentity(identityRemote)
        return SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser(interface, &tmp_identityRemote)
    }

    /// Steamworks `ISteamNetworkingMessages::GetSessionConnectionInfo()`
    public func getSessionConnectionInfo(identityRemote: SteamNetworkingIdentity) -> (rc: SteamNetworkingConnectionState, connectionInfo: SteamNetConnectionInfo, quickStatus: SteamNetConnectionRealTimeStatus) {
        var tmp_identityRemote = CSteamworks.SteamNetworkingIdentity(identityRemote)
        var tmp_connectionInfo = SteamNetConnectionInfo_t()
        var tmp_quickStatus = SteamNetConnectionRealTimeStatus_t()
        let rc = SteamNetworkingConnectionState(SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo(interface, &tmp_identityRemote, &tmp_connectionInfo, &tmp_quickStatus))
        if rc != .none {
            return (rc: rc, connectionInfo: SteamNetConnectionInfo(tmp_connectionInfo), quickStatus: SteamNetConnectionRealTimeStatus(tmp_quickStatus))
        } else {
            return (rc: rc, connectionInfo: SteamNetConnectionInfo(), quickStatus: SteamNetConnectionRealTimeStatus())
        }
    }

    /// Steamworks `ISteamNetworkingMessages::ReceiveMessagesOnChannel()`
    public func receiveMessagesOnChannel(localChannel: Int, maxMessages: Int) -> (rc: Int, outMessages: [SteamNetworkingMessage]) {
        let tmp_outMessages = SteamOutArray<OpaquePointer?>(maxMessages)
        let rc = Int(SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel(interface, Int32(localChannel), tmp_outMessages.steamArray, Int32(maxMessages)))
        return (rc: rc, outMessages: tmp_outMessages.swiftArray(rc))
    }

    /// Steamworks `ISteamNetworkingMessages::SendMessageToUser()`
    public func sendMessageToUser(identityRemote: SteamNetworkingIdentity, data: UnsafeRawPointer, dataSize: Int, sendFlags: SteamNetworkingSendFlags, remoteChannel: Int) -> Result {
        var tmp_identityRemote = CSteamworks.SteamNetworkingIdentity(identityRemote)
        return Result(SteamAPI_ISteamNetworkingMessages_SendMessageToUser(interface, &tmp_identityRemote, data, uint32(dataSize), Int32(sendFlags), Int32(remoteChannel)))
    }
}
