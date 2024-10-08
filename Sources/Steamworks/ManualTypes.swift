//
//  ManualTypes.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

internal import CSteamworks

// strdup(), free()
#if canImport(Glibc)
import Glibc
#endif
#if canImport(Darwin)
import Darwin
#endif

// Public types that cannot be autogenerated for one reason or another.
//
// Must be added to LibGenerate::Generated.manualTypes so that the doc
// structure generation matches and sorts them properly.

// MARK: SteamIPAddress

// A very rough manual wrap to work around the union implementation
// and expose the static getters.

/// Steamworks `SteamIPAddress_t`
public struct SteamIPAddress {
    private let ip: SteamIPAddress_t

    // MARK: Properties

    /// The address family
    public var type: SteamIPType {
        SteamIPType(ip.m_eType)
    }

    /// Four bytes, host order
    public var ipv4Address: Int {
        Int(ip.m_unIPv4)
    }

    /// SIxteen bytes, network order
    public var ipv6Address: [UInt8] {
        Array(ip.m_rgubIPv6_ptr, 16)
    }

    /// Is the IP address possibly valid?
    public var isSet: Bool {
        return ip.IsSet()
    }

    // MARK: Initializers

    /// Initialize with an IPv4 address.
    public init(ipv4Address: Int) {
        precondition(ipv4Address >= 0 && ipv4Address <= UInt32.max)
        self.ip = SteamIPAddress_t(.init(m_unIPv4: UInt32(ipv4Address)), m_eType: k_ESteamIPTypeIPv4)
    }

    /// Initialize with an  IPv6 address
    public init(ipv6Address: [UInt8]) {
        precondition(ipv6Address.count == 16)
        var ip = SteamIPAddress_t()
        ip.m_eType = k_ESteamIPTypeIPv6
        _ = ipv6Address.withUnsafeBytes { ptr in
            memcpy(&ip.m_ipv6Qword, ptr.baseAddress!, ptr.count)
        }
        self.ip = ip
    }

    init(_ steam: SteamIPAddress_t) {
        self.ip = steam
    }

    // MARK: Well-known addresses

    /// IPv4 `INADDDR_ANY`
    static let ipv4Any = SteamIPAddress(SteamIPAddress_t.IPv4Any())
    /// IPv6 `INADDDR_ANY`
    static let ipv6Any = SteamIPAddress(SteamIPAddress_t.IPv6Any())
    /// IPv4 `INADDDR_LOOPBACK`
    static let ipv4Loopback = SteamIPAddress(SteamIPAddress_t.IPv4Loopback())
    /// IPv6 `INADDDR_LOOPBACK`
    static let ipv6Loopback = SteamIPAddress(SteamIPAddress_t.IPv6Loopback())
}

// MARK: Conformances

extension SteamIPAddress: Sendable, Hashable {
    /// Simple equality, no thinking about IPv4 expressed in IPv6...
    public static func == (lhs: SteamIPAddress, rhs: SteamIPAddress) -> Bool {
        guard lhs.type == rhs.type else {
            return false
        }
        switch lhs.type {
        case .ipv4:
            return lhs.ip.m_unIPv4 == rhs.ip.m_unIPv4
        case .ipv6:
            return lhs.ip.m_ipv6Qword.0 == rhs.ip.m_ipv6Qword.0 &&
                   lhs.ip.m_ipv6Qword.1 == rhs.ip.m_ipv6Qword.1
        case .unrepresentedInSwift:
            return false
        }
    }

    /// Use ``SteamIPAddress`` as a dictionary key.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        switch type {
        case .ipv6:
            hasher.combine(ip.m_ipv6Qword.0)
            hasher.combine(ip.m_ipv6Qword.1)
        case .ipv4:
            hasher.combine(ip.m_unIPv4)
        case .unrepresentedInSwift:
            break
        }
    }
}

extension SteamIPAddress: SteamCreatable {}

// MARK: SteamInputActionEvent

// Too enum-y for the json to understand.
/// Steamworks `SteamInputActionEvent_t`
public struct SteamInputActionEvent: Sendable {
    /// Steamworks `controllerHandle`
    public let controllerHandle: InputHandle

