//
//  GameID.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

private extension Int {
    var isValidModID: Bool {
        self & 0x80000000 != 0
    }
}

/// Steamworks `CGameID` - encapsulates an appID/modID pair
public struct GameID {
    private var value: UInt64

    private let MOD_SPEC = (shift: 32, mask: UInt64(0xffffffff)) // 32
    private let TYP_SPEC = (shift: 24, mask: UInt64(0xff))       //  8
    private let APP_SPEC = (shift: 0,  mask: UInt64(0xffffff))   // 24 = 64 total

    // MARK: Properties

    /// The ModID of the `GameID`, max 32 bits (no typedef for this?)
    public var modID: Int {
        get {
            Int(value.shiftOut(MOD_SPEC))
        }
        set {
            precondition(newValue >= 0 && newValue <= UInt32.max, "Invalid modID \(newValue), max \(MOD_SPEC.mask)")
            value.shiftIn(UInt32(newValue), MOD_SPEC)
        }
    }

    /// Private enum of different types of 'game'
    enum GameType: UInt32 {
        case app = 0
        case gameMod = 1
        case shortcut = 2
        case p2p = 3
        case unrepresentedInSwift = 4
    }

    /// The type of the `GameID`.
    var gameType: GameType {
        get {
            GameType(rawValue: value.shiftOut(TYP_SPEC)) ?? .unrepresentedInSwift
        }
        set {
            value.shiftIn(newValue.rawValue, TYP_SPEC)
        }
    }

    /// The `AppID` of the `GameID` - note for manual construction this is only a 24-bit value.
    public var appID: AppID {
        get {
            AppID(value.shiftOut(APP_SPEC))
        }
        set {
            precondition(appID.value <= APP_SPEC.mask, "Invalid AppID \(newValue), max \(APP_SPEC.mask)")
            value.shiftIn(newValue.value, APP_SPEC)
        }
    }

    /// The flat version of the `GameID`
    public var asUInt64: UInt64 {
        value
    }

    // MARK: Queries

    /// Is the `GameID` representing a valid thing?
    public var isValid: Bool {
        // each type has its own invalid fixed point:
        switch gameType {
        case .app:
            return appID != .invalid

        case .gameMod:
            return appID != .invalid && modID.isValidModID

        case .shortcut:
            return modID.isValidModID

        case .p2p: /* == on next line is correct */
            return appID == .invalid && modID.isValidModID

        case .unrepresentedInSwift:
            return false
        }
    }

    /// Is this a mod?
    public var isMod: Bool {
        gameType == .gameMod
    }

    /// Is this a shortcut?
    public var isShortcut: Bool {
        gameType == .shortcut
    }

    /// Is this a p2pfile [err what]?
    public var isP2PFile: Bool {
        gameType == .p2p
    }

    /// Is this an app (== game)?
    public var isSteamApp: Bool {
        gameType == .app
    }

    // MARK: Initializers

    /// Create a fresh invalid `GameID`.
    public init() {
        value = 0
        gameType = .app
        appID = .invalid
        assert(modID == 0)
    }

    /// Create a `GameID` from a flat value
    public init(_ gameID: UInt64) {
        value = gameID
    }

    /// Create a `GameID` from a C++ `CGameID`
    init(_ gameID: CGameID) {
        value = gameID.m_ulGameID
    }

    /// Create a `GameID` from an `AppID` - other fields invalid
    init(_ appID: AppID) {
        value = 0
        self.appID = appID
    }

    /// Create a `GameID` for a mod
    init(_ appID: AppID, modID: Int) {
        value = 0
        self.appID = appID
        self.modID = modID
        self.gameType = .gameMod
    }

    // MARK: Compound Setters

    /// Set the `GameID` from a 64-bit representation
    mutating func setFromUInt64(_ u: UInt64) {
        self = GameID(u)
    }

    /// Clear all fields, leaving an invalid ID.
    public mutating func reset() {
        value = 0
    }
}

extension GameID: Hashable, Comparable, CustomStringConvertible {
    // MARK: Conformances

    /// `GameID`s are equal if all their properties are identical
    public static func == (lhs: GameID, rhs: GameID) -> Bool {
        lhs.value == rhs.value
    }

    /// `GameID`s can be used as dictionary keys.
    public func hash(into hasher: inout Hasher) {
        value.hash(into: &hasher)
    }

    /// Following steam, ordering is defined on the raw 64-bit numeric value, for whatever good that does.
    public static func < (lhs: GameID, rhs: GameID) -> Bool {
        lhs.value < rhs.value
    }

    /// A human-readable description of the `GameID`
    public var description: String {
        "[\(appID.value) t=\(gameType) m=\(modID)]"
    }
}
