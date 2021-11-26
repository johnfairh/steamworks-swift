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
        case .unrepresentedInSwift: return false
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
