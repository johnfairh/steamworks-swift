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

//func JoinClanChatRoom(steamIDClan: CSteamID,
//                      completion: @escaping (JoinClanChatRoomCompletionResult_t) -> Void) {
//    let rc = SteamFriends().pointee.JoinClanChatRoom(steamIDClan)
//    apiCallbacks[rc] = makeRaw(completion)
//}
//
//@available(macOS 12.0.0, *)
//func JoinClanChatRoom(steamIDClan: CSteamID) async -> JoinClanChatRoomCompletionResult_t {
//    await withUnsafeContinuation { continuation in
//        JoinClanChatRoom(steamIDClan: steamIDClan) {
//            continuation.resume(returning: $0)
//        }
//    }
//}
