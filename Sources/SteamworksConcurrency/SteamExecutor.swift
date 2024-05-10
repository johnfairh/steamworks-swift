//
//  SteamExecutor.swift
//  SteamworksHelpers
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation // NSCondition, Thread
import Steamworks

// doesn't work on Linux:
//
// 1) foundation APIs don't match
// 2) swift-atomics doesn't link (maybe C++ breakage?)

#if !os(Linux)

import Atomics

/// An executor for associating Actors with Steamworks
///
/// **EXPERIMENTAL**
///
/// This creates a single new thread to run ``Actor``/``Task`` code and periodically
/// call Steamworks -- either to dispatch callbacks or do Steamworks maintenance work.
///
/// A single executor thread can support multiple ``APIClient``s so you can service a
/// gameserver and client API from the same thread.
///
/// This solves the problem of using Swift concurrency with Steamworks outside of the
/// main thread.
///
/// Problems:
/// 1. Until Swift 6 makes isolation inheritance work, it's still not safe to actually use the
///   `async` version of the APIs.
///
/// 2. The poll resolution promised by the API is dubious -- probably because of the
///   thread priorities available via ``NSThread`` getting anything below 100ms is a
///   bit sketchy.
///
/// To Do (perhaps):
/// * Change the API clients at runtime - eg. creation of a server or something
/// * Figure out what on earth is wrong with Linux vs. swift-atomics
public final class SteamExecutor: SerialExecutor, @unchecked Sendable {
    /// Combination mutex & CV protecting ``jobs`` and ``quit`` and ``thread``
    private let cond: NSCondition

    /// Swift concurrency work pending execution
    private var jobs: [UnownedJob]

    /// Interlocked state for ``stop()`.
    private enum Quit {
        case no
        case sent
        case done
    }
    private var quit: Quit

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
        /// The Steamworks API to poll
        public let steam: SteamBaseAPI?

        /// Kind of polling to perform
        public enum PollKind {
            /// Call ``SteamBaseAPI.runCallbacks()``
            case runCallbacks
            /// Call ``SteamBaseAPI.releaseCurrentThreadMemory()``
            case releaseCurrentThreadMemory
        }
        public let pollKind: PollKind

        /// How frequently to poll
        public let interval: TimeInterval

        /// An identifier for this client, used for stats and debug
        public let name: String

