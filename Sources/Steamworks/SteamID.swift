//
//  SteamID.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

/// The globally unique identifier for all Steam accounts, Steam groups, lobbies, and chat rooms.
///
/// Steamworks `CSteamID`.  Methods and interface style to follow Steamworks, see docs there.
public struct SteamID {
    private var value: UInt64

    private static let UNI_SPEC = (shift: 56, mask: UInt64(0xff))       //  8
    private static let ATY_SPEC = (shift: 52, mask: UInt64(0xf))        //  4
    private static let AIN_SPEC = (shift: 32, mask: UInt64(0xfffff))    // 20 (if ATY==chat then 8 flags+12 instance...)
    private static let AID_SPEC = (shift: 0,  mask: UInt64(0xffffffff)) // 32 = 64 total

    // MARK: Properties

    /// The universe of the `SteamID`.
    public var universe: Universe {
        get {
            Universe(rawValue: value.shiftOut(Self.UNI_SPEC)) ?? .unrepresentedInSwift
        }
        set {
            value.shiftIn(newValue.rawValue, Self.UNI_SPEC)
        }
    }

    /// The account type of the `SteamID`.
    public var accountType: AccountType {
        get {
            AccountType(rawValue: value.shiftOut(Self.ATY_SPEC)) ?? .unrepresentedInSwift
        }
        set {
            value.shiftIn(newValue.rawValue, Self.ATY_SPEC)
        }
    }

    /// The account instance of the `SteamID`.  Max 20 bits, 0xfffff.
    public var accountInstance: Int {
        get {
            Int(value.shiftOut(Self.AIN_SPEC))
        }
        set {
            precondition(newValue >= 0 && newValue <= Self.AIN_SPEC.mask, "\(newValue) out of range for account instance, max \(Self.AIN_SPEC.mask)")
            value.shiftIn(UInt32(newValue), Self.AIN_SPEC)
        }
    }

    /// The account ID of the `SteamID`.
    public var accountID: AccountID {
        get {
            AccountID(value.shiftOut(Self.AID_SPEC))
        }
        set {
            value.shiftIn(newValue.value, Self.AID_SPEC)
        }
    }

    /// Converts steam ID to its 64-bit representation
    public var asUInt64: UInt64 {
        value
    }

    /// Converts the static parts of a steam ID to a 64-bit representation.
    ///
    /// For multiseat accounts, all instances of that account will have the same static account
    /// key, so they can be grouped together by the static account key.
    public var staticAccountKey: UInt64 {
        // note we do NOT include the account instance (which is a dynamic property)
        SteamID(accountID: accountID, accountInstance: 0, universe: universe, accountType: accountType).value
    }

    // MARK: Queries

    /// Is the SteamID valid?
    public var isValid: Bool {
        switch universe {
        case .invalid, .max, .unrepresentedInSwift: return false
        default: break
        }

        switch accountType {
        case .invalid, .max, .unrepresentedInSwift:
            return false
        case .individual:
            if accountID.value == 0 || accountInstance != k_unSteamUserDefaultInstance {
                return false
            }
        case .clan:
            if accountID.value == 0 || accountInstance != 0 {
                return false
            }
        case .gameServer:
            if accountID.value == 0 {
                return false
            }
        default:
            break
        }

        return true
    }

    /// Is this an anonymous game server login that will be filled in?
    public var isBlankAnonAccount: Bool {
        accountID.value == 0 && isAnonAccount && accountInstance == 0
    }

    /// Is this a game server account id?  (Either persistent or anonymous)
    public var isGameServerAccount: Bool {
        isPersistentGameServerAccount || isAnonGameServerAccount
    }

    /// Is this a persistent (not anonymous) game server account id?
    public var isPersistentGameServerAccount: Bool {
        accountType == .gameServer
    }

    /// Is this an anonymous game server account id?
    public var isAnonGameServerAccount: Bool {
        accountType == .anonGameServer
    }

    /// Is this a content server account id?
    public var isContentServerAccount: Bool {
        accountType == .contentServer
    }

    /// Is this a clan account id?
    public var isClanAccount: Bool {
        accountType == .clan
    }

    /// Is this a chat account id?
    public var isChatAccount: Bool {
        accountType == .chat
    }

    /// Is this a chat lobby account id?
    public var isLobby: Bool {
        isChatAccount &&
            (UInt32(accountInstance) & ChatSteamIDInstanceFlags.lobby.rawValue != 0)
    }

    ///  Is this an individual user account id?
    public var isIndividualAccount: Bool {
        accountType == .individual || accountType == .consoleUser
    }

    /// Is this an anonymous account?
    public var isAnonAccount: Bool {
        accountType == .anonUser || accountType == .anonGameServer
    }

    /// Is this an anonymous user account? ( used to create an account or reset a password )
    public var isAnonUserAccount: Bool {
        accountType == .anonUser
    }

