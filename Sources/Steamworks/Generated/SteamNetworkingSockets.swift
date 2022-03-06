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
        var tmp_address = CSteamworks.SteamNetworkingIPAddr(address)
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress(interface, &tmp_address, Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::ConnectP2P()`
    public func connectP2P(identityRemote: SteamNetworkingIdentity, remoteVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamNetConnection {
        var tmp_identityRemote = CSteamworks.SteamNetworkingIdentity(identityRemote)
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectP2P(interface, &tmp_identityRemote, Int32(remoteVirtualPort), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::ConnectToHostedDedicatedServer()`
    public func connectToHostedDedicatedServer(identityTarget: SteamNetworkingIdentity, remoteVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamNetConnection {
        var tmp_identityTarget = CSteamworks.SteamNetworkingIdentity(identityTarget)
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer(interface, &tmp_identityTarget, Int32(remoteVirtualPort), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateHostedDedicatedServerListenSocket()`
    public func createHostedDedicatedServerListenSocket(localVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket(interface, Int32(localVirtualPort), Int32(options.count), &tmp_options))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateListenSocketIP()`
    public func createListenSocketIP(address: SteamNetworkingIPAddr, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmp_address = CSteamworks.SteamNetworkingIPAddr(address)
        var tmp_options = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP(interface, &tmp_address, Int32(options.count), &tmp_options))
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
    public func createSocketPair(outConnection1: inout HSteamNetConnection, outConnection2: inout HSteamNetConnection, useNetworkLoopback: Bool, identity1: SteamNetworkingIdentity, identity2: SteamNetworkingIdentity) -> Bool {
        var tmp_outConnection1 = CSteamworks.HSteamNetConnection()
        var tmp_outConnection2 = CSteamworks.HSteamNetConnection()
        var tmp_identity1 = CSteamworks.SteamNetworkingIdentity(identity1)
        var tmp_identity2 = CSteamworks.SteamNetworkingIdentity(identity2)
        let rc = SteamAPI_ISteamNetworkingSockets_CreateSocketPair(interface, &tmp_outConnection1, &tmp_outConnection2, useNetworkLoopback, &tmp_identity1, &tmp_identity2)
        outConnection1 = HSteamNetConnection(tmp_outConnection1)
        outConnection2 = HSteamNetConnection(tmp_outConnection2)
        return rc
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
    @discardableResult
    public func getAuthenticationStatus(details: inout SteamNetAuthenticationStatus) -> SteamNetworkingAvailability {
        var tmp_details = SteamNetAuthenticationStatus_t()
        let rc = SteamNetworkingAvailability(SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus(interface, &tmp_details))
        details = SteamNetAuthenticationStatus(tmp_details)
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::GetCertificateRequest()`
    public func getCertificateRequest(blobSize: inout Int, blob: UnsafeMutableRawPointer, msg: inout String) -> Bool {
        var tmp_blobSize = Int32(blobSize)
        let tmp_msg = UnsafeMutableBufferPointer<CChar>.allocate(capacity: Int(1024))
        defer { tmp_msg.deallocate() }
        let rc = CSteamAPI_ISteamNetworkingSockets_GetCertificateRequest(interface, &tmp_blobSize, blob, tmp_msg.baseAddress)
        blobSize = Int(tmp_blobSize)
        msg = String(tmp_msg)
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionInfo()`
    @discardableResult
    public func getConnectionInfo(conn: HSteamNetConnection, info: inout SteamNetConnectionInfo) -> Bool {
        var tmp_info = SteamNetConnectionInfo_t()
        let rc = SteamAPI_ISteamNetworkingSockets_GetConnectionInfo(interface, CSteamworks.HSteamNetConnection(conn), &tmp_info)
        info = SteamNetConnectionInfo(tmp_info)
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionName()`
    public func getConnectionName(peer: HSteamNetConnection, name: inout Int, maxLen: Int) -> Bool {
        var tmp_name = Int8()
        let rc = SteamAPI_ISteamNetworkingSockets_GetConnectionName(interface, CSteamworks.HSteamNetConnection(peer), &tmp_name, Int32(maxLen))
        name = Int(tmp_name)
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionRealTimeStatus()`
    public func getConnectionRealTimeStatus(conn: HSteamNetConnection, status: inout SteamNetConnectionRealTimeStatus?, laneCount: Int, laneStatus: inout [SteamNetConnectionRealTimeLaneStatus]?) -> Result {
        let tmp_status = status.map { _ in UnsafeMutablePointer<SteamNetConnectionRealTimeStatus_t>.allocate(capacity: 1) }
        defer { tmp_status?.deallocate() }
        let tmp_laneStatus = laneStatus.map { _ in UnsafeMutableBufferPointer<SteamNetConnectionRealTimeLaneStatus_t>.allocate(capacity: laneCount) }
        defer { tmp_laneStatus?.deallocate() }
        let rc = Result(SteamAPI_ISteamNetworkingSockets_GetConnectionRealTimeStatus(interface, CSteamworks.HSteamNetConnection(conn), tmp_status, Int32(laneCount), tmp_laneStatus.flatMap { $0.baseAddress }))
        if rc == .ok {
            tmp_status.map { status = SteamNetConnectionRealTimeStatus($0.pointee) }
            tmp_laneStatus.map { laneStatus = $0.map { SteamNetConnectionRealTimeLaneStatus($0) } }
        }
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionUserData()`
    public func getConnectionUserData(peer: HSteamNetConnection) -> Int {
        Int(SteamAPI_ISteamNetworkingSockets_GetConnectionUserData(interface, CSteamworks.HSteamNetConnection(peer)))
    }

    /// Steamworks `ISteamNetworkingSockets::GetDetailedConnectionStatus()`
    public func getDetailedConnectionStatus(conn: HSteamNetConnection, buf: inout String, bufSize: Int) -> Int {
        let tmp_buf = UnsafeMutableBufferPointer<CChar>.allocate(capacity: bufSize)
        defer { tmp_buf.deallocate() }
        let rc = Int(SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus(interface, CSteamworks.HSteamNetConnection(conn), tmp_buf.baseAddress, Int32(bufSize)))
        if rc == 0 {
            buf = String(tmp_buf)
        }
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::GetFakeIP()`
    public func getFakeIP(firstPort: Int, info: inout SteamNetworkingFakeIPResult) {
        var tmp_info = SteamNetworkingFakeIPResult_t()
        SteamAPI_ISteamNetworkingSockets_GetFakeIP(interface, Int32(firstPort), &tmp_info)
        info = SteamNetworkingFakeIPResult(tmp_info)
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
    public func getIdentity(identity: inout SteamNetworkingIdentity) -> Bool {
        var tmp_identity = CSteamworks.SteamNetworkingIdentity()
        let rc = SteamAPI_ISteamNetworkingSockets_GetIdentity(interface, &tmp_identity)
        identity = SteamNetworkingIdentity(tmp_identity)
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::GetListenSocketAddress()`
    @discardableResult
    public func getListenSocketAddress(socket: HSteamListenSocket, address: inout SteamNetworkingIPAddr) -> Bool {
        var tmp_address = CSteamworks.SteamNetworkingIPAddr()
        let rc = SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress(interface, CSteamworks.HSteamListenSocket(socket), &tmp_address)
        address = SteamNetworkingIPAddr(tmp_address)
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::GetRemoteFakeIPForConnection()`
    public func getRemoteFakeIPForConnection(conn: HSteamNetConnection, outAddr: inout SteamNetworkingIPAddr) -> Result {
        var tmp_outAddr = CSteamworks.SteamNetworkingIPAddr()
        let rc = Result(SteamAPI_ISteamNetworkingSockets_GetRemoteFakeIPForConnection(interface, CSteamworks.HSteamNetConnection(conn), &tmp_outAddr))
        if rc == .ok {
            outAddr = SteamNetworkingIPAddr(tmp_outAddr)
        }
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::InitAuthentication()`
    @discardableResult
    public func initAuthentication() -> SteamNetworkingAvailability {
        SteamNetworkingAvailability(SteamAPI_ISteamNetworkingSockets_InitAuthentication(interface))
    }

    /// Steamworks `ISteamNetworkingSockets::ReceiveMessagesOnConnection()`
    @discardableResult
    public func receiveMessagesOnConnection(conn: HSteamNetConnection, outMessages: inout [SteamNetworkingMessage], maxMessages: Int) -> Int {
        let tmp_outMessages = UnsafeMutableBufferPointer<OpaquePointer?>.allocate(capacity: maxMessages)
        defer { tmp_outMessages.deallocate() }
        let rc = Int(SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection(interface, CSteamworks.HSteamNetConnection(conn), tmp_outMessages.baseAddress, Int32(maxMessages)))
        outMessages = tmp_outMessages[0..<rc].map { SteamNetworkingMessage($0) }
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::ReceiveMessagesOnPollGroup()`
    @discardableResult
    public func receiveMessagesOnPollGroup(pollGroup: HSteamNetPollGroup, outMessages: inout [SteamNetworkingMessage], maxMessages: Int) -> Int {
        let tmp_outMessages = UnsafeMutableBufferPointer<OpaquePointer?>.allocate(capacity: maxMessages)
        defer { tmp_outMessages.deallocate() }
        let rc = Int(SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup(interface, CSteamworks.HSteamNetPollGroup(pollGroup), tmp_outMessages.baseAddress, Int32(maxMessages)))
        outMessages = tmp_outMessages[0..<rc].map { SteamNetworkingMessage($0) }
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::ResetIdentity()`
    public func resetIdentity(identity: inout SteamNetworkingIdentity) {
        var tmp_identity = CSteamworks.SteamNetworkingIdentity()
        SteamAPI_ISteamNetworkingSockets_ResetIdentity(interface, &tmp_identity)
        identity = SteamNetworkingIdentity(tmp_identity)
    }

    /// Steamworks `ISteamNetworkingSockets::RunCallbacks()`
    public func runCallbacks() {
        SteamAPI_ISteamNetworkingSockets_RunCallbacks(interface)
    }

    /// Steamworks `ISteamNetworkingSockets::SendMessageToConnection()`
    public func sendMessageToConnection(conn: HSteamNetConnection, data: UnsafeRawPointer, dataSize: Int, sendFlags: SteamNetworkingSendFlags, outMessageNumber: inout Int) -> Result {
        var tmp_outMessageNumber = int64()
        let rc = Result(SteamAPI_ISteamNetworkingSockets_SendMessageToConnection(interface, CSteamworks.HSteamNetConnection(conn), data, uint32(dataSize), Int32(sendFlags), &tmp_outMessageNumber))
        outMessageNumber = Int(tmp_outMessageNumber)
        return rc
    }

    /// Steamworks `ISteamNetworkingSockets::SendMessages()`
    public func sendMessages(messages: [SteamNetworkingMessage], outMessageNumberOrResult: inout [Int]) {
        var tmp_messages = messages.map { OpaquePointer?($0) }
        let tmp_outMessageNumberOrResult = UnsafeMutableBufferPointer<int64>.allocate(capacity: messages.count)
        defer { tmp_outMessageNumberOrResult.deallocate() }
        SteamAPI_ISteamNetworkingSockets_SendMessages(interface, Int32(messages.count), &tmp_messages, tmp_outMessageNumberOrResult.baseAddress)
        outMessageNumberOrResult = tmp_outMessageNumberOrResult.map { Int($0) }
    }

    /// Steamworks `ISteamNetworkingSockets::SetCertificate()`
    public func setCertificate(certificate: UnsafeRawPointer, certificateSize: Int, msg: inout String) -> Bool {
        let tmp_msg = UnsafeMutableBufferPointer<CChar>.allocate(capacity: Int(1024))
        defer { tmp_msg.deallocate() }
        let rc = CSteamAPI_ISteamNetworkingSockets_SetCertificate(interface, certificate, Int32(certificateSize), tmp_msg.baseAddress)
        msg = String(tmp_msg)
        return rc
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
