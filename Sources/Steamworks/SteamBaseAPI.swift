//
//  SteamBaseAPI.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

// SteamBase API - wrap up common interface stuff between user and gameserver APIs
// * callbacks, callreturns dispatch
// * methods to register for callbacks
// * polymorphic interface getters
//
// Not offering a way to unregister callbacks:
// 1) Steamworks doesn't let you do it
// 2) The locking/cancellation honouring is horrendous

@_implementationOnly import CSteamworks
import Logging

/// Behavior common to both the user and game server APIs.
///
/// You can't create this directly; instead use a `SteamAPI` or `SteamGameServerAPI`.
///
/// In Steamworks, a _callback_ is a broadcast notification.  In C++ you discover what notifications
/// are available from the docs and use the `STEAM_CALLBACK()` macro to connect your method.
/// In this Swift version you register using a run-time call to one of the [registration methods](#tpc-callback-registration)
/// such as `onSteamServersConnected(...)`.  If you register after creating your API instance
/// and before mkaing your first call to `runCallbacks()` then your code is equivalent to the C++
/// version.
public class SteamBaseAPI: @unchecked Sendable {
    /// Type-erased client closure, expose this to other files because of code gen
    typealias RawClient = (UnsafeMutableRawPointer) -> Void

    /// Type-eraser for client closures, again exposed to other files because of code gen
    static func makeRaw<SteamType, SwiftType>(_ client: @escaping (SwiftType) -> Void) -> RawClient where
    SwiftType : SteamCreatable, SwiftType.SteamType == SteamType {
        { client(SwiftType($0.bindMemory(to: SteamType.self, capacity: 1).pointee)) }
    }

    // MARK: Callbacks

    final class Callbacks {
        private var clients = [CallbackID : [RawClient]]()
        private var lock = Lock()

        /// Add a client
        func add(callbackID: CallbackID, rawClient: @escaping RawClient) {
            lock.locked {
                var list = clients[callbackID, default: []]
                list.append(rawClient)
                clients[callbackID] = list
            }
        }

        /// Dispatch a callback
        func dispatch(callbackID: CallbackID, rawData: UnsafeMutableRawPointer) {
            guard let list = lock.locked({ clients[callbackID] }) else {
                return
            }
            list.forEach { $0(rawData) }
        }
    }

    let callbacks = Callbacks()

    // MARK: CallResults

    final class CallResults {
        private var pending = [SteamAPICall_t : RawClient]()
        private var lock = Lock()

        func add(callID: SteamAPICall_t, rawClient: @escaping RawClient) {
            lock.locked {
                pending[callID] = rawClient
            }
        }

        func dispatch(callID: SteamAPICall_t, rawData: UnsafeMutableRawPointer) {
            if let client = lock.locked({ pending.removeValue(forKey: callID) }) {
                client(rawData)
            }
        }

        private init() {}

        static let shared = CallResults()
    }

    // MARK: Steam interface

    private let steamPipe: HSteamPipe
    private let lock: Lock

    private static var initOnce: Void = {
        SteamAPI_ManualDispatch_Init()
    }()

    init(steamPipe: HSteamPipe) {
        self.steamPipe = steamPipe
        self.lock = Lock()

        _ = SteamBaseAPI.initOnce
    }

    // MARK: Notifications

    /// Dispatch callbacks and call-returns.
    ///
    /// _Callbacks_ are broadcast notifications.  _Call returns_ are asynchronous replies to
    /// certain API functions such as `SteamFriends.getFollowerCount(...)`.
    ///
    /// Typically call once per frame on one thread.  The implementation uses the steamworks
    /// 'manual dispatch' approach, but the docs from `SteamAPI_RunCallbacks` and
    /// `SteamGameServer_RunCallbacks` apply.
    ///
    /// This routine is safe to call on multiple threads but will deadlock if called reentrantly.
    public func runCallbacks() {
        lock.locked {
            SteamAPI_ManualDispatch_RunFrame(steamPipe)

            var callback = CallbackMsg_t()
            while SteamAPI_ManualDispatch_GetNextCallback(steamPipe, &callback) {
                defer { SteamAPI_ManualDispatch_FreeLastCallback(steamPipe) }

                if ( callback.m_iCallback == SteamAPICallCompleted_t_k_iCallback ) {
                    onCallCompleted(callback: callback)
                } else {
                    print("Global notification for callback ID \(callback.m_iCallback), \(callback.m_cubParam) bytes")
                    callbacks.dispatch(callbackID: callback.m_iCallback,
                                       rawData: UnsafeMutableRawPointer(callback.m_pubParam))
                }
            }
        }
    }

    /// Call periodically on all threads that are not calling `runCallbacks()`.
    public func releaseCurrentThreadMemory() {
        SteamAPI_ReleaseCurrentThreadMemory() // === SteamGameServer_ReleaseCur....
    }

    // Workaround anonymous enums not imported, special case here
    private let SteamAPICallCompleted_t_k_iCallback = CallbackID(703)

    private func onCallCompleted(callback: CallbackMsg_t) {
        assert(callback.m_iCallback == SteamAPICallCompleted_t_k_iCallback)

        callback.m_pubParam.withMemoryRebound(to: SteamAPICallCompleted_t.self, capacity: 1) {
            let callCompleted = $0.pointee

            // Temp buffer for the actual results
            let callResult = UnsafeMutableRawPointer
                .allocate(byteCount: Int(callCompleted.m_cubParam), alignment: MemoryLayout<Int>.size)
            defer { callResult.deallocate() }

            var failed = true
            let success = SteamAPI_ManualDispatch_GetAPICallResult(
                steamPipe,
                callCompleted.m_hAsyncCall,
                callResult,
                Int32(callCompleted.m_cubParam),
                callCompleted.m_iCallback,
                &failed)

            if !success {
                logError("Failure return from SteamAPI_ManualDispatch_GetAPICallResult() for \(callCompleted.m_hAsyncCall), \(callCompleted.m_cubParam) bytes")
            } else if failed {
                logError("Failed flag set by SteamAPI_ManualDispatch_GetAPICallResult() for \(callCompleted.m_hAsyncCall), \(callCompleted.m_cubParam) bytes")
            } else {
                CallResults.shared.dispatch(callID: callCompleted.m_hAsyncCall, rawData: callResult)
            }
        }
    }

    // MARK: Logging

    /// Logger for the module.
    ///
    /// A [swift-log](https://github.com/apple/swift-log) `Logger`.
    ///
    /// Produces infrequent error-path diagnostic info at `Logger.Level.error` log level for the few
    /// operations that are actually implemented by the `Steamworks` Swift module.
    public static var logger = Logger(label: "steamworks")
}

func logError(_ message: @autoclosure () -> String) {
    SteamBaseAPI.logger.error(.init(stringLiteral: message()))
}