    public enum Event: Sendable {
        case digital(InputDigitalActionHandle, InputDigitalActionData)
        case analog(InputAnalogActionHandle, InputAnalogActionData)
        case unrepresentedInSwift
    }
    /// Steamworks `eEventType` and event union
    public let event: Event

    init(_ steam: SteamInputActionEvent_t) {
        controllerHandle = .init(steam.controllerHandle)
        switch steam.eEventType {
        case ESteamInputActionEventType_DigitalAction:
            event = .digital(.init(steam.digitalAction.actionHandle),
                             .init(steam.digitalAction.digitalActionData))

        case ESteamInputActionEventType_AnalogAction:
            event = .analog(.init(steam.analogAction.actionHandle),
                             .init(steam.analogAction.analogActionData))

        default:
            event = .unrepresentedInSwift
            logError("Steam returned an undocumented enum value \(steam.eEventType) for SteamInputActionEvent")
        }
    }
}

extension SteamInputActionEvent: SteamCreatable {}

// MARK: servernetadr

// Some more bizarreness from MMS.  What even is `SteamIPAddress`...
//
// This is read-only type afaics so just port the getters.
// None of them are const-correct...
//
// `netadr_t` is something from another valve sdk.
//
// Can't implement comparable because Swift C++ import doesn't understand C++ operator overloads.

/// Steamworks `servernetadr`
public struct ServerNetAdr: Sendable {
    private let adr: servernetadr_t

    init(_ steam: servernetadr_t) {
        self.adr = steam
    }

    public init() {
        self.adr = servernetadr_t()
    }

    public var queryPort: UInt16 {
        adr.GetQueryPort()
    }

    public var connectionPort: UInt16 {
        adr.GetConnectionPort()
    }

    public var ip: Int {
        Int(adr.GetIP())
    }

    public var connectionAddressString: String {
        String(adr.GetConnectionAddressString())
    }

    public var queryAddressString: String {
        String(adr.GetQueryAddressString())
    }
}

extension ServerNetAdr: SteamCreatable {}

// MARK: SteamNetworkingIPAddr

// This is another union/method-tastic struct.  We model it as an immutable thing
// that users can instantiate.

/// Steamworks `SteamNetworkingIPAddr`
public struct SteamNetworkingIPAddr: @unchecked Sendable {
    typealias SteamType = CSteamworks.SteamNetworkingIPAddr
    let adr: SteamType

    // MARK: Fields

    public var isIPv6AllZeros: Bool {
        adr.IsIPv6AllZeros()
    }

    public var isIPv4: Bool {
        adr.IsIPv4()
    }

    public var isLocalHost: Bool {
        adr.IsLocalHost()
    }

    /// Returns IP in host byte order (e.g. aa.bb.cc.dd as 0xaabbccdd).  Returns 0 if IP is not mapped IPv4.
    public var ipv4: Int {
        Int(adr.GetIPv4())
    }

    public var ipv6: [UInt8] {
        Array(UnsafeBufferPointer(start: adr.m_ipv6_ptr, count: 16))
    }

    public var port: UInt16 {
        adr.m_port
    }

    /// Classify address as FakeIP.  Never returns `k_ESteamNetworkingFakeIPType_Invalid`.
    public var fakeIPType: SteamNetworkingFakeIPType {
        .init(adr.GetFakeIPType())
    }

    /// Return `true` if we are a FakeIP
    public var isFakeIP: Bool {
        fakeIPType != .notFake
    }

    public func toString(withPort: Bool = true) -> String {
        String(unsafeUninitializedCapacity: 48) { ubuf in
            ubuf.withMemoryRebound(to: CChar.self) { sbuf in
                adr.ToString(sbuf.baseAddress, 48, withPort)
                return strlen(sbuf.baseAddress!)
            }
        }
    }

    // MARK: Initializers

    init(_ adr: CSteamworks.SteamNetworkingIPAddr) {
        self.adr = adr
    }

    /// An invalid address
    public init() {
        adr = SteamType()
    }

    /// `INADDR_ANY` with some port
    public init(inaddrAnyPort port: UInt16) {
        var adr = SteamType()
        adr.Clear()
        adr.m_port = port
        self.init(adr)
    }

    /// Sets to IPv4 mapped address.  IP and port are in host byte order.
    public init(ipv4: Int, port: UInt16) {
        var adr = SteamType()
        adr.SetIPv4(UInt32(ipv4), port)
        self.init(adr)
    }

