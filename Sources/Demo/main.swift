import Steamworks
import Foundation

if let v = SteamAPI() {
    print(v)
}

print("End program")

//
//public enum SteamFriends2 {
//    static func HasFriend(steamIDFriend: UInt64, friendFlags: Int32) -> Bool {
//        SteamAPI_ISteamFriends_HasFriend(SteamAPI_SteamFriends_v017(), steamIDFriend, friendFlags)
//    }
//}
//
//public struct SteamUtils {
//    private var iSteamUtils: UnsafeMutablePointer<ISteamUtils>
//    private init(isClient: Bool) {
//        iSteamUtils = isClient ? SteamAPI_SteamUtils_v010() : SteamAPI_SteamGameServerUtils_v010()
//    }
//
//    public static let client = SteamUtils(isClient: true)
//    public static let server = SteamUtils(isClient: false)
//
//    public var secondsSinceAppActive: UInt32 {
//        SteamAPI_ISteamUtils_GetSecondsSinceAppActive(iSteamUtils)
//    }
//
//    static var secondsSinceAppActive: UInt32 {
//        client.secondsSinceAppActive
//    }
//}
//#endif
