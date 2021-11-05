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
    let server: SteamGameServerAPI

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
        api.useLoggerForSteamworksWarnings()
        self.api = api
        guard let server = SteamGameServerAPI(port: 27100, serverMode: .noAuthentication, version: "1.0.0.0") else {
            print("SteamGameServerAPI init failed")
            return nil
        }
        self.server = server
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
        server.runCallbacks()
        frameCounter += 1
    }
}

// Incredibly `@main` is still broken....

func main() {
    print("Client testbed, steamworks version \(SteamAPI.steamworksVersion)")
    SteamAPI.logger.logLevel = .trace
    guard let client = Client() else {
        return
    }

    client.api.onPersonaStateChange { [weak client] in
        guard let client = client else { return }
        print("PersonaStateChange: \($0)")
        client.api.friends.getFollowerCount(steamID: $0.steamID) {
            print("FollowerCount: \($0)")
            client.requestQuit()
        }
    }

    client.runFrameLoop()
    print("Ran \(client.frameCounter) frames")
}

main()
