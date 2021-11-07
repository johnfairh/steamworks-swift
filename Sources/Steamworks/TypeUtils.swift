//
//  TypeUtils.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

/// Protocol added to Swift structs meaning they have a corresponding Steam (C) type
protocol SteamCreatable {
    associatedtype SteamType
    init(_ steam: SteamType)
}

/// Type of Steam Callback ID used as interface from Generated/Callbacks -> SteamCallbacks
typealias CallbackID = Int32

extension String {
    /// For converting strings received from Steamworks.  We promote `nullptr` to empty string for
    /// ease, this may be wrong though for some API or other, tbd.
    init(_ cString: UnsafePointer<CChar>?) {
        if let cString = cString {
            self.init(cString: cString)
        } else {
            self = ""
        }
    }
}

// Extremely terrifying extension to a C++ class ...
extension CSteamID {
    init(_ steamID: SteamID) {
        self.init(steamID.steamID)
    }
}

// MARK: Enums

/// For DRYing the conversion code between Steam enums (which are structs) and Swift enums
/// (which are enums).
protocol EnumConvertible {
    associatedtype From: RawRepresentable
}

extension EnumConvertible where Self: RawRepresentable, From.RawValue == Self.RawValue {
    init(_ from: From) {
        self.init(rawValue: from.rawValue)!
    }
}
