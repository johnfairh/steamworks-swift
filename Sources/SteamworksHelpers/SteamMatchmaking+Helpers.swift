//
//  SteamMatchmaking+Helpers.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamMatchmaking {
    /// Steamworks `ISteamMatchmaking::GetLobbyChatEntry()` for strings
    public func getLobbyChatMsg(lobby: SteamID, chatIDIndex: Int) -> (rc: Int, user: SteamID, msg: String, chatEntryType: ChatEntryType) {
        var res: (rc: Int, user: SteamID, chatEntryType: ChatEntryType)! = nil
        let msg = String(unsafeUninitializedCapacity: 4096 /* docs */) { bufp in
            res = getLobbyChatEntry(lobby: lobby, chatIDIndex: chatIDIndex, data: bufp.baseAddress!, dataSize: 4096)
            return res.rc - 1 // steam counts the NUL, this API does not
        }
        return (rc: res.rc, user: res.user, msg: msg, chatEntryType: res.chatEntryType)
    }

    /// Steamworks `ISteamMatchmaking::SendLobbyChatMsg()` for strings
    @discardableResult
    public func sendLobbyChatMsg(lobby: SteamID, msg: String) -> Bool {
        let len = msg.utf8.count
        return msg.withCString { cstring in
            sendLobbyChatMsg(lobby: lobby, msgBody: cstring, msgBodySize: len + 1)
        }
    }
}

