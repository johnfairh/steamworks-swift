//
//  SteamUGC.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamUGC`](https://partner.steamgames.com/doc/api/ISteamUGC)
///
/// Access via `SteamBaseAPI.ugc` through a `SteamAPI` or `SteamGameServerAPI` instance.
public struct SteamUGC {
    private let isServer: Bool
    var interface: UnsafeMutablePointer<ISteamUGC> {
        isServer ? SteamAPI_SteamGameServerUGC_v016() : SteamAPI_SteamUGC_v016()
    }

    init(isServer: Bool) {
        self.isServer = isServer
    }

    /// Steamworks `ISteamUGC::AddAppDependency()`, callback
    public func addAppDependency(publishedFileID: PublishedFileID, appID: AppID, completion: @escaping (AddAppDependencyResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_AddAppDependency(interface, PublishedFileId_t(publishedFileID), AppId_t(appID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::AddAppDependency()`, async
    func addAppDependency(publishedFileID: PublishedFileID, appID: AppID) async -> AddAppDependencyResult? {
        await withUnsafeContinuation {
            addAppDependency(publishedFileID: publishedFileID, appID: appID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::AddDependency()`, callback
    public func addDependency(parentPublishedFileID: PublishedFileID, childPublishedFileID: PublishedFileID, completion: @escaping (AddUGCDependencyResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_AddDependency(interface, PublishedFileId_t(parentPublishedFileID), PublishedFileId_t(childPublishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::AddDependency()`, async
    func addDependency(parentPublishedFileID: PublishedFileID, childPublishedFileID: PublishedFileID) async -> AddUGCDependencyResult? {
        await withUnsafeContinuation {
            addDependency(parentPublishedFileID: parentPublishedFileID, childPublishedFileID: childPublishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::AddExcludedTag()`
    @discardableResult
    public func addExcludedTag(handle: UGCQueryHandle, tagName: String) -> Bool {
        SteamAPI_ISteamUGC_AddExcludedTag(interface, UGCQueryHandle_t(handle), tagName)
    }

    /// Steamworks `ISteamUGC::AddItemKeyValueTag()`
    @discardableResult
    public func addItemKeyValueTag(handle: UGCUpdateHandle, key: String, value: String) -> Bool {
        SteamAPI_ISteamUGC_AddItemKeyValueTag(interface, UGCUpdateHandle_t(handle), key, value)
    }

    /// Steamworks `ISteamUGC::AddItemPreviewFile()`
    @discardableResult
    public func addItemPreviewFile(handle: UGCUpdateHandle, previewFile: String, type: ItemPreviewType) -> Bool {
        SteamAPI_ISteamUGC_AddItemPreviewFile(interface, UGCUpdateHandle_t(handle), previewFile, EItemPreviewType(type))
    }

    /// Steamworks `ISteamUGC::AddItemPreviewVideo()`
    @discardableResult
    public func addItemPreviewVideo(handle: UGCUpdateHandle, videoID: String) -> Bool {
        SteamAPI_ISteamUGC_AddItemPreviewVideo(interface, UGCUpdateHandle_t(handle), videoID)
    }

    /// Steamworks `ISteamUGC::AddItemToFavorites()`, callback
    public func addItemToFavorites(appId: AppID, publishedFileID: PublishedFileID, completion: @escaping (UserFavoriteItemsListChanged?) -> Void) {
        let rc = SteamAPI_ISteamUGC_AddItemToFavorites(interface, AppId_t(appId), PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::AddItemToFavorites()`, async
    func addItemToFavorites(appId: AppID, publishedFileID: PublishedFileID) async -> UserFavoriteItemsListChanged? {
        await withUnsafeContinuation {
            addItemToFavorites(appId: appId, publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::AddRequiredKeyValueTag()`
    @discardableResult
    public func addRequiredKeyValueTag(handle: UGCQueryHandle, key: String, value: String) -> Bool {
        SteamAPI_ISteamUGC_AddRequiredKeyValueTag(interface, UGCQueryHandle_t(handle), key, value)
    }

    /// Steamworks `ISteamUGC::AddRequiredTag()`
    @discardableResult
    public func addRequiredTag(handle: UGCQueryHandle, tagName: String) -> Bool {
        SteamAPI_ISteamUGC_AddRequiredTag(interface, UGCQueryHandle_t(handle), tagName)
    }

    /// Steamworks `ISteamUGC::AddRequiredTagGroup()`
    @discardableResult
    public func addRequiredTagGroup(handle: UGCQueryHandle, tagGroups: [String]) -> Bool {
        let tmp_tagGroups = StringArray(tagGroups)
        defer { tmp_tagGroups.deallocate() }
        return SteamAPI_ISteamUGC_AddRequiredTagGroup(interface, UGCQueryHandle_t(handle), .init(tmp_tagGroups))
    }

    /// Steamworks `ISteamUGC::BInitWorkshopForGameServer()`
    public func initWorkshopForGameServer(workshopDepotID: DepotID, folder: String) -> Bool {
        SteamAPI_ISteamUGC_BInitWorkshopForGameServer(interface, DepotId_t(workshopDepotID), folder)
    }

    /// Steamworks `ISteamUGC::CreateItem()`, callback
    public func createItem(consumerAppId: AppID, fileType: WorkshopFileType, completion: @escaping (CreateItemResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_CreateItem(interface, AppId_t(consumerAppId), EWorkshopFileType(fileType))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::CreateItem()`, async
    func createItem(consumerAppId: AppID, fileType: WorkshopFileType) async -> CreateItemResult? {
        await withUnsafeContinuation {
            createItem(consumerAppId: consumerAppId, fileType: fileType, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::CreateQueryAllUGCRequest()`
    public func createQueryAllUGCRequest(queryType: UGCQuery, matchingeMatchingUGCTypeFileType: UGCMatchingUGCType, creatorAppID: AppID, consumerAppID: AppID, cursor: String) -> UGCQueryHandle {
        UGCQueryHandle(SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor(interface, EUGCQuery(queryType), EUGCMatchingUGCType(matchingeMatchingUGCTypeFileType), AppId_t(creatorAppID), AppId_t(consumerAppID), cursor))
    }

    /// Steamworks `ISteamUGC::CreateQueryAllUGCRequest()`
    public func createQueryAllUGCRequest(queryType: UGCQuery, matchingeMatchingUGCTypeFileType: UGCMatchingUGCType, creatorAppID: AppID, consumerAppID: AppID, page: Int) -> UGCQueryHandle {
        UGCQueryHandle(SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage(interface, EUGCQuery(queryType), EUGCMatchingUGCType(matchingeMatchingUGCTypeFileType), AppId_t(creatorAppID), AppId_t(consumerAppID), uint32(page)))
    }

    /// Steamworks `ISteamUGC::CreateQueryUGCDetailsRequest()`
    public func createQueryUGCDetailsRequest(publishedFileID: inout PublishedFileID, numPublishedFileIDs: Int) -> UGCQueryHandle {
        var tmp_publishedFileID = PublishedFileId_t()
        let rc = UGCQueryHandle(SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest(interface, &tmp_publishedFileID, uint32(numPublishedFileIDs)))
        publishedFileID = PublishedFileID(tmp_publishedFileID)
        return rc
    }

    /// Steamworks `ISteamUGC::CreateQueryUserUGCRequest()`
    public func createQueryUserUGCRequest(accountID: AccountID, listType: UserUGCList, matchingUGCType: UGCMatchingUGCType, sortOrder: UserUGCListSortOrder, creatorAppID: AppID, consumerAppID: AppID, page: Int) -> UGCQueryHandle {
        UGCQueryHandle(SteamAPI_ISteamUGC_CreateQueryUserUGCRequest(interface, AccountID_t(accountID), EUserUGCList(listType), EUGCMatchingUGCType(matchingUGCType), EUserUGCListSortOrder(sortOrder), AppId_t(creatorAppID), AppId_t(consumerAppID), uint32(page)))
    }

    /// Steamworks `ISteamUGC::DeleteItem()`, callback
    public func deleteItem(publishedFileID: PublishedFileID, completion: @escaping (DeleteItemResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_DeleteItem(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::DeleteItem()`, async
    func deleteItem(publishedFileID: PublishedFileID) async -> DeleteItemResult? {
        await withUnsafeContinuation {
            deleteItem(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::DownloadItem()`
    public func downloadItem(publishedFileID: PublishedFileID, highPriority: Bool) -> Bool {
        SteamAPI_ISteamUGC_DownloadItem(interface, PublishedFileId_t(publishedFileID), highPriority)
    }

    /// Steamworks `ISteamUGC::GetAppDependencies()`, callback
    public func getAppDependencies(publishedFileID: PublishedFileID, completion: @escaping (GetAppDependenciesResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_GetAppDependencies(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::GetAppDependencies()`, async
    func getAppDependencies(publishedFileID: PublishedFileID) async -> GetAppDependenciesResult? {
        await withUnsafeContinuation {
            getAppDependencies(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::GetItemDownloadInfo()`
    public func getItemDownloadInfo(publishedFileID: PublishedFileID, bytesDownloaded: inout UInt64, bytesTotal: inout UInt64) -> Bool {
        SteamAPI_ISteamUGC_GetItemDownloadInfo(interface, PublishedFileId_t(publishedFileID), &bytesDownloaded, &bytesTotal)
    }

    /// Steamworks `ISteamUGC::GetItemInstallInfo()`
    public func getItemInstallInfo(publishedFileID: PublishedFileID, sizeOnDisk: inout UInt64, folder: inout String, folderSize: Int, timeStamp: inout RTime32) -> Bool {
        let tmp_folder = UnsafeMutableBufferPointer<CChar>.allocate(capacity: folderSize)
        defer { tmp_folder.deallocate() }
        var tmp_timeStamp = CSteamworks.RTime32()
        let rc = SteamAPI_ISteamUGC_GetItemInstallInfo(interface, PublishedFileId_t(publishedFileID), &sizeOnDisk, tmp_folder.baseAddress, uint32(folderSize), &tmp_timeStamp)
        if rc {
            folder = String(tmp_folder)
            timeStamp = RTime32(tmp_timeStamp)
        }
        return rc
    }

    /// Steamworks `ISteamUGC::GetItemState()`
    public func getItemState(publishedFileID: PublishedFileID) -> ItemState {
        ItemState(SteamAPI_ISteamUGC_GetItemState(interface, PublishedFileId_t(publishedFileID)))
    }

    /// Steamworks `ISteamUGC::GetItemUpdateProgress()`
    public func getItemUpdateProgress(handle: UGCUpdateHandle, bytesProcessed: inout UInt64, bytesTotal: inout UInt64) -> ItemUpdateStatus {
        ItemUpdateStatus(SteamAPI_ISteamUGC_GetItemUpdateProgress(interface, UGCUpdateHandle_t(handle), &bytesProcessed, &bytesTotal))
    }

    /// Steamworks `ISteamUGC::GetNumSubscribedItems()`
    public func getNumSubscribedItems() -> Int {
        Int(SteamAPI_ISteamUGC_GetNumSubscribedItems(interface))
    }

    /// Steamworks `ISteamUGC::GetQueryUGCKeyValueTag()`
    public func getQueryUGCKeyValueTag(handle: UGCQueryHandle, index: Int, key: String, value: inout String, valueSize: Int) -> Bool {
        let tmp_value = UnsafeMutableBufferPointer<CChar>.allocate(capacity: valueSize)
        defer { tmp_value.deallocate() }
        let rc = SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag(interface, UGCQueryHandle_t(handle), uint32(index), key, tmp_value.baseAddress, uint32(valueSize))
        value = String(tmp_value)
        return rc
    }

    /// Steamworks `ISteamUGC::GetQueryUGCAdditionalPreview()`
    @discardableResult
    public func getQueryUGCAdditionalPreview(handle: UGCQueryHandle, index: Int, previewIndex: Int, urlOrVideoID: inout String, urlSize: Int, originalFileName: inout String, originalFileNameSize: Int, previewType: inout ItemPreviewType) -> Bool {
        let tmp_urlOrVideoID = UnsafeMutableBufferPointer<CChar>.allocate(capacity: urlSize)
        defer { tmp_urlOrVideoID.deallocate() }
        let tmp_originalFileName = UnsafeMutableBufferPointer<CChar>.allocate(capacity: urlSize)
        defer { tmp_originalFileName.deallocate() }
        var tmp_previewType = EItemPreviewType(rawValue: 0)
        let rc = SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview(interface, UGCQueryHandle_t(handle), uint32(index), uint32(previewIndex), tmp_urlOrVideoID.baseAddress, uint32(urlSize), tmp_originalFileName.baseAddress, uint32(originalFileNameSize), &tmp_previewType)
        urlOrVideoID = String(tmp_urlOrVideoID)
        originalFileName = String(tmp_originalFileName)
        previewType = ItemPreviewType(tmp_previewType)
        return rc
    }

    /// Steamworks `ISteamUGC::GetQueryUGCChildren()`
    @discardableResult
    public func getQueryUGCChildren(handle: UGCQueryHandle, index: Int, publishedFileID: inout PublishedFileID, maxEntries: Int) -> Bool {
        var tmp_publishedFileID = PublishedFileId_t()
        let rc = SteamAPI_ISteamUGC_GetQueryUGCChildren(interface, UGCQueryHandle_t(handle), uint32(index), &tmp_publishedFileID, uint32(maxEntries))
        publishedFileID = PublishedFileID(tmp_publishedFileID)
        return rc
    }

    /// Steamworks `ISteamUGC::GetQueryUGCKeyValueTag()`
    @discardableResult
    public func getQueryUGCKeyValueTag(handle: UGCQueryHandle, index: Int, valueTagIndex: Int, key: inout String, keySize: Int, value: inout String, valueSize: Int) -> Bool {
        let tmp_key = UnsafeMutableBufferPointer<CChar>.allocate(capacity: keySize)
        defer { tmp_key.deallocate() }
        let tmp_value = UnsafeMutableBufferPointer<CChar>.allocate(capacity: valueSize)
        defer { tmp_value.deallocate() }
        let rc = SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag(interface, UGCQueryHandle_t(handle), uint32(index), uint32(valueTagIndex), tmp_key.baseAddress, uint32(keySize), tmp_value.baseAddress, uint32(valueSize))
        key = String(tmp_key)
        value = String(tmp_value)
        return rc
    }

    /// Steamworks `ISteamUGC::GetQueryUGCMetadata()`
    @discardableResult
    public func getQueryUGCMetadata(handle: UGCQueryHandle, index: Int, metadata: inout String, metadatasizeSize: Int) -> Bool {
        let tmp_metadata = UnsafeMutableBufferPointer<CChar>.allocate(capacity: metadatasizeSize)
        defer { tmp_metadata.deallocate() }
        let rc = SteamAPI_ISteamUGC_GetQueryUGCMetadata(interface, UGCQueryHandle_t(handle), uint32(index), tmp_metadata.baseAddress, uint32(metadatasizeSize))
        metadata = String(tmp_metadata)
        return rc
    }

    /// Steamworks `ISteamUGC::GetQueryUGCNumAdditionalPreviews()`
    public func getQueryUGCNumAdditionalPreviews(handle: UGCQueryHandle, index: Int) -> Int {
        Int(SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews(interface, UGCQueryHandle_t(handle), uint32(index)))
    }

    /// Steamworks `ISteamUGC::GetQueryUGCNumKeyValueTags()`
    public func getQueryUGCNumKeyValueTags(handle: UGCQueryHandle, index: Int) -> Int {
        Int(SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags(interface, UGCQueryHandle_t(handle), uint32(index)))
    }

    /// Steamworks `ISteamUGC::GetQueryUGCNumTags()`
    public func getQueryUGCNumTags(handle: UGCQueryHandle, index: Int) -> Int {
        Int(SteamAPI_ISteamUGC_GetQueryUGCNumTags(interface, UGCQueryHandle_t(handle), uint32(index)))
    }

    /// Steamworks `ISteamUGC::GetQueryUGCPreviewURL()`
    @discardableResult
    public func getQueryUGCPreviewURL(handle: UGCQueryHandle, index: Int, url: inout String, urlSize: Int) -> Bool {
        let tmp_url = UnsafeMutableBufferPointer<CChar>.allocate(capacity: urlSize)
        defer { tmp_url.deallocate() }
        let rc = SteamAPI_ISteamUGC_GetQueryUGCPreviewURL(interface, UGCQueryHandle_t(handle), uint32(index), tmp_url.baseAddress, uint32(urlSize))
        url = String(tmp_url)
        return rc
    }

    /// Steamworks `ISteamUGC::GetQueryUGCResult()`
    @discardableResult
    public func getQueryUGCResult(handle: UGCQueryHandle, index: Int, details: inout SteamUGCDetails) -> Bool {
        var tmp_details = SteamUGCDetails_t()
        let rc = SteamAPI_ISteamUGC_GetQueryUGCResult(interface, UGCQueryHandle_t(handle), uint32(index), &tmp_details)
        details = SteamUGCDetails(tmp_details)
        return rc
    }

    /// Steamworks `ISteamUGC::GetQueryUGCStatistic()`
    @discardableResult
    public func getQueryUGCStatistic(handle: UGCQueryHandle, index: Int, statType: ItemStatistic, statValue: inout UInt64) -> Bool {
        SteamAPI_ISteamUGC_GetQueryUGCStatistic(interface, UGCQueryHandle_t(handle), uint32(index), EItemStatistic(statType), &statValue)
    }

    /// Steamworks `ISteamUGC::GetQueryUGCTag()`
    @discardableResult
    public func getQueryUGCTag(handle: UGCQueryHandle, index: Int, tag: Int, value: inout String, valueSize: Int) -> Bool {
        let tmp_value = UnsafeMutableBufferPointer<CChar>.allocate(capacity: valueSize)
        defer { tmp_value.deallocate() }
        let rc = SteamAPI_ISteamUGC_GetQueryUGCTag(interface, UGCQueryHandle_t(handle), uint32(index), uint32(tag), tmp_value.baseAddress, uint32(valueSize))
        value = String(tmp_value)
        return rc
    }

    /// Steamworks `ISteamUGC::GetQueryUGCTagDisplayName()`
    @discardableResult
    public func getQueryUGCTagDisplayName(handle: UGCQueryHandle, index: Int, tag: Int, value: inout String, valueSize: Int) -> Bool {
        let tmp_value = UnsafeMutableBufferPointer<CChar>.allocate(capacity: valueSize)
        defer { tmp_value.deallocate() }
        let rc = SteamAPI_ISteamUGC_GetQueryUGCTagDisplayName(interface, UGCQueryHandle_t(handle), uint32(index), uint32(tag), tmp_value.baseAddress, uint32(valueSize))
        value = String(tmp_value)
        return rc
    }

    /// Steamworks `ISteamUGC::GetSubscribedItems()`
    public func getSubscribedItems(publishedFileID: inout [PublishedFileID], maxEntries: Int) -> Int {
        let tmp_publishedFileID = UnsafeMutableBufferPointer<PublishedFileId_t>.allocate(capacity: maxEntries)
        defer { tmp_publishedFileID.deallocate() }
        let rc = Int(SteamAPI_ISteamUGC_GetSubscribedItems(interface, tmp_publishedFileID.baseAddress, uint32(maxEntries)))
        publishedFileID = tmp_publishedFileID.map { PublishedFileID($0) }
        return rc
    }

    /// Steamworks `ISteamUGC::GetUserItemVote()`, callback
    public func getUserItemVote(publishedFileID: PublishedFileID, completion: @escaping (GetUserItemVoteResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_GetUserItemVote(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::GetUserItemVote()`, async
    func getUserItemVote(publishedFileID: PublishedFileID) async -> GetUserItemVoteResult? {
        await withUnsafeContinuation {
            getUserItemVote(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::GetWorkshopEULAStatus()`, callback
    public func getWorkshopEULAStatus(completion: @escaping (WorkshopEULAStatus?) -> Void) {
        let rc = SteamAPI_ISteamUGC_GetWorkshopEULAStatus(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::GetWorkshopEULAStatus()`, async
    func getWorkshopEULAStatus() async -> WorkshopEULAStatus? {
        await withUnsafeContinuation {
            getWorkshopEULAStatus(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::ReleaseQueryUGCRequest()`
    @discardableResult
    public func releaseQueryUGCRequest(handle: UGCQueryHandle) -> Bool {
        SteamAPI_ISteamUGC_ReleaseQueryUGCRequest(interface, UGCQueryHandle_t(handle))
    }

    /// Steamworks `ISteamUGC::RemoveAllItemKeyValueTags()`
    public func removeAllItemKeyValueTags(handle: UGCUpdateHandle) -> Bool {
        SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags(interface, UGCUpdateHandle_t(handle))
    }

    /// Steamworks `ISteamUGC::RemoveAppDependency()`, callback
    public func removeAppDependency(publishedFileID: PublishedFileID, appID: AppID, completion: @escaping (RemoveAppDependencyResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_RemoveAppDependency(interface, PublishedFileId_t(publishedFileID), AppId_t(appID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::RemoveAppDependency()`, async
    func removeAppDependency(publishedFileID: PublishedFileID, appID: AppID) async -> RemoveAppDependencyResult? {
        await withUnsafeContinuation {
            removeAppDependency(publishedFileID: publishedFileID, appID: appID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::RemoveDependency()`, callback
    public func removeDependency(parentPublishedFileID: PublishedFileID, childPublishedFileID: PublishedFileID, completion: @escaping (RemoveUGCDependencyResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_RemoveDependency(interface, PublishedFileId_t(parentPublishedFileID), PublishedFileId_t(childPublishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::RemoveDependency()`, async
    func removeDependency(parentPublishedFileID: PublishedFileID, childPublishedFileID: PublishedFileID) async -> RemoveUGCDependencyResult? {
        await withUnsafeContinuation {
            removeDependency(parentPublishedFileID: parentPublishedFileID, childPublishedFileID: childPublishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::RemoveItemFromFavorites()`, callback
    public func removeItemFromFavorites(appId: AppID, publishedFileID: PublishedFileID, completion: @escaping (UserFavoriteItemsListChanged?) -> Void) {
        let rc = SteamAPI_ISteamUGC_RemoveItemFromFavorites(interface, AppId_t(appId), PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::RemoveItemFromFavorites()`, async
    func removeItemFromFavorites(appId: AppID, publishedFileID: PublishedFileID) async -> UserFavoriteItemsListChanged? {
        await withUnsafeContinuation {
            removeItemFromFavorites(appId: appId, publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::RemoveItemKeyValueTags()`
    @discardableResult
    public func removeItemKeyValueTags(handle: UGCUpdateHandle, key: String) -> Bool {
        SteamAPI_ISteamUGC_RemoveItemKeyValueTags(interface, UGCUpdateHandle_t(handle), key)
    }

    /// Steamworks `ISteamUGC::RemoveItemPreview()`
    @discardableResult
    public func removeItemPreview(handle: UGCUpdateHandle, index: Int) -> Bool {
        SteamAPI_ISteamUGC_RemoveItemPreview(interface, UGCUpdateHandle_t(handle), uint32(index))
    }

    /// Steamworks `ISteamUGC::RequestUGCDetails()`, callback
    public func requestUGCDetails(publishedFileID: PublishedFileID, maxAgeSeconds: Int, completion: @escaping (SteamUGCRequestUGCDetailsResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_RequestUGCDetails(interface, PublishedFileId_t(publishedFileID), uint32(maxAgeSeconds))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::RequestUGCDetails()`, async
    func requestUGCDetails(publishedFileID: PublishedFileID, maxAgeSeconds: Int) async -> SteamUGCRequestUGCDetailsResult? {
        await withUnsafeContinuation {
            requestUGCDetails(publishedFileID: publishedFileID, maxAgeSeconds: maxAgeSeconds, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SendQueryUGCRequest()`, callback
    public func sendQueryUGCRequest(handle: UGCQueryHandle, completion: @escaping (SteamUGCQueryCompleted?) -> Void) {
        let rc = SteamAPI_ISteamUGC_SendQueryUGCRequest(interface, UGCQueryHandle_t(handle))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::SendQueryUGCRequest()`, async
    func sendQueryUGCRequest(handle: UGCQueryHandle) async -> SteamUGCQueryCompleted? {
        await withUnsafeContinuation {
            sendQueryUGCRequest(handle: handle, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SetAllowCachedResponse()`
    @discardableResult
    public func setAllowCachedResponse(handle: UGCQueryHandle, maxAgeSeconds: Int) -> Bool {
        SteamAPI_ISteamUGC_SetAllowCachedResponse(interface, UGCQueryHandle_t(handle), uint32(maxAgeSeconds))
    }

    /// Steamworks `ISteamUGC::SetAllowLegacyUpload()`
    public func setAllowLegacyUpload(handle: UGCUpdateHandle, allowLegacyUpload: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetAllowLegacyUpload(interface, UGCUpdateHandle_t(handle), allowLegacyUpload)
    }

    /// Steamworks `ISteamUGC::SetCloudFileNameFilter()`
    @discardableResult
    public func setCloudFileNameFilter(handle: UGCQueryHandle, matchCloudFileName: String) -> Bool {
        SteamAPI_ISteamUGC_SetCloudFileNameFilter(interface, UGCQueryHandle_t(handle), matchCloudFileName)
    }

    /// Steamworks `ISteamUGC::SetItemContent()`
    @discardableResult
    public func setItemContent(handle: UGCUpdateHandle, contentFolder: String) -> Bool {
        SteamAPI_ISteamUGC_SetItemContent(interface, UGCUpdateHandle_t(handle), contentFolder)
    }

    /// Steamworks `ISteamUGC::SetItemDescription()`
    @discardableResult
    public func setItemDescription(handle: UGCUpdateHandle, description: String) -> Bool {
        SteamAPI_ISteamUGC_SetItemDescription(interface, UGCUpdateHandle_t(handle), description)
    }

    /// Steamworks `ISteamUGC::SetItemMetadata()`
    @discardableResult
    public func setItemMetadata(handle: UGCUpdateHandle, metaData: String) -> Bool {
        SteamAPI_ISteamUGC_SetItemMetadata(interface, UGCUpdateHandle_t(handle), metaData)
    }

    /// Steamworks `ISteamUGC::SetItemPreview()`
    @discardableResult
    public func setItemPreview(handle: UGCUpdateHandle, previewFile: String) -> Bool {
        SteamAPI_ISteamUGC_SetItemPreview(interface, UGCUpdateHandle_t(handle), previewFile)
    }

    /// Steamworks `ISteamUGC::SetItemTags()`
    @discardableResult
    public func setItemTags(handle: UGCUpdateHandle, tags: [String]) -> Bool {
        let tmp_tags = StringArray(tags)
        defer { tmp_tags.deallocate() }
        return SteamAPI_ISteamUGC_SetItemTags(interface, UGCUpdateHandle_t(handle), .init(tmp_tags))
    }

    /// Steamworks `ISteamUGC::SetItemTitle()`
    @discardableResult
    public func setItemTitle(handle: UGCUpdateHandle, title: String) -> Bool {
        SteamAPI_ISteamUGC_SetItemTitle(interface, UGCUpdateHandle_t(handle), title)
    }

    /// Steamworks `ISteamUGC::SetItemUpdateLanguage()`
    @discardableResult
    public func setItemUpdateLanguage(handle: UGCUpdateHandle, language: String) -> Bool {
        SteamAPI_ISteamUGC_SetItemUpdateLanguage(interface, UGCUpdateHandle_t(handle), language)
    }

    /// Steamworks `ISteamUGC::SetItemVisibility()`
    @discardableResult
    public func setItemVisibility(handle: UGCUpdateHandle, visibility: RemoteStoragePublishedFileVisibility) -> Bool {
        SteamAPI_ISteamUGC_SetItemVisibility(interface, UGCUpdateHandle_t(handle), ERemoteStoragePublishedFileVisibility(visibility))
    }

    /// Steamworks `ISteamUGC::SetLanguage()`
    @discardableResult
    public func setLanguage(handle: UGCQueryHandle, language: String) -> Bool {
        SteamAPI_ISteamUGC_SetLanguage(interface, UGCQueryHandle_t(handle), language)
    }

    /// Steamworks `ISteamUGC::SetMatchAnyTag()`
    @discardableResult
    public func setMatchAnyTag(handle: UGCQueryHandle, matchAnyTag: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetMatchAnyTag(interface, UGCQueryHandle_t(handle), matchAnyTag)
    }

    /// Steamworks `ISteamUGC::SetRankedByTrendDays()`
    @discardableResult
    public func setRankedByTrendDays(handle: UGCQueryHandle, days: Int) -> Bool {
        SteamAPI_ISteamUGC_SetRankedByTrendDays(interface, UGCQueryHandle_t(handle), uint32(days))
    }

    /// Steamworks `ISteamUGC::SetReturnAdditionalPreviews()`
    @discardableResult
    public func setReturnAdditionalPreviews(handle: UGCQueryHandle, returnAdditionalPreviews: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetReturnAdditionalPreviews(interface, UGCQueryHandle_t(handle), returnAdditionalPreviews)
    }

    /// Steamworks `ISteamUGC::SetReturnChildren()`
    @discardableResult
    public func setReturnChildren(handle: UGCQueryHandle, returnChildren: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetReturnChildren(interface, UGCQueryHandle_t(handle), returnChildren)
    }

    /// Steamworks `ISteamUGC::SetReturnKeyValueTags()`
    @discardableResult
    public func setReturnKeyValueTags(handle: UGCQueryHandle, returnKeyValueTags: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetReturnKeyValueTags(interface, UGCQueryHandle_t(handle), returnKeyValueTags)
    }

    /// Steamworks `ISteamUGC::SetReturnLongDescription()`
    @discardableResult
    public func setReturnLongDescription(handle: UGCQueryHandle, returnLongDescription: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetReturnLongDescription(interface, UGCQueryHandle_t(handle), returnLongDescription)
    }

    /// Steamworks `ISteamUGC::SetReturnMetadata()`
    @discardableResult
    public func setReturnMetadata(handle: UGCQueryHandle, returnMetadata: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetReturnMetadata(interface, UGCQueryHandle_t(handle), returnMetadata)
    }

    /// Steamworks `ISteamUGC::SetReturnOnlyIDs()`
    @discardableResult
    public func setReturnOnlyIDs(handle: UGCQueryHandle, returnOnlyIDs: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetReturnOnlyIDs(interface, UGCQueryHandle_t(handle), returnOnlyIDs)
    }

    /// Steamworks `ISteamUGC::SetReturnPlaytimeStats()`
    @discardableResult
    public func setReturnPlaytimeStats(handle: UGCQueryHandle, days: Int) -> Bool {
        SteamAPI_ISteamUGC_SetReturnPlaytimeStats(interface, UGCQueryHandle_t(handle), uint32(days))
    }

    /// Steamworks `ISteamUGC::SetReturnTotalOnly()`
    @discardableResult
    public func setReturnTotalOnly(handle: UGCQueryHandle, returnTotalOnly: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetReturnTotalOnly(interface, UGCQueryHandle_t(handle), returnTotalOnly)
    }

    /// Steamworks `ISteamUGC::SetSearchText()`
    @discardableResult
    public func setSearchText(handle: UGCQueryHandle, searchText: String) -> Bool {
        SteamAPI_ISteamUGC_SetSearchText(interface, UGCQueryHandle_t(handle), searchText)
    }

    /// Steamworks `ISteamUGC::SetTimeCreatedDateRange()`
    public func setTimeCreatedDateRange(handle: UGCQueryHandle, start: RTime32, end: RTime32) -> Bool {
        SteamAPI_ISteamUGC_SetTimeCreatedDateRange(interface, UGCQueryHandle_t(handle), CSteamworks.RTime32(start), CSteamworks.RTime32(end))
    }

    /// Steamworks `ISteamUGC::SetTimeUpdatedDateRange()`
    public func setTimeUpdatedDateRange(handle: UGCQueryHandle, start: RTime32, end: RTime32) -> Bool {
        SteamAPI_ISteamUGC_SetTimeUpdatedDateRange(interface, UGCQueryHandle_t(handle), CSteamworks.RTime32(start), CSteamworks.RTime32(end))
    }

    /// Steamworks `ISteamUGC::SetUserItemVote()`, callback
    public func setUserItemVote(publishedFileID: PublishedFileID, voteUp: Bool, completion: @escaping (SetUserItemVoteResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_SetUserItemVote(interface, PublishedFileId_t(publishedFileID), voteUp)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::SetUserItemVote()`, async
    func setUserItemVote(publishedFileID: PublishedFileID, voteUp: Bool) async -> SetUserItemVoteResult? {
        await withUnsafeContinuation {
            setUserItemVote(publishedFileID: publishedFileID, voteUp: voteUp, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::ShowWorkshopEULA()`
    public func showWorkshopEULA() -> Bool {
        SteamAPI_ISteamUGC_ShowWorkshopEULA(interface)
    }

    /// Steamworks `ISteamUGC::StartItemUpdate()`
    public func startItemUpdate(consumerAppId: AppID, publishedFileID: PublishedFileID) -> UGCUpdateHandle {
        UGCUpdateHandle(SteamAPI_ISteamUGC_StartItemUpdate(interface, AppId_t(consumerAppId), PublishedFileId_t(publishedFileID)))
    }

    /// Steamworks `ISteamUGC::StartPlaytimeTracking()`, callback
    public func startPlaytimeTracking(publishedFileID: [PublishedFileID], completion: @escaping (StartPlaytimeTrackingResult?) -> Void) {
        var tmp_publishedFileID = publishedFileID.map { PublishedFileId_t($0) }
        let rc = SteamAPI_ISteamUGC_StartPlaytimeTracking(interface, &tmp_publishedFileID, uint32(publishedFileID.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::StartPlaytimeTracking()`, async
    func startPlaytimeTracking(publishedFileID: [PublishedFileID]) async -> StartPlaytimeTrackingResult? {
        await withUnsafeContinuation {
            startPlaytimeTracking(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::StopPlaytimeTracking()`, callback
    public func stopPlaytimeTracking(publishedFileID: [PublishedFileID], completion: @escaping (StopPlaytimeTrackingResult?) -> Void) {
        var tmp_publishedFileID = publishedFileID.map { PublishedFileId_t($0) }
        let rc = SteamAPI_ISteamUGC_StopPlaytimeTracking(interface, &tmp_publishedFileID, uint32(publishedFileID.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::StopPlaytimeTracking()`, async
    func stopPlaytimeTracking(publishedFileID: [PublishedFileID]) async -> StopPlaytimeTrackingResult? {
        await withUnsafeContinuation {
            stopPlaytimeTracking(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::StopPlaytimeTrackingForAllItems()`, callback
    public func stopPlaytimeTrackingForAllItems(completion: @escaping (StopPlaytimeTrackingResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::StopPlaytimeTrackingForAllItems()`, async
    func stopPlaytimeTrackingForAllItems() async -> StopPlaytimeTrackingResult? {
        await withUnsafeContinuation {
            stopPlaytimeTrackingForAllItems(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SubmitItemUpdate()`, callback
    public func submitItemUpdate(handle: UGCUpdateHandle, changeNote: String?, completion: @escaping (SubmitItemUpdateResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_SubmitItemUpdate(interface, UGCUpdateHandle_t(handle), changeNote)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::SubmitItemUpdate()`, async
    func submitItemUpdate(handle: UGCUpdateHandle, changeNote: String?) async -> SubmitItemUpdateResult? {
        await withUnsafeContinuation {
            submitItemUpdate(handle: handle, changeNote: changeNote, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SubscribeItem()`, callback
    public func subscribeItem(publishedFileID: PublishedFileID, completion: @escaping (RemoteStorageSubscribePublishedFileResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_SubscribeItem(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::SubscribeItem()`, async
    func subscribeItem(publishedFileID: PublishedFileID) async -> RemoteStorageSubscribePublishedFileResult? {
        await withUnsafeContinuation {
            subscribeItem(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SuspendDownloads()`
    public func suspendDownloads(suspend: Bool) {
        SteamAPI_ISteamUGC_SuspendDownloads(interface, suspend)
    }

    /// Steamworks `ISteamUGC::UnsubscribeItem()`, callback
    public func unsubscribeItem(publishedFileID: PublishedFileID, completion: @escaping (RemoteStorageUnsubscribePublishedFileResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_UnsubscribeItem(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::UnsubscribeItem()`, async
    func unsubscribeItem(publishedFileID: PublishedFileID) async -> RemoteStorageUnsubscribePublishedFileResult? {
        await withUnsafeContinuation {
            unsubscribeItem(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::UpdateItemPreviewFile()`
    @discardableResult
    public func updateItemPreviewFile(handle: UGCUpdateHandle, index: Int, previewFile: String) -> Bool {
        SteamAPI_ISteamUGC_UpdateItemPreviewFile(interface, UGCUpdateHandle_t(handle), uint32(index), previewFile)
    }

    /// Steamworks `ISteamUGC::UpdateItemPreviewVideo()`
    @discardableResult
    public func updateItemPreviewVideo(handle: UGCUpdateHandle, index: Int, videoID: String) -> Bool {
        SteamAPI_ISteamUGC_UpdateItemPreviewVideo(interface, UGCUpdateHandle_t(handle), uint32(index), videoID)
    }
}
