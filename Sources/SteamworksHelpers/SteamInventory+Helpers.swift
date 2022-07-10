//
//  SteamInventory+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Steamworks

extension SteamInventory {
    /// Steamworks `ISteamInventory::GetItemDefinitionIDs()`
    public func getItemDefinitionIDs() -> (rc: Bool, itemDefIDs: [SteamItemDef]) {
        let (rc, _, count) = getItemDefinitionIDs(returnItemDefIDs: false, itemDefIDsArraySize: 0)
        guard rc else {
            return (false, [])
        }
        let ids = getItemDefinitionIDs(itemDefIDsArraySize: count)
        return (ids.rc, ids.itemDefIDs)
    }

    /// Steamworks `ISteamInventory::GetItemsWithPrices()`
    public func getItemsWithPrices() -> (rc: Bool, arrayItemDefs: [SteamItemDef], currentPrices: [UInt64], basePrices: [UInt64]) {
        getItemsWithPrices(arrayLength: getNumItemsWithPrices())
    }

    /// Steamworks `ISteamInventory::GetResultItems()`
    public func getResultItems(handle: SteamInventoryResult) -> (rc: Bool, itemsArray: [SteamItemDetails]) {
        let (rc, _, count) = getResultItems(handle: handle, returnItemsArray: false, itemsArraySize: 0)
        guard rc else {
            return (false, [])
        }
        let ids = getResultItems(handle: handle, itemsArraySize: count)
        return (ids.rc, ids.itemsArray)
    }
}
