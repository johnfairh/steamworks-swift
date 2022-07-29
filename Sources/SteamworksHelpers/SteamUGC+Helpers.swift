//
//  SteamUGC+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks

extension SteamUGC {
    /// Steamworks `ISteamUGC::GetSubscribedItems()`
    public func getSubscribedItems() -> (rc: Int, publishedFileID: [PublishedFileID]) {
        getSubscribedItems(maxEntries: getNumSubscribedItems())
    }
}
