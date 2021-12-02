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

struct ShimMatchmakingVTable_t {
    ShimServerResponded_t serverResponded;
    ShimServerFailedToRespond_t serverFailedToRespond;
    ShimRefreshComplete_t refreshComplete;
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

#endif /* steam_matchmaking_shims_h */
