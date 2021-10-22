import Steamworks
import Foundation

if let v = SteamAPI() {
    print(v)
}

print("End program")

//#if false
//func test() {
//    let hSteamPipe = SteamAPI_GetHSteamPipe()
//    SteamAPI_ManualDispatch_RunFrame( hSteamPipe )
//    var callback = CallbackMsg_t()
//    while SteamAPI_ManualDispatch_GetNextCallback( hSteamPipe, &callback ) {
//        if ( callback.m_iCallback == 123 /* SteamAPICallCompleted_t.k_iCallback */ ) {
//
//            callback.m_pubParam.withMemoryRebound(to: SteamAPICallCompleted_t.self, capacity: 1) { pCallCompletedPtr in
//
//                let pCallCompleted = pCallCompletedPtr.pointee
//
//                let tmpCallResult = UnsafeMutableRawPointer
//                    .allocate(byteCount: Int(pCallCompleted.m_cubParam),
//                              alignment: MemoryLayout<Int>.stride)
//                defer { tmpCallResult.deallocate() }
//
//                var bFailed = true
//
//                if SteamAPI_ManualDispatch_GetAPICallResult(
//                    hSteamPipe,
//                    pCallCompleted.m_hAsyncCall,
//                    tmpCallResult,
//                    Int32(pCallCompleted.m_cubParam),
//                    pCallCompleted.m_iCallback,
//                    &bFailed) {
//                    // Dispatch the call result to the registered handler(s) for the
//                    // call identified by pCallCompleted->m_hAsyncCall
//                    issueCallback(id: pCallCompleted.m_hAsyncCall, raw: tmpCallResult)
//                }
//            }
//        } else {
//            // Look at callback.m_iCallback to see what kind of callback it is,
//            // and dispatch to appropriate handler(s)
//        }
//        SteamAPI_ManualDispatch_FreeLastCallback( hSteamPipe );
//    }
//}
//
//typealias RawCallback = (UnsafeMutableRawPointer) -> Void
//
//func makeRaw<T>(_ callback: @escaping (T) -> Void) -> RawCallback {
//    { raw in callback(raw.bindMemory(to: T.self, capacity: 1).pointee) }
//}
//
//var apiCallbacks = [SteamAPICall_t : RawCallback]()
//
//func issueCallback(id: SteamAPICall_t, raw: UnsafeMutableRawPointer) {
//    if let callback = apiCallbacks.removeValue(forKey: id) {
//        callback(raw)
//    }
//}
//
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
