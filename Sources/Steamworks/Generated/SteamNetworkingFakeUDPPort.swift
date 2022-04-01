//
//  SteamNetworkingFakeUDPPort.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamNetworkingFakeUDPPort`](https://partner.steamgames.com/doc/api/ISteamNetworkingFakeUDPPort)
///
/// Access via `ISteamNetworkingSockets.CreateFakeUDPPort(...)`.
public final class SteamNetworkingFakeUDPPort {
    private let interface: UnsafeMutablePointer<ISteamNetworkingFakeUDPPort>
    init(_ interface: UnsafeMutablePointer<ISteamNetworkingFakeUDPPort>) {
        self.interface = interface
    }

    /// Steamworks `ISteamNetworkingFakeUDPPort::DestroyFakeUDPPort()`
    public func destroyFakeUDPPort() {
        SteamAPI_ISteamNetworkingFakeUDPPort_DestroyFakeUDPPort(interface)
    }

    /// Steamworks `ISteamNetworkingFakeUDPPort::ReceiveMessages()`
    public func receiveMessages(maxMessages: Int) -> (rc: Int, messages: [SteamNetworkingMessage]) {
        let tmp_messages = SteamOutArray<OpaquePointer?>(maxMessages)
        let rc = Int(SteamAPI_ISteamNetworkingFakeUDPPort_ReceiveMessages(interface, tmp_messages.steamArray, Int32(maxMessages)))
        return (rc: rc, messages: tmp_messages.swiftArray(rc))
    }

    /// Steamworks `ISteamNetworkingFakeUDPPort::ScheduleCleanup()`
    public func scheduleCleanup(address: SteamNetworkingIPAddr) {
        var tmp_address = CSteamworks.SteamNetworkingIPAddr(address)
        SteamAPI_ISteamNetworkingFakeUDPPort_ScheduleCleanup(interface, &tmp_address)
    }

    /// Steamworks `ISteamNetworkingFakeUDPPort::SendMessageToFakeIP()`
    public func sendMessageToFakeIP(address: SteamNetworkingIPAddr, data: UnsafeRawPointer, dataSize: Int, sendFlags: SteamNetworkingSendFlags) -> Result {
        var tmp_address = CSteamworks.SteamNetworkingIPAddr(address)
        return Result(SteamAPI_ISteamNetworkingFakeUDPPort_SendMessageToFakeIP(interface, &tmp_address, data, uint32(dataSize), Int32(sendFlags)))
    }
}
