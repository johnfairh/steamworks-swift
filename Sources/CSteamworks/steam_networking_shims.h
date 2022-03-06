//
//  steam_networking_shims.h
//  swift-steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

#ifndef steam_networking_shims_h
#define steam_networking_shims_h

// SteamNetworkingMessage_t
//
// For some reason the Swift importer does not like this type.  Either its protected
// destructor, the function-pointer fields or who knows what.
// It imports (consistently) as, basically, a void *.
//
// Provide here -- we can see the type -- a C API that forwards to the actual code,
// that is then called from the Swift wrapper.  Wow.
extern "C" {

typedef void * CMsgPtr;

static inline SteamNetworkingMessage_t *SM(CMsgPtr m) {
    return static_cast<SteamNetworkingMessage_t *>(m);
}

static inline void CSteamNetworkingMessage_SetData(CMsgPtr m, void *data, int32 size) {
    auto msg = SM(m);
    msg->m_pData = data;
    msg->m_cbSize = size;
}
static inline void *CSteamNetworkingMessage_GetData(CMsgPtr m) { return SM(m)->m_pData; }
static inline int32 CSteamNetworkingMessage_GetDataSize(CMsgPtr m) { return SM(m)->m_cbSize; }

static inline void CSteamNetworkingMessage_SetConn(CMsgPtr m, HSteamNetConnection conn) {
    SM(m)->m_conn = conn;
}
static inline HSteamNetConnection CSteamNetworkingMessage_GetConn(CMsgPtr m) { return SM(m)->m_conn; }

static inline void CSteamNetworkingMessage_SetPeerIdentity(CMsgPtr m, SteamNetworkingIdentity identity) {
    SM(m)->m_identityPeer = identity;
}
static inline SteamNetworkingIdentity CSteamNetworkingMessaage_GetPeerIdentity(CMsgPtr m) { return SM(m)->m_identityPeer; }

static inline int64 CSteamNetworkingMessage_GetConnUserData(CMsgPtr m) { return SM(m)->m_nConnUserData; }

static inline SteamNetworkingMicroseconds CSteamNetworkingMessage_GetUsecTimeReceived(CMsgPtr m) { return SM(m)->m_usecTimeReceived; }

static inline int64 CSteamNetworkingMessage_GetMessageNumber(CMsgPtr m) { return SM(m)->m_nMessageNumber; }

static inline void CSteamNetworkingMessage_SetFreeData(CMsgPtr m, void (*freeData)(_Nonnull CMsgPtr)) {
    SM(m)->m_pfnFreeData = reinterpret_cast<void (*)(SteamNetworkingMessage_t *)>(freeData);
}

static inline void CSteamNetworkingMessage_Release(CMsgPtr m) {
    SM(m)->Release();
}

static inline int CSteamNetworkingMessage_GetChannel(CMsgPtr m) { return SM(m)->m_nChannel; }

static inline int CSteamNetworkingMessage_GetSendFlags(CMsgPtr m) { return SM(m)->m_nFlags; }
static inline void CSteamNetworkingMessage_SetSendFlags(CMsgPtr m, int flags) {
    SM(m)->m_nFlags = flags;
}

static inline void CSteamNetworkingMessage_SetUserData(CMsgPtr m, int64 userData) {
    SM(m)->m_nUserData = userData;
}

} // "C"

/// This is a bitflag enum for which steam just does a smash of #defines.
/// We generate a Swift bitset enum from `steam_api_extra` and need this placeholder to make
/// everything come out OK.
enum ESteamNetworkingSendFlags {
    k_ESteamNetworkingSendFlags_dummy
};

enum ESteamNetworkConnectionInfoFlags {
    k_ESteamNetworkConnectionInfoFlags_dummy
};

#endif /* steam_networking_shims_h */
