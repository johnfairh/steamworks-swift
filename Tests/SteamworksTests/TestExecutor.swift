//
//  TestExecutor.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import SteamworksConcurrency
import XCTest
import Foundation

/// Custom executor
class TestExecutor: XCTestCase {
    actor SimpleActor {
        nonisolated let unownedExecutor: UnownedSerialExecutor
        var counter = 0
        init(executor: UnownedSerialExecutor) {
            self.unownedExecutor = executor
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
    }

    /// Test this thing basically works
    func testExecutor() async throws {
        let threadName = "TestExec"
        let executor = SteamExecutor(apiClient: .init(), name: threadName)
        defer { executor.stop() }

        let actor = SimpleActor(executor: executor.asUnownedSerialExecutor())
        await actor.doSomething()
        let counter = await actor.counter
        XCTAssertEqual(3, counter)

        let stats = executor.stats
        XCTAssertTrue(stats.jobCount >= 3)
        XCTAssertEqual(1, stats.apiClients.count)
        XCTAssertTrue(stats.apiClients[0].pollCount > 1)

        let thread = try XCTUnwrap(executor.thread)
        XCTAssertEqual(threadName, thread.name)

        // explicit shutdown - the defer one should nop
        executor.stop()
    }

    /// Test the polling frequency is roughly correct
    func testExecutorSinglePolling() async throws {
        let executor = SteamExecutor(apiClient: .init(interval: 0.5)) // poll every 0.5s
        defer { executor.stop() }

        let actor = SimpleActor(executor: executor.asUnownedSerialExecutor())
        try await actor.idlePause(seconds: 4)
        let stats = try XCTUnwrap(executor.stats.apiClients.first)
        XCTAssertGreaterThanOrEqual(stats.pollCount, 8)
        XCTAssertLessThanOrEqual(stats.pollCount, 8 + 2)
    }

    /// Test the multi-client polling
    func testExecutorMultiPolling() async throws {
        let executor = SteamExecutor(apiClients: [
            .init(interval: 0.5, name: "500ms"),
            .init(interval: 0.1, name: "10ms"),
            .init(interval: 1.0, name: "1s")
        ])
        defer { executor.stop() }

        let actor = SimpleActor(executor: executor.asUnownedSerialExecutor())
        try await actor.busyPause(seconds: 4)
        let stats = executor.stats

        let expectedMin = [4 * 2, 4 * 10, 4 * 1]
        for (c, m) in zip(stats.apiClients, expectedMin) {
            XCTAssertGreaterThanOrEqual(c.pollCount, m)
            XCTAssertLessThanOrEqual(c.pollCount, m + 2)
        }
    }
}
