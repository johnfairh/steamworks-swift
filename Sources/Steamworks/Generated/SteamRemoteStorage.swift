//
//  SteamRemoteStorage.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamRemoteStorage`](https://partner.steamgames.com/doc/api/ISteamRemoteStorage)
///
/// Access via `SteamAPI.remoteStorage`.
public struct SteamRemoteStorage: Sendable {
    var interface: UnsafeMutablePointer<ISteamRemoteStorage> {
        SteamAPI_SteamRemoteStorage_v016()
    }

    init() {
    }

    /// Steamworks `ISteamRemoteStorage::BeginFileWriteBatch()`
    public func beginFileWriteBatch() -> Bool {
        SteamAPI_ISteamRemoteStorage_BeginFileWriteBatch(interface)
    }

    /// Steamworks `ISteamRemoteStorage::CommitPublishedFileUpdate()`, callback
    public func commitPublishedFileUpdate(handle: PublishedFileUpdateHandle, completion: @escaping (RemoteStorageUpdatePublishedFileResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate(interface, PublishedFileUpdateHandle_t(handle))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::CommitPublishedFileUpdate()`, async
    public func commitPublishedFileUpdate(handle: PublishedFileUpdateHandle) async -> RemoteStorageUpdatePublishedFileResult? {
        await withUnsafeContinuation {
            commitPublishedFileUpdate(handle: handle, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::CreatePublishedFileUpdateRequest()`
    public func createPublishedFileUpdateRequest(publishedFileId: PublishedFileID) -> PublishedFileUpdateHandle {
        PublishedFileUpdateHandle(SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest(interface, PublishedFileId_t(publishedFileId)))
    }

    /// Steamworks `ISteamRemoteStorage::DeletePublishedFile()`, callback
    public func deletePublishedFile(publishedFileId: PublishedFileID, completion: @escaping (RemoteStorageDeletePublishedFileResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_DeletePublishedFile(interface, PublishedFileId_t(publishedFileId))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::DeletePublishedFile()`, async
    public func deletePublishedFile(publishedFileId: PublishedFileID) async -> RemoteStorageDeletePublishedFileResult? {
        await withUnsafeContinuation {
            deletePublishedFile(publishedFileId: publishedFileId, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::EndFileWriteBatch()`
    public func endFileWriteBatch() -> Bool {
        SteamAPI_ISteamRemoteStorage_EndFileWriteBatch(interface)
    }

    /// Steamworks `ISteamRemoteStorage::EnumeratePublishedFilesByUserAction()`, callback
    public func enumeratePublishedFilesByUserAction(action: WorkshopFileAction, startIndex: Int, completion: @escaping (RemoteStorageEnumeratePublishedFilesByUserActionResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction(interface, EWorkshopFileAction(action), uint32(startIndex))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::EnumeratePublishedFilesByUserAction()`, async
    public func enumeratePublishedFilesByUserAction(action: WorkshopFileAction, startIndex: Int) async -> RemoteStorageEnumeratePublishedFilesByUserActionResult? {
        await withUnsafeContinuation {
            enumeratePublishedFilesByUserAction(action: action, startIndex: startIndex, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::EnumeratePublishedWorkshopFiles()`, callback
    public func enumeratePublishedWorkshopFiles(enumerationType: WorkshopEnumerationType, startIndex: Int, count: Int, days: Int, tags: [String], userTags: [String], completion: @escaping (RemoteStorageEnumerateWorkshopFilesResult?) -> Void) {
        let tmpTags = StringArray(tags)
        defer { tmpTags.deallocate() }
        let tmpUserTags = StringArray(userTags)
        defer { tmpUserTags.deallocate() }
        let rc = SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles(interface, EWorkshopEnumerationType(enumerationType), uint32(startIndex), uint32(count), uint32(days), .init(tmpTags), .init(tmpUserTags))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::EnumeratePublishedWorkshopFiles()`, async
    public func enumeratePublishedWorkshopFiles(enumerationType: WorkshopEnumerationType, startIndex: Int, count: Int, days: Int, tags: [String], userTags: [String]) async -> RemoteStorageEnumerateWorkshopFilesResult? {
        await withUnsafeContinuation {
            enumeratePublishedWorkshopFiles(enumerationType: enumerationType, startIndex: startIndex, count: count, days: days, tags: tags, userTags: userTags, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::EnumerateUserPublishedFiles()`, callback
    public func enumerateUserPublishedFiles(startIndex: Int, completion: @escaping (RemoteStorageEnumerateUserPublishedFilesResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles(interface, uint32(startIndex))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::EnumerateUserPublishedFiles()`, async
    public func enumerateUserPublishedFiles(startIndex: Int) async -> RemoteStorageEnumerateUserPublishedFilesResult? {
        await withUnsafeContinuation {
            enumerateUserPublishedFiles(startIndex: startIndex, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::EnumerateUserSharedWorkshopFiles()`, callback
    public func enumerateUserSharedWorkshopFiles(steamId: SteamID, startIndex: Int, requiredTags: [String], excludedTags: [String], completion: @escaping (RemoteStorageEnumerateUserPublishedFilesResult?) -> Void) {
        let tmpRequiredTags = StringArray(requiredTags)
        defer { tmpRequiredTags.deallocate() }
        let tmpExcludedTags = StringArray(excludedTags)
        defer { tmpExcludedTags.deallocate() }
        let rc = SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles(interface, CUnsignedLongLong(steamId), uint32(startIndex), .init(tmpRequiredTags), .init(tmpExcludedTags))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::EnumerateUserSharedWorkshopFiles()`, async
    public func enumerateUserSharedWorkshopFiles(steamId: SteamID, startIndex: Int, requiredTags: [String], excludedTags: [String]) async -> RemoteStorageEnumerateUserPublishedFilesResult? {
        await withUnsafeContinuation {
            enumerateUserSharedWorkshopFiles(steamId: steamId, startIndex: startIndex, requiredTags: requiredTags, excludedTags: excludedTags, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::EnumerateUserSubscribedFiles()`, callback
    public func enumerateUserSubscribedFiles(startIndex: Int, completion: @escaping (RemoteStorageEnumerateUserSubscribedFilesResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles(interface, uint32(startIndex))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::EnumerateUserSubscribedFiles()`, async
    public func enumerateUserSubscribedFiles(startIndex: Int) async -> RemoteStorageEnumerateUserSubscribedFilesResult? {
        await withUnsafeContinuation {
            enumerateUserSubscribedFiles(startIndex: startIndex, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::FileDelete()`
    @discardableResult
    public func fileDelete(file: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_FileDelete(interface, file)
    }

    /// Steamworks `ISteamRemoteStorage::FileExists()`
    public func fileExists(file: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_FileExists(interface, file)
    }

    /// Steamworks `ISteamRemoteStorage::FileForget()`
    @discardableResult
    public func fileForget(file: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_FileForget(interface, file)
    }

    /// Steamworks `ISteamRemoteStorage::FilePersisted()`
    public func filePersisted(file: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_FilePersisted(interface, file)
    }

    /// Steamworks `ISteamRemoteStorage::FileRead()`
    public func fileRead(file: String, data: UnsafeMutableRawPointer, dataToReadSize: Int) -> Int {
        Int(SteamAPI_ISteamRemoteStorage_FileRead(interface, file, data, int32(dataToReadSize)))
    }

    /// Steamworks `ISteamRemoteStorage::FileReadAsync()`, callback
    public func fileReadAsync(file: String, offset: Int, toReadSize: Int, completion: @escaping (RemoteStorageFileReadAsyncComplete?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_FileReadAsync(interface, file, uint32(offset), uint32(toReadSize))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::FileReadAsync()`, async
    public func fileReadAsync(file: String, offset: Int, toReadSize: Int) async -> RemoteStorageFileReadAsyncComplete? {
        await withUnsafeContinuation {
            fileReadAsync(file: file, offset: offset, toReadSize: toReadSize, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::FileReadAsyncComplete()`
    public func fileReadAsyncComplete(readCall: SteamAPICall, buffer: UnsafeMutableRawPointer, toReadSize: Int) -> Bool {
        SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete(interface, SteamAPICall_t(readCall), buffer, uint32(toReadSize))
    }

    /// Steamworks `ISteamRemoteStorage::FileShare()`, callback
    public func fileShare(file: String, completion: @escaping (RemoteStorageFileShareResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_FileShare(interface, file)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::FileShare()`, async
    public func fileShare(file: String) async -> RemoteStorageFileShareResult? {
        await withUnsafeContinuation {
            fileShare(file: file, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::FileWrite()`
    public func fileWrite(file: String, data: UnsafeRawPointer, dataSize: Int) -> Bool {
        SteamAPI_ISteamRemoteStorage_FileWrite(interface, file, data, int32(dataSize))
    }

    /// Steamworks `ISteamRemoteStorage::FileWriteAsync()`, callback
    public func fileWriteAsync(file: String, data: UnsafeRawPointer, dataSize: Int, completion: @escaping (RemoteStorageFileWriteAsyncComplete?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_FileWriteAsync(interface, file, data, uint32(dataSize))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::FileWriteAsync()`, async
    public func fileWriteAsync(file: String, data: UnsafeRawPointer, dataSize: Int) async -> RemoteStorageFileWriteAsyncComplete? {
        await withUnsafeContinuation {
            fileWriteAsync(file: file, data: data, dataSize: dataSize, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::FileWriteStreamCancel()`
    public func fileWriteStreamCancel(handle: UGCFileWriteStreamHandle) -> Bool {
        SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel(interface, UGCFileWriteStreamHandle_t(handle))
    }

    /// Steamworks `ISteamRemoteStorage::FileWriteStreamClose()`
    @discardableResult
    public func fileWriteStreamClose(handle: UGCFileWriteStreamHandle) -> Bool {
        SteamAPI_ISteamRemoteStorage_FileWriteStreamClose(interface, UGCFileWriteStreamHandle_t(handle))
    }

    /// Steamworks `ISteamRemoteStorage::FileWriteStreamOpen()`
    public func fileWriteStreamOpen(file: String) -> UGCFileWriteStreamHandle {
        UGCFileWriteStreamHandle(SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen(interface, file))
    }

    /// Steamworks `ISteamRemoteStorage::FileWriteStreamWriteChunk()`
    public func fileWriteStreamWriteChunk(handle: UGCFileWriteStreamHandle, data: UnsafeRawPointer, dataSize: Int) -> Bool {
        SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk(interface, UGCFileWriteStreamHandle_t(handle), data, int32(dataSize))
    }

    /// Steamworks `ISteamRemoteStorage::GetCachedUGCCount()`
    public func getCachedUGCCount() -> Int {
        Int(SteamAPI_ISteamRemoteStorage_GetCachedUGCCount(interface))
    }

    /// Steamworks `ISteamRemoteStorage::GetCachedUGCHandle()`
    public func getCachedUGCHandle(cachedContentIndex: Int) -> UGCHandle {
        UGCHandle(SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle(interface, int32(cachedContentIndex)))
    }

    /// Steamworks `ISteamRemoteStorage::GetFileCount()`
    public func getFileCount() -> Int {
        Int(SteamAPI_ISteamRemoteStorage_GetFileCount(interface))
    }

    /// Steamworks `ISteamRemoteStorage::GetFileNameAndSize()`
    public func getFileNameAndSize(fileIndex: Int) -> (rc: String, fileSizeInBytes: Int) {
        var tmpFileSizeInBytes = int32()
        let rc = String(SteamAPI_ISteamRemoteStorage_GetFileNameAndSize(interface, CInt(fileIndex), &tmpFileSizeInBytes))
        return (rc: rc, fileSizeInBytes: Int(tmpFileSizeInBytes))
    }

    /// Steamworks `ISteamRemoteStorage::GetFileSize()`
    public func getFileSize(file: String) -> Int {
        Int(SteamAPI_ISteamRemoteStorage_GetFileSize(interface, file))
    }

    /// Steamworks `ISteamRemoteStorage::GetFileTimestamp()`
    public func getFileTimestamp(file: String) -> Int {
        Int(SteamAPI_ISteamRemoteStorage_GetFileTimestamp(interface, file))
    }

    /// Steamworks `ISteamRemoteStorage::GetLocalFileChange()`
    public func getLocalFileChange(fileIndex: Int) -> (rc: String, eChangeType: RemoteStorageLocalFileChangeType, eFilePathType: RemoteStorageFilePathType) {
        var tmpEChangeType = ERemoteStorageLocalFileChange(rawValue: 0)
        var tmpEFilePathType = ERemoteStorageFilePathType(rawValue: 0)
        let rc = String(SteamAPI_ISteamRemoteStorage_GetLocalFileChange(interface, CInt(fileIndex), &tmpEChangeType, &tmpEFilePathType))
        return (rc: rc, eChangeType: RemoteStorageLocalFileChangeType(tmpEChangeType), eFilePathType: RemoteStorageFilePathType(tmpEFilePathType))
    }

    /// Steamworks `ISteamRemoteStorage::GetLocalFileChangeCount()`
    public func getLocalFileChangeCount() -> Int {
        Int(SteamAPI_ISteamRemoteStorage_GetLocalFileChangeCount(interface))
    }

    /// Steamworks `ISteamRemoteStorage::GetPublishedFileDetails()`, callback
    public func getPublishedFileDetails(publishedFileId: PublishedFileID, maxSecondsOld: Int, completion: @escaping (RemoteStorageGetPublishedFileDetailsResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails(interface, PublishedFileId_t(publishedFileId), uint32(maxSecondsOld))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::GetPublishedFileDetails()`, async
    public func getPublishedFileDetails(publishedFileId: PublishedFileID, maxSecondsOld: Int) async -> RemoteStorageGetPublishedFileDetailsResult? {
        await withUnsafeContinuation {
            getPublishedFileDetails(publishedFileId: publishedFileId, maxSecondsOld: maxSecondsOld, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::GetPublishedItemVoteDetails()`, callback
    public func getPublishedItemVoteDetails(publishedFileId: PublishedFileID, completion: @escaping (RemoteStorageGetPublishedItemVoteDetailsResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails(interface, PublishedFileId_t(publishedFileId))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::GetPublishedItemVoteDetails()`, async
    public func getPublishedItemVoteDetails(publishedFileId: PublishedFileID) async -> RemoteStorageGetPublishedItemVoteDetailsResult? {
        await withUnsafeContinuation {
            getPublishedItemVoteDetails(publishedFileId: publishedFileId, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::GetQuota()`
    public func getQuota() -> (rc: Bool, totalBytes: UInt64, availableBytes: UInt64) {
        var tmpTotalBytes = uint64()
        var tmpAvailableBytes = uint64()
        let rc = SteamAPI_ISteamRemoteStorage_GetQuota(interface, &tmpTotalBytes, &tmpAvailableBytes)
        return (rc: rc, totalBytes: tmpTotalBytes, availableBytes: tmpAvailableBytes)
    }

    /// Steamworks `ISteamRemoteStorage::GetSyncPlatforms()`
    public func getSyncPlatforms(file: String) -> RemoteStoragePlatform {
        RemoteStoragePlatform(SteamAPI_ISteamRemoteStorage_GetSyncPlatforms(interface, file))
    }

    /// Steamworks `ISteamRemoteStorage::GetUGCDownloadProgress()`
    public func getUGCDownloadProgress(content: UGCHandle) -> (rc: Bool, bytesDownloaded: Int, bytesExpected: Int) {
        var tmpBytesDownloaded = int32()
        var tmpBytesExpected = int32()
        let rc = SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress(interface, UGCHandle_t(content), &tmpBytesDownloaded, &tmpBytesExpected)
        return (rc: rc, bytesDownloaded: Int(tmpBytesDownloaded), bytesExpected: Int(tmpBytesExpected))
    }

    /// Steamworks `ISteamRemoteStorage::GetUserPublishedItemVoteDetails()`, callback
    public func getUserPublishedItemVoteDetails(publishedFileId: PublishedFileID, completion: @escaping (RemoteStorageGetPublishedItemVoteDetailsResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails(interface, PublishedFileId_t(publishedFileId))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::GetUserPublishedItemVoteDetails()`, async
    public func getUserPublishedItemVoteDetails(publishedFileId: PublishedFileID) async -> RemoteStorageGetPublishedItemVoteDetailsResult? {
        await withUnsafeContinuation {
            getUserPublishedItemVoteDetails(publishedFileId: publishedFileId, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::IsCloudEnabledForAccount()`
    public func isCloudEnabledForAccount() -> Bool {
        SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount(interface)
    }

    /// Steamworks `ISteamRemoteStorage::IsCloudEnabledForApp()`
    public func isCloudEnabledForApp() -> Bool {
        SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp(interface)
    }

    /// Steamworks `ISteamRemoteStorage::PublishVideo()`, callback
    public func publishVideo(videoProvider: WorkshopVideoProvider, videoAccount: String, videoIdentifier: String, previewFile: String, consumerAppId: AppID, title: String, description: String, visibility: RemoteStoragePublishedFileVisibility, tags: [String], completion: @escaping (RemoteStoragePublishFileProgress?) -> Void) {
        let tmpTags = StringArray(tags)
        defer { tmpTags.deallocate() }
        let rc = SteamAPI_ISteamRemoteStorage_PublishVideo(interface, EWorkshopVideoProvider(videoProvider), videoAccount, videoIdentifier, previewFile, AppId_t(consumerAppId), title, description, ERemoteStoragePublishedFileVisibility(visibility), .init(tmpTags))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::PublishVideo()`, async
    public func publishVideo(videoProvider: WorkshopVideoProvider, videoAccount: String, videoIdentifier: String, previewFile: String, consumerAppId: AppID, title: String, description: String, visibility: RemoteStoragePublishedFileVisibility, tags: [String]) async -> RemoteStoragePublishFileProgress? {
        await withUnsafeContinuation {
            publishVideo(videoProvider: videoProvider, videoAccount: videoAccount, videoIdentifier: videoIdentifier, previewFile: previewFile, consumerAppId: consumerAppId, title: title, description: description, visibility: visibility, tags: tags, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::PublishWorkshopFile()`, callback
    public func publishWorkshopFile(file: String, previewFile: String, consumerAppId: AppID, title: String, description: String, visibility: RemoteStoragePublishedFileVisibility, tags: [String], workshopFileType: WorkshopFileType, completion: @escaping (RemoteStoragePublishFileProgress?) -> Void) {
        let tmpTags = StringArray(tags)
        defer { tmpTags.deallocate() }
        let rc = SteamAPI_ISteamRemoteStorage_PublishWorkshopFile(interface, file, previewFile, AppId_t(consumerAppId), title, description, ERemoteStoragePublishedFileVisibility(visibility), .init(tmpTags), EWorkshopFileType(workshopFileType))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::PublishWorkshopFile()`, async
    public func publishWorkshopFile(file: String, previewFile: String, consumerAppId: AppID, title: String, description: String, visibility: RemoteStoragePublishedFileVisibility, tags: [String], workshopFileType: WorkshopFileType) async -> RemoteStoragePublishFileProgress? {
        await withUnsafeContinuation {
            publishWorkshopFile(file: file, previewFile: previewFile, consumerAppId: consumerAppId, title: title, description: description, visibility: visibility, tags: tags, workshopFileType: workshopFileType, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::SetCloudEnabledForApp()`
    public func setCloudEnabledForApp(enabled: Bool) {
        SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp(interface, enabled)
    }

    /// Steamworks `ISteamRemoteStorage::SetSyncPlatforms()`
    public func setSyncPlatforms(file: String, remoteStoragePlatform: RemoteStoragePlatform) -> Bool {
        SteamAPI_ISteamRemoteStorage_SetSyncPlatforms(interface, file, ERemoteStoragePlatform(remoteStoragePlatform))
    }

    /// Steamworks `ISteamRemoteStorage::SetUserPublishedFileAction()`, callback
    public func setUserPublishedFileAction(publishedFileId: PublishedFileID, action: WorkshopFileAction, completion: @escaping (RemoteStorageSetUserPublishedFileActionResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction(interface, PublishedFileId_t(publishedFileId), EWorkshopFileAction(action))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::SetUserPublishedFileAction()`, async
    public func setUserPublishedFileAction(publishedFileId: PublishedFileID, action: WorkshopFileAction) async -> RemoteStorageSetUserPublishedFileActionResult? {
        await withUnsafeContinuation {
            setUserPublishedFileAction(publishedFileId: publishedFileId, action: action, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::SubscribePublishedFile()`, callback
    public func subscribePublishedFile(publishedFileId: PublishedFileID, completion: @escaping (RemoteStorageSubscribePublishedFileResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_SubscribePublishedFile(interface, PublishedFileId_t(publishedFileId))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::SubscribePublishedFile()`, async
    public func subscribePublishedFile(publishedFileId: PublishedFileID) async -> RemoteStorageSubscribePublishedFileResult? {
        await withUnsafeContinuation {
            subscribePublishedFile(publishedFileId: publishedFileId, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::UGCDownload()`, callback
    public func ugcDownload(content: UGCHandle, priority: Int, completion: @escaping (RemoteStorageDownloadUGCResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_UGCDownload(interface, UGCHandle_t(content), uint32(priority))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::UGCDownload()`, async
    public func ugcDownload(content: UGCHandle, priority: Int) async -> RemoteStorageDownloadUGCResult? {
        await withUnsafeContinuation {
            ugcDownload(content: content, priority: priority, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::UGCDownloadToLocation()`, callback
    public func ugcDownloadToLocation(content: UGCHandle, location: String, priority: Int, completion: @escaping (RemoteStorageDownloadUGCResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation(interface, UGCHandle_t(content), location, uint32(priority))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::UGCDownloadToLocation()`, async
    public func ugcDownloadToLocation(content: UGCHandle, location: String, priority: Int) async -> RemoteStorageDownloadUGCResult? {
        await withUnsafeContinuation {
            ugcDownloadToLocation(content: content, location: location, priority: priority, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::UGCRead()`
    public func ugcRead(content: UGCHandle, data: UnsafeMutableRawPointer, dataToReadSize: Int, offset: Int, action: UGCReadAction) -> Int {
        Int(SteamAPI_ISteamRemoteStorage_UGCRead(interface, UGCHandle_t(content), data, int32(dataToReadSize), uint32(offset), EUGCReadAction(action)))
    }

    /// Steamworks `ISteamRemoteStorage::UnsubscribePublishedFile()`, callback
    public func unsubscribePublishedFile(publishedFileId: PublishedFileID, completion: @escaping (RemoteStorageUnsubscribePublishedFileResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile(interface, PublishedFileId_t(publishedFileId))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::UnsubscribePublishedFile()`, async
    public func unsubscribePublishedFile(publishedFileId: PublishedFileID) async -> RemoteStorageUnsubscribePublishedFileResult? {
        await withUnsafeContinuation {
            unsubscribePublishedFile(publishedFileId: publishedFileId, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamRemoteStorage::UpdatePublishedFileDescription()`
    public func updatePublishedFileDescription(handle: PublishedFileUpdateHandle, description: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription(interface, PublishedFileUpdateHandle_t(handle), description)
    }

    /// Steamworks `ISteamRemoteStorage::UpdatePublishedFileFile()`
    public func updatePublishedFileFile(handle: PublishedFileUpdateHandle, file: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile(interface, PublishedFileUpdateHandle_t(handle), file)
    }

    /// Steamworks `ISteamRemoteStorage::UpdatePublishedFilePreviewFile()`
    public func updatePublishedFilePreviewFile(handle: PublishedFileUpdateHandle, previewFile: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile(interface, PublishedFileUpdateHandle_t(handle), previewFile)
    }

    /// Steamworks `ISteamRemoteStorage::UpdatePublishedFileSetChangeDescription()`
    public func updatePublishedFileSetChangeDescription(handle: PublishedFileUpdateHandle, changeDescription: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription(interface, PublishedFileUpdateHandle_t(handle), changeDescription)
    }

    /// Steamworks `ISteamRemoteStorage::UpdatePublishedFileTags()`
    public func updatePublishedFileTags(handle: PublishedFileUpdateHandle, tags: [String]) -> Bool {
        let tmpTags = StringArray(tags)
        defer { tmpTags.deallocate() }
        return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags(interface, PublishedFileUpdateHandle_t(handle), .init(tmpTags))
    }

    /// Steamworks `ISteamRemoteStorage::UpdatePublishedFileTitle()`
    public func updatePublishedFileTitle(handle: PublishedFileUpdateHandle, title: String) -> Bool {
        SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle(interface, PublishedFileUpdateHandle_t(handle), title)
    }

    /// Steamworks `ISteamRemoteStorage::UpdatePublishedFileVisibility()`
    public func updatePublishedFileVisibility(handle: PublishedFileUpdateHandle, visibility: RemoteStoragePublishedFileVisibility) -> Bool {
        SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility(interface, PublishedFileUpdateHandle_t(handle), ERemoteStoragePublishedFileVisibility(visibility))
    }

    /// Steamworks `ISteamRemoteStorage::UpdateUserPublishedItemVote()`, callback
    public func updateUserPublishedItemVote(publishedFileId: PublishedFileID, voteUp: Bool, completion: @escaping (RemoteStorageUpdateUserPublishedItemVoteResult?) -> Void) {
        let rc = SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote(interface, PublishedFileId_t(publishedFileId), voteUp)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamRemoteStorage::UpdateUserPublishedItemVote()`, async
    public func updateUserPublishedItemVote(publishedFileId: PublishedFileID, voteUp: Bool) async -> RemoteStorageUpdateUserPublishedItemVoteResult? {
        await withUnsafeContinuation {
            updateUserPublishedItemVote(publishedFileId: publishedFileId, voteUp: voteUp, completion: $0.resume)
        }
    }
}
