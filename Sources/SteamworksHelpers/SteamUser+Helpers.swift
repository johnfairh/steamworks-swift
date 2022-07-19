//
//  SteamUser+Helpers.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamUser {
    /// Steamworks `ISteamUser::GetEncryptedAppTicket()`
    public func getEncryptedAppTicket() -> [UInt8]? {
        let (_, _, size) = getEncryptedAppTicket(returnTicket: false, maxTicketSize: 0)
        let ticket = getEncryptedAppTicket(maxTicketSize: size)
        return ticket.rc ? ticket.ticket : nil
    }
}
