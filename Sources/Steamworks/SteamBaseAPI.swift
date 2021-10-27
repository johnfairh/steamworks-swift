//
//  SteamBaseAPI.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

// Not offering a way to unregister callbacks:
// 1) Steamworks doesn't let you do it
// 2) The locking/cancellation honouring is horrendous

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
        func add(rawClient: @escaping RawClient, callbackID: CallbackID) {
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

        func add(rawClient: @escaping RawClient, callID: SteamAPICall_t) {
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
            if SteamAPI_ManualDispatch_GetAPICallResult(
                steamPipe,
                callCompleted.m_hAsyncCall,
                callResult,
                Int32(callCompleted.m_cubParam),
                callCompleted.m_iCallback,
                &failed) {
                print("Call completed failed=\(failed) for \(callCompleted.m_hAsyncCall), \(callCompleted.m_cubParam) bytes")
                CallResults.shared.dispatch(callID: callCompleted.m_hAsyncCall, rawData: callResult)
            } else {
                print("Mysterious failure from GetAPICallResult() for \(callCompleted.m_hAsyncCall), \(callCompleted.m_cubParam) bytes")
            }
        }
    }
}
