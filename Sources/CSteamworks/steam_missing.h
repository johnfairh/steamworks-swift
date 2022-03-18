// Stuff that's missing from the API headers that it's easier to patch
// in here rather than the Swift side.

// If we find more than one of the same kind of thing and its plausible
// to generate it then stop and make it generated.


// Enumify 'game server flags' from isteammatchmaking.h.
// Despite the name appears to be an enum rather than a bitset?

enum EFavoriteFlags
{
  k_EFavoriteFlagsNone = k_unFavoriteFlagNone,
  k_EFavoriteFlagFavorite = k_unFavoriteFlagFavorite,
  k_EFavoriteFlagHistory = k_unFavoriteFlagHistory
};

static inline bool CSteamAPI_ISteamMatchmaking_GetFavoriteGame( ISteamMatchmaking* self, int iGame, AppId_t * pnAppID, uint32 * pnIP, uint16 * pnConnPort, uint16 * pnQueryPort, EFavoriteFlags * punFlags, uint32 * pRTime32LastPlayedOnServer ) {
  SteamAPI_ISteamMatchmaking_GetFavoriteGame(self, iGame, pnAppID, pnIP, pnConnPort, pnQueryPort, reinterpret_cast<uint32 *>(punFlags), pRTime32LastPlayedOnServer);
}

static inline int CSteamAPI_ISteamMatchmaking_AddFavoriteGame( ISteamMatchmaking* self, AppId_t nAppID, uint32 nIP, uint16 nConnPort, uint16 nQueryPort, EFavoriteFlags unFlags, uint32 rTime32LastPlayedOnServer ) {
  return SteamAPI_ISteamMatchmaking_AddFavoriteGame(self, nAppID, nIP, nConnPort, nQueryPort, unFlags, rTime32LastPlayedOnServer);
}

static inline bool CSteamAPI_ISteamMatchmaking_RemoveFavoriteGame( ISteamMatchmaking* self, AppId_t nAppID, uint32 nIP, uint16 nConnPort, uint16 nQueryPort, EFavoriteFlags unFlags ) {
  return CSteamAPI_ISteamMatchmaking_RemoveFavoriteGame(self, nAppID, nIP, nConnPort, nQueryPort, unFlags);
}


// SteamPartyBeaconLocation_t - this thing is an 'in' parameter and not marked const here,
// and is passed by value in other APIs.  So for ease we provide a similar version.  Again
// if we see more params of this nature (pass by ref in C, actually const) then generate.
static inline SteamAPICall_t CSteamAPI_ISteamParties_CreateBeacon( ISteamParties* self, uint32 unOpenSlots, SteamPartyBeaconLocation_t beaconLocation, const char * pchConnectString, const char * pchMetadata ) {
  return SteamAPI_ISteamParties_CreateBeacon(self, unOpenSlots, &beaconLocation, pchConnectString, pchMetadata);
}


// Shim for structs that we don't generate because unions and C++

__attribute__((swift_name("getter:SteamNetworkingIPAddr.m_ipv6_ptr(self:)")))
static inline const uint8 * _Nonnull SteamNetworkingIPAddr_m_ipv6_ptr(const SteamNetworkingIPAddr * _Nonnull s)
{
    return s->m_ipv6;
}

__attribute__((swift_name("getter:SteamNetworkingIdentity.m_genericBytes_ptr(self:)")))
static inline const uint8 * _Nonnull SteamNetworkingIdentity_m_genericBytes_ptr(const SteamNetworkingIdentity * _Nonnull s)
{
    return s->m_genericBytes;
}

__attribute__((swift_name("getter:SteamIPAddress_t.m_rgubIPv6_ptr(self:)")))
static inline const uint8 * _Nonnull SteamIPAddress_t_m_rgubIPv6_ptr(const SteamIPAddress_t * _Nonnull s)
{
    return s->m_rgubIPv6;
}

// Shim a couple of APIs to get rid of refs to fixed-size arrays of char that import as unwieldy tuples

static inline bool CSteamAPI_ISteamNetworkingSockets_GetCertificateRequest( ISteamNetworkingSockets* self, int * pcbBlob, void * pBlob, char * errMsg ) {
    auto msgp = reinterpret_cast<SteamNetworkingErrMsg *>(errMsg);
    return SteamAPI_ISteamNetworkingSockets_GetCertificateRequest(self, pcbBlob, pBlob, *msgp);
}

static inline bool CSteamAPI_ISteamNetworkingSockets_SetCertificate( ISteamNetworkingSockets* self, const void * pCertificate, int cbCertificate, char *errMsg ) {
    auto msgp = reinterpret_cast<SteamNetworkingErrMsg *>(errMsg);
    return SteamAPI_ISteamNetworkingSockets_SetCertificate(self, pCertificate, cbCertificate, *msgp);
}
