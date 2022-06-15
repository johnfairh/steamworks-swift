//
//  SteamNetworkingSockets.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamNetworkingSockets`](https://partner.steamgames.com/doc/api/ISteamNetworkingSockets)
///
/// Access via `SteamBaseAPI.networkingSockets` through a `SteamAPI` or `SteamGameServerAPI` instance.
public struct SteamNetworkingSockets {
    private let isServer: Bool
    var interface: OpaquePointer {
        isServer ? SteamAPI_SteamGameServerNetworkingSockets_SteamAPI_v012() : SteamAPI_SteamNetworkingSockets_SteamAPI_v012()
    }

    init(isServer: Bool) {
        self.isServer = isServer
    }

    /// Steamworks `ISteamNetworkingSockets::AcceptConnection()`
    public func acceptConnection(conn: HSteamNetConnection) -> Result {
        Result(SteamAPI_ISteamNetworkingSockets_AcceptConnection(interface, CSteamworks.HSteamNetConnection(conn)))
    }

    /// Steamworks `ISteamNetworkingSockets::BeginAsyncRequestFakeIP()`
    public func beginAsyncRequestFakeIP(numPorts: Int) -> Bool {
        SteamAPI_ISteamNetworkingSockets_BeginAsyncRequestFakeIP(interface, Int32(numPorts))
    }

    /// Steamworks `ISteamNetworkingSockets::CloseConnection()`
    @discardableResult
    public func closeConnection(peer: HSteamNetConnection, reason: Int, debug: String, enableLinger: Bool) -> Bool {
        SteamAPI_ISteamNetworkingSockets_CloseConnection(interface, CSteamworks.HSteamNetConnection(peer), Int32(reason), debug, enableLinger)
    }

    /// Steamworks `ISteamNetworkingSockets::CloseListenSocket()`
    @discardableResult
    public func closeListenSocket(socket: HSteamListenSocket) -> Bool {
        SteamAPI_ISteamNetworkingSockets_CloseListenSocket(interface, CSteamworks.HSteamListenSocket(socket))
    }

    /// Steamworks `ISteamNetworkingSockets::ConfigureConnectionLanes()`
    public func configureConnectionLanes(conn: HSteamNetConnection, lanePriorities: [Int], laneWeights: [Int]) -> Result {
        var tmp_lanePriorities = lanePriorities.map { Int32($0) }
        var tmp_laneWeights = laneWeights.map { uint16($0) }
        return Result(SteamAPI_ISteamNetworkingSockets_ConfigureConnectionLanes(interface, CSteamworks.HSteamNetConnection(conn), Int32(laneWeights.count), &tmp_lanePriorities, &tmp_laneWeights))
    }

