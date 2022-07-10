//
//  SteamFriends+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamFriends {
    /// Steamworks `ISteamFriends::GetFriendsGroupMembersList()`
    public func getFriendsGroupMembersList(friendsGroupID: FriendsGroupID) -> [SteamID] {
        getFriendsGroupMembersList(friendsGroupID: friendsGroupID, membersCount: getFriendsGroupMembersCount(friendsGroupID: friendsGroupID))
    }
}
