![macOS](https://shields.io/badge/platform-macOS%20|%20%3F%3F-lightgrey)
![Steamworks 1.54](https://shields.io/badge/steamworks-1.54-lightgrey)
![MIT](https://shields.io/badge/license-MIT-black)

# steamworks-swift

Experiment with Steamworks SDK and Swift C++ importer.

**Caveat Integrator: The Swift C++ importer is a chaotic science project; this package is built on top**

Current state:
* Requires Swift 5.7, Xcode 14 beta -- the C++ importer is a unstable science project
* Code gen creates Swift versions of Steam types; callbacks and call-returns work
* All interfaces complete - see [rough docs](https://johnfairh.github.io/swift-steamworks/index.html)
* Some interface quality-of-life helpers in a separate `SteamworksHelpers` module
* `make test` builds and runs unit tests that run frame loops and access portions of the Steam API
  doing various sync and async tasks.
* Encrypted app ticket support in separate `SteamworksEncryptedAppTicket` module
* Separate demo showing encrypted app-ticket stuff, `make run_ticket`
* The Xcode project basically works, assumes `sdk` exists.  SourceKit can manage
  tab completion even if module interface gen is beyond it

### Concept

* Offer a pure Swift module `Steamworks` covering all of the current Steamworks API
* Leave out the deprecated and WIN32-only stuff
* Do not diverge too far from the 'real' API names to aid docs / searching / porting:
  I think this is a better starting point than doing a complete OO analysis to carve
  out function.  Can go to build `SteamworksPatterns` or something if worthwhile.  Name
  etc. changes:
   * _Don't_ use Swift properties for 0-arg getters: diverges too far from Steamworks
     naming
   * Drop the intermittent Hungarian notation (argh the 1990s are calling)
   * Use Swift closures for callbacks as well as async-await sugar
   * Map unions onto enums with associated values
* Provide custom API-lifetime and message dispatch classes
* Provide strongly typed handles
* Access interfaces via central types
* Use code gen to deal with the ~900 APIs and their ~400 types, taking advantage of the
  handy JSON file.  This code-gen piece is the actual main work in this project
* Provide quality-of-life helpers module `SteamworksHelpers` to wrap up API patterns
  involving multiple calls, usually determining buffer lengths

### API mapping design

### Lifecycle

```swift
// Initialization
let steam = SteamAPI(appID: MyAppId) // or `SteamGameServerAPI`

// Frame loop
steam.runCallbacks() // or `steam.releaseCurrentThreadMemory()`

// Shutdown
// ...when `steam` goes out of scope
```

### Callbacks

C++
```cpp
STEAM_CALLBACK(MyClass, OnUserStatsReceived, UserStatsReceived_t, m_CallbackUserStatsReceived);

...

m_CallbackUserStatsReceived( this, &MyClass::OnUserStatsReceived )

...

void MyClass::OnUserStatsReceived( UserStatsReceived_t *pCallback ) {
  ...
}
```
Swift
```swift
steam.onUserStatsReceived { userStatsReceived in
  ...
}
```

There are async versions too, like:
```
for await userStatsReceived in steam.userStatsReceived {
  ...
}
```
...but these need the panacea of custom executors to be practical.

#### Functions

```cpp
auto handle = SteamInventory()->StartUpdateProperties();
```
```swift
let handle = steam.inventory.startUpdateProperties()
```

### Call-return style

C++
```cpp
CCallResult<MyClass, FriendsGetFollowerCount_t> m_GetFollowerCountCallResult;

...

auto hSteamAPICall = SteamFriends.GetFollowerCount(steamID);
m_GetFollowerCountCallResult.Set(hSteamAPICall, this, &MyClass::OnGetFollowerCount);

...

void MyClass::OnGetFollowerCount(FriendsGetFollowerCount_t *pCallback, bool bIOFailure) {
  ...
}

```
Swift
```swift
steam.friends.getFollowerCount(steamID: steamID) { getFollowerCount in
  guard let getFollowerCount = getFollowerCount else {
    // `bIOFailure` case
    ...
  }
  ...
}
```

Again there are async versions that are impractical for now:
```swift
let getFollowerCount = await steam.friends.getFollowerCount(steamID: steamID)
```

### Array-length parameters

Parameters carrying the length of an input array are discarded because Swift arrays
carry their length with them.

### 'Out' parameters

C++ 'out' parameters filled in by APIs are returned in a tuple, or, if the Steam API
is `void` then as the sole return value.

```cpp
SteamInventoryResult_t result;
bool rc = SteamInventory()->GrantPromoItems(&result);
```
```swift
let (rc, result) = steamAPI.inventory.grantPromoItems()
```

### Optional 'out' parameters

Some C++ 'out' parameters are optional: they can be passed as `NULL` to indicate they're
not required by caller.  In the Swift API these generate an additional boolean parameter
`return<ParamName>` with default `true`.

```cpp
auto avail = SteamNetworkingUtils()->GetRelayNetworkStatusAvailability(NULL);
```
```swift
let (avail, _) = steamAPI.networkingUtils.getRelayNetworkStatusAvailability(returnDetails: false)
```

The return tuple is still populated with something but its contents is undefined; the
library guarantees to pass `NULL` to the underlying Steamworks API.

### 'In-out' parameters

C++ parameters whose values are significant and also have their value updated are present
in _both_ Swift function parameters and the return tuple.

```cpp
uint32 itemDefIDCount = 0;
bool rc1 = SteamInventory()->GetItemDefinitionIDs(NULL, &itemDefIDCount);
auto itemDefIDs = new SteamItemDef_t [itemDefIDCount];
bool rc2 = SteamInventory()->GetItemDefinitions(itemDefIDs, &itemDefIDCount);
```
```swift
let (rc1, _, itemDefIDCount) = steamAPI.inventory.
                                   getItemDefinitionIDs(returnItemDefIDs: false,
                                                        itemDefIDsArraySize: 0)
let (rc2, itemDefIDs, _) = steamAPI.inventory.
                               getItemDefinitionIDs(itemDefIDsArraySize: itemDefIDCount)
```

### Default parameter values

Default values are provided where the API docs suggest a value, but there are still APIs
where caller is required to provide a max buffer length for an output string -- these look
pretty weird in Swift but no way to avoid.  Some Steamworks APIs support the old "pass NULL
to get the required length" two-pass style and these patterns are wrapped up in a Swifty
way in the `SteamworksHelpers` module.

### Swift C++ Bugs

Tech limitations, on 5.7 Xcode 14.0b3:
* ~~Have to manually tell Swift to link with `libc++`.  Verify by commenting from
  Makefile.  When resolved tidy Makefile. ~~ currently fixed in 5.7
* ~~Importing `Dispatch` and `-enable-cxx-interop` makes `DispatchSemaphore` disappear
  but not the rest of the module?? Work around.  When resolved rewrite mutex.~~ currently
  fixed in 5.7
* Some structures/classes aren't imported -- the common factor seems to be a `protected`
  destructor.  Verify by trying to use `SteamNetworkingMessage_t`.
* Something goes wrong storing pointers to classes and they get nobbled by something.
  Verify by making `SteamIPAddress` a struct, changing interfaces to cache the interface
  pointers.
* Some C++ types with `operator ==` don't have `Equatable` generated.  Verify with
  `SteamNetworkingIPAddr`.  Got worse in 5.7
* ~~ Importing `Foundation` and `-enable-cxx-interop` and a C++ module goes wrong.  Swift
  5.6 doesn't crash; worse the compiler goes slow, spits out warnings, then the binary
  runs like treacle.  Will aim to not depend on Foundation, see how that goes. ~~ seems
  fixed in 5.7 but build is really slow - keep up not using Foundation?
* Calls to virtual functions aren't generated properly: Swift generates a ref
  to a symbol instead of doing the vtable call.  So the actual C++ interfaces are not
  usable in practice.  Will use the flat API.
* Anonymous enums are not imported at all.  Affects callback etc. ID constants.
  Will work around.
* sourcekit won't give me a module interface for `CSteamworks` to see what else the
  importer is doing.  Probably Xcode's fault, still not passing the user's flags to
  sourcekit and still doing insultingly bad error-reporting.

### Non-Swift Problems

* Some [Steamworks SDK issues](#json-notes), nothing too serious.
* How do I CI this stuff?  SDK license doesn't seem to allow non-local redistribution,
  with that could build the thing; don't really fancy installing the steam client but
  maybe that's doable.

#### Weird Steam messages

Getting unexpected SteamAPICallCompleteds out of
`SteamAPI_ManualDispatch_GetNextCallback()` -- suspect parts of steamworks trying to
use callbacks internally without understanding manual dispatch mode.  Or I'm missing
an API somewhere to dispatch them.

* 2101 - `HTTPRequestCompleted_t.k_iCallback`
* 1296 - `k_iSteamNetworkingUtilsCallbacks + 16` - undefined, not a clue

Seems triggered by using steamnetworking.

Facepunch logs & drops these too, so, erm, shrug I suppose.

Getting `src/steamnetworkingsockets/clientlib/csteamnetworkingmessages.cpp (229) : Assertion Failed: [#40725897 pipe] Unlinking connection in state 1` using steamnetworkingmessages; possibly
it's not expecting to send messages from a steam ID to itself.

### Requirements

* Needs Swift 5.7 (Xcode 14 beta)
* Needs Steam client installed
* I'm using macOS 12; should work on macOS 11, Linux; might work on Windows

To run the generator / build:
* Needs Steamworks SDK downloaded as `sdk` at the top level of the package, or
  set `STEAM_SDK`

### Interface plan

✅ ISteamAppList, ISteamApps, ISteamFriends, ISteamGameSearch, ISteamGameServer,
ISteamGameServerStats, ISteamHTMLSruface, ISteamHTTP, ISteamInput, ISteamInventory,
ISteamMatchMaking, ISteamMatchmakingServers, ISteamMusic, ISteamMusicRemote,
ISteamNetworkingMessages, ISteamNetworkingSockets, ISteamNetworkingUtils,
ISteamParentalSettings, ISteamParties, ISteamRemotePlay, ISteamRemoteStorage,
ISteamScreenshots, ISteamUGC, ISteamUser, ISteamUserStats, ISteamUtils, ISteamVideo,
SteamEncryptedAppTicket

Skip:
* ISteamAppTicket - er not actually a thing?
* ISteamClient - internal stuff, very C++y, looks ignorable
* ISteamController - deprecated, need to review for stuff that's been generated and
  can actually be deleted after working through ISteamInput
* ISteamGameCoordinator - "largely" deprecated
* ISteamNetworking - this is the pre-modern interface
* ISteamPS3... - will leave Swift-on-PS3 for another day

### JSON notes

Capture some notes on troubles reflecting the json into the module.

* The 'modern' `isteamnetworking` stuff is incomplete somehow - Json describes
  `SteamDatagramGameCoordinatorServerLogin`, `SteamDatagramHostedAddress` are missing
  from the header files.  The online API docs are hilariously broken here, scads of
  broken links.  Have to wait for Valve to fix this.

  I found some of this in the SDR SDK, but it's not supported on macOS and uses actual
  grown-up C++ with `std::string` and friends so best leave it alone for now.

* `SteamNetworkingMessage_t` doesn't import into Swift.  Probably stumbling into a hole
  of C++ struct with function pointer fields.  Trust Apple will get to this eventually,
  will write a zero-cost inline shim.

* Json (and all non-C languages) struggles with unions.  Thankfully rare:
  `SteamIPAddress_t`, `SteamInputAction_t`, `SteamNetworkingConfigValue_t`.
  `SteamNetworkingConfigValue_t`.  Rare enough to deal with manually.

* Loads of missing `out_string_count` etc. annotations and a few wrong, see patchfile.
