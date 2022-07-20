//
//  TestUtils.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation
import XCTest
@testable import LibGenerate
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
        setenv("SteamAppId", "480", 1)
        if let steam = SteamAPI() {
            TestClient.client = Client(steam: steam)
            atexit {
                TestClient.client = nil
            }
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

    static var fixturesSdkURL: URL {
        fixturesURL.appendingPathComponent("sdk")
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
        let generator: Generator

        init() throws {
            setenv(IO.PATCH_YAML_PATH_VAR, patchYAMLURL.path, 1)
            setenv(IO.SDK_EXTRA_JSON_PATH_VAR, sdkExtraJSONURL.path, 1)
            swiftOutputDirURL = try! FileManager.default.createTemporaryDirectory()
            cOutputDirURL = try! FileManager.default.createTemporaryDirectory()
            generator = try Generator(sdkURL: fixturesSdkURL,
                                      swiftOutputDirURL: swiftOutputDirURL,
                                      cOutputDirURL: cOutputDirURL)
        }

        deinit {
            try? FileManager.default.removeItem(at: swiftOutputDirURL)
            try? FileManager.default.removeItem(at: cOutputDirURL)
            unsetenv(IO.PATCH_YAML_PATH_VAR)
            unsetenv(IO.SDK_EXTRA_JSON_PATH_VAR)
        }
    }
}
