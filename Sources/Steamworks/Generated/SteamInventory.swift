//
//  SteamInventory.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamInventory`](https://partner.steamgames.com/doc/api/ISteamInventory)
///
/// Access via `SteamBaseAPI.inventory` through a `SteamAPI` or `SteamGameServerAPI` instance.
public struct SteamInventory {
    private let isServer: Bool
    var interface: UnsafeMutablePointer<ISteamInventory> {
        isServer ? SteamAPI_SteamGameServerInventory_v003() : SteamAPI_SteamInventory_v003()
    }

    init(isServer: Bool) {
        self.isServer = isServer
    }

    /// Steamworks `ISteamInventory::AddPromoItem()`
    public func addPromoItem(def: SteamItemDef) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_AddPromoItem(interface, &tmpResultHandle, SteamItemDef_t(def))
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::AddPromoItems()`
    public func addPromoItems(arrayItemDefs: [SteamItemDef]) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        var tmpArrayItemDefs = arrayItemDefs.map { SteamItemDef_t($0) }
        let rc = SteamAPI_ISteamInventory_AddPromoItems(interface, &tmpResultHandle, &tmpArrayItemDefs, uint32(arrayItemDefs.count))
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::CheckResultSteamID()`
    public func checkResultSteamID(handle: SteamInventoryResult, expected: SteamID) -> Bool {
        SteamAPI_ISteamInventory_CheckResultSteamID(interface, SteamInventoryResult_t(handle), CUnsignedLongLong(expected))
    }

    /// Steamworks `ISteamInventory::ConsumeItem()`
    public func consumeItem(consume: SteamItemInstanceID, quantity: Int) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_ConsumeItem(interface, &tmpResultHandle, SteamItemInstanceID_t(consume), uint32(quantity))
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::DeserializeResult()`
    public func deserializeResult(buffer: [UInt8], reservedMUSTBEFALSE: Bool = false) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_DeserializeResult(interface, &tmpResultHandle, buffer, uint32(buffer.count), reservedMUSTBEFALSE)
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::DestroyResult()`
    public func destroyResult(handle: SteamInventoryResult) {
        SteamAPI_ISteamInventory_DestroyResult(interface, SteamInventoryResult_t(handle))
    }

