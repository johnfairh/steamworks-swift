//
//  ManualStructs.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

// MARK: SteamIPAddress

// A very rough manual wrap to work around the union implementation
// and expose the static getters.

// omg if we make `SteamIPAddress` a `struct` as it should be then the
// embedded `SteamIPAddress_t` gets nobbled somehow during runtime...

/// Steamworks `SteamIPAddress_t`
public final class SteamIPAddress {
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
        // this is such a fucking mess
        Mirror(reflecting: ip.m_rgubIPv6).children.map { $0.value as! UInt8 }
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
            memcpy(&ip.m_ipv6Qword, ptr.baseAddress, ptr.count)
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

    /// Use `SteamIPAddress` as a dictionary key.
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
public struct SteamInputActionEvent {
    /// Steamworks `controllerHandle`
    public let controllerHandle: InputHandle

    public enum Event {
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
// Again we have to be `final class` to avoid the weird corruption of the embedded C++ thing.
//
// This is read-only type afaics so just port the getters.
// None of them are const-correct...
//
// `netadr_t` is something from another valve sdk.
//
// Can't implement comparable because Swift C++ import doesn't understand C++ operator overloads.

/// Steamworks `servernetadr`
public final class ServerNetAdr {
    private var adr: servernetadr_t

    init(_ steam: servernetadr_t) {
        self.adr = steam
    }

    public var queryPort: Int {
        Int(adr.GetQueryPort())
    }

    public var connectionPort: Int {
        Int(adr.GetConnectionPort())
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
public final class SteamNetworkingIPAddr {
    private(set) var adr: CSteamworks.SteamNetworkingIPAddr

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
        let buf = UnsafeBufferPointer(start: adr.m_ipv6_ptr, count: 16)
        return Array(buf)
    }

    public var port: Int {
        Int(adr.m_port)
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

    private init() {
        adr = .init()
    }

    /// `INADDR_ANY` with some port
    public convenience init(inaddrAnyPort port: Int) {
        self.init()
        adr.Clear()
        adr.m_port = UInt16(port)
    }

    /// Sets to IPv4 mapped address.  IP and port are in host byte order.
    public convenience init(ipv4: Int, port: Int) {
        self.init()
        adr.SetIPv4(UInt32(ipv4), UInt16(port))
    }

    /// IP is interpreted as bytes, so there are no endian issues.  (Same as `inaddr_in6`.)
    /// The IP can be a mapped IPv4 address.
    public convenience init(ipv6: [UInt8], port: Int) {
        self.init()
        adr.SetIPv6(ipv6, UInt16(port))
    }

    /// Parse an IP address and optional port.  If a port is not present, it is set to 0.
    public convenience init?(addressAndPort: String) {
        self.init()
        adr.Clear()
        guard adr.ParseString(addressAndPort) else {
            return nil
        }
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
// ** Actually *mostly* immutable because I don't understand 'type'
// Can't quite `enum`-ify this because:
// 1) The random non-class-corruption issue;
// 2) The 'types' enum is large and weird.

/// Steamworks `SteamNetworkingIPAddr`
public final class SteamNetworkingIdentity {
    private(set) var identity: CSteamworks.SteamNetworkingIdentity

    // MARK: Fields

    /// Type of identity
    public var type: SteamNetworkingIdentityType {
        get {
            .init(identity.m_eType)
        }
        set {
            identity.m_eType = .init(newValue)
        }
    }

    /// Returns true if we are the invalid type.  Does not make any other validity checks (e.g. is SteamID actually valid)
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
        .init(SteamAPI_SteamNetworkingIdentity_GetFakeIPType(&identity))
// uh using the method causes a link failure, not implemented anywhere? valve pls
//      .init(identity.GetFakeIPType())
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

    init(_ identity: CSteamworks.SteamNetworkingIdentity) {
        self.identity = identity
    }

    private init() {
        identity = .init()
    }

    /// Init from a Steam ID
    public convenience init(_ steamID: SteamID) {
        self.init()
        identity.SetSteamID64(steamID.asUInt64) // also sets type
    }

    /// Init from an IP address
    public convenience init(_ ipaddr: SteamNetworkingIPAddr) {
        self.init()
        var adr = ipaddr.adr
        identity.SetIPAddr(&adr) // also sets type
    }

    /// Identify as localhost, ~anonymous
    public static var localhost: SteamNetworkingIdentity {
        let id = SteamNetworkingIdentity()
        id.identity.SetLocalHost()
        return id
    }

    /// Init generic string or some other type.  Max length 31 bytes.
    public convenience init?(genericString: String, type: SteamNetworkingIdentityType = .genericString) {
        self.init()
        guard identity.SetGenericString(genericString) else {
            return nil
        }
        self.type = type
    }

    /// Init from a `description` string.
    public convenience init?(description: String) {
        self.init()
        guard identity.ParseString(description) else {
            return nil
        }
    }

    /// Init generic bytes or some other type.  Max 32 bytes.
    public convenience init?(_ bytes: [UInt8], type: SteamNetworkingIdentityType = .genericBytes) {
        self.init()
        guard identity.SetGenericBytes(bytes, bytes.count) else {
            return nil
        }
        self.type = type
    }
}

extension SteamNetworkingIdentity: SteamCreatable, CustomStringConvertible, Equatable {
    typealias SteamType = CSteamworks.SteamNetworkingIdentity

    public static func == (lhs: SteamNetworkingIdentity, rhs: SteamNetworkingIdentity) -> Bool {
        lhs.identity == rhs.identity
    }
}

extension CSteamworks.SteamNetworkingIdentity {
    init(_ swift: SteamNetworkingIdentity) {
        self = swift.identity
    }
}

// MARK: SteamNetworkingMessage

// This is very doomed because we can't see this C++ type from the Swift side.  So
// we provide a C-style flat API of our own to deal with it.

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
    /// The token passed to this callback should then be converted into a `SteamNetworkingMessage`
    /// using `SteamNetworkingMessage.fromFreeDataToken()`.
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

    /// For received messages, only the `reliable` bit is valid.
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

// MARK: SteamNetworkingConfigValue

// Another enum-y union thing, used for writing to SteamNetworking

/// Steamworks `SteamNetworkingConfigValue_t`
public final class SteamNetworkingConfigValue {
    private(set) var val: SteamNetworkingConfigValue_t
    private var owned: UnsafeMutablePointer<CChar>! = nil

    deinit {
        owned.map { free($0) }
    }

    init(_ steam: SteamNetworkingConfigValue_t) {
        val = steam
    }

    public init(_ s: SteamNetworkingConfigValueSetting, value: Int) {
        val = SteamNetworkingConfigValue_t()
        val.SetInt32(.init(s), Int32(value))
    }

    public init(_ s: SteamNetworkingConfigValueSetting, value: Float) {
        val = SteamNetworkingConfigValue_t()
        val.SetFloat(.init(s), value)
    }

    public init(_ s: SteamNetworkingConfigValueSetting, value: String) {
        owned = strdup(value)
        val = SteamNetworkingConfigValue_t()
        val.SetString(.init(s), owned)
    }
}

extension SteamNetworkingConfigValue: SteamCreatable {}

extension SteamNetworkingConfigValue_t {
    init(_ swift: SteamNetworkingConfigValue) {
        self = swift.val
    }
}