    ///  Is this a faked up Steam ID for a PSN friend account?
    public var isConsoleUserAccount: Bool {
        accountType == .consoleUser
    }

    // MARK: Initializers

    /// Create a fresh invalid SteamID.
    public init() {
        value = 0
    }

    /// Create a Steam ID using the default instance.
    public init(accountID: AccountID, universe: Universe, accountType: AccountType) {
        let instance: Int
        if accountType == .clan || accountType == .gameServer {
            instance = 0
        } else {
            instance = Int(k_unSteamUserDefaultInstance)
        }
        self.init(accountID: accountID, accountInstance: instance, universe: universe, accountType: accountType)
    }

    /// Create a Steam ID with an instance.
    public init(accountID: AccountID, accountInstance: Int, universe: Universe, accountType: AccountType) {
        value = 0
        self.accountID = accountID
        self.universe = universe
        self.accountType = accountType
        self.accountInstance = accountInstance
    }

    /// Create a Steam ID from a 64-bit representation
    public init(_ steamID: UInt64) {
        value = steamID
    }

    /// Initialize from a C++ CSteamID
    init(_ steamID: CSteamID) {
        value = steamID.ConvertToUint64()
    }

    // MARK: Compound Setters

    /// Set parameters for steam ID
    public mutating func set(accountID: AccountID, universe: Universe, accountType: AccountType) {
        self = SteamID(accountID: accountID, universe: universe, accountType: accountType)
    }

    /// Set parameters for steam ID
    public mutating func instancedSet(accountID: AccountID, accountInstance: Int, universe: Universe, accountType: AccountType) {
        self = SteamID(accountID: accountID, accountInstance: accountInstance, universe: universe, accountType: accountType)
    }

    /// Initialize a steam ID from its 52 bit parts and universe/type
    public mutating func fullSet(identifier: UInt64, universe: Universe, accountType: AccountType) {
        instancedSet(accountID: AccountID(identifier.shiftOut(Self.AID_SPEC)),
                     accountInstance: Int(identifier.shiftOut(Self.AIN_SPEC)),
                     universe: universe,
                     accountType: accountType)
    }

    /// Initialize a steam ID from its 64-bit representation
    public mutating func setFromUInt64(_ steamID: UInt64) {
        self = SteamID(value)
    }

    /// Clear all fields, leaving an invalid ID.
    public mutating func clear() {
        value = 0
    }

    /// Create an anonymous game server login to be filled in by the AM
    public mutating func createBlankAnonLogon(universe: Universe) {
        accountID = AccountID(0)
        accountType = .anonGameServer
        self.universe = universe
        accountInstance = 0
    }

    /// Create an anonymous game server login to be filled in by the AM
    public mutating func createBlankAnonUserLogon(universe: Universe) {
        accountID = AccountID(0)
        accountType = .anonUser
        self.universe = universe
        accountInstance = 0
    }

    // MARK: Well-known Steam IDs

    /// Generic invalid SteamID
    public static let `nil` = SteamID()

    /// This steamID comes from a user game connection to an out of date GS that hasnt implemented the protocol
    /// to provide its steamID
    public static let outOfDateGS = SteamID(accountID: AccountID(0), accountInstance: 0, universe: .invalid, accountType: .invalid)

    /// This steamID comes from a user game connection to an sv_lan GS
    public static let lanModeGS = SteamID(accountID: AccountID(0), accountInstance: 0, universe: .public, accountType: .invalid)

    /// This steamID can come from a user game connection to a GS that has just booted but hasnt yet even initialized
    /// its steam3 component and started logging on.
    public static let notInitYetGS = SteamID(accountID: AccountID(1), accountInstance: 0, universe: .invalid, accountType: .invalid)

    /// This steamID can come from a user game connection to a GS that isn't using the steam authentication system but still
    /// wants to support the "Join Game" option in the friends list
    public static let nonSteamGS = SteamID(accountID: AccountID(2), accountInstance: 0, universe: .invalid, accountType: .invalid)
}


extension SteamID: Hashable, Comparable, CustomStringConvertible, Sendable {
    // MARK: Conformances

    /// Following steam, ordering is defined on the raw 64-bit numeric value, for whatever good that does.
    public static func < (lhs: SteamID, rhs: SteamID) -> Bool {
        lhs.value < rhs.value
    }

    /// A human-readable description of the Steam ID
    public var description: String {
        "[0x\(String(accountID.value,radix: 16)) i=\(accountInstance) u=\(universe), t=\(accountType)]"
    }
}

// MARK: API interop gunk

extension UInt64 {
    init(_ steamID: SteamID) {
        self = steamID.asUInt64
    }
}

extension SteamID: SteamCreatable {
    typealias SteamType = CSteamID
}

// What a day to be alive, a Swift extension to a C++ class ...
extension CSteamID {
    init(_ steamID: SteamID) {
        self.init(steamID.asUInt64)
    }
}