        /// Create a new client to be polled
        /// - Parameters:
        ///   - steam: A ``SteamAPI`` or ``SteamGameServerAPI`` to be polled.
        ///   - pollKind: What kind of polling to perform.  Default is ``.runCallbacks`` which means Steamworks callbacks
        ///               can occur on the executor's thread.
        ///   - interval: How often to make the polling call.
        ///               More precisely, this time is left between calls to the polling function.  No attempt is made
        ///               to claw back lost time or account for time spent polling.
        ///   - name: A name for this client, used for stats and debug.
        public init(_ steam: SteamBaseAPI?, pollKind: PollKind = .runCallbacks, interval: TimeInterval = 0.1, name: String = "APIClient") {
            self.steam = steam
            self.pollKind = pollKind
            self.interval = interval
            self.name = name
        }
    }

    /// Statistics about the executor and its API clients
    public struct Stats {
        /// Total number of jobs executed
        public let jobCount: Int

        /// Statistics for one ``SteamExecutor.APIClient``
        public struct APIClient {
            /// The name of the API client
            public let name: String
            /// Total number of polls
            public let pollCount: Int
        }

        /// Per-``APIClient`` statistics, in order of clients passed to ``SteamExecutor.init()``.
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
            let now = Date.now
            if now >= due {
                poll()
                // intentionally resample, not counting time in `poll()`
                due = Date.now.advanced(by: client.interval)
            }
            return due
        }

        func poll() {
            pollCount.wrappingIncrement(ordering: .relaxed)

            guard let steam = client.steam else {
                return
            }

            switch client.pollKind {
            case .runCallbacks:
                steam.runCallbacks()
            case .releaseCurrentThreadMemory:
                steam.releaseCurrentThreadMemory()
            }
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
    /// - Parameters:
    ///   - apiClients: Description of Steamworks tasks to perform on this thread.
    ///   - qos: The ``QualityOfService`` for the executor's thread.
    ///   - name: A name for the executor's thread, used in stats and debug.
    public init(apiClients: [APIClient], qos: QualityOfService = .default, name: String = "SteamExecutor") {
        self.cond = NSCondition()
        self.jobs = []
        self.quit = .no
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

    /// Create an executor to service a single Steam API client.
    ///
    /// See ``init(apiClients:name:qos:)``.
    public convenience init(apiClient: APIClient, qos: QualityOfService = .default, name: String = "SteamExecutor") {
        self.init(apiClients: [apiClient], qos: qos, name: name)
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
        // for general fairness this should probably rotate the clients
        // but i doubt worth it here..
    }

    private func threadMain() {
        cond.lock()

        while quit == .no {
            maybePoll()

            if jobs.isEmpty {
                cond.wait(until: apiPollDue)
            }
            let loopJobs = jobs
            jobs = []

            cond.unlock()

            // May be worth adding ``maybePoll()`` calls into this loop,
            // or limiting the time spent - on the whole though think not,
            // we're not in RT-world here.  New jobs created by this loop
            // don't extend it, in practice the length of the list is of the
            // order #-actors-using-executor

            for job in loopJobs {
                jobCount.wrappingIncrement(ordering: .relaxed)
                job.runSynchronously(on: asUnownedSerialExecutor())
            }

            cond.lock()
        }

        quit = .done
        cond.signal()

        cond.unlock()
    }

    /// Get a snapshot of the executor's statistics
    public var stats: Stats {
        Stats(jobCount: jobCount.load(ordering: .relaxed),
              apiClients: apiPolls.map(\.stats))
    }

    /// Send a job to be executed later on the thread
    ///
    /// Called by the Swift runtime, do not call.  :nodoc:
    public func enqueue(_ job: consuming ExecutorJob) {
        let unownedJob = UnownedJob(job)
        cond.withLock {
            jobs.append(unownedJob)
            cond.signal()
        }
    }

    /// Stop the executor.
    ///
    /// Blocks until the thread has finished any pending jobs. If any actors still exist associated with
    /// this then they will stop working in a bad way.
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

#else

public final class SteamExecutor: SerialExecutor, @unchecked Sendable {
    public struct APIClient {
        public init(_ steam: SteamBaseAPI?, interval: TimeInterval = 0.1, name: String = "APIClient") {
        }
    }

    public struct Stats {
        public let jobCount: Int
        public struct APIClient {
            public let name: String
            public let pollCount: Int
        }
        public let apiClients: [APIClient]
    }

    public var thread: Thread? {
        nil
    }

    public var stats: Stats { Stats(jobCount: 0, apiClients:[Stats.APIClient(name: "", pollCount: 0)]) }
    public func enqueue(_ job: consuming ExecutorJob) {}
    public func stop() {}

    public init(apiClients: [APIClient], qos: QualityOfService = .default, name: String = "SteamExecutor") {}
    public convenience init(apiClient: APIClient, qos: QualityOfService = .default, name: String = "SteamExecutor") {
        self.init(apiClients: [apiClient])
    }
}

#endif

// Quick manual implementation of NSCondition - has no effect on scheduling
// performance or anything really, guess this is what NSCondition is doing:
// it has objc_msgSend going on but I guess that is all cached or irrelevant.
//
//private final class JCond {
//    private var mutex: UnsafeMutablePointer<pthread_mutex_t>
//    private var cond: UnsafeMutablePointer<pthread_cond_t>
//
//    init() {
//        mutex = .allocate(capacity: 1)
//        var mattr = pthread_mutexattr_t()
//        pthread_mutexattr_init(&mattr)
//        pthread_mutexattr_settype(&mattr, PTHREAD_MUTEX_NORMAL)
//        pthread_mutex_init(mutex, &mattr)
//        pthread_mutexattr_destroy(&mattr)
//
//        cond = .allocate(capacity: 1)
//        pthread_cond_init(cond, nil)
//    }
//
//    func lock() {
//        pthread_mutex_lock(mutex)
//    }
//
//    func unlock() {
//        pthread_mutex_unlock(mutex)
//    }
//
//    func withLock<R>(_ call: () throws -> R) rethrows -> R {
//        lock()
//        defer { unlock() }
//        return try call()
//    }
//
//    func wait() {
//        pthread_cond_wait(cond, mutex)
//    }
//
//    func wait(until: Date) {
//        let epochDouble = until.timeIntervalSince1970
//        let epochSeconds = trunc(epochDouble)
//        let epochNano = trunc(fmod(epochDouble, 1.0) * 1E9)
//        var timespec = timespec(tv_sec: epochSeconds, tv_nsec: epochNano)
//        pthread_cond_timedwait(cond, mutex, &timespec)
//    }
//
//    func signal() {
//        pthread_cond_signal(cond)
//    }
//
//    deinit {
//        pthread_cond_destroy(cond)
//        cond.deallocate()
//        pthread_mutex_destroy(mutex)
//        mutex.deallocate()
//    }
//}
//
// Swift C++ baffling decisions
//extension pthread_mutexattr_t {
//    init() {
//        self.init(__sig: 0, __opaque: (0,0,0,0,0,0,0,0))
//    }
//}
