//
//  SteamUtils+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks

extension SteamUtils {
    /// Steamworks `ISteamUtils::FilterText()`
    public func filterText(context: TextFilteringContext, steamID: SteamID, inputMessage: String) -> (rc: Int, filteredText: String) {
        filterText(context: context, steamID: steamID, inputMessage: inputMessage, byteSizeOutFilteredText: inputMessage.utf8.count + 1)
    }

    /// Steamworks `ISteamUtils::GetImageRGBA()`
    public func getImageRGBA(imageIndex: Int) -> (rc: Bool, width: Int, height: Int, dest: [UInt8]) {
        let (rc, width, height) = getImageSize(imageIndex: imageIndex)
        guard rc else {
            return (rc, 0, 0, [])
        }
        let bytes = getImageRGBA(imageIndex: imageIndex, destBufferSize: width * height * 4) // per docs
        return (bytes.rc, width, height, bytes.dest)
    }
}
