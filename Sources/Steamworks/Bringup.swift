//
//  Bringup.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

// MARK: SteamID

public struct SteamID {
    public let steamID: UInt64
    public init(_ steamID: UInt64) {
        self.steamID = steamID
    }
    init(_ steamID: CSteamID) {
        var kludge = steamID
        self.steamID = kludge.ConvertToUint64()
    }
}

extension UInt64 {
    init(_ steamID: SteamID) {
        self = steamID.steamID
    }
}

// MARK: Typedefs

public struct SteamTypealias<SwiftType> {
    public let value: SwiftType
    public init(value: SwiftType) {
        self.value = value
    }
    init(_ steamValue: SwiftType) {
        self.value = steamValue
    }
}

// Conversion of Swift Types to Steam types, for passing in typedefs
// to Steamworks
extension FixedWidthInteger {
    init(_ value: SteamTypealias<Self>) {
        self = value.value
    }
}

public typealias FriendsGroupID = SteamTypealias<Int16>
public typealias AppId = SteamTypealias<UInt32>

// MARK: Bringup interfaces

public struct SteamUser {
    var interface: UnsafeMutablePointer<ISteamUser> {
        SteamAPI_SteamUser_v021()
    }

    public init() {
    }

    public var steamID: SteamID {
        SteamID(SteamAPI_ISteamUser_GetSteamID(interface))
    }
}

public struct SteamUserStats {
    var interface: UnsafeMutablePointer<ISteamUserStats> {
        SteamAPI_SteamUserStats_v012()
    }

    public init() {
    }

    public func requestCurrentStats() -> Bool {
        SteamAPI_ISteamUserStats_RequestCurrentStats(interface)
    }
}