    /// IP is interpreted as bytes, so there are no endian issues.  (Same as `inaddr_in6`.)
    /// The IP can be a mapped IPv4 address.
    public init(ipv6: [UInt8], port: UInt16) {
        var adr = SteamType()
        adr.SetIPv6(ipv6, port)
        self.init(adr)
    }

    /// Parse an IP address and optional port.  If a port is not present, it is set to 0.
    public init?(addressAndPort: String) {
        var adr = SteamType()
        adr.Clear()
        guard adr.ParseString(addressAndPort) else {
            return nil
        }
        self.init(adr)
    }
}

extension SteamNetworkingIPAddr: SteamCreatable {}

extension SteamNetworkingIPAddr: Equatable, CustomStringConvertible {
    public static func == (lhs: SteamNetworkingIPAddr, rhs: SteamNetworkingIPAddr) -> Bool {
         lhs.adr == rhs.adr
    }

    public var description: String {
        toString()
    }
}

extension CSteamworks.SteamNetworkingIPAddr {
    init(_ swift: SteamNetworkingIPAddr) {
        self = swift.adr
    }
}

// MARK: SteamNetworkingIdentity

// Again model as immutable thing that can be created.
// Can't quite `enum`-ify this because the 'types' enum is large and weird.

/// Steamworks `SteamNetworkingIdentity`
public struct SteamNetworkingIdentity: Sendable {
    typealias SteamType = CSteamworks.SteamNetworkingIdentity
    let identity: SteamType

    // MARK: Fields

    /// Type of identity
    public var type: SteamNetworkingIdentityType {
        .init(identity.m_eType)
    }

    /// Returns true if we are the invalid type.  Does not make any other validity checks (e.g. is Steam ID actually valid)
    public var isValid: Bool {
        !identity.IsInvalid()
    }

    /// Returns CSteamID (!IsValid() if identity is not a SteamID)
    public var steamID: SteamID {
        .init(identity.GetSteamID())
    }

    /// Returns `nil` if we are not an IP address.
    public var ipAddr: SteamNetworkingIPAddr? {
        identity.GetIPAddr().map { .init($0.pointee) }
    }

    /// Returns true if this identity is localhost.
    public var isLocalhost: Bool {
        identity.IsLocalHost()
    }

    public var fakeIPType: SteamNetworkingFakeIPType {
      .init(identity.GetFakeIPType())
    }

    public var isFakeIP: Bool {
        switch fakeIPType {
        case .invalid, .notFake, .unrepresentedInSwift:
            return false
        case .globalIPv4, .localIPv4:
            return true
        }
    }

    /// Returns `nil` if not generic string type
    public var genericString: String? {
        .init(identity.GetGenericString())
    }

    /// Returns `nil` if not generic bytes type
    public var genericBytes: [UInt8]? {
        var count = Int32(0)
        guard let bytes = identity.GetGenericBytes(&count) else {
            return nil
        }
        return Array(UnsafeBufferPointer(start: bytes, count: Int(count)))
    }

    /// String format, should round-trip
    public var description: String {
        String(unsafeUninitializedCapacity: 128) { ubuf in
            ubuf.withMemoryRebound(to: CChar.self) { sbuf in
                identity.ToString(sbuf.baseAddress, 128)
                return strlen(sbuf.baseAddress!)
            }
        }
    }

    // MARK: Initializers

    init(_ identity: SteamType) {
        self.identity = identity
    }

    /// Create an invalid identity
    public init() {
        identity = SteamType()
    }

    /// Init from a Steam ID
    public init(_ steamID: SteamID) {
        var identity = SteamType()
        identity.SetSteamID64(steamID.asUInt64) // also sets type
        self.init(identity)
    }

    /// Init from an IP address
    public init(_ ipaddr: SteamNetworkingIPAddr) {
        var identity = SteamType()
        identity.SetIPAddr(ipaddr.adr) // also sets type
        self.init(identity)
    }

    /// Identify as localhost, ~anonymous
    public static var localhost: SteamNetworkingIdentity {
        var identity = SteamType()
        identity.SetLocalHost()
        return .init(identity)
    }

