//
//  TicketClient.swift
//  TicketClient
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks
import SteamworksEncryptedAppTicket
import Foundation

@main
struct Main {
    static func main() {
        print("TicketClient testbed, steamworks version \(SteamAPI.steamworksVersion)")
        SteamAPI.logger.logLevel = .trace
        guard let steam = SteamAPI() else {
            print("Steam API not starting.")
            return
        }
    }
}
