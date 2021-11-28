//
//  TypeUtils.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

// MARK: Callbacks

/// Type of Steam Callback ID used as interface from Generated/Callbacks -> SteamCallbacks
typealias CallbackID = Int32

// MARK: Strings

extension String {
    /// For converting const strings received from Steamworks.  We promote `nullptr` to empty string;
    /// where Steamworks specifies a string may legitimately be NULL we use a `String?` instead.
    init(_ cString: UnsafePointer<CChar>?) {
        if let cString = cString {
            self.init(cString: cString)
        } else {
            self = ""
        }
    }

    /// For converting C strings filled in by steamworks into Strings.
    /// Make sure the thing is null-terminated.
    init(_ bufptr: UnsafeMutableBufferPointer<CChar>) {
        if let cString = bufptr.baseAddress {
            cString[bufptr.count - 1] = 0
            self.init(cString: cString)
        } else {
            self = ""
        }
    }
}

// MARK: Arrays of Strings

/// Far too much work to translate badly-thought-out C code.
///
/// C API is written "const char **" but is a mistake, actually
/// means "const char * const *"; we work around.  It's maddening
/// to see the same 'const' mistakes now as I did in the early 90s.
///
/// Needs to allow NULL.
///
/// If non-empty, must have a NULL entry to signify end-of-list.
/// (not in the docs, check SpaceWar sample...)
final class SteamStringArray {
    // Storage -- the auto-trick with arrays doesn't work through all the
    // optional nonsense we have going on
    private let buf: UnsafeMutableBufferPointer<UnsafePointer<CChar>?>?

    // The "_Nullable const char **"
    var cStrings: UnsafeMutablePointer<UnsafePointer<CChar>?>? {
        buf?.baseAddress
    }

    init(_ strings: [String]) {
        guard !strings.isEmpty else {
            buf = nil
            return
        }
        buf = .allocate(capacity: strings.count + 1)
        strings.enumerated().forEach { i, str in
            buf?[i] = UnsafePointer(strdup(str))
        }
        buf?[strings.count] = nil
    }

    deinit {
        buf?.forEach { $0.map { free(UnsafeMutablePointer(mutating: $0)) } }
        buf?.deallocate()
    }
}

// MARK: Typedefs

/// Conversion of Swift Types to Steam types, for passing in typedefs
/// to Steamworks.
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
/// Clang importer imports the SW version as structs with `RawValue` of `UInt32`( or `Int32`
/// if there are negative values.)
///
/// But the actual Steamworks APIs that use these are all over the place with their types - never using
/// the actual enum type (because would imply one value, I suppose) and instead using a basically
/// random signed/unsigned half/regular width value.
///
/// These dumb casts smooth over the bumps in generated code.  See also
/// `String.asSwiftTypeForPassingIntoSteamworks`.
extension RawConvertible where Self: OptionSet, RawValue == UInt32 {
    init<T: BinaryInteger>(_ rawValue: T) {
        self.init(rawValue: RawValue(rawValue))
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
/// Used as part of generic callback logic binding steam & Swift types.
protocol SteamCreatable {
    associatedtype SteamType
    init(_ steam: SteamType)
}

/// Helper to deal with bitfields.
extension UInt64 {
    typealias BitSpec = (shift: Int, mask: UInt64)

    func shiftOut(_ bs: BitSpec) -> UInt32 {
        UInt32((self >> bs.shift) & bs.mask)
    }

    mutating func shiftIn(_ value: UInt32, _ bs: BitSpec) {
        self = (self & ~(bs.mask << bs.shift)) | (UInt64(value) << bs.shift)
    }
}

// MARK: Struct members

/// Dumb C-style booleans, assigning over into actual Bools
extension Bool {
    init<T>(_ someInt: T) where T: BinaryInteger {
        self = someInt != 0
    }
}

/// Fixed-size arrays are frequent.  These get imported as tuples which are useless.
///
/// We generate C shims to get pointers instead, then stumble around copying the memory over
/// at runtime and converting the elements.
extension Array {
    init<T>(_ ptr: UnsafePointer<T>, _ count: Int, convert: (T) -> Element) {
        self.init(unsafeUninitializedCapacity: count) { buf, done in
            let ubp = UnsafeBufferPointer(start: ptr, count: count)
            for i in 0..<count {
                buf[i] = convert(ubp[i])
            }
            done = count
        }
    }
}

/// Because we can't use `Foundation.Data` here right now, arrays of bytes go over as-is
extension Array where Element == UInt8 {
    init(_ ptr: UnsafePointer<UInt8>, _ count: Int) {
        self.init(unsafeUninitializedCapacity: count) { buf, done in
            buf.baseAddress!.initialize(from: ptr, count: count)
            done = count
        }
    }
}

// MARK: Callbacks

/// A quick helper to reduce generated code size
extension AsyncStream.Continuation {
    func yield0(_ thing: Element) {
        _ = yield(thing)
    }
}

// MARK: Function pointers

// Not sure how to / whether to generalize this yet.
// If there are more that are missing then can add to the extra_api and
// figure out how to translate the C typedefs.
// See kludge in Names.swift too to make it transparent.

public typealias SteamAPIWarningMessageHook = Optional<@convention(c) (Int32, UnsafePointer<CChar>?) -> Void>
