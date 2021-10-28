//
//  main.swift
//  Client
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks
import Foundation

// A testbed to verify API coherence and the callback etc. pieces, not attempting
// to demo the rest of the API.  Porting SpaceWar over to Swift might be an interesting
// exercise in the future.

final class Client {
    let api: SteamAPI

    let frameSource: DispatchSourceTimer
    private(set) var frameCounter: Int

    private var _quit: Bool

    func requestQuit() {
        _quit = true
    }

    init?() {
        guard let api = SteamAPI() else {
            print("SteamAPI init failed")
            return nil
        }
        self.api = api
        frameSource = DispatchSource.makeTimerSource(queue: .main)
        frameCounter = 0
        _quit = false
    }

    func runFrameLoop() {
        frameSource.schedule(deadline: .now(), repeating: .milliseconds(1000/60))
        frameSource.setEventHandler() { [weak self] in self?.frame() }
        frameSource.resume()

        while !_quit && RunLoop.current.run(mode: .default, before: .distantFuture) {
        }
    }

    func frame() {
        api.runCallbacks()
        frameCounter += 1
    }
}

// Incredibly `@main` is still broken....

func main() {
    guard let client = Client() else {
        return
    }

    client.api.onPersonaStateChange {
        print("PersonaStateChange: \($0)")
        SteamFriends.getFollowerCount(steamID: $0.steamID) {
            print("FollowerCount: \($0)")
            client.requestQuit()
        }
    }

    client.runFrameLoop()
    print("Ran \(client.frameCounter) frames")
}

main()

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
