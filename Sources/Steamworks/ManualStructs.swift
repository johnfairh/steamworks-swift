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
        // The C++ method isn't marked `const` so we can't call it ...
        switch type {
        case .ipv4: return ipv4Address != 0
        case .ipv6: return ip.m_ipv6Qword.0 != 0 || ip.m_ipv6Qword.1 != 0
        case .unrepresentedInSwift:
            logError("Steam returned an undocumented enum value \(type) for SteamIPAddress")
            return false
        }
    }

    // MARK: Initializers

    /// Initialize with an IPv4 address.
    public init(ipv4Address: Int) {
        precondition(ipv4Address >= 0 && ipv4Address <= UInt32.max)
        var ip = SteamIPAddress_t()
        ip.m_eType = k_ESteamIPTypeIPv4
        ip.m_unIPv4 = UInt32(ipv4Address)
        self.ip = ip
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
    private var adr: CSteamworks.SteamNetworkingIPAddr

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

    /// Sets to IPv4 mapped address.  IP and port are in host byte order.
    public init(ipv4: Int, port: Int) {
        adr = .init()
        adr.SetIPv4(UInt32(ipv4), UInt16(port))
    }

    /// IP is interpreted as bytes, so there are no endian issues.  (Same as `inaddr_in6`.)
    /// The IP can be a mapped IPv4 address.
    public init(ipv6: [UInt8], port: Int) {
        adr = .init()
        adr.SetIPv6(ipv6, UInt16(port))
    }

    /// Parse an IP address and optional port.  If a port is not present, it is set to 0.
    public init?(addressAndPort: String) {
        adr = .init()
        adr.Clear()
        guard adr.ParseString(addressAndPort) else {
            return nil
        }
    }
}

extension SteamNetworkingIPAddr: SteamCreatable {
}
