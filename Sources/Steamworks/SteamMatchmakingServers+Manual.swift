//
//  SteamMatchmakingServers+Manual.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

// SteamMatchmakingServers
// -----------------------
// This API is unlike any of the others, it's written in only-in-C++ type way which is
// very convenient unless you are using it in a different language.
//
// The API is based around sets of callbacks over time, so users pass in not even
// structs packed with function pointers but C++ classes inheriting from a bunch of
// ABCs.
//
// One day Swift will be able to write a type that overrides a bunch of virtual methods,
// but not today.
//
// Q: How to receive the C++ callbacks?
// A: We implement a bunch of shim C++ classes whose instances store function pointers
// back to Swift code and forward method calls.  We should be able to generate these
// because they're in the JSON.  TBD.
//
// Q: How to manage the lifetime of the shim objects?
// A: We could make the client do it somehow.  But it is friendlier not to do that,
// instead we will maintain a database here in this layer and snoop the interface's
// APIs for erecting and tearing down queries.
// This probably means we will not generate most of the APIs in this interface.  TBD.
//
// Q: How to connect client Swift code to the callbacks->shims?
// A: Clients will get a protocol to implement, just like C++ clients.  We should be
// able to generate these protocols from the JSON.  TBD.  The 'Query' category of
// C++ callbacks do not carry a context pointer inline, relying instead on `this`,
// so we will have to add this on the C++ -> Swift layer.
//
// (This is rather abusing existentials here but not having to type-erase all these
// dumb callback things is pleasant.)

// MARK: Client Protocols

public protocol SteamMatchmakingServerListResponse {
    /// Server has responded ok with updated data
    func serverResponded(request: HServerListRequest, iServer: Int)
    /// Server has failed to respond
    func serverFailedToRespond(request: HServerListRequest, iServer: Int)
    /// A list refresh you had initiated is now 100% completed
    func refreshComplete(request: HServerListRequest, response: MatchMakingServerResponse)
}

// MARK: Query lifetime interfaces

extension SteamMatchmakingServers {
    /// Steamworks `ISteamMatchmakingServers::RequestInternetServerList()`
    public func requestInternetServerList(appIndex: AppID,
                                          filters: MatchMakingKeyValuePairs,
                                          requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        let tmp_filters = MatchMakingKeyValuePairArray(filters)
        defer { tmp_filters.deallocate() }
        let shim = CShimServerListResponse.Allocate(MatchmakingServersControl.vtable)
        let rc = HServerListRequest(SteamAPI_ISteamMatchmakingServers_RequestInternetServerList(
                                        interface,
                                        AppId_t(appIndex),
                                        .init(tmp_filters),
                                        uint32(filters.count),
                                        shim.pointee.getInterface()))
        guard rc != .invalid else {
            shim.pointee.Deallocate()
            return .invalid
        }
        MatchmakingServersControl.bind(handle: rc, swift: requestServersResponse, cpp: shim)
        return rc
    }

    /// Steamworks `ISteamMatchmakingServers::ReleaseRequest()`
    public func releaseRequest(serverListRequest: HServerListRequest) {
        MatchmakingServersControl.unbind(handle: serverListRequest)
        SteamAPI_ISteamMatchmakingServers_ReleaseRequest(interface, .init(serverListRequest))
    }
}

// MARK: C++ -> Swift callback plumbing

enum MatchmakingServersControl {
    typealias CShimServerListResponsePtr = UnsafeMutablePointer<CShimServerListResponse>

    // MARK: Database

    private struct Client {
        let swift: SteamMatchmakingServerListResponse
        let cpp: CShimServerListResponsePtr
    }
    private static var lock = Lock()
    private static var serverQueries: [HServerListRequest : Client] = [:]

    // MARK: The list of glue callbacks exposed to C++ shim

    static let vtable: UnsafePointer<ShimMatchmakingVTable_t> = {
        let ptr = UnsafeMutablePointer<ShimMatchmakingVTable_t>.allocate(capacity: 1)
        ptr.initialize(to: .init(
            serverResponded: { chsl, server in
                let hsl = HServerListRequest(chsl)
                find(handle: hsl)?.serverResponded(request: hsl, iServer: Int(server))
            },
            serverFailedToRespond: { chsl, server in
                let hsl = HServerListRequest(chsl)
                find(handle: hsl)?.serverFailedToRespond(request: hsl, iServer: Int(server))
            },
            refreshComplete: { chsl, rsp in
                let hsl = HServerListRequest(chsl)
                find(handle: hsl)?.refreshComplete(request: hsl, response: .init(rsp))
            }
        ))
        return UnsafePointer(ptr)
    }()

    // MARK: APIs

    static func bind(handle: HServerListRequest, swift: SteamMatchmakingServerListResponse, cpp: CShimServerListResponsePtr) {
        lock.locked {
            serverQueries[handle] = Client(swift: swift, cpp: cpp)
        }
    }

    static func unbind(handle: HServerListRequest) {
        lock.locked {
            if let client = serverQueries.removeValue(forKey: handle) {
                client.cpp.pointee.Deallocate()
            }
        }
    }

    private static func find(handle: HServerListRequest) -> SteamMatchmakingServerListResponse? {
        lock.locked {
            if let rsp = serverQueries[handle]?.swift {
                return rsp
            }
            logError("Got SteamMatchmakingServerListResponse callback for unknown handle: \(handle)")
            return nil
        }
    }
}