    /// Steamworks `ISteamInventory::ExchangeItems()`
    public func exchangeItems(arrayGenerate: [SteamItemDef], arrayGenerateQuantity: [Int], arrayDestroy: [SteamItemInstanceID], arrayDestroyQuantity: [Int]) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        var tmpArrayGenerate = arrayGenerate.map { SteamItemDef_t($0) }
        var tmpArrayGenerateQuantity = arrayGenerateQuantity.map { uint32($0) }
        var tmpArrayDestroy = arrayDestroy.map { SteamItemInstanceID_t($0) }
        var tmpArrayDestroyQuantity = arrayDestroyQuantity.map { uint32($0) }
        let rc = SteamAPI_ISteamInventory_ExchangeItems(interface, &tmpResultHandle, &tmpArrayGenerate, &tmpArrayGenerateQuantity, uint32(arrayGenerateQuantity.count), &tmpArrayDestroy, &tmpArrayDestroyQuantity, uint32(arrayDestroyQuantity.count))
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::GenerateItems()`
    public func generateItems(arrayItemDefs: [SteamItemDef], arrayQuantity: [Int]) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        var tmpArrayItemDefs = arrayItemDefs.map { SteamItemDef_t($0) }
        var tmpArrayQuantity = arrayQuantity.map { uint32($0) }
        let rc = SteamAPI_ISteamInventory_GenerateItems(interface, &tmpResultHandle, &tmpArrayItemDefs, &tmpArrayQuantity, uint32(arrayQuantity.count))
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::GetAllItems()`
    public func getAllItems() -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_GetAllItems(interface, &tmpResultHandle)
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::GetEligiblePromoItemDefinitionIDs()`
    public func getEligiblePromoItemDefinitionIDs(steamID: SteamID, itemDefIDsArraySize: Int) -> (rc: Bool, itemDefIDs: [SteamItemDef], itemDefIDsArraySize: Int) {
        let tmpItemDefIDs = SteamOutArray<SteamItemDef_t>(itemDefIDsArraySize)
        var tmpItemDefIDsArraySize = uint32(itemDefIDsArraySize)
        let rc = SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs(interface, CUnsignedLongLong(steamID), tmpItemDefIDs.steamArray, &tmpItemDefIDsArraySize)
        if rc {
            return (rc: rc, itemDefIDs: tmpItemDefIDs.swiftArray(Int(tmpItemDefIDsArraySize)), itemDefIDsArraySize: Int(tmpItemDefIDsArraySize))
        } else {
            return (rc: rc, itemDefIDs: [], itemDefIDsArraySize: 0)
        }
    }

    /// Steamworks `ISteamInventory::GetItemDefinitionIDs()`
    public func getItemDefinitionIDs(returnItemDefIDs: Bool = true, itemDefIDsArraySize: Int) -> (rc: Bool, itemDefIDs: [SteamItemDef], itemDefIDsArraySize: Int) {
        let tmpItemDefIDs = SteamOutArray<SteamItemDef_t>(itemDefIDsArraySize, returnItemDefIDs)
        var tmpItemDefIDsArraySize = uint32(itemDefIDsArraySize)
        let rc = SteamAPI_ISteamInventory_GetItemDefinitionIDs(interface, tmpItemDefIDs.steamArray, &tmpItemDefIDsArraySize)
        if rc {
            return (rc: rc, itemDefIDs: tmpItemDefIDs.swiftArray(Int(tmpItemDefIDsArraySize)), itemDefIDsArraySize: Int(tmpItemDefIDsArraySize))
        } else {
            return (rc: rc, itemDefIDs: [], itemDefIDsArraySize: 0)
        }
    }

    /// Steamworks `ISteamInventory::GetItemDefinitionProperty()`
    public func getItemDefinitionProperty(definitionIndex: SteamItemDef, propertyName: String?, returnValueBuffer: Bool = true, valueBufferSize: Int) -> (rc: Bool, valueBuffer: String, valueBufferSize: Int) {
        let tmpValueBuffer = SteamString(length: valueBufferSize, isReal: returnValueBuffer)
        var tmpValueBufferSize = uint32(valueBufferSize)
        let rc = SteamAPI_ISteamInventory_GetItemDefinitionProperty(interface, SteamItemDef_t(definitionIndex), propertyName, tmpValueBuffer.charBuffer, &tmpValueBufferSize)
        return (rc: rc, valueBuffer: tmpValueBuffer.swiftString, valueBufferSize: Int(tmpValueBufferSize))
    }

    /// Steamworks `ISteamInventory::GetItemPrice()`
    public func getItemPrice(definitionIndex: SteamItemDef) -> (rc: Bool, currentPrice: UInt64, basePrice: UInt64) {
        var tmpCurrentPrice = uint64()
        var tmpBasePrice = uint64()
        let rc = SteamAPI_ISteamInventory_GetItemPrice(interface, SteamItemDef_t(definitionIndex), &tmpCurrentPrice, &tmpBasePrice)
        return (rc: rc, currentPrice: tmpCurrentPrice, basePrice: tmpBasePrice)
    }

    /// Steamworks `ISteamInventory::GetItemsByID()`
    public func getItemsByID(instanceIDs: [SteamItemInstanceID]) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        var tmpInstanceIDs = instanceIDs.map { SteamItemInstanceID_t($0) }
        let rc = SteamAPI_ISteamInventory_GetItemsByID(interface, &tmpResultHandle, &tmpInstanceIDs, uint32(instanceIDs.count))
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::GetItemsWithPrices()`
    public func getItemsWithPrices(arrayLength: Int) -> (rc: Bool, arrayItemDefs: [SteamItemDef], currentPrices: [UInt64], basePrices: [UInt64]) {
        let tmpArrayItemDefs = SteamOutArray<SteamItemDef_t>(arrayLength)
        var tmpCurrentPrices = SteamTransOutArray<UInt64>(arrayLength)
        var tmpBasePrices = SteamTransOutArray<UInt64>(arrayLength)
        let rc = tmpCurrentPrices.setContent { nstCurrentPrices in
            tmpBasePrices.setContent { nstBasePrices in
                SteamAPI_ISteamInventory_GetItemsWithPrices(interface, tmpArrayItemDefs.steamArray, nstCurrentPrices, nstBasePrices, uint32(arrayLength))
            }
        }
        if rc {
            return (rc: rc, arrayItemDefs: tmpArrayItemDefs.swiftArray(), currentPrices: tmpCurrentPrices.swiftArray(), basePrices: tmpBasePrices.swiftArray())
        } else {
            return (rc: rc, arrayItemDefs: [], currentPrices: [], basePrices: [])
        }
    }

    /// Steamworks `ISteamInventory::GetNumItemsWithPrices()`
    public func getNumItemsWithPrices() -> Int {
        Int(SteamAPI_ISteamInventory_GetNumItemsWithPrices(interface))
    }

