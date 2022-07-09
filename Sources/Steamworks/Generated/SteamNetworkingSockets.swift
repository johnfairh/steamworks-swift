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
        SteamAPI_ISteamNetworkingSockets_BeginAsyncRequestFakeIP(interface, CInt(numPorts))
    }

    /// Steamworks `ISteamNetworkingSockets::CloseConnection()`
    @discardableResult
    public func closeConnection(peer: HSteamNetConnection, reason: Int, debug: String, enableLinger: Bool) -> Bool {
        SteamAPI_ISteamNetworkingSockets_CloseConnection(interface, CSteamworks.HSteamNetConnection(peer), CInt(reason), debug, enableLinger)
    }

    /// Steamworks `ISteamNetworkingSockets::CloseListenSocket()`
    @discardableResult
    public func closeListenSocket(socket: HSteamListenSocket) -> Bool {
        SteamAPI_ISteamNetworkingSockets_CloseListenSocket(interface, CSteamworks.HSteamListenSocket(socket))
    }

    /// Steamworks `ISteamNetworkingSockets::ConfigureConnectionLanes()`
    public func configureConnectionLanes(conn: HSteamNetConnection, lanePriorities: [Int], laneWeights: [Int]) -> Result {
        var tmpLanePriorities = lanePriorities.map { CInt($0) }
        var tmpLaneWeights = laneWeights.map { uint16($0) }
        return Result(SteamAPI_ISteamNetworkingSockets_ConfigureConnectionLanes(interface, CSteamworks.HSteamNetConnection(conn), CInt(laneWeights.count), &tmpLanePriorities, &tmpLaneWeights))
    }

    /// Steamworks `ISteamNetworkingSockets::ConnectByIPAddress()`
    public func connectByIPAddress(address: SteamNetworkingIPAddr, options: [SteamNetworkingConfigValue]) -> HSteamNetConnection {
        var tmpOptions = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress(interface, CSteamworks.SteamNetworkingIPAddr(address), CInt(options.count), &tmpOptions))
    }

    /// Steamworks `ISteamNetworkingSockets::ConnectP2P()`
    public func connectP2P(identityRemote: SteamNetworkingIdentity, remoteVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamNetConnection {
        var tmpOptions = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectP2P(interface, CSteamworks.SteamNetworkingIdentity(identityRemote), CInt(remoteVirtualPort), CInt(options.count), &tmpOptions))
    }

    /// Steamworks `ISteamNetworkingSockets::ConnectToHostedDedicatedServer()`
    public func connectToHostedDedicatedServer(identityTarget: SteamNetworkingIdentity, remoteVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamNetConnection {
        var tmpOptions = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamNetConnection(SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer(interface, CSteamworks.SteamNetworkingIdentity(identityTarget), CInt(remoteVirtualPort), CInt(options.count), &tmpOptions))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateFakeUDPPort()`
    public func createFakeUDPPort(fakeServerPort: Int) -> SteamNetworkingFakeUDPPort {
        SteamNetworkingFakeUDPPort(SteamAPI_ISteamNetworkingSockets_CreateFakeUDPPort(interface, CInt(fakeServerPort)))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateHostedDedicatedServerListenSocket()`
    public func createHostedDedicatedServerListenSocket(localVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmpOptions = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket(interface, CInt(localVirtualPort), CInt(options.count), &tmpOptions))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateListenSocketIP()`
    public func createListenSocketIP(address: SteamNetworkingIPAddr, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmpOptions = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP(interface, CSteamworks.SteamNetworkingIPAddr(address), CInt(options.count), &tmpOptions))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateListenSocketP2P()`
    public func createListenSocketP2P(localVirtualPort: Int, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmpOptions = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P(interface, CInt(localVirtualPort), CInt(options.count), &tmpOptions))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateListenSocketP2PFakeIP()`
    public func createListenSocketP2PFakeIP(fakePort: Int, options: [SteamNetworkingConfigValue]) -> HSteamListenSocket {
        var tmpOptions = options.map { SteamNetworkingConfigValue_t($0) }
        return HSteamListenSocket(SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2PFakeIP(interface, CInt(fakePort), CInt(options.count), &tmpOptions))
    }

    /// Steamworks `ISteamNetworkingSockets::CreatePollGroup()`
    public func createPollGroup() -> HSteamNetPollGroup {
        HSteamNetPollGroup(SteamAPI_ISteamNetworkingSockets_CreatePollGroup(interface))
    }

    /// Steamworks `ISteamNetworkingSockets::CreateSocketPair()`
    public func createSocketPair(useNetworkLoopback: Bool, identity1: SteamNetworkingIdentity?, identity2: SteamNetworkingIdentity?) -> (rc: Bool, connection1: HSteamNetConnection, connection2: HSteamNetConnection) {
        var tmpConnection1 = CSteamworks.HSteamNetConnection()
        var tmpConnection2 = CSteamworks.HSteamNetConnection()
        let tmpIdentity1 = SteamNullable<CSteamworks.SteamNetworkingIdentity>(identity1)
        defer { tmpIdentity1.deallocate() }
        let tmpIdentity2 = SteamNullable<CSteamworks.SteamNetworkingIdentity>(identity2)
        defer { tmpIdentity2.deallocate() }
        let rc = SteamAPI_ISteamNetworkingSockets_CreateSocketPair(interface, &tmpConnection1, &tmpConnection2, useNetworkLoopback, tmpIdentity1.steamValue, tmpIdentity2.steamValue)
        return (rc: rc, connection1: HSteamNetConnection(tmpConnection1), connection2: HSteamNetConnection(tmpConnection2))
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
        let tmpDetails = SteamNullable<SteamNetAuthenticationStatus_t>(isReal: returnDetails)
        defer { tmpDetails.deallocate() }
        let rc = SteamNetworkingAvailability(SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus(interface, tmpDetails.steamValue))
        return (rc: rc, details: tmpDetails.swiftValue(dummy: SteamNetAuthenticationStatus()))
    }

    /// Steamworks `ISteamNetworkingSockets::GetCertificateRequest()`
    public func getCertificateRequest(blobSize: Int, blob: UnsafeMutableRawPointer?) -> (rc: Bool, blobSize: Int, msg: String) {
        var tmpBlobSize = CInt(blobSize)
        let tmpMsg = SteamString(length: 1024)
        let rc = CSteamAPI_ISteamNetworkingSockets_GetCertificateRequest(interface, &tmpBlobSize, blob, tmpMsg.charBuffer)
        return (rc: rc, blobSize: Int(tmpBlobSize), msg: tmpMsg.swiftString)
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionInfo()`
    public func getConnectionInfo(conn: HSteamNetConnection) -> (rc: Bool, info: SteamNetConnectionInfo) {
        var tmpInfo = SteamNetConnectionInfo_t()
        let rc = SteamAPI_ISteamNetworkingSockets_GetConnectionInfo(interface, CSteamworks.HSteamNetConnection(conn), &tmpInfo)
        if rc {
            return (rc: rc, info: SteamNetConnectionInfo(tmpInfo))
        } else {
            return (rc: rc, info: SteamNetConnectionInfo())
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionName()`
    public func getConnectionName(peer: HSteamNetConnection, maxLen: Int) -> (rc: Bool, name: String) {
        let tmpName = SteamString(length: maxLen)
        let rc = SteamAPI_ISteamNetworkingSockets_GetConnectionName(interface, CSteamworks.HSteamNetConnection(peer), tmpName.charBuffer, CInt(maxLen))
        if rc {
            return (rc: rc, name: tmpName.swiftString)
        } else {
            return (rc: rc, name: "")
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetConnectionRealTimeStatus()`
    public func getConnectionRealTimeStatus(conn: HSteamNetConnection, returnStatus: Bool = true, laneCount: Int, returnLaneStatus: Bool = true) -> (rc: Result, status: SteamNetConnectionRealTimeStatus, laneStatus: [SteamNetConnectionRealTimeLaneStatus]) {
        let tmpStatus = SteamNullable<SteamNetConnectionRealTimeStatus_t>(isReal: returnStatus)
        defer { tmpStatus.deallocate() }
        let tmpLaneStatus = SteamOutArray<SteamNetConnectionRealTimeLaneStatus_t>(laneCount, returnLaneStatus)
        let rc = Result(SteamAPI_ISteamNetworkingSockets_GetConnectionRealTimeStatus(interface, CSteamworks.HSteamNetConnection(conn), tmpStatus.steamValue, CInt(laneCount), tmpLaneStatus.steamArray))
        if rc == .ok {
            return (rc: rc, status: tmpStatus.swiftValue(dummy: SteamNetConnectionRealTimeStatus()), laneStatus: tmpLaneStatus.swiftArray())
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
        let tmpBuf = SteamString(length: bufSize)
        let rc = Int(SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus(interface, CSteamworks.HSteamNetConnection(conn), tmpBuf.charBuffer, CInt(bufSize)))
        if rc == 0 {
            return (rc: rc, buf: tmpBuf.swiftString)
        } else {
            return (rc: rc, buf: "")
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetFakeIP()`
    public func getFakeIP(firstPort: Int) -> SteamNetworkingFakeIPResult {
        var tmpInfo = SteamNetworkingFakeIPResult_t()
        SteamAPI_ISteamNetworkingSockets_GetFakeIP(interface, CInt(firstPort), &tmpInfo)
        return SteamNetworkingFakeIPResult(tmpInfo)
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
        var tmpIdentity = CSteamworks.SteamNetworkingIdentity()
        let rc = SteamAPI_ISteamNetworkingSockets_GetIdentity(interface, &tmpIdentity)
        if rc {
            return (rc: rc, identity: SteamNetworkingIdentity(tmpIdentity))
        } else {
            return (rc: rc, identity: SteamNetworkingIdentity())
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetListenSocketAddress()`
    public func getListenSocketAddress(socket: HSteamListenSocket) -> (rc: Bool, address: SteamNetworkingIPAddr) {
        var tmpAddress = CSteamworks.SteamNetworkingIPAddr()
        let rc = SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress(interface, CSteamworks.HSteamListenSocket(socket), &tmpAddress)
        if rc {
            return (rc: rc, address: SteamNetworkingIPAddr(tmpAddress))
        } else {
            return (rc: rc, address: SteamNetworkingIPAddr())
        }
    }

    /// Steamworks `ISteamNetworkingSockets::GetRemoteFakeIPForConnection()`
    public func getRemoteFakeIPForConnection(conn: HSteamNetConnection) -> (rc: Result, addr: SteamNetworkingIPAddr) {
        var tmpAddr = CSteamworks.SteamNetworkingIPAddr()
        let rc = Result(SteamAPI_ISteamNetworkingSockets_GetRemoteFakeIPForConnection(interface, CSteamworks.HSteamNetConnection(conn), &tmpAddr))
        if rc == .ok {
            return (rc: rc, addr: SteamNetworkingIPAddr(tmpAddr))
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
        let tmpMessages = SteamOutArray<OpaquePointer?>(maxMessages)
        let rc = Int(SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection(interface, CSteamworks.HSteamNetConnection(conn), tmpMessages.steamArray, CInt(maxMessages)))
        if rc >= 0 {
            return (rc: rc, messages: tmpMessages.swiftArray(Int(rc)))
        } else {
            return (rc: rc, messages: [])
        }
    }

    /// Steamworks `ISteamNetworkingSockets::ReceiveMessagesOnPollGroup()`
    public func receiveMessagesOnPollGroup(pollGroup: HSteamNetPollGroup, maxMessages: Int) -> (rc: Int, messages: [SteamNetworkingMessage]) {
        let tmpMessages = SteamOutArray<OpaquePointer?>(maxMessages)
        let rc = Int(SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup(interface, CSteamworks.HSteamNetPollGroup(pollGroup), tmpMessages.steamArray, CInt(maxMessages)))
        if rc >= 0 {
            return (rc: rc, messages: tmpMessages.swiftArray(Int(rc)))
        } else {
            return (rc: rc, messages: [])
        }
    }

    /// Steamworks `ISteamNetworkingSockets::ResetIdentity()`
    public func resetIdentity(identity: SteamNetworkingIdentity?) {
        let tmpIdentity = SteamNullable<CSteamworks.SteamNetworkingIdentity>(identity)
        defer { tmpIdentity.deallocate() }
        SteamAPI_ISteamNetworkingSockets_ResetIdentity(interface, tmpIdentity.steamValue)
    }

    /// Steamworks `ISteamNetworkingSockets::RunCallbacks()`
    public func runCallbacks() {
        SteamAPI_ISteamNetworkingSockets_RunCallbacks(interface)
    }

    /// Steamworks `ISteamNetworkingSockets::SendMessageToConnection()`
    public func sendMessageToConnection(conn: HSteamNetConnection, data: UnsafeRawPointer, dataSize: Int, sendFlags: SteamNetworkingSendFlags) -> (rc: Result, messageNumber: Int) {
        var tmpMessageNumber = int64()
        let rc = Result(SteamAPI_ISteamNetworkingSockets_SendMessageToConnection(interface, CSteamworks.HSteamNetConnection(conn), data, uint32(dataSize), Int32(sendFlags), &tmpMessageNumber))
        return (rc: rc, messageNumber: Int(tmpMessageNumber))
    }

    /// Steamworks `ISteamNetworkingSockets::SendMessages()`
    public func sendMessages(messages: [SteamNetworkingMessage]) -> [Int] {
        var tmpMessages = messages.map { OpaquePointer?($0) }
        let tmpMessageNumberOrResult = SteamOutArray<int64>(messages.count)
        SteamAPI_ISteamNetworkingSockets_SendMessages(interface, CInt(messages.count), &tmpMessages, tmpMessageNumberOrResult.steamArray)
        return tmpMessageNumberOrResult.swiftArray()
    }

    /// Steamworks `ISteamNetworkingSockets::SetCertificate()`
    public func setCertificate(certificate: UnsafeRawPointer, certificateSize: Int) -> (rc: Bool, msg: String) {
        let tmpMsg = SteamString(length: 1024)
        let rc = CSteamAPI_ISteamNetworkingSockets_SetCertificate(interface, certificate, CInt(certificateSize), tmpMsg.charBuffer)
        return (rc: rc, msg: tmpMsg.swiftString)
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
