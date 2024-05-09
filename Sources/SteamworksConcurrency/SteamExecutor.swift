//
//  SteamExecutor.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation // NSCondition, Thread
import Atomics

// add in steam tweaks

// hmm
extension TimeInterval {
    public static let steamFastPoll: TimeInterval = Double(1)/Double(60)
    public static let steamSlowPoll: TimeInterval = 0.1
}

public final class SteamExecutor: SerialExecutor, @unchecked Sendable {
    /// Combination mutex & CV protecting ``jobs`` and ``quit`` and ``thread``
    private let cond = NSCondition()

    /// Swift concurrency work pending execution
    private var jobs = [UnownedJob]()

    /// Interlocked state for ``stop()`.
    private enum Quit {
        case no
        case sent
        case done
    }
    private var quit = Quit.no

    /// The `QualityOfService`used by the executor's thread
    public let qos: QualityOfService
    /// The (debug) name associated with the executor's thread and locks
    public let name: String

    private var _thread: Thread?

    /// The ``Thread`` for the executor, or ``nil`` if it's not running
    public private(set) var thread: Thread? {
        get {
            cond.withLock { _thread }
        }
        set {
            cond.withLock { _thread = newValue }
        }
    }

    /// A Steam API Client to be periodically polled
    public struct APIClient {
        /// How frequently to poll the client
        public let interval: TimeInterval
        /// An identifier for the client, used for stats and debug
        public let name: String

        // the api instance
        // which poll to call


        /// Create a new client to be polled
        public init(interval: TimeInterval = .steamSlowPoll, name: String = "APIClient") {
            self.interval = interval
            self.name = name
        }
    }

    /// Statistics about the executor and its API clients
    public struct Stats {
        /// Total number of jobs executed
        public let jobCount: Int

        /// Per-``APIClient`` statistics
        public struct APIClient {
            /// The name of the API client
            public let name: String
            /// Total number of polls
            public let pollCount: Int
        }

        public let apiClients: [APIClient]
    }

    /// Executor tracking of the API Clients
    private final class APIPoll {
        let client: APIClient
        private var due: Date
        private(set) var pollCount: ManagedAtomic<Int>

        init(client: APIClient) {
            self.client = client
            self.due = .distantPast
            self.pollCount = .init(0)
        }

        func maybePoll() -> Date {
            if Date.now >= due {
                poll()
                // intentionally resample, not counting time in `poll()`
                due = Date.now.advanced(by: client.interval)
            }
            return due
        }

        func poll() {
            pollCount.wrappingIncrement(ordering: .relaxed)
        }

        var stats: Stats.APIClient {
            Stats.APIClient(
                name: client.name,
                pollCount: pollCount.load(ordering: .relaxed)
            )
        }
    }

    /// The set of Steam APIs this executor's thread is responsible for polling.
    /// Only safe to access the non-atomic/constant parts from the thread.
    private let apiPolls: [APIPoll]
    /// Cache of earliest deadline.  Only safe to access from the thread.
    private var apiPollDue: Date

    /// Stats
    private var jobCount: ManagedAtomic<Int>

    /// Create a new steamworks-focussed executor
    ///
    /// This creates a single new thread to run ``Actor``/``Task`` code and periodically
    /// call Steamworks to dispatch callbacks.
    ///
    public init(apiClients: [APIClient], name: String = "SteamExecutor", qos: QualityOfService = .default) {
        self.qos = qos
        self.name = name
        self.cond.name = "\(name) CV"
        self._thread = nil
        self.apiPolls = apiClients.map { .init(client: $0) }
        self.apiPollDue = .distantPast
        self.jobCount = .init(0)

        Thread.detachNewThread { [unowned self] in
            Thread.current.qualityOfService = qos
            Thread.current.name = name
            thread = Thread.current
            threadMain()
            thread = nil
        }
    }

    /// Create an executor to service a single steam API client.
    ///
    /// See ``init(apiClients:name:qos:)``.
    public convenience init(apiClient: APIClient, name: String = "SteamExecutor", qos: QualityOfService = .default) {
        self.init(apiClients: [apiClient], name: name, qos: qos)
    }

    private func maybePoll() {
        guard Date.now >= apiPollDue else {
            return
        }
        apiPollDue = .distantFuture
        for apiPoll in apiPolls {
            let thisDue = apiPoll.maybePoll()
            apiPollDue = min(thisDue, apiPollDue)
        }
    }

    private func threadMain() {
        while quit == .no {
            maybePoll()
            let loopJobs = cond.withLock {
                cond.wait(until: apiPollDue)
                defer { jobs = [] }
                return jobs
            }

            for job in loopJobs {
                jobCount.wrappingIncrement(ordering: .relaxed)
                job.runSynchronously(on: asUnownedSerialExecutor())
                maybePoll()
            }
        }

        cond.withLock {
            quit = .done
            cond.signal()
        }
    }

    /// Get a snapshot of the executor's statistics
    public var stats: Stats {
        Stats(jobCount: jobCount.load(ordering: .relaxed),
              apiClients: apiPolls.map(\.stats))
    }

    /// Send a job to be executed later on the thread; returns immediately
    public func enqueue(_ job: consuming ExecutorJob) {
        let unownedJob = UnownedJob(job)
        cond.withLock {
            jobs.append(unownedJob)
            cond.signal()
        }
    }

    /// Stop the thread - blocks until the thread has finished any pending work
    /// If any actors still exist associated with this then they will stop working...
    public func stop() {
        cond.withLock {
            guard quit == .no else {
                return
            }
            quit = .sent
            cond.signal()

            while quit == .sent {
                cond.wait()
            }
        }
    }
}
