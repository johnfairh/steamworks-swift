//
//  SteamInventory+Helpers.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
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

    /// Steamworks `ISteamInventory::GetItemDefinitionProperty()`
    public func getItemDefinitionProperty(definitionIndex: SteamItemDef, propertyName: String?) -> (rc: Bool, valueBuffer: String) {
        let (rc, _, count) = getItemDefinitionProperty(definitionIndex: definitionIndex,
                                                       propertyName: propertyName,
                                                       returnValueBuffer: false,
                                                       valueBufferSize: 0)
        guard rc else {
            return (false, "")
        }
        let ids = getItemDefinitionProperty(definitionIndex: definitionIndex,
                                            propertyName: propertyName,
                                            valueBufferSize: count)
        return (ids.rc, ids.valueBuffer)
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

    /// Steamworks `ISteamInventory::GetResultItemProperty()`
    public func getResultItemProperty(handle: SteamInventoryResult, itemIndex: Int, propertyName: String?) -> (rc: Bool, valueBuffer: String) {
        let (rc, _, count) = getResultItemProperty(handle: handle,
                                                   itemIndex: itemIndex,
                                                   propertyName: propertyName,
                                                   returnValueBuffer: false,
                                                   valueBufferSize: 0)
        guard rc else {
            return (rc, "")
        }
        let props = getResultItemProperty(handle: handle,
                                          itemIndex: itemIndex,
                                          propertyName: propertyName,
                                          valueBufferSize: count)
        return (props.rc, props.valueBuffer)
    }

    /// Steamworks `ISteamInventory::SerializeResult()`
    public func serializeResult(handle: SteamInventoryResult) -> (rc: Bool, buffer: [UInt8]) {
        let (rc, _, count) = serializeResult(handle: handle, returnBuffer: false, bufferSize: 0)
        guard rc else {
            return (false, [])
        }
        let ser = serializeResult(handle: handle, bufferSize: count)
        return (ser.rc, ser.buffer)
    }
}
