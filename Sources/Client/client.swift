//
//  client.swift
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
    let server: SteamGameServerAPI

    let frameSource: DispatchSourceTimer
    private(set) var frameCounter: Int

    enum State {
        case idle
        case testing
        case done
    }
    private var testState: State
    private var testNext: Int

    init?() {
        guard let api = SteamAPI() else {
            print("SteamAPI init failed")
            return nil
        }
        api.useLoggerForSteamworksWarnings()
        self.api = api
        guard let server = SteamGameServerAPI(port: 27100, serverMode: .noAuthentication, version: "1.0.0.0") else {
            print("SteamGameServerAPI init failed")
            return nil
        }
        self.server = server
        frameSource = DispatchSource.makeTimerSource(queue: .main)
        frameCounter = 0
        testState = .idle
        testNext = 0
    }

    func runFrameLoop() {
        frameSource.schedule(deadline: .now(), repeating: .milliseconds(1000/60))
        frameSource.setEventHandler() { [weak self] in self?.frame() }
        frameSource.resume()

        while testState != .done && RunLoop.current.run(mode: .default, before: .distantFuture) {
        }
    }

    func frame() {
        api.runCallbacks()
        server.runCallbacks()
        frameCounter += 1
        nudgeTests()
    }

    func nudgeTests() {
        guard testState == .idle else {
            return
        }
        testState = .testing
        print(">>>> Starting clienttest \(testNext)")
        switch testNext {
        case 0:
            testSyncQueries()
        case 1:
            testCallReturn()
        case 2:
            testCallback()
        default:
            print("<<<< Actually, that's the end")
            testState = .done
        }
    }

    func endTest() {
        print("<<<< Ended clienttest \(testNext)")
        testNext += 1
        testState = .idle
    }

    func testSyncQueries() {
        let name = api.friends.getPersonaName()
        print("name = \(name)")
        let state = api.friends.getPersonaState()
        print("state = \(state)")
        let friendCount = api.friends.getFriendCount(friendFlags: .all)
        print("friendCount = \(friendCount)")
        let nickname = api.friends.getPlayerNickname(player: SteamID(22))
        print("nickname = \(nickname.map { $0 } ?? "nil")")
        endTest()
    }

    func testCallReturn() {
        let u = SteamUser()
        let steamID = u.steamID
        print("SteamID = \(steamID)")
        api.friends.getFollowerCount(steamID: steamID) { res in
            defer { self.endTest() }
            guard let res = res else {
                print("GetFollowerCount transport failure.")
                return
            }

            guard res.result == .ok else {
                print("GetFollowerCount failed: \(res.result)")
                return
            }

            print("GetFollowerCount: \(res.count) followers")
        }
    }

    func testCallback() {
        api.onUserStatsReceived { [weak self] statsMsg in
            print("User stats received: \(statsMsg)")
            self?.endTest()
        }

        let us = SteamUserStats()
        let rc = us.requestCurrentStats()
        print("RequestCurrentStats: \(rc)")
        if rc != true {
            print("...that's bad, abandoning test")
            endTest()
        }
    }
}

@main
struct Main {
    static func main() {
        print("Client testbed, steamworks version \(SteamAPI.steamworksVersion)")
        SteamAPI.logger.logLevel = .trace
        SteamAPI.logger.trace("Is this thing on?")
        guard let client = Client() else {
            return
        }

        client.runFrameLoop()
        print("Ran \(client.frameCounter) frames")
    }
}
