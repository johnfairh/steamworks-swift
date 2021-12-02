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

public protocol SteamMatchmakingServerListResponse {
    /// Server has responded ok with updated data
    func serverResponded(request: HServerListRequest, iServer: Int)
    /// Server has failed to respond
    func serverFailedToRespond(request: HServerListRequest, iServer: Int)
    /// A list refresh you had initiated is now 100% completed
    func refreshComplete(request: HServerListRequest, response: MatchMakingServerResponse)
}

extension SteamMatchmakingServers {
    /// Steamworks `ISteamMatchmakingServers::RequestFavoritesServerList()`
    public func requestFavoritesServerList(appIndex: AppID, filters: MatchMakingKeyValuePairs, requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        let tmp_filters = MatchMakingKeyValuePairArray(filters)
        defer { tmp_filters.deallocate() }
        var shim = ShimMatchmakingServerListResponse()
        let rc = HServerListRequest(
            SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList(
                interface,
                AppId_t(appIndex),
                .init(tmp_filters),
                uint32(filters.count),
                nil/*&shim*/)
        )
        shim.listRequest = rc
        MatchmakingServersControl.bind(handle: rc, swift: requestServersResponse, cpp: shim)
        return rc
    }

    /// Steamworks `ISteamMatchmakingServers::ReleaseRequest()`
    public func releaseRequest(serverListRequest: HServerListRequest) {
        MatchmakingServersControl.unbind(handle: serverListRequest)
        SteamAPI_ISteamMatchmakingServers_ReleaseRequest(interface, serverListRequest.value)
    }
}

struct ShimMatchmakingServerListResponse {
    var listRequest: HServerListRequest!
    init() {
        listRequest = nil
    }
    func deallocate() {
        // delete this;
    }
}

var shims_server_responded_callback: (HServerListRequest, Int) -> Void = { _, _ in }

enum MatchmakingServersControl {
    struct Client {
        let swift: SteamMatchmakingServerListResponse
        let cpp: ShimMatchmakingServerListResponse
    }
    static var lock = Lock()
    static var serverQueries: [HServerListRequest : Client] = [:]

    /// Can't do this because requires static storage on the C side, but we just have a header.
    /// Have to store them in the shim instance.  Oh, or provide a pointer to a static table here on
    /// the swift side?  That would be OK.
    private static var initOnce: Void = {
        shims_server_responded_callback = { hsl, server in
            find(handle: hsl)?.serverResponded(request: hsl, iServer: server)
        }
    }()

    static func bind(handle: HServerListRequest, swift: SteamMatchmakingServerListResponse, cpp: ShimMatchmakingServerListResponse) {
        _ = initOnce

        lock.locked {
            serverQueries[handle] = Client(swift: swift, cpp: cpp)
        }
    }

    static func unbind(handle: HServerListRequest) {
        lock.locked {
            if let client = serverQueries.removeValue(forKey: handle) {
                client.cpp.deallocate()
            }
        }
    }

    static func find(handle: HServerListRequest) -> SteamMatchmakingServerListResponse? {
        lock.locked {
            serverQueries[handle]?.swift
        }
    }
}
