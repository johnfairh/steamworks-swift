//
//  SteamUtils+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamUtils {
    /// Steamworks `ISteamUtils::FilterText()`
    public func filterText(context: TextFilteringContext, steamID: SteamID, inputMessage: String) -> (rc: Int, filteredText: String) {
        filterText(context: context, steamID: steamID, inputMessage: inputMessage, byteSizeOutFilteredText: inputMessage.utf8.count + 1)
    }
}