    /// Init generic string or some other type.  Max length 31 bytes.
    public init?(genericString: String, type: SteamNetworkingIdentityType = .genericString) {
        var identity = SteamType()
        guard identity.SetGenericString(genericString) else {
            return nil
        }
        identity.m_eType = .init(type)
        self.init(identity)
    }

    /// Init from a `description` string.
    public init?(description: String) {
        var identity = SteamType()
        guard identity.ParseString(description) else {
            return nil
        }
        self.init(identity)
    }

    /// Init generic bytes or some other type.  Max 32 bytes.
    public init?(_ bytes: [UInt8], type: SteamNetworkingIdentityType = .genericBytes) {
        var identity = SteamType()
        guard identity.SetGenericBytes(bytes, bytes.count) else {
            return nil
        }
        identity.m_eType = .init(type)
        self.init(identity)
    }
}

extension SteamNetworkingIdentity: SteamCreatable, CustomStringConvertible, Equatable {
    public static func == (lhs: SteamNetworkingIdentity, rhs: SteamNetworkingIdentity) -> Bool {
        lhs.identity == rhs.identity
    }
}

extension CSteamworks.SteamNetworkingIdentity: SwiftCreatable {
    init(_ swift: SteamNetworkingIdentity) {
        self = swift.identity
    }
}

// MARK: SteamNetworkingMessage

// This is very doomed because we can't see this C++ type from the Swift side.  So
// we provide a C-style flat API of our own to deal with it.

/// Steamworks `SteamNetworkingMessage_t`
///
/// This is not marked `Sendable` because it wraps a buffer of abritrary writable memory.
/// May be that it needs that conformance anyway because of usage patterns, TBD.
public struct SteamNetworkingMessage {
    private(set) var cmsg: CMsgPtr

    init(_ steam: CMsgPtr) {
        cmsg = steam
    }

    init(_ steam: OpaquePointer?) {
        cmsg = .init(steam!)
    }

    /// Set payload
    public func set(data: UnsafeMutableRawPointer, size: Int) {
        CSteamNetworkingMessage_SetData(cmsg, data, Int32(size))
    }

    /// Message payload
    public var data: UnsafeMutableRawPointer {
        CSteamNetworkingMessage_GetData(cmsg)
    }

    /// Size of the payload.
    public var size: Int {
        Int(CSteamNetworkingMessage_GetDataSize(cmsg))
    }

    /// For messages received on connections: what connection did this come from?
    /// For outgoing messages: what connection to send it to?
    /// Not used when using the ISteamNetworkingMessages interface
    public var conn: HSteamNetConnection {
        get {
            .init(CSteamNetworkingMessage_GetConn(cmsg))
        }
        set {
            CSteamNetworkingMessage_SetConn(cmsg, .init(newValue))
        }
    }

    /// For inbound messages: Who sent this to us?
    /// For outbound messages on connections: not used.
    /// For outbound messages on the ad-hoc ISteamNetworkingMessages interface: who should we send this to?
    public var peerIdentity: SteamNetworkingIdentity {
        get {
            .init(CSteamNetworkingMessaage_GetPeerIdentity(cmsg))
        }
        set {
            CSteamNetworkingMessage_SetPeerIdentity(cmsg, newValue.identity)
        }
    }

    /// For messages received on connections, this is the user data associated with the connection.
    public var connUserData: Int {
        Int(CSteamNetworkingMessage_GetConnUserData(cmsg))
    }

    /// Local timestamp when the message was received
    public var usecTimeReceived: SteamNetworkingMicroseconds {
        .init(CSteamNetworkingMessage_GetUsecTimeReceived(cmsg))
    }

    /// Message number assigned by the sender.
    public var messageNumber: Int {
        Int(CSteamNetworkingMessage_GetMessageNumber(cmsg))
    }

    /// Function used to free up the data buffer when not supplied by Steam.
    /// The token passed to this callback should then be converted into a ``SteamNetworkingMessage``
    /// using ``SteamNetworkingMessage/fromFreeDataToken(_:)``.
    public func setFreeData(_ f: @escaping @convention(c) (UnsafeMutableRawPointer) -> Void) {
        CSteamNetworkingMessage_SetFreeData(cmsg, f)
    }

