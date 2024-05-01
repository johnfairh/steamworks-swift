#include <steam/steam_api.h>
#include <steam/steam_gameserver.h>

// Steamworks 1.59 still has fucked up SteamVideo json
S_API ISteamVideo *SteamAPI_SteamVideo_v004();

#include <steam/steam_api_flat.h>
#include <steam/steamnetworkingfakeip.h>
#include "Generated/steam_struct_shims.h"
#include "steam_missing.h"
#include "steam_matchmaking_shims.h"
#include "steam_networking_shims.h"
#include "swift_shims.h"
