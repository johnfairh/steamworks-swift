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
//
// ----
// Q: How did that plan work out?
// A: Very verbose but works OK, I think.  I can't quite raise the enthusiasm to
// go back to the generator side and generate all the C++/Swift code here -- seems too
// special-case.

// MARK: Client Protocols

/// Steamworks `ISteamMatchmakingServerListResponse`
public protocol SteamMatchmakingServerListResponse {
    /// Server has responded ok with updated data
    func serverResponded(request: HServerListRequest, iServer: Int)
    /// Server has failed to respond
    func serverFailedToRespond(request: HServerListRequest, iServer: Int)
    /// A list refresh you had initiated is now 100% completed
    func refreshComplete(request: HServerListRequest, response: MatchMakingServerResponse)
}

/// Steamworks `ISteamMatchmakingPingResponse`
public protocol SteamMatchmakingPingResponse {
    /// Server has responded successfully and has updated data
    func serverResponded(server: GameServerItem)
    /// Server failed to respond to the ping request
    func serverFailedToRespond()
}

/// Steamworks `ISteamMatchmakingPlayersResponse`
public protocol SteamMatchmakingPlayersResponse {
    /// Got data on a new player on the server
    func addPlayerToList(name: String, score: Int, timePlayed: Float)
    /// The server failed to respond to the request for player details
    func playersFailedToRespond()
    /// The server has finished responding to the player details request
    func playersRefreshComplete()
}

/// Steamworks `ISteamMatchmakingRulesResponse`
public protocol SteamMatchmakingRulesResponse {
    /// One of these per rule defined on the server you are querying
    func rulesResponded(rule: String, value: String)
    /// The server failed to respond to the request for rule details
    func rulesFailedToRespond()
    /// The server has finished responding to the rule details request
    func rulesRefreshComplete()
}

// MARK: Query lifetime interfaces

extension SteamMatchmakingServers {
    /// Abstract all of the separate 'server request' methods.
    /// Goodness knows why this isn't a single call with an enum for server-type.
    private typealias ServerRequestMethod = (UnsafeMutablePointer<ISteamMatchmakingServers>?,
                                             AppId_t,
                                             UnsafeMutablePointer<UnsafeMutablePointer<MatchMakingKeyValuePair_t>?>?,
                                             uint32,
                                             UnsafeMutablePointer<ISteamMatchmakingServerListResponse>?) -> CSteamworks.HServerListRequest?

