//
//  steam_matchmaking_shims.h
//  swift-steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

#ifndef steam_matchmaking_shims_h
#define steam_matchmaking_shims_h

extern "C" {

typedef void (__cdecl *ShimServerResponded_t)(HServerListRequest, int);
typedef void (__cdecl *ShimServerFailedToRespond_t)(HServerListRequest, int);
typedef void (__cdecl *ShimRefreshComplete_t)(HServerListRequest, EMatchMakingServerResponse);
typedef void (__cdecl *ShimPingResponded_t)(HServerQuery, _Nonnull gameserveritem_t *);
typedef void (__cdecl *ShimServerQuery_t)(HServerQuery);
typedef void (__cdecl *ShimAddPlayerToList_t)(HServerQuery, const char *, int, float);
typedef void (__cdecl *ShimRulesResponded_t)(HServerQuery, const char *, const char *);

struct ShimMatchmakingVTable_t {
    ShimServerResponded_t serverResponded;
    ShimServerFailedToRespond_t serverFailedToRespond;
    ShimRefreshComplete_t refreshComplete;
    ShimPingResponded_t pingResponded;
    ShimServerQuery_t pingFailedToRespond;
    ShimAddPlayerToList_t addPlayerToList;
    ShimServerQuery_t playersFailedToRespond;
    ShimServerQuery_t playersRefreshComplete;
    ShimRulesResponded_t rulesResponded;
    ShimServerQuery_t rulesFailedToRespond;
    ShimServerQuery_t rulesRefreshComplete;
};

} // extern "C"

class CShimServerListResponse: ISteamMatchmakingServerListResponse {
    // Store this as a member everywhere because we don't have a .c file
    // to put any actual storage declaration.  These all point to the same
    // statically-allocated table on the Swift side.
    const ShimMatchmakingVTable_t *vtable;

    CShimServerListResponse(const ShimMatchmakingVTable_t *vtable): vtable(vtable) {
    }
  public:
    // Lifetime - don't let Swift try and do anything vaguely clever
    static _Nonnull CShimServerListResponse *Allocate(const ShimMatchmakingVTable_t *vtable) {
        return new CShimServerListResponse(vtable);
    }

    void Deallocate() {
        delete this;
    }

    // Help poor confused Swift get hold of the superclass interface!
    _Nonnull ISteamMatchmakingServerListResponse *getInterface() {
        return this;
    }

    // Overrides - proxy to vtable

    void ServerResponded(HServerListRequest hRequest, int iServer) {
        vtable->serverResponded(hRequest, iServer);
    }

    void ServerFailedToRespond(HServerListRequest hRequest, int iServer) {
        vtable->serverFailedToRespond(hRequest, iServer);
    }

    void RefreshComplete(HServerListRequest hRequest, EMatchMakingServerResponse response) {
        vtable->refreshComplete(hRequest, response);
    }
};

class CShimPingResponse: ISteamMatchmakingPingResponse {
    const ShimMatchmakingVTable_t *vtable;

    CShimPingResponse(const ShimMatchmakingVTable_t *vtable): vtable(vtable) {
    }
  public:
    // Lifetime - don't let Swift try and do anything vaguely clever
    static _Nonnull CShimPingResponse *Allocate(const ShimMatchmakingVTable_t *vtable) {
        return new CShimPingResponse(vtable);
    }

    void Deallocate() {
        delete this;
    }

    // Steamworks doesn't put this in the callbacks so we have to stash it in order
    // to carry through context back to Swift.  Painfully we have to stash it here
    // *after* giving the interface to Steam, but because of the threading model this
    // is *probably* not a race condition.
    HServerQuery handle;

    _Nonnull ISteamMatchmakingPingResponse *getInterface() {
        return this;
    }

    // Overrides

    // Server has responded successfully and has updated data
    void ServerResponded(gameserveritem_t &server) {
        vtable->pingResponded(handle, &server); // yikes what does Swift think C++ refs are...
    }

    // Server failed to respond to the ping request
    void ServerFailedToRespond() {
        vtable->pingFailedToRespond(handle);
    }
};

class CShimPlayersResponse: ISteamMatchmakingPlayersResponse {
    const ShimMatchmakingVTable_t *vtable;

    CShimPlayersResponse(const ShimMatchmakingVTable_t *vtable): vtable(vtable) {
    }
  public:
    static _Nonnull CShimPlayersResponse *Allocate(const ShimMatchmakingVTable_t *vtable) {
        return new CShimPlayersResponse(vtable);
    }

    void Deallocate() {
        delete this;
    }

    HServerQuery handle;

    _Nonnull ISteamMatchmakingPlayersResponse *getInterface() {
        return this;
    }

    // Overrides

    // Got data on a new player on the server
    void AddPlayerToList( const char *pchName, int nScore, float flTimePlayed) {
        vtable->addPlayerToList(handle, pchName, nScore, flTimePlayed);
    }

    // The server failed to respond to the request for player details
    void PlayersFailedToRespond() {
        vtable->playersFailedToRespond(handle);
    }

    // The server has finished responding to the player details request
    void PlayersRefreshComplete() {
        vtable->playersRefreshComplete(handle);
    }
};

class CShimRulesResponse: ISteamMatchmakingRulesResponse {
    const ShimMatchmakingVTable_t *vtable;

    CShimRulesResponse(const ShimMatchmakingVTable_t *vtable): vtable(vtable) {
    }
  public:
    static _Nonnull CShimRulesResponse *Allocate(const ShimMatchmakingVTable_t *vtable) {
        return new CShimRulesResponse(vtable);
    }

    void Deallocate() {
        delete this;
    }

    HServerQuery handle;

    _Nonnull ISteamMatchmakingRulesResponse *getInterface() {
        return this;
    }

    // Overrides

    // Got data on a rule on the server
    void RulesResponded(const char *pchRule, const char *pchValue) {
        vtable->rulesResponded(handle, pchRule, pchValue);
    }

    // The server failed to respond to the request for rule details
    void RulesFailedToRespond() {
        vtable->rulesFailedToRespond(handle);
    }

    // The server has finished responding to the rule details request
    void RulesRefreshComplete() {
        vtable->rulesRefreshComplete(handle);
    }
};

#endif /* steam_matchmaking_shims_h */
