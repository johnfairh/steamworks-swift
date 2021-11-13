//
//  TypeUtils.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks
import LibGenerate

// MARK: Callbacks

/// Type of Steam Callback ID used as interface from Generated/Callbacks -> SteamCallbacks
typealias CallbackID = Int32

// MARK: Strings

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

// MARK: Typedefs

// Conversion of Swift Types to Steam types, for passing in typedefs
// to Steamworks

protocol SteamTypeAlias {
    associatedtype SwiftType
    var value: SwiftType { get }
}

extension FixedWidthInteger {
    init<T: SteamTypeAlias>(_ value: T) where T.SwiftType == Self {
        self = value.value
    }
}

// MARK: Enums

/// Firstly a protocol and extension for converting to raw structs -- covering Steamworks enums (imported as structs)
/// and Swift OptionSets.  In both cases there is no invalid value, so the "!" on the init will never fire.
protocol RawConvertible {
    associatedtype From: RawRepresentable
}

extension RawConvertible where Self: RawRepresentable, From.RawValue == Self.RawValue {
    init(_ from: From) {
        self.init(rawValue: from.rawValue)!
    }
}

/// Secondly a protocol and extension for converting to Swift enums.  The wrinkle here is that we cannot trust the
/// C API to give us a valid (ie. documented) enum case, and must not crash the program if it does.
///
/// This is a pretty thorny type-checking mismatch - we work around it by extending the C model with an "unrepresented"
/// value added by our code generator and spot out-of-range values at runtime.
///
/// Give huge thanks to SR-0280 which permits protocol members to be witnessed by enum cases!
protocol EnumWithUnrepresented: RawConvertible {
    static var unrepresentedInSwift: Self { get }
}

extension EnumWithUnrepresented where Self: RawRepresentable, From.RawValue == Self.RawValue {
    init(_ from: From) {
        if let converted = Self(rawValue: from.rawValue) {
            self = converted
        } else {
            logError("Steam returned an undocumented enum value \(from.rawValue) for \(Self.self)")
            self = .unrepresentedInSwift
        }
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
extension RawConvertible where Self: OptionSet {
    init(_ rawValue: RawValue) {
        self.init(rawValue: rawValue)
    }
}

/// For passing into Steamworks, where it expects int32
extension Int32 {
    init<T>(_ optionSet: T) where T: OptionSet, T.RawValue: BinaryInteger {
        self = Int32(optionSet.rawValue)
    }
}

// MARK: Structs

/// Protocol added to Swift structs meaning they have a corresponding Steam (C) type
protocol SteamCreatable {
    associatedtype SteamType
    init(_ steam: SteamType)
}