    /// Steamworks `ISteamNetworkingSockets::ConnectByIPAddress()`
    public func connectByIPAddress(address: SteamNetworkingIPAddr, options: [SteamNetworkingConfigValue]) -> HSteamNetConnection {
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress(interface, CSteamworks.SteamNetworkingIPAddr(address), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::ConnectP2P()`
    public func connectP2P(identityRemote: SteamNetworkingIdentity, remoteVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamNetConnection {
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectP2P(interface, CSteamworks.SteamNetworkingIdentity(identityRemote), Int32(remoteVirtualPort), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::ConnectToHostedDedicatedServer()`
    public func connectToHostedDedicatedServer(identityTarget: SteamNetworkingIdentity, remoteVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamNetConnection {
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer(interface, CSteamworks.SteamNetworkingIdentity(identityTarget), Int32(remoteVirtualPort), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateFakeUDPPort()`
    public func createFakeUDPPort(fakeServerPort: Int) -> SteamNetworkingFakeUDPPort {
        SteamNetworkingFakeUDPPort(SteamAPI_ISteamNetworkingSockets_CreateFakeUDPPort(interface, Int32(fakeServerPort)))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateHostedDedicatedServerListenSocket()`
    public func createHostedDedicatedServerListenSocket(localVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket(interface, Int32(localVirtualPort), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateListenSocketIP()`
    public func createListenSocketIP(address: SteamNetworkingIPAddr, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP(interface, CSteamworks.SteamNetworkingIPAddr(address), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateListenSocketP2P()`
    public func createListenSocketP2P(localVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P(interface, Int32(localVirtualPort), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateListenSocketP2PFakeIP()`
    public func createListenSocketP2PFakeIP(fakePort: Int, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2PFakeIP(interface, Int32(fakePort), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::CreatePollGroup()`
    public func createPollGroup() -> HSteamNetPollGroup {
        HSteamNetPollGroup(SteamAPI_ISteamNetworkingSockets_CreatePollGroup(interface))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateSocketPair()`
    public func createSocketPair(useNetworkLoopback: Bool, identity1: SteamNetworkingIdentity?, identity2: SteamNetworkingIdentity?) -> (rc: Bool, connection1: HSteamNetConnection, connection2: HSteamNetConnection) {
        var tmp_connection1 = CSteamworks.HSteamNetConnection()
        var tmp_connection2 = CSteamworks.HSteamNetConnection()
        let tmp_identity1 = SteamNullable<CSteamworks.SteamNetworkingIdentity>(identity1)
        defer { tmp_identity1.deallocate() }
        let tmp_identity2 = SteamNullable<CSteamworks.SteamNetworkingIdentity>(identity2)
        defer { tmp_identity2.deallocate() }
        let rc = SteamAPI_ISteamNetworkingSockets_CreateSocketPair(interface, &tmp_connection1, &tmp_connection2, useNetworkLoopback, tmp_identity1.steamValue, tmp_identity2.steamValue)
        return (rc: rc, connection1: HSteamNetConnection(tmp_connection1), connection2: HSteamNetConnection(tmp_connection2))
    }

    /// Steamworks `ISteamNetworkingSockets::DestroyPollGroup()`
    @discardableResult
    public func destroyPollGroup(pollGroup: HSteamNetPollGroup) -> Bool {
        SteamAPI_ISteamNetworkingSockets_DestroyPollGroup(interface, CSteamworks.HSteamNetPollGroup(pollGroup))
    }

    /// Steamworks `ISteamNetworkingSockets::FlushMessagesOnConnection()`
    @discardableResult
    public func flushMessagesOnConnection(conn: HSteamNetConnection) -> Result {
        Result(SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection(interface, CSteamworks.HSteamNetConnection(conn)))
    }

    /// Steamworks `ISteamNetworkingSockets::GetAuthenticationStatus()`
    public func getAuthenticationStatus(returnDetails: Bool = true) -> (rc: SteamNetworkingAvailability, details: SteamNetAuthenticationStatus) {
        let tmp_details = SteamNullable<SteamNetAuthenticationStatus_t>(isReal: returnDetails)
        defer { tmp_details.deallocate() }
        let rc = SteamNetworkingAvailability(SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus(interface, tmp_details.steamValue))
        return (rc: rc, details: tmp_details.swiftValue(dummy: SteamNetAuthenticationStatus()))
    }

    /// Steamworks `ISteamNetworkingSockets::GetCertificateRequest()`
    public func getCertificateRequest(blobSize: inout Int, blob: UnsafeMutableRawPointer?) -> (rc: Bool, msg: String) {
        var tmp_blobSize = Int32(blobSize)
        let tmp_msg = SteamString(length: Int(1024))
        let rc = CSteamAPI_ISteamNetworkingSockets_GetCertificateRequest(interface, &tmp_blobSize, blob, tmp_msg.charBuffer)
        blobSize = Int(tmp_blobSize)
        return (rc: rc, msg: tmp_msg.swiftString)
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionInfo()`
    public func getConnectionInfo(conn: HSteamNetConnection) -> (rc: Bool, info: SteamNetConnectionInfo) {
        var tmp_info = SteamNetConnectionInfo_t()
        let rc = SteamAPI_ISteamNetworkingSockets_GetConnectionInfo(interface, CSteamworks.HSteamNetConnection(conn), &tmp_info)
        if rc {
            return (rc: rc, info: SteamNetConnectionInfo(tmp_info))
        } else {
            return (rc: rc, info: SteamNetConnectionInfo())
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionName()`
    public func getConnectionName(peer: HSteamNetConnection, maxLen: Int) -> (rc: Bool, name: String) {
        let tmp_name = SteamString(length: maxLen)
        let rc = SteamAPI_ISteamNetworkingSockets_GetConnectionName(interface, CSteamworks.HSteamNetConnection(peer), tmp_name.charBuffer, Int32(maxLen))
        if rc {
            return (rc: rc, name: tmp_name.swiftString)
        } else {
            return (rc: rc, name: "")
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionRealTimeStatus()`
    public func getConnectionRealTimeStatus(conn: HSteamNetConnection, returnStatus: Bool = true, laneCount: Int, returnLaneStatus: Bool = true) -> (rc: Result, status: SteamNetConnectionRealTimeStatus, laneStatus: [SteamNetConnectionRealTimeLaneStatus]) {
        let tmp_status = SteamNullable<SteamNetConnectionRealTimeStatus_t>(isReal: returnStatus)
        defer { tmp_status.deallocate() }
        let tmp_laneStatus = SteamOutArray<SteamNetConnectionRealTimeLaneStatus_t>(laneCount, returnLaneStatus)
        let rc = Result(SteamAPI_ISteamNetworkingSockets_GetConnectionRealTimeStatus(interface, CSteamworks.HSteamNetConnection(conn), tmp_status.steamValue, Int32(laneCount), tmp_laneStatus.steamArray))
        if rc == .ok {
            return (rc: rc, status: tmp_status.swiftValue(dummy: SteamNetConnectionRealTimeStatus()), laneStatus: tmp_laneStatus.swiftArray())
        } else {
            return (rc: rc, status: SteamNetConnectionRealTimeStatus(), laneStatus: [])
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionUserData()`
    public func getConnectionUserData(peer: HSteamNetConnection) -> Int {
        Int(SteamAPI_ISteamNetworkingSockets_GetConnectionUserData(interface, CSteamworks.HSteamNetConnection(peer)))
    }

    /// Steamworks `ISteamNetworkingSockets::GetDetailedConnectionStatus()`
    public func getDetailedConnectionStatus(conn: HSteamNetConnection, bufSize: Int) -> (rc: Int, buf: String) {
        let tmp_buf = SteamString(length: bufSize)
        let rc = Int(SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus(interface, CSteamworks.HSteamNetConnection(conn), tmp_buf.charBuffer, Int32(bufSize)))
        if rc == 0 {
            return (rc: rc, buf: tmp_buf.swiftString)
        } else {
            return (rc: rc, buf: "")
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetFakeIP()`
    public func getFakeIP(firstPort: Int) -> SteamNetworkingFakeIPResult {
        var tmp_info = SteamNetworkingFakeIPResult_t()
        SteamAPI_ISteamNetworkingSockets_GetFakeIP(interface, Int32(firstPort), &tmp_info)
        return SteamNetworkingFakeIPResult(tmp_info)
    }

    /// Steamworks `ISteamNetworkingSockets::GetHostedDedicatedServerPOPID()`
    public func getHostedDedicatedServerPOPID() -> SteamNetworkingPOPID {
        SteamNetworkingPOPID(SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID(interface))
    }

    /// Steamworks `ISteamNetworkingSockets::GetHostedDedicatedServerPort()`
    public func getHostedDedicatedServerPort() -> Int {
        Int(SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort(interface))
    }

    /// Steamworks `ISteamNetworkingSockets::GetIdentity()`
    public func getIdentity() -> (rc: Bool, identity: SteamNetworkingIdentity) {
        var tmp_identity = CSteamworks.SteamNetworkingIdentity()
        let rc = SteamAPI_ISteamNetworkingSockets_GetIdentity(interface, &tmp_identity)
        if rc {
            return (rc: rc, identity: SteamNetworkingIdentity(tmp_identity))
        } else {
            return (rc: rc, identity: SteamNetworkingIdentity())
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetListenSocketAddress()`
    public func getListenSocketAddress(socket: HSteamListenSocket) -> (rc: Bool, address: SteamNetworkingIPAddr) {
        var tmp_address = CSteamworks.SteamNetworkingIPAddr()
        let rc = SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress(interface, CSteamworks.HSteamListenSocket(socket), &tmp_address)
        if rc {
            return (rc: rc, address: SteamNetworkingIPAddr(tmp_address))
        } else {
            return (rc: rc, address: SteamNetworkingIPAddr())
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetRemoteFakeIPForConnection()`
    public func getRemoteFakeIPForConnection(conn: HSteamNetConnection) -> (rc: Result, addr: SteamNetworkingIPAddr) {
        var tmp_addr = CSteamworks.SteamNetworkingIPAddr()
        let rc = Result(SteamAPI_ISteamNetworkingSockets_GetRemoteFakeIPForConnection(interface, CSteamworks.HSteamNetConnection(conn), &tmp_addr))
        if rc == .ok {
            return (rc: rc, addr: SteamNetworkingIPAddr(tmp_addr))
        } else {
            return (rc: rc, addr: SteamNetworkingIPAddr())
        }
    }

    /// Steamworks `ISteamNetworkingSockets::InitAuthentication()`
    @discardableResult
    public func initAuthentication() -> SteamNetworkingAvailability {
        SteamNetworkingAvailability(SteamAPI_ISteamNetworkingSockets_InitAuthentication(interface))
    }

    /// Steamworks `ISteamNetworkingSockets::ReceiveMessagesOnConnection()`
    public func receiveMessagesOnConnection(conn: HSteamNetConnection, maxMessages: Int) -> (rc: Int, messages: [SteamNetworkingMessage]) {
        let tmp_messages = SteamOutArray<OpaquePointer?>(maxMessages)
        let rc = Int(SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection(interface, CSteamworks.HSteamNetConnection(conn), tmp_messages.steamArray, Int32(maxMessages)))
        if rc >= 0 {
            return (rc: rc, messages: tmp_messages.swiftArray(rc))
        } else {
            return (rc: rc, messages: [])
        }
    }

    /// Steamworks `ISteamNetworkingSockets::ReceiveMessagesOnPollGroup()`
    public func receiveMessagesOnPollGroup(pollGroup: HSteamNetPollGroup, maxMessages: Int) -> (rc: Int, messages: [SteamNetworkingMessage]) {
        let tmp_messages = SteamOutArray<OpaquePointer?>(maxMessages)
        let rc = Int(SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup(interface, CSteamworks.HSteamNetPollGroup(pollGroup), tmp_messages.steamArray, Int32(maxMessages)))
        if rc >= 0 {
            return (rc: rc, messages: tmp_messages.swiftArray(rc))
        } else {
            return (rc: rc, messages: [])
        }
    }

    /// Steamworks `ISteamNetworkingSockets::ResetIdentity()`
    public func resetIdentity(identity: SteamNetworkingIdentity?) {
        let tmp_identity = SteamNullable<CSteamworks.SteamNetworkingIdentity>(identity)
        defer { tmp_identity.deallocate() }
        SteamAPI_ISteamNetworkingSockets_ResetIdentity(interface, tmp_identity.steamValue)
    }

    /// Steamworks `ISteamNetworkingSockets::RunCallbacks()`
    public func runCallbacks() {
        SteamAPI_ISteamNetworkingSockets_RunCallbacks(interface)
    }

    /// Steamworks `ISteamNetworkingSockets::SendMessageToConnection()`
    public func sendMessageToConnection(conn: HSteamNetConnection, data: UnsafeRawPointer, dataSize: Int, sendFlags: SteamNetworkingSendFlags) -> (rc: Result, messageNumber: Int) {
        var tmp_messageNumber = int64()
        let rc = Result(SteamAPI_ISteamNetworkingSockets_SendMessageToConnection(interface, CSteamworks.HSteamNetConnection(conn), data, uint32(dataSize), Int32(sendFlags), &tmp_messageNumber))
        return (rc: rc, messageNumber: Int(tmp_messageNumber))
    }

    /// Steamworks `ISteamNetworkingSockets::SendMessages()`
    public func sendMessages(messages: [SteamNetworkingMessage]) -> [Int] {
        var tmp_messages = messages.map { OpaquePointer?($0) }
        let tmp_messageNumberOrResult = SteamOutArray<int64>(messages.count)
        SteamAPI_ISteamNetworkingSockets_SendMessages(interface, Int32(messages.count), &tmp_messages, tmp_messageNumberOrResult.steamArray)
        return tmp_messageNumberOrResult.swiftArray()
    }

    /// Steamworks `ISteamNetworkingSockets::SetCertificate()`
    public func setCertificate(certificate: UnsafeRawPointer, certificateSize: Int) -> (rc: Bool, msg: String) {
        let tmp_msg = SteamString(length: Int(1024))
        let rc = CSteamAPI_ISteamNetworkingSockets_SetCertificate(interface, certificate, Int32(certificateSize), tmp_msg.charBuffer)
        return (rc: rc, msg: tmp_msg.swiftString)
    }

    /// Steamworks `ISteamNetworkingSockets::SetConnectionName()`
    public func setConnectionName(peer: HSteamNetConnection, name: String) {
        SteamAPI_ISteamNetworkingSockets_SetConnectionName(interface, CSteamworks.HSteamNetConnection(peer), name)
    }

    /// Steamworks `ISteamNetworkingSockets::SetConnectionPollGroup()`
    @discardableResult
    public func setConnectionPollGroup(conn: HSteamNetConnection, pollGroup: HSteamNetPollGroup) -> Bool {
        SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup(interface, CSteamworks.HSteamNetConnection(conn), CSteamworks.HSteamNetPollGroup(pollGroup))
    }

    /// Steamworks `ISteamNetworkingSockets::SetConnectionUserData()`
    @discardableResult
    public func setConnectionUserData(peer: HSteamNetConnection, userData: Int) -> Bool {
        SteamAPI_ISteamNetworkingSockets_SetConnectionUserData(interface, CSteamworks.HSteamNetConnection(peer), int64(userData))
    }
}