    /// Steamworks `ISteamInventory::GetResultItemProperty()`
    public func getResultItemProperty(handle: SteamInventoryResult, itemIndex: Int, propertyName: String?, returnValueBuffer: Bool = true, valueBufferSize: Int) -> (rc: Bool, valueBuffer: String, valueBufferSize: Int) {
        let tmpValueBuffer = SteamString(length: valueBufferSize, isReal: returnValueBuffer)
        var tmpValueBufferSize = uint32(valueBufferSize)
        let rc = SteamAPI_ISteamInventory_GetResultItemProperty(interface, SteamInventoryResult_t(handle), uint32(itemIndex), propertyName, tmpValueBuffer.charBuffer, &tmpValueBufferSize)
        return (rc: rc, valueBuffer: tmpValueBuffer.swiftString, valueBufferSize: Int(tmpValueBufferSize))
    }

    /// Steamworks `ISteamInventory::GetResultItems()`
    public func getResultItems(handle: SteamInventoryResult, returnItemsArray: Bool = true, itemsArraySize: Int) -> (rc: Bool, itemsArray: [SteamItemDetails], itemsArraySize: Int) {
        let tmpItemsArray = SteamOutArray<SteamItemDetails_t>(itemsArraySize, returnItemsArray)
        var tmpItemsArraySize = uint32(itemsArraySize)
        let rc = SteamAPI_ISteamInventory_GetResultItems(interface, SteamInventoryResult_t(handle), tmpItemsArray.steamArray, &tmpItemsArraySize)
        if rc {
            return (rc: rc, itemsArray: tmpItemsArray.swiftArray(Int(tmpItemsArraySize)), itemsArraySize: Int(tmpItemsArraySize))
        } else {
            return (rc: rc, itemsArray: [], itemsArraySize: 0)
        }
    }

    /// Steamworks `ISteamInventory::GetResultStatus()`
    public func getResultStatus(handle: SteamInventoryResult) -> Result {
        Result(SteamAPI_ISteamInventory_GetResultStatus(interface, SteamInventoryResult_t(handle)))
    }

    /// Steamworks `ISteamInventory::GetResultTimestamp()`
    public func getResultTimestamp(handle: SteamInventoryResult) -> RTime32 {
        RTime32(SteamAPI_ISteamInventory_GetResultTimestamp(interface, SteamInventoryResult_t(handle)))
    }

    /// Steamworks `ISteamInventory::GrantPromoItems()`
    public func grantPromoItems() -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_GrantPromoItems(interface, &tmpResultHandle)
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::InspectItem()`
    public func inspectItem(itemToken: String) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_InspectItem(interface, &tmpResultHandle, itemToken)
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::LoadItemDefinitions()`
    @discardableResult
    public func loadItemDefinitions() -> Bool {
        SteamAPI_ISteamInventory_LoadItemDefinitions(interface)
    }

    /// Steamworks `ISteamInventory::RemoveProperty()`
    public func removeProperty(handle: SteamInventoryUpdateHandle, itemID: SteamItemInstanceID, propertyName: String) -> Bool {
        SteamAPI_ISteamInventory_RemoveProperty(interface, SteamInventoryUpdateHandle_t(handle), SteamItemInstanceID_t(itemID), propertyName)
    }

