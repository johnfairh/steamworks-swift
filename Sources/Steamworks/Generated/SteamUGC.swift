//
//  SteamUGC.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

internal import CSteamworks

/// Steamworks [`ISteamUGC`](https://partner.steamgames.com/doc/api/ISteamUGC)
///
/// Access via ``SteamBaseAPI/ugc`` through a ``SteamAPI`` or ``SteamGameServerAPI`` instance.
public struct SteamUGC: Sendable {
    private let isServer: Bool
    var interface: UnsafeMutablePointer<ISteamUGC> {
        isServer ? SteamAPI_SteamGameServerUGC_v020() : SteamAPI_SteamUGC_v020()
    }

    init(isServer: Bool) {
        self.isServer = isServer
    }

    /// Steamworks `ISteamUGC::AddAppDependency()`, callback
    public func addAppDependency(publishedFileID: PublishedFileID, appID: AppID, completion: @Sendable @escaping (sending AddAppDependencyResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_AddAppDependency(interface, PublishedFileId_t(publishedFileID), AppId_t(appID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::AddAppDependency()`, async
    public func addAppDependency(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID, appID: AppID) async -> AddAppDependencyResult? {
        await withUnsafeContinuation {
            addAppDependency(publishedFileID: publishedFileID, appID: appID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::AddContentDescriptor()`
    public func addContentDescriptor(handle: UGCUpdateHandle, descid: UGCContentDescriptorID) -> Bool {
        SteamAPI_ISteamUGC_AddContentDescriptor(interface, UGCUpdateHandle_t(handle), EUGCContentDescriptorID(descid))
    }

    /// Steamworks `ISteamUGC::AddDependency()`, callback
    public func addDependency(parentPublishedFileID: PublishedFileID, childPublishedFileID: PublishedFileID, completion: @Sendable @escaping (sending AddUGCDependencyResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_AddDependency(interface, PublishedFileId_t(parentPublishedFileID), PublishedFileId_t(childPublishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::AddDependency()`, async
    public func addDependency(isolation: isolated (any Actor)? = #isolation, parentPublishedFileID: PublishedFileID, childPublishedFileID: PublishedFileID) async -> AddUGCDependencyResult? {
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
    public func addItemToFavorites(appId: AppID, publishedFileID: PublishedFileID, completion: @Sendable @escaping (sending UserFavoriteItemsListChanged?) -> Void) {
        let rc = SteamAPI_ISteamUGC_AddItemToFavorites(interface, AppId_t(appId), PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::AddItemToFavorites()`, async
    public func addItemToFavorites(isolation: isolated (any Actor)? = #isolation, appId: AppID, publishedFileID: PublishedFileID) async -> UserFavoriteItemsListChanged? {
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
        let tmpTagGroups = StringArray(tagGroups)
        defer { tmpTagGroups.deallocate() }
        return SteamAPI_ISteamUGC_AddRequiredTagGroup(interface, UGCQueryHandle_t(handle), .init(tmpTagGroups))
    }

    /// Steamworks `ISteamUGC::BInitWorkshopForGameServer()`
    public func initWorkshopForGameServer(workshopDepotID: DepotID, folder: String) -> Bool {
        SteamAPI_ISteamUGC_BInitWorkshopForGameServer(interface, DepotId_t(workshopDepotID), folder)
    }

    /// Steamworks `ISteamUGC::CreateItem()`, callback
    public func createItem(consumerAppId: AppID, fileType: WorkshopFileType, completion: @Sendable @escaping (sending CreateItemResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_CreateItem(interface, AppId_t(consumerAppId), EWorkshopFileType(fileType))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::CreateItem()`, async
    public func createItem(isolation: isolated (any Actor)? = #isolation, consumerAppId: AppID, fileType: WorkshopFileType) async -> CreateItemResult? {
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
    public func createQueryUGCDetailsRequest(publishedFileID: [PublishedFileID]) -> UGCQueryHandle {
        var tmpPublishedFileID = publishedFileID.map { PublishedFileId_t($0) }
        return UGCQueryHandle(SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest(interface, &tmpPublishedFileID, uint32(publishedFileID.count)))
    }

    /// Steamworks `ISteamUGC::CreateQueryUserUGCRequest()`
    public func createQueryUserUGCRequest(accountID: AccountID, listType: UserUGCList, matchingUGCType: UGCMatchingUGCType, sortOrder: UserUGCListSortOrder, creatorAppID: AppID, consumerAppID: AppID, page: Int) -> UGCQueryHandle {
        UGCQueryHandle(SteamAPI_ISteamUGC_CreateQueryUserUGCRequest(interface, AccountID_t(accountID), EUserUGCList(listType), EUGCMatchingUGCType(matchingUGCType), EUserUGCListSortOrder(sortOrder), AppId_t(creatorAppID), AppId_t(consumerAppID), uint32(page)))
    }

    /// Steamworks `ISteamUGC::DeleteItem()`, callback
    public func deleteItem(publishedFileID: PublishedFileID, completion: @Sendable @escaping (sending DeleteItemResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_DeleteItem(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::DeleteItem()`, async
    public func deleteItem(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID) async -> DeleteItemResult? {
        await withUnsafeContinuation {
            deleteItem(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::DownloadItem()`
    public func downloadItem(publishedFileID: PublishedFileID, highPriority: Bool) -> Bool {
        SteamAPI_ISteamUGC_DownloadItem(interface, PublishedFileId_t(publishedFileID), highPriority)
    }

    /// Steamworks `ISteamUGC::GetAppDependencies()`, callback
    public func getAppDependencies(publishedFileID: PublishedFileID, completion: @Sendable @escaping (sending GetAppDependenciesResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_GetAppDependencies(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::GetAppDependencies()`, async
    public func getAppDependencies(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID) async -> GetAppDependenciesResult? {
        await withUnsafeContinuation {
            getAppDependencies(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::GetItemDownloadInfo()`
    public func getItemDownloadInfo(publishedFileID: PublishedFileID) -> (rc: Bool, bytesDownloaded: UInt64, bytesTotal: UInt64) {
        var tmpBytesDownloaded = uint64()
        var tmpBytesTotal = uint64()
        let rc = SteamAPI_ISteamUGC_GetItemDownloadInfo(interface, PublishedFileId_t(publishedFileID), &tmpBytesDownloaded, &tmpBytesTotal)
        return (rc: rc, bytesDownloaded: tmpBytesDownloaded, bytesTotal: tmpBytesTotal)
    }

    /// Steamworks `ISteamUGC::GetItemInstallInfo()`
    public func getItemInstallInfo(publishedFileID: PublishedFileID, folderSize: Int = SteamConstants.filenameMaxSize) -> (rc: Bool, sizeOnDisk: UInt64, folder: String, timeStamp: RTime32) {
        var tmpSizeOnDisk = uint64()
        var tmpFolder = SteamOutString(length: folderSize)
        var tmpTimeStamp = CSteamworks.RTime32()
        let rc = tmpFolder.setContent { nstFolder in
            SteamAPI_ISteamUGC_GetItemInstallInfo(interface, PublishedFileId_t(publishedFileID), &tmpSizeOnDisk, nstFolder, uint32(folderSize), &tmpTimeStamp)
        }
        if rc {
            return (rc: rc, sizeOnDisk: tmpSizeOnDisk, folder: tmpFolder.swiftString, timeStamp: RTime32(tmpTimeStamp))
        } else {
            return (rc: rc, sizeOnDisk: 0, folder: "", timeStamp: 0)
        }
    }

    /// Steamworks `ISteamUGC::GetItemState()`
    public func getItemState(publishedFileID: PublishedFileID) -> ItemState {
        ItemState(SteamAPI_ISteamUGC_GetItemState(interface, PublishedFileId_t(publishedFileID)))
    }

    /// Steamworks `ISteamUGC::GetItemUpdateProgress()`
    public func getItemUpdateProgress(handle: UGCUpdateHandle) -> (rc: ItemUpdateStatus, bytesProcessed: UInt64, bytesTotal: UInt64) {
        var tmpBytesProcessed = uint64()
        var tmpBytesTotal = uint64()
        let rc = ItemUpdateStatus(SteamAPI_ISteamUGC_GetItemUpdateProgress(interface, UGCUpdateHandle_t(handle), &tmpBytesProcessed, &tmpBytesTotal))
        return (rc: rc, bytesProcessed: tmpBytesProcessed, bytesTotal: tmpBytesTotal)
    }

    /// Steamworks `ISteamUGC::GetNumSubscribedItems()`
    public func getNumSubscribedItems() -> Int {
        Int(SteamAPI_ISteamUGC_GetNumSubscribedItems(interface))
    }

    /// Steamworks `ISteamUGC::GetNumSupportedGameVersions()`
    public func getNumSupportedGameVersions(handle: UGCQueryHandle, index: Int) -> Int {
        Int(SteamAPI_ISteamUGC_GetNumSupportedGameVersions(interface, UGCQueryHandle_t(handle), uint32(index)))
    }

    /// Steamworks `ISteamUGC::GetQueryUGCKeyValueTag()`
    public func getQueryUGCKeyValueTag(handle: UGCQueryHandle, index: Int, key: String, valueSize: Int = SteamConstants.ugcKeyValueMaxSize + 1) -> (rc: Bool, value: String) {
        var tmpValue = SteamOutString(length: valueSize)
        let rc = tmpValue.setContent { nstValue in
            SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag(interface, UGCQueryHandle_t(handle), uint32(index), key, nstValue, uint32(valueSize))
        }
        return (rc: rc, value: tmpValue.swiftString)
    }

    /// Steamworks `ISteamUGC::GetQueryUGCAdditionalPreview()`
    public func getQueryUGCAdditionalPreview(handle: UGCQueryHandle, index: Int, previewIndex: Int, urlSize: Int = SteamConstants.filenameMaxSize, returnOriginalFileName: Bool = true, originalFileNameSize: Int = SteamConstants.filenameMaxSize) -> (rc: Bool, urlOrVideoID: String, originalFileName: String, previewType: ItemPreviewType) {
        var tmpUrlOrVideoID = SteamOutString(length: urlSize)
        var tmpOriginalFileName = SteamOutString(length: urlSize, isReal: returnOriginalFileName)
        var tmpPreviewType = EItemPreviewType(rawValue: 0)
        let rc = tmpUrlOrVideoID.setContent { nstUrlOrVideoID in
            tmpOriginalFileName.setContent { nstOriginalFileName in
                SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview(interface, UGCQueryHandle_t(handle), uint32(index), uint32(previewIndex), nstUrlOrVideoID, uint32(urlSize), nstOriginalFileName, uint32(originalFileNameSize), &tmpPreviewType)
            }
        }
        if rc {
            return (rc: rc, urlOrVideoID: tmpUrlOrVideoID.swiftString, originalFileName: tmpOriginalFileName.swiftString, previewType: ItemPreviewType(tmpPreviewType))
        } else {
            return (rc: rc, urlOrVideoID: "", originalFileName: "", previewType: .image)
        }
    }

    /// Steamworks `ISteamUGC::GetQueryUGCChildren()`
    public func getQueryUGCChildren(handle: UGCQueryHandle, index: Int, maxEntries: Int) -> (rc: Bool, publishedFileID: PublishedFileID) {
        var tmpPublishedFileID = PublishedFileId_t()
        let rc = SteamAPI_ISteamUGC_GetQueryUGCChildren(interface, UGCQueryHandle_t(handle), uint32(index), &tmpPublishedFileID, uint32(maxEntries))
        if rc {
            return (rc: rc, publishedFileID: PublishedFileID(tmpPublishedFileID))
        } else {
            return (rc: rc, publishedFileID: 0)
        }
    }

    /// Steamworks `ISteamUGC::GetQueryUGCContentDescriptors()`
    public func getQueryUGCContentDescriptors(handle: UGCQueryHandle, index: Int, maxEntries: Int) -> (rc: Int, descriptors: [UGCContentDescriptorID]) {
        let tmpDescriptors = SteamOutArray<EUGCContentDescriptorID>(maxEntries)
        let rc = Int(SteamAPI_ISteamUGC_GetQueryUGCContentDescriptors(interface, UGCQueryHandle_t(handle), uint32(index), tmpDescriptors.steamArray, uint32(maxEntries)))
        return (rc: rc, descriptors: tmpDescriptors.swiftArray())
    }

    /// Steamworks `ISteamUGC::GetQueryUGCKeyValueTag()`
    public func getQueryUGCKeyValueTag(handle: UGCQueryHandle, index: Int, valueTagIndex: Int, keySize: Int = SteamConstants.ugcKeyValueMaxSize + 1, valueSize: Int = SteamConstants.ugcKeyValueMaxSize + 1) -> (rc: Bool, key: String, value: String) {
        var tmpKey = SteamOutString(length: keySize)
        var tmpValue = SteamOutString(length: valueSize)
        let rc = tmpKey.setContent { nstKey in
            tmpValue.setContent { nstValue in
                SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag(interface, UGCQueryHandle_t(handle), uint32(index), uint32(valueTagIndex), nstKey, uint32(keySize), nstValue, uint32(valueSize))
            }
        }
        if rc {
            return (rc: rc, key: tmpKey.swiftString, value: tmpValue.swiftString)
        } else {
            return (rc: rc, key: "", value: "")
        }
    }

    /// Steamworks `ISteamUGC::GetQueryUGCMetadata()`
    public func getQueryUGCMetadata(handle: UGCQueryHandle, index: Int, metadatasizeSize: Int) -> (rc: Bool, metadata: String) {
        var tmpMetadata = SteamOutString(length: metadatasizeSize)
        let rc = tmpMetadata.setContent { nstMetadata in
            SteamAPI_ISteamUGC_GetQueryUGCMetadata(interface, UGCQueryHandle_t(handle), uint32(index), nstMetadata, uint32(metadatasizeSize))
        }
        if rc {
            return (rc: rc, metadata: tmpMetadata.swiftString)
        } else {
            return (rc: rc, metadata: "")
        }
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
    public func getQueryUGCPreviewURL(handle: UGCQueryHandle, index: Int, urlSize: Int = SteamConstants.filenameMaxSize) -> (rc: Bool, url: String) {
        var tmpUrl = SteamOutString(length: urlSize)
        let rc = tmpUrl.setContent { nstUrl in
            SteamAPI_ISteamUGC_GetQueryUGCPreviewURL(interface, UGCQueryHandle_t(handle), uint32(index), nstUrl, uint32(urlSize))
        }
        if rc {
            return (rc: rc, url: tmpUrl.swiftString)
        } else {
            return (rc: rc, url: "")
        }
    }

    /// Steamworks `ISteamUGC::GetQueryUGCResult()`
    public func getQueryUGCResult(handle: UGCQueryHandle, index: Int) -> (rc: Bool, details: SteamUGCDetails) {
        var tmpDetails = SteamUGCDetails_t()
        let rc = SteamAPI_ISteamUGC_GetQueryUGCResult(interface, UGCQueryHandle_t(handle), uint32(index), &tmpDetails)
        if rc {
            return (rc: rc, details: SteamUGCDetails(tmpDetails))
        } else {
            return (rc: rc, details: SteamUGCDetails())
        }
    }

    /// Steamworks `ISteamUGC::GetQueryUGCStatistic()`
    public func getQueryUGCStatistic(handle: UGCQueryHandle, index: Int, statType: ItemStatistic) -> (rc: Bool, statValue: UInt64) {
        var tmpStatValue = uint64()
        let rc = SteamAPI_ISteamUGC_GetQueryUGCStatistic(interface, UGCQueryHandle_t(handle), uint32(index), EItemStatistic(statType), &tmpStatValue)
        return (rc: rc, statValue: tmpStatValue)
    }

    /// Steamworks `ISteamUGC::GetQueryUGCTag()`
    public func getQueryUGCTag(handle: UGCQueryHandle, index: Int, tag: Int, valueSize: Int = SteamConstants.ugcKeyValueMaxSize + 1) -> (rc: Bool, value: String) {
        var tmpValue = SteamOutString(length: valueSize)
        let rc = tmpValue.setContent { nstValue in
            SteamAPI_ISteamUGC_GetQueryUGCTag(interface, UGCQueryHandle_t(handle), uint32(index), uint32(tag), nstValue, uint32(valueSize))
        }
        if rc {
            return (rc: rc, value: tmpValue.swiftString)
        } else {
            return (rc: rc, value: "")
        }
    }

    /// Steamworks `ISteamUGC::GetQueryUGCTagDisplayName()`
    public func getQueryUGCTagDisplayName(handle: UGCQueryHandle, index: Int, tag: Int, valueSize: Int = SteamConstants.ugcKeyValueMaxSize + 1) -> (rc: Bool, value: String) {
        var tmpValue = SteamOutString(length: valueSize)
        let rc = tmpValue.setContent { nstValue in
            SteamAPI_ISteamUGC_GetQueryUGCTagDisplayName(interface, UGCQueryHandle_t(handle), uint32(index), uint32(tag), nstValue, uint32(valueSize))
        }
        if rc {
            return (rc: rc, value: tmpValue.swiftString)
        } else {
            return (rc: rc, value: "")
        }
    }

    /// Steamworks `ISteamUGC::GetSubscribedItems()`
    public func getSubscribedItems(maxEntries: Int) -> (rc: Int, publishedFileID: [PublishedFileID]) {
        let tmpPublishedFileID = SteamOutArray<PublishedFileId_t>(maxEntries)
        let rc = Int(SteamAPI_ISteamUGC_GetSubscribedItems(interface, tmpPublishedFileID.steamArray, uint32(maxEntries)))
        return (rc: rc, publishedFileID: tmpPublishedFileID.swiftArray(Int(rc)))
    }

    /// Steamworks `ISteamUGC::GetSupportedGameVersionData()`
    public func getSupportedGameVersionData(handle: UGCQueryHandle, index: Int, versionIndex: Int, gameBranchSize: Int) -> (rc: Bool, gameBranchMin: String, gameBranchMax: String) {
        var tmpGameBranchMin = SteamOutString(length: gameBranchSize)
        var tmpGameBranchMax = SteamOutString(length: gameBranchSize)
        let rc = tmpGameBranchMin.setContent { nstGameBranchMin in
            tmpGameBranchMax.setContent { nstGameBranchMax in
                SteamAPI_ISteamUGC_GetSupportedGameVersionData(interface, UGCQueryHandle_t(handle), uint32(index), uint32(versionIndex), nstGameBranchMin, nstGameBranchMax, uint32(gameBranchSize))
            }
        }
        return (rc: rc, gameBranchMin: tmpGameBranchMin.swiftString, gameBranchMax: tmpGameBranchMax.swiftString)
    }

    /// Steamworks `ISteamUGC::GetUserContentDescriptorPreferences()`
    public func getUserContentDescriptorPreferences(maxEntries: Int) -> (rc: Int, descriptors: [UGCContentDescriptorID]) {
        let tmpDescriptors = SteamOutArray<EUGCContentDescriptorID>(maxEntries)
        let rc = Int(SteamAPI_ISteamUGC_GetUserContentDescriptorPreferences(interface, tmpDescriptors.steamArray, uint32(maxEntries)))
        return (rc: rc, descriptors: tmpDescriptors.swiftArray())
    }

    /// Steamworks `ISteamUGC::GetUserItemVote()`, callback
    public func getUserItemVote(publishedFileID: PublishedFileID, completion: @Sendable @escaping (sending GetUserItemVoteResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_GetUserItemVote(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::GetUserItemVote()`, async
    public func getUserItemVote(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID) async -> GetUserItemVoteResult? {
        await withUnsafeContinuation {
            getUserItemVote(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::GetWorkshopEULAStatus()`, callback
    public func getWorkshopEULAStatus(completion: @Sendable @escaping (sending WorkshopEULAStatus?) -> Void) {
        let rc = SteamAPI_ISteamUGC_GetWorkshopEULAStatus(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::GetWorkshopEULAStatus()`, async
    public func getWorkshopEULAStatus(isolation: isolated (any Actor)? = #isolation) async -> WorkshopEULAStatus? {
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
    public func removeAppDependency(publishedFileID: PublishedFileID, appID: AppID, completion: @Sendable @escaping (sending RemoveAppDependencyResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_RemoveAppDependency(interface, PublishedFileId_t(publishedFileID), AppId_t(appID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::RemoveAppDependency()`, async
    public func removeAppDependency(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID, appID: AppID) async -> RemoveAppDependencyResult? {
        await withUnsafeContinuation {
            removeAppDependency(publishedFileID: publishedFileID, appID: appID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::RemoveContentDescriptor()`
    public func removeContentDescriptor(handle: UGCUpdateHandle, descid: UGCContentDescriptorID) -> Bool {
        SteamAPI_ISteamUGC_RemoveContentDescriptor(interface, UGCUpdateHandle_t(handle), EUGCContentDescriptorID(descid))
    }

    /// Steamworks `ISteamUGC::RemoveDependency()`, callback
    public func removeDependency(parentPublishedFileID: PublishedFileID, childPublishedFileID: PublishedFileID, completion: @Sendable @escaping (sending RemoveUGCDependencyResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_RemoveDependency(interface, PublishedFileId_t(parentPublishedFileID), PublishedFileId_t(childPublishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::RemoveDependency()`, async
    public func removeDependency(isolation: isolated (any Actor)? = #isolation, parentPublishedFileID: PublishedFileID, childPublishedFileID: PublishedFileID) async -> RemoveUGCDependencyResult? {
        await withUnsafeContinuation {
            removeDependency(parentPublishedFileID: parentPublishedFileID, childPublishedFileID: childPublishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::RemoveItemFromFavorites()`, callback
    public func removeItemFromFavorites(appId: AppID, publishedFileID: PublishedFileID, completion: @Sendable @escaping (sending UserFavoriteItemsListChanged?) -> Void) {
        let rc = SteamAPI_ISteamUGC_RemoveItemFromFavorites(interface, AppId_t(appId), PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::RemoveItemFromFavorites()`, async
    public func removeItemFromFavorites(isolation: isolated (any Actor)? = #isolation, appId: AppID, publishedFileID: PublishedFileID) async -> UserFavoriteItemsListChanged? {
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
    public func requestUGCDetails(publishedFileID: PublishedFileID, maxAgeSeconds: Int, completion: @Sendable @escaping (sending SteamUGCRequestUGCDetailsResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_RequestUGCDetails(interface, PublishedFileId_t(publishedFileID), uint32(maxAgeSeconds))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::RequestUGCDetails()`, async
    public func requestUGCDetails(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID, maxAgeSeconds: Int) async -> SteamUGCRequestUGCDetailsResult? {
        await withUnsafeContinuation {
            requestUGCDetails(publishedFileID: publishedFileID, maxAgeSeconds: maxAgeSeconds, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SendQueryUGCRequest()`, callback
    public func sendQueryUGCRequest(handle: UGCQueryHandle, completion: @Sendable @escaping (sending SteamUGCQueryCompleted?) -> Void) {
        let rc = SteamAPI_ISteamUGC_SendQueryUGCRequest(interface, UGCQueryHandle_t(handle))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::SendQueryUGCRequest()`, async
    public func sendQueryUGCRequest(isolation: isolated (any Actor)? = #isolation, handle: UGCQueryHandle) async -> SteamUGCQueryCompleted? {
        await withUnsafeContinuation {
            sendQueryUGCRequest(handle: handle, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SetAdminQuery()`
    public func setAdminQuery(handle: UGCUpdateHandle, adminQuery: Bool) -> Bool {
        SteamAPI_ISteamUGC_SetAdminQuery(interface, UGCUpdateHandle_t(handle), adminQuery)
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
    public func setItemTags(handle: UGCUpdateHandle, tags: [String], allowAdminTags: Bool = false) -> Bool {
        let tmpTags = StringArray(tags)
        defer { tmpTags.deallocate() }
        return SteamAPI_ISteamUGC_SetItemTags(interface, UGCUpdateHandle_t(handle), .init(tmpTags), allowAdminTags)
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

    /// Steamworks `ISteamUGC::SetRequiredGameVersions()`
    public func setRequiredGameVersions(handle: UGCUpdateHandle, gameBranchMin: String, gameBranchMax: String) -> Bool {
        SteamAPI_ISteamUGC_SetRequiredGameVersions(interface, UGCUpdateHandle_t(handle), gameBranchMin, gameBranchMax)
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
    public func setUserItemVote(publishedFileID: PublishedFileID, voteUp: Bool, completion: @Sendable @escaping (sending SetUserItemVoteResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_SetUserItemVote(interface, PublishedFileId_t(publishedFileID), voteUp)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::SetUserItemVote()`, async
    public func setUserItemVote(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID, voteUp: Bool) async -> SetUserItemVoteResult? {
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
    public func startPlaytimeTracking(publishedFileID: [PublishedFileID], completion: @Sendable @escaping (sending StartPlaytimeTrackingResult?) -> Void) {
        var tmpPublishedFileID = publishedFileID.map { PublishedFileId_t($0) }
        let rc = SteamAPI_ISteamUGC_StartPlaytimeTracking(interface, &tmpPublishedFileID, uint32(publishedFileID.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::StartPlaytimeTracking()`, async
    public func startPlaytimeTracking(isolation: isolated (any Actor)? = #isolation, publishedFileID: [PublishedFileID]) async -> StartPlaytimeTrackingResult? {
        await withUnsafeContinuation {
            startPlaytimeTracking(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::StopPlaytimeTracking()`, callback
    public func stopPlaytimeTracking(publishedFileID: [PublishedFileID], completion: @Sendable @escaping (sending StopPlaytimeTrackingResult?) -> Void) {
        var tmpPublishedFileID = publishedFileID.map { PublishedFileId_t($0) }
        let rc = SteamAPI_ISteamUGC_StopPlaytimeTracking(interface, &tmpPublishedFileID, uint32(publishedFileID.count))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::StopPlaytimeTracking()`, async
    public func stopPlaytimeTracking(isolation: isolated (any Actor)? = #isolation, publishedFileID: [PublishedFileID]) async -> StopPlaytimeTrackingResult? {
        await withUnsafeContinuation {
            stopPlaytimeTracking(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::StopPlaytimeTrackingForAllItems()`, callback
    public func stopPlaytimeTrackingForAllItems(completion: @Sendable @escaping (sending StopPlaytimeTrackingResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems(interface)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::StopPlaytimeTrackingForAllItems()`, async
    public func stopPlaytimeTrackingForAllItems(isolation: isolated (any Actor)? = #isolation) async -> StopPlaytimeTrackingResult? {
        await withUnsafeContinuation {
            stopPlaytimeTrackingForAllItems(completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SubmitItemUpdate()`, callback
    public func submitItemUpdate(handle: UGCUpdateHandle, changeNote: String?, completion: @Sendable @escaping (sending SubmitItemUpdateResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_SubmitItemUpdate(interface, UGCUpdateHandle_t(handle), changeNote)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::SubmitItemUpdate()`, async
    public func submitItemUpdate(isolation: isolated (any Actor)? = #isolation, handle: UGCUpdateHandle, changeNote: String?) async -> SubmitItemUpdateResult? {
        await withUnsafeContinuation {
            submitItemUpdate(handle: handle, changeNote: changeNote, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SubscribeItem()`, callback
    public func subscribeItem(publishedFileID: PublishedFileID, completion: @Sendable @escaping (sending RemoteStorageSubscribePublishedFileResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_SubscribeItem(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::SubscribeItem()`, async
    public func subscribeItem(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID) async -> RemoteStorageSubscribePublishedFileResult? {
        await withUnsafeContinuation {
            subscribeItem(publishedFileID: publishedFileID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamUGC::SuspendDownloads()`
    public func suspendDownloads(suspend: Bool) {
        SteamAPI_ISteamUGC_SuspendDownloads(interface, suspend)
    }

    /// Steamworks `ISteamUGC::UnsubscribeItem()`, callback
    public func unsubscribeItem(publishedFileID: PublishedFileID, completion: @Sendable @escaping (sending RemoteStorageUnsubscribePublishedFileResult?) -> Void) {
        let rc = SteamAPI_ISteamUGC_UnsubscribeItem(interface, PublishedFileId_t(publishedFileID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamUGC::UnsubscribeItem()`, async
    public func unsubscribeItem(isolation: isolated (any Actor)? = #isolation, publishedFileID: PublishedFileID) async -> RemoteStorageUnsubscribePublishedFileResult? {
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
