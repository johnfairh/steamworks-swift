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
        if let cString {
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
/// C API is written `const char **` but probably means
/// `const char * const *`; we work around.
///
/// Needs to allow NULL.
///
/// If non-empty, must have a NULL entry to signify end-of-list.
/// (not in the docs, check SpaceWar sample...)
///
/// Also supports SteamRemoteStorage's custom array-of-strings type that
/// is only marginally better thought out.
///
/// This is intentionally a struct with an explicit deallocate.  Flipping to a class with `deinit` fails
/// because the compiler will not understand the lifetime requirements of the `cStrings` field, ie:
/// ```swift
/// let s = StringArrayClass(p)
/// SomeAPI(s.cStrings)
/// ```
///  ...has UB/crashiness because Swift will deinit `s` after evalulating `s.cStrings` but before
///  actually calling `SomeAPI()`.  And yes, C++ explicitly doesn't work like this.
struct StringArray {
    /// Storage -- the auto-trick with arrays doesn't work through all the optionals
    private let buf: UnsafeMutableBufferPointer<UnsafePointer<CChar>?>?

    /// The `_Nullable const char **`
    var cStrings: UnsafeMutablePointer<UnsafePointer<CChar>?>? {
        buf?.baseAddress
    }

    /// The `_Nullable SteamParamStringArray_t *`
    let steamParamStringArray: UnsafeMutablePointer<SteamParamStringArray_t>?

    init(_ strings: [String]) {
        guard !strings.isEmpty else {
            buf = nil
            steamParamStringArray = nil
            return
        }
        buf = .allocate(capacity: strings.count + 1)
        steamParamStringArray = .allocate(capacity: 1)
        steamParamStringArray?.pointee.m_nNumStrings = Int32(strings.count)
        steamParamStringArray?.pointee.m_ppStrings = buf?.baseAddress
        strings.enumerated().forEach { i, str in
            buf?[i] = UnsafePointer(strdup(str))
        }
        buf?[strings.count] = nil
    }

    func deallocate() {
        buf?.forEach { $0.map { free(UnsafeMutablePointer(mutating: $0)) } }
        buf?.deallocate()
        steamParamStringArray?.deallocate()
    }
}

// Now add extensions to turn the type around to vend multiple types, gives
// polymorphism via `.init()` at point of use.

extension Optional where Wrapped == UnsafeMutablePointer<SteamParamStringArray_t> {
    init(_ stringArray: StringArray) {
        self = stringArray.steamParamStringArray
    }
}

// sometimes it's 'const'...
extension Optional where Wrapped == UnsafePointer<SteamParamStringArray_t> {
    init(_ stringArray: StringArray) {
        self = .init(stringArray.steamParamStringArray)
    }
}

extension Optional where Wrapped == UnsafeMutablePointer<UnsafePointer<CChar>?> {
    init(_ stringArray: StringArray) {
        self = stringArray.cStrings
    }
}

// MARK: Arrays of pairs of strings ...

public typealias MatchMakingKeyValuePairs = KeyValuePairs<String, String>

/// This dumb thing is for isteammatchmaking, which requires an array of pointers
/// to C++ classes that contain two (inline) strings.  We model the input data in Swift as
/// a String:String dictionary and build the data structure here.
struct MatchMakingKeyValuePairArray {
    /// Flat buffer of `MMKVP_t` structs
    private let pairBuffer: UnsafeMutableBufferPointer<MatchMakingKeyValuePair_t>?
    /// Buffer of pointers into the above buffer
    private let pairPointerBuffer: UnsafeMutableBufferPointer<UnsafeMutablePointer<MatchMakingKeyValuePair_t>?>?

    /// Pointer to the pointer array
    var pairPointerArray: UnsafeMutablePointer<UnsafeMutablePointer<MatchMakingKeyValuePair_t>?>? {
        pairPointerBuffer?.baseAddress
    }

    init(_ pairs: MatchMakingKeyValuePairs?) {
        guard let pairs, pairs.count > 0 else {
            pairBuffer = nil
            pairPointerBuffer = nil
            return
        }
        pairBuffer = .allocate(capacity: pairs.count)
        _ = pairBuffer?.initialize(from: pairs.map { MatchMakingKeyValuePair_t($0.key, $0.value) } )
        pairPointerBuffer = .allocate(capacity: pairs.count)
        _ = pairPointerBuffer?.initialize(from: (0..<pairs.count).map { pairBuffer!.baseAddress! + $0 })
    }

    func deallocate() {
        pairPointerBuffer?.deallocate()
        pairBuffer?.deallocate()
    }
}

extension Optional where Wrapped == UnsafeMutablePointer<UnsafeMutablePointer<MatchMakingKeyValuePair_t>?> {
    init(_ mmkvpa: MatchMakingKeyValuePairArray) {
        self = mmkvpa.pairPointerArray
    }
}

// MARK: Typedefs

/// Conversion of Swift Types to Steam types, for passing in typedefs to Steamworks
protocol SteamTypeAlias {
    associatedtype SwiftType
    var value: SwiftType { get }
}

extension FixedWidthInteger {
    init<T: SteamTypeAlias>(_ value: T) where T.SwiftType == Self {
        self = value.value
    }
}

/// HServerListRequest is the only `void *` typedef, deal with it manually
extension UnsafeMutableRawPointer {
    init(_ value: HServerListRequest) {
        self = value.value
    }
}

extension HServerListRequest {
    public static let invalid = Self(UnsafeMutableRawPointer(bitPattern: UInt(1)))

    typealias SteamType = UnsafeMutableRawPointer

    init(_ steam: CSteamworks.HServerListRequest?) {
        if let steam {
            self.init(steam)
        } else {
            self = .invalid
        }
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

/// Same again for uint32 ... SteamInput doing its own thing
extension UInt32 {
    init<T>(_ optionSet: T) where T: OptionSet, T.RawValue: BinaryInteger {
        self = UInt32(optionSet.rawValue)
    }
}

// MARK: Structs

/// Protocol added to Swift structs meaning they have a corresponding Steam (C) type
/// Used as part of generic callback logic binding steam & Swift types.
protocol SteamCreatable {
    associatedtype SteamType
    init(_ steam: SteamType)
}

/// Protocol added to some imported Steam (C) types indicating they can be created
/// from a Swift type - used for some forms of in-parameters.
protocol SwiftCreatable {
    associatedtype SwiftType
    init(_ swift: SwiftType)
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

/// Always that one dumb outlier.  :eyes: at this type name..
extension GameServerItem {
    init(_ ptr: UnsafeMutablePointer<gameserveritem_t>) {
        self.init(ptr.pointee)
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
///
/// This is probably simplifiable using one of the convertible protocols
extension Array {
    init<T>(_ ptr: UnsafePointer<T>, _ count: Int, convert: (T) -> Element) {
        self = UnsafeBufferPointer(start: ptr, count: count).map(convert)
    }
}

/// Arrays of bytes go over skipping conversion (transparent)
extension Array where Element == UInt8 {
    init(_ ptr: UnsafePointer<UInt8>, _ count: Int) {
        self.init(UnsafeBufferPointer(start: ptr, count: count))
    }
}

// MARK: Callbacks

/// A quick helper to reduce generated code size
extension AsyncStream.Continuation {
    func yield0(_ thing: Element) {
        _ = yield(thing)
    }
}

// MARK: IP addresses

extension Int {
    /// Helper for providing IPv4 addresses by byte
    public static func ipv4(_ hi1: UInt8, _ hi2: UInt8, _ lo2: UInt8, _ lo: UInt8) -> Int {
        Int(hi1) << 24 | Int(hi2) << 16 | Int(lo2) << 8 | Int(lo)
    }
}

// MARK: Function pointers

public typealias SteamAPIWarningMessageHook = Optional<@convention(c) (Int32, UnsafePointer<CChar>?) -> Void>

// MARK: Arrays of things coming out of Steam

/// This pulls out all the gross management of arrays of stuff into code that gets compiled once
/// rather than being assembled by the generator.  We also pull the 'nullable' use case into here
/// to simplify the generator.
final class SteamOutArray<SteamType> {
    private let steamBuffer: UnsafeMutableBufferPointer<SteamType>?

    var steamArray: UnsafeMutablePointer<SteamType>? {
        steamBuffer.map { $0.baseAddress! }
    }

    init(_ count: Int, _ isReal: Bool = true) {
        steamBuffer = isReal ? .allocate(capacity: count) : nil
    }

    deinit {
        steamBuffer?.deallocate()
    }

    func swiftArray<SwiftType>(_ count: Int = -1) -> [SwiftType] where SwiftType: SteamCreatable, SwiftType.SteamType == SteamType {
        guard let steamBuffer else { return [] }
        return count < 0 ? steamBuffer.map { .init($0) } : steamBuffer[0..<count].map { .init($0) }
    }

    /// Specialization for Int32 and Int64 because we have many steam types mapping to there... another sign this is a bad choice?
    func swiftArray(_ count: Int = -1) -> [Int] where SteamType: BinaryInteger {
        guard let steamBuffer else { return [] }
        return count < 0 ? steamBuffer.map { .init($0) } : steamBuffer[0..<count].map { .init($0) }
    }
}

/// Wrapper for 'transparent out arrays'
///
/// This is the pattern where we allocate some memory once, have C fill it in, and return that memory
/// untouched to the Swift client.  So it only works when the types are guaranteed bitwise identical,
/// which turns out mostly to be byte arrays for opaque data blobs.
///
/// The only no-copy way I can figure out to populate an `Array` is through its initializer, which is gross
/// because of the code generation and because of the need to pass stuff out -- we wrap up that here.
///
/// Oh and it has to cope with the 'nullable' case too where the client doesn't actually want the data
/// so we have to pass `nil` into the API.
struct SteamTransOutArray<SteamType> {
    private var array: [SteamType]?
    private let count: Int?

    init(_ count: Int, _ isReal: Bool = true) {
        self.array = nil
        self.count = isReal ? count : nil
    }

    mutating func setContent<T>(with: (UnsafeMutablePointer<SteamType>?) -> T) -> T {
        guard let count else {
            return with(nil)
        }
        var cascadedResult: T? = nil
        array = .init(unsafeUninitializedCapacity: count) { umbp, actualCount in
            actualCount = count
            cascadedResult = with(umbp.baseAddress)
        }
        return cascadedResult!
    }

    func swiftArray(_ count: Int = -1) -> [SteamType] {
        guard let array else { return [] }
        return count < 0 ? array : Array(array[0..<count])
    }
}

/// Wrap up strings produced by the Steam API.
///
/// Length allocation includes space for nul terminator.
/// Output is forced to be nul-terminated.
/// Handles 'nil means don't want this' case.
struct SteamOutString {
    private var str: String?
    private let length: Int?

    /// Length here is as defined by the C API, typically 'length of buffer' which includes a null terminator
    init(length: Int, isReal: Bool = true) {
        self.str = nil
        self.length = isReal ? length : nil
    }

    mutating func setContent<T>(with: (UnsafeMutablePointer<UInt8>?) -> T) -> T {
        guard let length else {
            return with(nil)
        }
        var cascadedResult: T? = nil
        str = String(unsafeUninitializedCapacity: length) { umbp in
            cascadedResult = with(umbp.baseAddress)
            return strlentrunc(umbp)
        }
        return cascadedResult!
    }

    var swiftString: String {
        str ?? ""
    }
}

/// lordy ... the design of the swift API seems rooted in some legacy Objective-C stuff
private func strlentrunc(_ cstr: UnsafeMutableBufferPointer<UInt8>) -> Int {
    cstr[cstr.count-1] = 0
    return cstr.prefix(while: { $0 != 0 }).count
}

/// Wrapper for values passed by reference to the steam API that can be nil - so importer magic doesn't work.
///
/// Intentionally a struct with explicit deallocate for lifetime reasons.
struct SteamNullable<SteamType> {
    let steamValue: UnsafeMutablePointer<SteamType>?

    /// Init for out params, no initial value
    init(isReal: Bool = true) {
        steamValue = isReal ? .allocate(capacity: 1) : nil
    }

    /// Init for in param, optional initial value
    init<SwiftType>(_ swiftValue: SwiftType?) where SteamType: SwiftCreatable, SteamType.SwiftType == SwiftType {
        guard let swiftValue else {
            steamValue = nil
            return
        }
        steamValue = .allocate(capacity: 1)
        steamValue?.initialize(to: SteamType(swiftValue))
    }

    func deallocate() {
        steamValue?.deallocate()
    }

    func swiftValue<SwiftType>(dummy: @autoclosure () -> SwiftType) -> SwiftType where SwiftType: SteamCreatable, SwiftType.SteamType == SteamType {
        guard let steamValue else { return dummy() }
        return SwiftType(steamValue.pointee)
    }
}
