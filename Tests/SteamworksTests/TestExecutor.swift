//
//  TestExecutor.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks
import SteamworksConcurrency
import XCTest
import Foundation

/// Custom executor
class TestExecutor: XCTestCase {
    actor SteamActor {
        nonisolated let unownedExecutor: UnownedSerialExecutor
        var counter = 0
        init(executor: SteamExecutor) {
            self.unownedExecutor = executor.asUnownedSerialExecutor()
        }

        func doSomething() async {
            counter += 1
            try? await Task.sleep(for: .milliseconds(20))
            counter += 1
            try? await Task.sleep(for: .milliseconds(20))
            counter += 1
        }

        /// Do nothing in one go - exercises the executor's "no jobs are being scheduled" path
        func idlePause(seconds: Int) async throws {
            try await Task.sleep(for: .seconds(seconds))
        }

        /// Do nothing very busily - exercise the executors "jobs are being scheduled" path
        func busyPause(seconds: Int) async throws {
            let until = Date.now.addingTimeInterval(TimeInterval(seconds))
            while Date.now < until {
                try await Task.sleep(for: .milliseconds(20))
            }
        }

        func steamWork(_ steam: SteamAPI) async {
            let steamID = steam.user.getSteamID()

            let fc = await steam.friends.getFollowerCount(steamID: steamID)

            if let fc, fc.result == .ok {
                print("GetFollowerCount: \(fc.count) followers")
            } else {
                if let fc {
                    XCTFail("GetFollowerCount async failed: \(fc)")
                } else {
                    XCTFail("GetFollowerCount async failed, nil fc")
                }
            }
        }
    }

    /// Can't build the executor on Linux, atomics doesn't link & foundation is broken
    func skipLinux() throws {
        #if os(Linux)
        throw XCTSkip("Linux doesn't work")
        #endif
    }

    lazy var isCI: Bool = {
        ProcessInfo.processInfo.environment["CI"] != nil
    }()

    /// Test this thing basically works
    func testExecutor() async throws {
        try skipLinux()

        let threadName = "TestExec"
        let executor = SteamExecutor(apiClient: .init(nil), name: threadName)
        defer { executor.stop() }

        let actor = SteamActor(executor: executor)
        await actor.doSomething()
        let counter = await actor.counter
        XCTAssertEqual(3, counter)

        let stats = executor.stats
        XCTAssertTrue(stats.jobCount >= 3)
        XCTAssertEqual(1, stats.apiClients.count)
        XCTAssertTrue(stats.apiClients[0].pollCount >= 1)

        let thread = try XCTUnwrap(executor.thread)
        XCTAssertEqual(threadName, thread.name)

        // explicit shutdown - the defer one should nop
        executor.stop()
    }

    /// Test the polling frequency is roughly correct
    func testExecutorSinglePolling() async throws {
        try skipLinux()

        let executor = SteamExecutor(apiClient: .init(nil, interval: 0.5)) // poll every 0.5s
        defer { executor.stop() }

        let actor = SteamActor(executor: executor)
        try await actor.idlePause(seconds: 4)
        let stats = try XCTUnwrap(executor.stats.apiClients.first)
        XCTAssertGreaterThanOrEqual(stats.pollCount, isCI ? 6 : 8)
        XCTAssertLessThanOrEqual(stats.pollCount, 8 + 2)
    }

    /// Test the multi-client polling
    func testExecutorMultiPolling() async throws {
        try skipLinux()

        let executor = SteamExecutor(apiClients: [
            .init(nil, interval: 0.5, name: "500ms"),
            .init(nil, interval: 0.1, name: "100ms"),
            .init(nil, interval: 1.0, name: "1s")
        ], qos: .userInteractive)
        defer { executor.stop() }

        let actor = SteamActor(executor: executor)
        try await actor.busyPause(seconds: 4)
        let stats = executor.stats

        let expectedMin = [4 * 2, 4 * 10, 4 * 1]
        for (c, m) in zip(stats.apiClients, expectedMin) {
            print("\(c.name): \(c.pollCount), expected \(m)")

            // In the CI environment, presumably virtualized and heavily over-
            // subscribed, can't hit the 100ms target - tasks just don't get
            // swapped back in quickly enough and time leaks away - only manage
            // about 30 calls.

            if !isCI {
                XCTAssertGreaterThanOrEqual(c.pollCount, m)
                XCTAssertLessThanOrEqual(c.pollCount, m + 2)
            }
        }
    }

    func testExecutorSteam() async throws {
        try skipLinux()

        let steam = try TestClient.getClient()

        let executor = SteamExecutor(apiClient: .init(steam, interval: 0.1, name: "SteamClient"))
        defer { executor.stop() }

        let actor = SteamActor(executor: executor)
        await actor.steamWork(steam)
    }
}