    /// Steamworks `ISteamInventory::RequestEligiblePromoItemDefinitionsIDs()`, callback
    public func requestEligiblePromoItemDefinitionsIDs(steamID: SteamID, completion: @escaping (SteamInventoryEligiblePromoItemDefIDs?) -> Void) {
        let rc = SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs(interface, CUnsignedLongLong(steamID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamInventory::RequestEligiblePromoItemDefinitionsIDs()`, async
    public func requestEligiblePromoItemDefinitionsIDs(steamID: SteamID) async -> SteamInventoryEligiblePromoItemDefIDs? {
        await withUnsafeContinuation {
            requestEligiblePromoItemDefinitionsIDs(steamID: steamID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamInventory::RequestPrices()`, callback
    public func requestPrices(completion: @escaping (SteamInventoryRequestPricesResult?) -> Void) {
        let rc = SteamAPI_ISteamInventory_RequestPrices(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamInventory::RequestPrices()`, async
    public func requestPrices() async -> SteamInventoryRequestPricesResult? {
        await withUnsafeContinuation {
            requestPrices(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamInventory::SendItemDropHeartbeat()`
    public func sendItemDropHeartbeat() {
        SteamAPI_ISteamInventory_SendItemDropHeartbeat(interface)
    }

    /// Steamworks `ISteamInventory::SerializeResult()`
    public func serializeResult(handle: SteamInventoryResult, returnBuffer: Bool = true, bufferSize: Int) -> (rc: Bool, buffer: [UInt8], bufferSize: Int) {
        var tmpBuffer = SteamTransOutArray<UInt8>(bufferSize, returnBuffer)
        var tmpBufferSize = uint32(bufferSize)
        let rc = tmpBuffer.setContent { nstBuffer in
            SteamAPI_ISteamInventory_SerializeResult(interface, SteamInventoryResult_t(handle), nstBuffer, &tmpBufferSize)
        }
        return (rc: rc, buffer: tmpBuffer.swiftArray(), bufferSize: Int(tmpBufferSize))
    }

    /// Steamworks `ISteamInventory::SetProperty()`
    public func setProperty(handle: SteamInventoryUpdateHandle, itemID: SteamItemInstanceID, propertyName: String, value: Bool) -> Bool {
        SteamAPI_ISteamInventory_SetPropertyBool(interface, SteamInventoryUpdateHandle_t(handle), SteamItemInstanceID_t(itemID), propertyName, value)
    }

    /// Steamworks `ISteamInventory::SetProperty()`
    public func setProperty(handle: SteamInventoryUpdateHandle, itemID: SteamItemInstanceID, propertyName: String, value: Float) -> Bool {
        SteamAPI_ISteamInventory_SetPropertyFloat(interface, SteamInventoryUpdateHandle_t(handle), SteamItemInstanceID_t(itemID), propertyName, value)
    }

    /// Steamworks `ISteamInventory::SetProperty()`
    public func setProperty(handle: SteamInventoryUpdateHandle, itemID: SteamItemInstanceID, propertyName: String, value: Int) -> Bool {
        SteamAPI_ISteamInventory_SetPropertyInt64(interface, SteamInventoryUpdateHandle_t(handle), SteamItemInstanceID_t(itemID), propertyName, int64(value))
    }

    /// Steamworks `ISteamInventory::SetProperty()`
    public func setProperty(handle: SteamInventoryUpdateHandle, itemID: SteamItemInstanceID, propertyName: String, propertyValue: String) -> Bool {
        SteamAPI_ISteamInventory_SetPropertyString(interface, SteamInventoryUpdateHandle_t(handle), SteamItemInstanceID_t(itemID), propertyName, propertyValue)
    }

    /// Steamworks `ISteamInventory::StartPurchase()`, callback
    public func startPurchase(arrayItemDefs: [SteamItemDef], arrayQuantity: [Int], completion: @escaping (SteamInventoryStartPurchaseResult?) -> Void) {
        var tmpArrayItemDefs = arrayItemDefs.map { SteamItemDef_t($0) }
        var tmpArrayQuantity = arrayQuantity.map { uint32($0) }
        let rc = SteamAPI_ISteamInventory_StartPurchase(interface, &tmpArrayItemDefs, &tmpArrayQuantity, uint32(arrayQuantity.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamInventory::StartPurchase()`, async
    public func startPurchase(arrayItemDefs: [SteamItemDef], arrayQuantity: [Int]) async -> SteamInventoryStartPurchaseResult? {
        await withUnsafeContinuation {
            startPurchase(arrayItemDefs: arrayItemDefs, arrayQuantity: arrayQuantity, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamInventory::StartUpdateProperties()`
    public func startUpdateProperties() -> SteamInventoryUpdateHandle {
        SteamInventoryUpdateHandle(SteamAPI_ISteamInventory_StartUpdateProperties(interface))
    }

    /// Steamworks `ISteamInventory::SubmitUpdateProperties()`
    public func submitUpdateProperties(handle: SteamInventoryUpdateHandle) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_SubmitUpdateProperties(interface, SteamInventoryUpdateHandle_t(handle), &tmpResultHandle)
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::TransferItemQuantity()`
    public func transferItemQuantity(idSource: SteamItemInstanceID, quantity: Int, idDest: SteamItemInstanceID) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_TransferItemQuantity(interface, &tmpResultHandle, SteamItemInstanceID_t(idSource), uint32(quantity), SteamItemInstanceID_t(idDest))
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }

    /// Steamworks `ISteamInventory::TriggerItemDrop()`
    public func triggerItemDrop(listDefinition: SteamItemDef) -> (rc: Bool, resultHandle: SteamInventoryResult) {
        var tmpResultHandle = SteamInventoryResult_t()
        let rc = SteamAPI_ISteamInventory_TriggerItemDrop(interface, &tmpResultHandle, SteamItemDef_t(listDefinition))
        return (rc: rc, resultHandle: SteamInventoryResult(tmpResultHandle))
    }
}