    /// Call the given API with the same shape
    private func doRequestServerList(_ call: ServerRequestMethod,
                                     appIndex: AppID,
                                     filters: MatchMakingKeyValuePairs,
                                     requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        let tmp_filters = MatchMakingKeyValuePairArray(filters)
        defer { tmp_filters.deallocate() }
        let shim = CShimServerListResponse.Allocate(MatchmakingServersControl.vtable)
        let rc = HServerListRequest(call(interface,
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

    /// Steamworks `ISteamMatchmakingServers::RequestInternetServerList()`
    public func requestInternetServerList(appIndex: AppID,
                                          filters: MatchMakingKeyValuePairs,
                                          requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        doRequestServerList(SteamAPI_ISteamMatchmakingServers_RequestInternetServerList,
                            appIndex: appIndex,
                            filters: filters,
                            requestServersResponse: requestServersResponse)
    }

    /// Steamworks `ISteamMatchmakingServers::RequestLANServerList()`
    public func requestLANServerList(appIndex: AppID,
                                     requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        // This one doesn't have the filters so we fudge them in and out again.

        let api: ServerRequestMethod = { i, a, _, _, r in
            SteamAPI_ISteamMatchmakingServers_RequestLANServerList(i, a, r)
        }

        return doRequestServerList(api,
                                   appIndex: appIndex,
                                   filters: [:],
                                   requestServersResponse: requestServersResponse)
    }

    /// Steamworks `ISteamMatchmakingServers::RequestFriendsServerList()`
    public func requestFriendsServerList(appIndex: AppID,
                                         filters: MatchMakingKeyValuePairs,
                                         requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        doRequestServerList(SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList,
                            appIndex: appIndex,
                            filters: filters,
                            requestServersResponse: requestServersResponse)
    }

    /// Steamworks `ISteamMatchmakingServers::RequestFavoritesServerList()`
    public func requestFavoritesServerList(appIndex: AppID,
                                           filters: MatchMakingKeyValuePairs,
                                           requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        doRequestServerList(SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList,
                            appIndex: appIndex,
                            filters: filters,
                            requestServersResponse: requestServersResponse)
    }

    /// Steamworks `ISteamMatchmakingServers::RequestHistoryServerList()`
    public func requestHistoryServerList(appIndex: AppID,
                                         filters: MatchMakingKeyValuePairs,
                                         requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        doRequestServerList(SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList,
                            appIndex: appIndex,
                            filters: filters,
                            requestServersResponse: requestServersResponse)
    }

    /// Steamworks `ISteamMatchmakingServers::RequestSpectatorServerList()`
    public func requestSpectatorServerList(appIndex: AppID,
                                           filters: MatchMakingKeyValuePairs,
                                           requestServersResponse: SteamMatchmakingServerListResponse) -> HServerListRequest {
        doRequestServerList(SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList,
                            appIndex: appIndex,
                            filters: filters,
                            requestServersResponse: requestServersResponse)
    }

    /// Steamworks `ISteamMatchmakingServers::ReleaseRequest()`
    public func releaseRequest(_ serverListRequest: HServerListRequest) {
        MatchmakingServersControl.unbind(handle: serverListRequest)
        SteamAPI_ISteamMatchmakingServers_ReleaseRequest(interface, .init(serverListRequest))
    }

    // MARK: Queries

    /// Steamworks `ISteamMatchmakingServers::PingServer()`
    public func pingServer(ip: Int, port: UInt16, response: SteamMatchmakingPingResponse) -> HServerQuery {
        let shim = CShimPingResponse.Allocate(MatchmakingServersControl.vtable)
        let rc = HServerQuery(SteamAPI_ISteamMatchmakingServers_PingServer(interface,
                                                                           UInt32(ip),
                                                                           port,
                                                                           shim.pointee.getInterface()))
        guard rc != .invalid else {
            shim.pointee.Deallocate()
            return .invalid
        }
        shim.pointee.handle = rc.value
        MatchmakingServersControl.bind(handle: rc, ping: response) { shim.pointee.Deallocate() }
        return rc
    }

    /// Steamworks `ISteamMatchmakingServers::PlayerDetails()`
    public func playerDetails(ip: Int, port: UInt16, response: SteamMatchmakingPlayersResponse) -> HServerQuery {
        let shim = CShimPlayersResponse.Allocate(MatchmakingServersControl.vtable)
        let rc = HServerQuery(SteamAPI_ISteamMatchmakingServers_PlayerDetails(interface,
                                                                              UInt32(ip),
                                                                              port,
                                                                              shim.pointee.getInterface()))
        guard rc != .invalid else {
            shim.pointee.Deallocate()
            return .invalid
        }
        shim.pointee.handle = rc.value
        MatchmakingServersControl.bind(handle: rc, players: response) { shim.pointee.Deallocate() }
        return rc
    }

    /// Steamworks `ISteamMatchmakingServers::ServerRules()`
    public func serverRules(ip: Int, port: UInt16, response: SteamMatchmakingRulesResponse) -> HServerQuery {
        let shim = CShimRulesResponse.Allocate(MatchmakingServersControl.vtable)
        let rc = HServerQuery(SteamAPI_ISteamMatchmakingServers_ServerRules(interface,
                                                                            UInt32(ip),
                                                                            port,
                                                                            shim.pointee.getInterface()))
        guard rc != .invalid else {
            shim.pointee.Deallocate()
            return .invalid
        }
        shim.pointee.handle = rc.value
        MatchmakingServersControl.bind(handle: rc, rules: response) { shim.pointee.Deallocate() }
        return rc
    }

    /// Steamworks `ISteamMatchmakingServers::CancelServerQuery()`
    public func cancelServerQuery(_ serverQuery: HServerQuery) {
        MatchmakingServersControl.unbind(handle: serverQuery)
        SteamAPI_ISteamMatchmakingServers_CancelServerQuery(interface, .init(serverQuery))
    }
}

// MARK: C++ -> Swift callback plumbing

enum MatchmakingServersControl {
    typealias CShimServerListResponsePtr = UnsafeMutablePointer<CShimServerListResponse>

    // MARK: Databases

    private struct ServerListClient {
        let swift: SteamMatchmakingServerListResponse
        let cpp: CShimServerListResponsePtr
    }
    private static var lock = Lock()
    private static var serverQueries: [HServerListRequest : ServerListClient] = [:]

    private struct QueryClient {
        let ping: SteamMatchmakingPingResponse?
        let players: SteamMatchmakingPlayersResponse?
        let rules: SteamMatchmakingRulesResponse?
        let cppDeallocate: () -> Void
    }
    private static var queryQueries: [HServerQuery : QueryClient] = [:]

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
            },
            pingResponded: { chsq, rsp in
                let hsq = HServerQuery(chsq)
                find(handle: hsq)?.ping?.serverResponded(server: GameServerItem(rsp))
                unbind(handle: hsq) // seems to be right, dispose of objects
            },
            pingFailedToRespond: { chsq in
                let hsq = HServerQuery(chsq)
                find(handle: hsq)?.ping?.serverFailedToRespond()
                unbind(handle: hsq) // as above
            },
            addPlayerToList: { chsq, n, s, t in
                let hsq = HServerQuery(chsq)
                find(handle: hsq)?.players?.addPlayerToList(name: String(n), score: Int(s), timePlayed: t)
            },
            playersFailedToRespond: { chsq in
                let hsq = HServerQuery(chsq)
                find(handle: hsq)?.players?.playersFailedToRespond()
                unbind(handle: hsq) // as above
            },
            playersRefreshComplete: { chsq in
                let hsq = HServerQuery(chsq)
                find(handle: hsq)?.players?.playersRefreshComplete()
                unbind(handle: hsq) // as above
            },
            rulesResponded: { chsq, k, v in
                let hsq = HServerQuery(chsq)
                find(handle: hsq)?.rules?.rulesResponded(rule: String(k), value: String(v))
            },
            rulesFailedToRespond: { chsq in
                let hsq = HServerQuery(chsq)
                find(handle: hsq)?.rules?.rulesFailedToRespond()
                unbind(handle: hsq) // as above
            },
            rulesRefreshComplete: { chsq in
                let hsq = HServerQuery(chsq)
                find(handle: hsq)?.rules?.rulesRefreshComplete()
                unbind(handle: hsq) // as above
            }
        ))
        return UnsafePointer(ptr)
    }()

    // MARK: APIs

    static func bind(handle: HServerListRequest, swift: SteamMatchmakingServerListResponse, cpp: CShimServerListResponsePtr) {
        lock.locked {
            serverQueries[handle] = ServerListClient(swift: swift, cpp: cpp)
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

    static func bind(handle: HServerQuery,
                     ping: SteamMatchmakingPingResponse? = nil,
                     players: SteamMatchmakingPlayersResponse? = nil,
                     rules: SteamMatchmakingRulesResponse? = nil,
                     cppDeallocate: @escaping () -> Void) {
        lock.locked {
            queryQueries[handle] = QueryClient(ping: ping,
                                               players: players,
                                               rules: rules,
                                               cppDeallocate: cppDeallocate)
        }
    }

    static func unbind(handle: HServerQuery) {
        lock.locked {
            if let client = queryQueries.removeValue(forKey: handle) {
                client.cppDeallocate()
            }
        }
    }

    private static func find(handle: HServerQuery) -> QueryClient? {
        lock.locked {
            if let rsp = queryQueries[handle] {
                return rsp
            }
            logError("Got SteamMatchmaking ServerQuery callback for unknown handle: \(handle)")
            return nil
        }
    }
}
