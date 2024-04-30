//
//  SteamNetworkingFakeUDPPort.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

internal import CSteamworks

/// Steamworks [`ISteamNetworkingFakeUDPPort`](https://partner.steamgames.com/doc/api/ISteamNetworkingFakeUDPPort)
///
/// Access via ``SteamNetworkingSockets/createFakeUDPPort(fakeServerPort:)``.
public final class SteamNetworkingFakeUDPPort: Sendable {
    private let _interface: SteamUnsafeMutablePointer<ISteamNetworkingFakeUDPPort>
    private var interface: UnsafeMutablePointer<ISteamNetworkingFakeUDPPort> {
        _interface.base
    }
    init(_ interface: UnsafeMutablePointer<ISteamNetworkingFakeUDPPort>) {
        self._interface = .init(interface)
    }

    /// Steamworks `ISteamNetworkingFakeUDPPort::DestroyFakeUDPPort()`
    public func destroyFakeUDPPort() {
        SteamAPI_ISteamNetworkingFakeUDPPort_DestroyFakeUDPPort(interface)
    }

    /// Steamworks `ISteamNetworkingFakeUDPPort::ReceiveMessages()`
    public func receiveMessages(maxMessages: Int) -> (rc: Int, messages: [SteamNetworkingMessage]) {
        let tmpMessages = SteamOutArray<OpaquePointer?>(maxMessages)
        let rc = Int(SteamAPI_ISteamNetworkingFakeUDPPort_ReceiveMessages(interface, tmpMessages.steamArray, CInt(maxMessages)))
        return (rc: rc, messages: tmpMessages.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamNetworkingFakeUDPPort::ScheduleCleanup()`
    public func scheduleCleanup(address: SteamNetworkingIPAddr) {
        SteamAPI_ISteamNetworkingFakeUDPPort_ScheduleCleanup(interface, CSteamworks.SteamNetworkingIPAddr(address))
    }

    /// Steamworks `ISteamNetworkingFakeUDPPort::SendMessageToFakeIP()`
    public func sendMessageToFakeIP(address: SteamNetworkingIPAddr, data: UnsafeRawPointer, dataSize: Int, sendFlags: SteamNetworkingSendFlags) -> Result {
        Result(SteamAPI_ISteamNetworkingFakeUDPPort_SendMessageToFakeIP(interface, CSteamworks.SteamNetworkingIPAddr(address), data, uint32(dataSize), Int32(sendFlags)))
    }
}
