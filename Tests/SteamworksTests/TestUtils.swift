//
//  TestUtils.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation
import XCTest
@testable import LibGenerate
import Steamworks
import CSteamworks // for weird 'Linux C++ mode erase random stdlib calls' issue

#if canImport(Darwin)
import Darwin
#endif
#if canImport(GLibc)
import Glibc
#endif

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
            while runningFrames && RunLoop.current.run(mode: .default, before: .distantFuture) {
            }
        }

        func stopRunningFrames() {
            precondition(runningFrames)
            frameCallback = nil
            runningFrames = false
        }
    }

    private static var client: Client?

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

    /// Run frames until  `stopRunningFrames` is called
    static func runFrames(callback: FrameCallback? = nil) {
        client?.runFrames(callback: callback)
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

    class Harness {
        let swiftOutputDirURL: URL
        let cOutputDirURL: URL
        let docsOutputDirURL: URL
        let doccCollectionOutputDirURL: URL
        let generator: Generator

        init() throws {
            my_setenv(IO.PATCH_YAML_PATH_VAR, patchYAMLURL.path)
            my_setenv(IO.SDK_EXTRA_JSON_PATH_VAR, sdkExtraJSONURL.path)
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
            my_unsetenv(IO.PATCH_YAML_PATH_VAR)
            my_unsetenv(IO.SDK_EXTRA_JSON_PATH_VAR)
        }
    }
}
