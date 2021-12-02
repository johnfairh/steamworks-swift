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
        case 3:
            testStringFilter()
        case 4:
            testServerIP()
        case 5:
            testHTTP()
        case 6:
            testGameServers()
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
        let steamID = api.user.getSteamID()
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

        let rc = api.userStats.requestCurrentStats()
        print("RequestCurrentStats: \(rc)")
        if rc != true {
            print("...that's bad, abandoning test")
            endTest()
        }
    }

    func testStringFilter() {
        let steamID = api.user.getSteamID()
        let str = "Hello world"
        var filteredStr = String()

        let rc = api.utils.initFilterText(filterOptions: 0)
        print("InitFilterText: \(rc)")
        let count = api.utils.filterText(context: .chat, steamID: steamID, inputMessage: str, outFilteredText: &filteredStr, byteSizeOutFilteredText: 12)
        print("Filtered, count=\(count) out=\(filteredStr)")
        endTest()
    }

    func testServerIP() {
        let loggedOn = server.gameServer.loggedOn()
        let ip = server.gameServer.getPublicIP()
        print("Server logged on: \(loggedOn); IP type: \(ip.type); IPv4 addr: 0x\(String(ip.ipv4Address, radix: 16))")
        endTest()
    }

    func testHTTP() {
        let req = api.http.createHTTPRequest(httpRequestMethod: .get, absoluteURL: "http://bbc.co.uk/")
        api.http.sendHTTPRequest(request: req) { done in
            if let done = done {
                print("HTTP response, got steam done: \(done)")
            } else {
                print("HTTP response, steam IO faillure")
            }
            self.api.http.releaseHTTPRequest(request: req)
            self.endTest()
        }
    }

    func testGameServers() {
        class ServerCallbacks: SteamMatchmakingServerListResponse {
            let api: SteamAPI
            let done: () -> Void
            init(api: SteamAPI, done: @escaping () -> Void) {
                self.api = api
                self.done = done
            }
            func serverResponded(request: HServerListRequest, iServer: Int) {
                let g = api.matchmakingServers.getServerDetails(request: request, serverIndex: iServer)
                print("Got server: \(g.gameDescription)")
            }

            func serverFailedToRespond(request: HServerListRequest, iServer: Int) {
                print("ServerFailedToRespond: \(iServer)")
            }

            func refreshComplete(request: HServerListRequest, response: MatchMakingServerResponse) {
                print("RefreshComplete: \(response)")
                done()
            }
        }

        var handle: HServerListRequest?

        let callbacks = ServerCallbacks(api: api) {
            self.api.matchmakingServers.releaseRequest(serverListRequest: handle!)
            self.endTest()
        }

        handle = api.matchmakingServers.requestInternetServerList(appIndex: api.utils.getAppID(),
                                                                  filters: ["gamedir" : "spacewar", "secure" : "1"],
                                                                  requestServersResponse: callbacks)
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
