//
//  TestUtils.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation
import XCTest
#if !os(Linux)
@testable import LibGenerate
#endif
import Steamworks

/// Wrapper for Steam API initialization
///
/// We attempt to share this across test instances -- the shutdown
/// is a bit yolo relying on atexit() to kill the last ref and trigger
/// deinit.
///
/// Also yoloing what XCTest is doing with its threads...
///
/// Not going to work as-written if tests run in parallel
enum TestClient {
    struct InitFailure: Error {}

    typealias FrameCallback = (SteamAPI) -> Void

    final class Client {
        let steam: SteamAPI
        private var runningFrames: Bool
        private let frameSource: DispatchSourceTimer
        private var frameCallback: FrameCallback?

        init(steam: SteamAPI) {
            self.steam = steam
            runningFrames = false
            frameSource = DispatchSource.makeTimerSource(queue: .main)
            frameSource.schedule(deadline: .now(), repeating: .milliseconds(1000/60))
            frameSource.setEventHandler() { [weak self] in self?.frame() }
            frameCallback = nil
            frameSource.resume()
        }

        private func frame() {
            steam.runCallbacks()
            frameCallback?(steam)
        }

        func runFrames(callback: FrameCallback?) {
            precondition(!runningFrames)
            frameCallback = callback
            runningFrames = true
            while runningFrames {
                RunLoop.main.run(mode: .default, before: .distantFuture)
            }
        }

        func stopRunningFrames() {
            precondition(runningFrames)
            frameCallback = nil
            runningFrames = false
        }
    }

    typealias FrameCallbackAsync = @Sendable (SteamAPI) async -> Void

    @MainActor
    final class AsyncClient {
        let steam: SteamAPI
        private var runningFrames: Bool { runningFramesTask != nil }
        private var runningFramesTask: Task<Void,Never>?
        private var frameCallback: FrameCallbackAsync?

        init(steam: SteamAPI) {
            self.steam = steam
            frameCallback = nil
        }

        private func frame() async {
            steam.runCallbacks()
            await frameCallback?(steam)
        }

        func runFrames(callback: FrameCallbackAsync?) async {
            precondition(runningFramesTask == nil)
            frameCallback = callback
            runningFramesTask = Task {
                while !Task.isCancelled {
                    try? await Task.sleep(nanoseconds: (1000/60) * 1000)
                    MainActor.assertIsolated()
                    await frame()
                }
            }
            _ = await runningFramesTask?.result
            runningFramesTask = nil
        }

        func stopRunningFrames() {
            precondition(runningFramesTask != nil)
            runningFramesTask!.cancel()
        }
    }


    nonisolated(unsafe) private static var client: Client?
    nonisolated(unsafe) private static var asyncClient: AsyncClient?

    @discardableResult
    static func recycleClient() throws -> SteamAPI{
        TestClient.asyncClient = nil
        TestClient.client = nil // -> steam_shutdown_api
        return try getClient()
    }

    static func getClient() throws -> SteamAPI {
        if let client {
            return client.steam
        }
        guard FileManager.default.fileExists(atPath: "/Applications/Steam.app") else {
            throw XCTSkip("Skipping Steam API test, can't find Steam")
        }
        if let steam = SteamAPI(appID: .spaceWar, fakeAppIdTxtFile: true) {
            TestClient.client = Client(steam: steam)
//
// Not entirely sure this worked but I can't get `atexit` to actually appear on
// github actions running the same linux docker image as locally .. this is
// exhausting so I'm just giving up for now.
//
//            atexit {
//                TestClient.client = nil
//            }
            steam.useLoggerForSteamworksWarnings()
            steam.networkingUtils.useLoggerForDebug(detailLevel: .everything)
            return steam
        }
        print("Can't initialize Steam API")
        throw InitFailure()
    }

    static func getAsyncClient() async throws -> SteamAPI {
        if let asyncClient {
            return asyncClient.steam
        }
        let steam = try getClient()
        asyncClient = await AsyncClient(steam: steam)
        return steam
    }

