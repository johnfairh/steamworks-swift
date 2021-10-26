//
//  Bringup.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

public enum SteamFriends {
    public static func getFollowerCount(steamID: UInt64, completion: @escaping (FriendsGetFollowerCount) -> Void) {
        let rc = SteamAPI_ISteamFriends_GetFollowerCount(SteamAPI_SteamFriends_v017(), steamID)
        SteamCallbacks.CallResults.shared.add(rawClient: SteamCallbacks.makeRaw(completion), callID: rc)
    }
}

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
