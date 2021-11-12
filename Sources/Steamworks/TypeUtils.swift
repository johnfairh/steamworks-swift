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
/// (which are enums or OptionSet structs).
protocol EnumConvertible {
    associatedtype From: RawRepresentable
}

extension EnumConvertible where Self: RawRepresentable, From.RawValue == Self.RawValue {
    init(_ from: From) {
        self.init(rawValue: from.rawValue)!
    }
}

/// Steamworks OptionSet Integer mess
///
/// Steamworks has a few enums that are bitfield things mapped into Swift as `OptionSet`s.
/// Clang importer imports the SW version as structs with `RawValue` of `UInt32` or `Int32`
/// if there are no negative values.
///
/// But the actual Steamworks APIs that use these are all over the place with their types - never using
/// the actual enum type (because would imply one value, I suppose) and instead using a basically
/// random signed/unsigned half/regular width value.
///
/// These dumb casts smooth over the bumps in generated code.  See also
/// `String.asSwiftTypeForPassingIntoSteamworks`.
extension EnumConvertible where Self: OptionSet {
    init(_ rawValue: RawValue) {
        self.init(rawValue: rawValue)
    }
}

extension Int32 {
    init<T>(_ optionSet: T) where T: OptionSet, T.RawValue: BinaryInteger {
        self = Int32(optionSet.rawValue)
    }
}
