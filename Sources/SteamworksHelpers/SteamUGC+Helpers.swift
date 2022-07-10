//
//  SteamUGC+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamUGC {
    /// Steamworks `ISteamUGC::GetSubscribedItems()`
    public func getSubscribedItems() -> (rc: Int, publishedFileID: [PublishedFileID]) {
        getSubscribedItems(maxEntries: getNumSubscribedItems())
    }
}