    /// Run frames until  `stopRunningFrames` is called
    static func runFrames(callback: FrameCallback? = nil) {
        client?.runFrames(callback: callback)
    }

    static func runFramesAsync(callback: FrameCallbackAsync? = nil) async {
        await asyncClient?.runFrames(callback: callback)
    }

    static func runFrames(count: Int) {
        var frameCount = 0
        runFrames { _ in
            if frameCount >= count {
                stopRunningFrames()
            }
            frameCount += 1
        }
    }

    static func stopRunningFrames() {
        client?.stopRunningFrames()
    }

    static func stopRunningFramesAsync() async {
        await asyncClient?.stopRunningFrames()
    }
}

/// Foundation helpers
extension FileManager {
    /// Create a new empty temporary directory.  Caller must delete.
    func createTemporaryDirectory(inDirectory directory: URL? = nil, name: String? = nil) throws -> URL {
        let directoryName = name ?? UUID().uuidString
        let parentDirectoryURL = directory ?? temporaryDirectory
        let directoryURL = parentDirectoryURL.appendingPathComponent(directoryName)
        try createDirectory(at: directoryURL, withIntermediateDirectories: false)
        return directoryURL
    }

    /// Get a new temporary filename.  Caller must delete.
    func temporaryFileURL(inDirectory directory: URL? = nil) -> URL {
        let filename     = UUID().uuidString
        let directoryURL = directory ?? temporaryDirectory
        return directoryURL.appendingPathComponent(filename)
    }

    /// A file URL for the current directory
    var currentDirectory: URL {
        URL(fileURLWithPath: currentDirectoryPath)
    }
}

/// Stuff for faked up SDK database to test generator
/// Didn't make much use of this in the end / so far
extension XCTestCase {
    static var fixturesURL: URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .appendingPathComponent("Fixtures")
    }

    static var fixturesRedistSdkURL: URL {
        fixturesURL.appendingPathComponent("redist")
    }

    static var patchYAMLURL: URL {
        fixturesURL.appendingPathComponent("steam_api_patch.yaml")
    }

    static var sdkExtraJSONURL: URL {
        fixturesURL.appendingPathComponent("steam_api_extra.json")
    }

    #if !os(Linux)

    class Harness {
        let swiftOutputDirURL: URL
        let cOutputDirURL: URL
        let docsOutputDirURL: URL
        let doccCollectionOutputDirURL: URL
        let generator: Generator

        init() throws {
            setenv(IO.PATCH_YAML_PATH_VAR, patchYAMLURL.path, 1)
            setenv(IO.SDK_EXTRA_JSON_PATH_VAR, sdkExtraJSONURL.path, 1)
            swiftOutputDirURL = try! FileManager.default.createTemporaryDirectory()
            cOutputDirURL = try! FileManager.default.createTemporaryDirectory()
            docsOutputDirURL = try! FileManager.default.createTemporaryDirectory()
            doccCollectionOutputDirURL = try! FileManager.default.createTemporaryDirectory()

            generator = try Generator(redistSdkURL: fixturesRedistSdkURL,
                                      swiftOutputDirURL: swiftOutputDirURL,
                                      cOutputDirURL: cOutputDirURL,
                                      docStructureOutputDirURL: docsOutputDirURL,
                                      doccCollectionOutputDirURL: doccCollectionOutputDirURL)
        }

        deinit {
            try? FileManager.default.removeItem(at: swiftOutputDirURL)
            try? FileManager.default.removeItem(at: cOutputDirURL)
            try? FileManager.default.removeItem(at: docsOutputDirURL)
            try? FileManager.default.removeItem(at: doccCollectionOutputDirURL)
            unsetenv(IO.PATCH_YAML_PATH_VAR)
            unsetenv(IO.SDK_EXTRA_JSON_PATH_VAR)
        }
    }

    #endif
}
