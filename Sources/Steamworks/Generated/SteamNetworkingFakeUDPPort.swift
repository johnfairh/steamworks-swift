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
        let tmpMessages = SteamOutArray<OpaquePointer?>(maxMessages) /* ARR_SZ */
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
