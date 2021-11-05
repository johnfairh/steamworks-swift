//
//  Bringup.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks


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