    public static func fromFreeDataToken(_ token: UnsafeMutableRawPointer) -> SteamNetworkingMessage {
        .init(token)
    }

    /// Call when done with the object to decrement refcount and eventually call the free-data callback.
    public func release() {
        CSteamNetworkingMessage_Release(cmsg)
    }

    /// When using ISteamNetworkingMessages, the channel number the message was received on
    public var channel: Int {
        Int(CSteamNetworkingMessage_GetChannel(cmsg))
    }

    /// For received messages, only the ``SteamNetworkingSendFlags/reliable`` bit is valid.
    /// For outbound messages, all bits are relevant
    public var sendFlags: SteamNetworkingSendFlags {
        get {
            .init(CSteamNetworkingMessage_GetSendFlags(cmsg))
        }
        set {
            CSteamNetworkingMessage_SetSendFlags(cmsg, Int32(newValue))
        }
    }

    /// Arbitrary user data that you can use when sending messages using
    /// `ISteamNetworkingUtils::AllocateMessage` and `ISteamNetworkingSockets::SendMessage`.
    public func set(userData: Int) {
        CSteamNetworkingMessage_SetUserData(cmsg, Int64(userData))
    }

    /// For outbound messages, which lane to use?  See `ISteamNetworkingSockets::ConfigureConnectionLanes`.
    /// For inbound messages, what lane was the message received on?
    public var lane: Int {
        get {
            Int(CSteamNetworkingMessage_GetLane(cmsg))
        }
        set {
            CSteamNetworkingMessage_SetLane(cmsg, Int16(newValue))
        }
    }
}

extension Optional where Wrapped == OpaquePointer {
    init(_ swift: SteamNetworkingMessage) {
        self = OpaquePointer(swift.cmsg)
    }
}

extension SteamNetworkingMessage: SteamCreatable {
    typealias SteamType = Optional<OpaquePointer>
}

// MARK: SteamNetworkingConfigValue

// Another enum-y union thing, used for writing to SteamNetworking
// (This is intentionally a class to get a deinit for the owned storage...)

/// Steamworks `SteamNetworkingConfigValue_t`
public final class SteamNetworkingConfigValue: @unchecked Sendable {
    let val: SteamNetworkingConfigValue_t
    private var owned: UnsafeMutablePointer<CChar>! = nil

    deinit {
        owned.map { free($0) }
    }

    init(_ steam: SteamNetworkingConfigValue_t) {
        val = steam
    }

    public init(_ s: SteamNetworkingConfigValueSetting, value: Int) {
        var val = SteamNetworkingConfigValue_t()
        val.SetInt32(.init(s), Int32(value))
        self.val = val
    }

    public init(_ s: SteamNetworkingConfigValueSetting, value: Float) {
        var val = SteamNetworkingConfigValue_t()
        val.SetFloat(.init(s), value)
        self.val = val
    }

    public init(_ s: SteamNetworkingConfigValueSetting, value: String) {
        owned = strdup(value)
        var val = SteamNetworkingConfigValue_t()
        val.SetString(.init(s), owned)
        self.val = val
    }
}

extension SteamNetworkingConfigValue: SteamCreatable {}

extension SteamNetworkingConfigValue_t {
    init(_ swift: SteamNetworkingConfigValue) {
        self = swift.val
    }
}

// MARK: SteamAPIWarningMessageHook

public typealias SteamAPIWarningMessageHook = Optional<@Sendable @convention(c) (Int32, UnsafePointer<CChar>?) -> Void>

// MARK: IPv4 address helper

extension Int {
    /// Helper for providing IPv4 addresses by byte
    public static func ipv4(_ hi1: UInt8, _ hi2: UInt8, _ lo2: UInt8, _ lo: UInt8) -> Int {
        Int(hi1) << 24 | Int(hi2) << 16 | Int(lo2) << 8 | Int(lo)
    }
}

// MARK: MatchMakingKeyValuePairs

public typealias MatchMakingKeyValuePairs = KeyValuePairs<String, String>

// MARK: HServerListRequest

// this is just a bit odd
extension HServerListRequest {
    public static let invalid = Self(UnsafeMutableRawPointer(bitPattern: UInt(1)))
}

extension AppID {
    /// The well-known _SpaceWar_ ``AppID``
    public static let spaceWar = Self(480)
}

