//
//  SteamGameSearch.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamGameSearch`](https://partner.steamgames.com/doc/api/ISteamGameSearch)
///
/// Access via `SteamAPI.gameSearch`.
public struct SteamGameSearch {
    var interface: UnsafeMutablePointer<ISteamGameSearch> {
        SteamAPI_SteamGameSearch_v001()
    }

    init() {
    }

    /// Steamworks `ISteamGameSearch::AcceptGame()`
    public func acceptGame() -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_AcceptGame(interface))
    }

    /// Steamworks `ISteamGameSearch::AddGameSearchParams()`
    public func addGameSearchParams(keyToFind: String, valuesToFind: String) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_AddGameSearchParams(interface, keyToFind, valuesToFind))
    }

    /// Steamworks `ISteamGameSearch::CancelRequestPlayersForGame()`
    public func cancelRequestPlayersForGame() -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_CancelRequestPlayersForGame(interface))
    }

    /// Steamworks `ISteamGameSearch::DeclineGame()`
    public func declineGame() -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_DeclineGame(interface))
    }

    /// Steamworks `ISteamGameSearch::EndGame()`
    public func endGame(uniqueGameID: UInt64) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_EndGame(interface, uniqueGameID))
    }

    /// Steamworks `ISteamGameSearch::EndGameSearch()`
    public func endGameSearch() -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_EndGameSearch(interface))
    }

    /// Steamworks `ISteamGameSearch::HostConfirmGameStart()`
    public func hostConfirmGameStart(uniqueGameID: UInt64) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_HostConfirmGameStart(interface, uniqueGameID))
    }

    /// Steamworks `ISteamGameSearch::RequestPlayersForGame()`
    public func requestPlayersForGame(playerMin: Int, playerMax: Int, maxTeamSize: Int) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_RequestPlayersForGame(interface, CInt(playerMin), CInt(playerMax), CInt(maxTeamSize)))
    }

    /// Steamworks `ISteamGameSearch::RetrieveConnectionDetails()`
    public func retrieveConnectionDetails(host: SteamID, connectionDetailsSize: Int) -> (rc: GameSearchErrorCode, connectionDetails: String) {
        var tmpConnectionDetails = SteamOutString(length: connectionDetailsSize)
        let rc = tmpConnectionDetails.setContent { nstConnectionDetails in
            GameSearchErrorCode(SteamAPI_ISteamGameSearch_RetrieveConnectionDetails(interface, CUnsignedLongLong(host), nstConnectionDetails, CInt(connectionDetailsSize)))
        }
        return (rc: rc, connectionDetails: tmpConnectionDetails.swiftString)
    }

    /// Steamworks `ISteamGameSearch::SearchForGameSolo()`
    public func searchForGameSolo(playerMin: Int, playerMax: Int) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_SearchForGameSolo(interface, CInt(playerMin), CInt(playerMax)))
    }

    /// Steamworks `ISteamGameSearch::SearchForGameWithLobby()`
    public func searchForGameWithLobby(lobby: SteamID, playerMin: Int, playerMax: Int) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_SearchForGameWithLobby(interface, CUnsignedLongLong(lobby), CInt(playerMin), CInt(playerMax)))
    }

    /// Steamworks `ISteamGameSearch::SetConnectionDetails()`
    public func setConnectionDetails(connectionDetails: String, connectionDetailsSize: Int) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_SetConnectionDetails(interface, connectionDetails, CInt(connectionDetailsSize)))
    }

    /// Steamworks `ISteamGameSearch::SetGameHostParams()`
    public func setGameHostParams(key: String, value: String) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_SetGameHostParams(interface, key, value))
    }

    /// Steamworks `ISteamGameSearch::SubmitPlayerResult()`
    public func submitPlayerResult(uniqueGameID: UInt64, player: SteamID, ePlayerResult: PlayerResult) -> GameSearchErrorCode {
        GameSearchErrorCode(SteamAPI_ISteamGameSearch_SubmitPlayerResult(interface, uniqueGameID, CUnsignedLongLong(player), EPlayerResult_t(ePlayerResult)))
    }
}
