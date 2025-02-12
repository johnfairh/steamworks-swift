![macOS](https://shields.io/badge/platform-macOS%20|%20Linux%20|%20%3F%3F-lightgrey)
![Steamworks 1.61](https://shields.io/badge/steamworks-1.61-lightgrey)
[![Test](https://github.com/johnfairh/steamworks-swift/actions/workflows/test.yml/badge.svg)](https://github.com/johnfairh/steamworks-swift/actions/workflows/test.yml)
![MIT](https://shields.io/badge/license-MIT-black)

# steamworks-swift

A practical interface to the Steamworks SDK using the Swift C++ importer.

**Caveat Integrator: The Swift C++ importer is new and evolving; this package is built on top**

As of Swift 6, C++ finally seems solid on macOS.  On Linux it's tough to recommend:
still tends to break in weird non-portable ways.  I haven't tried Windows.

Current state:
* All Steamworks interfaces complete - see [API docs](https://johnfairh.github.io/steamworks-swift/index.html)
* Code gen creates Swift versions of Steam types; callbacks and call-returns work
* Code gen creates SDK header-file oriented type index for documentation
* Some interface quality-of-life helpers in a separate `SteamworksHelpers` module
* `make test` builds and runs unit tests that run frame loops and access portions of the Steam API
  doing various sync and async tasks.
* Experimental custom-executor for multithreaded Steamworks access in a separate
  `SteamworksConcurrency` module
* Encrypted app ticket support in separate `SteamworksEncryptedAppTicket` module
* Separate demo showing encrypted app-ticket stuff, `make run_ticket`
* Requires Swift 6 / Xcode 16
* The Xcode project basically works.
* ~Unit tests sometimes crash inside steam on exit~ fixed!

Below:
* [Concept](#concept)
* [API design](#api-mapping-design)
* [How to use](#how-to-use-this-project)
* [Implementation notes](#implementation-notes)

## Concept

* Offer a pure Swift module `Steamworks` covering all of the current Steamworks API
* Leave out the deprecated and WIN32-only stuff
* Do not diverge too far from the 'real' API names to aid docs / searching / porting:
  I think this is a better starting point than doing a complete OO analysis to carve
  out function.  Can go on to augment `SteamworksHelpers` if worthwhile.  Name etc.
  changes:
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

### Next

* More SpaceWar porting over to Swift to check general practicality, somewhat real-world usage,
  general interest - see [spacewar-swift](https://github.com/johnfairh/spacewar-swift).

## API mapping design

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
```swift
for await userStatsReceived in steam.userStatsReceived {
  ...
}
```
Be sure to check [Swift concurrency concerns](#swift-concurrency-concerns).

### Functions

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

There are async versions:
```swift
let getFollowerCount = await steam.friends.getFollowerCount(steamID: steamID)
```
...which are finally safe, as of Swift 6, but do check
[Swift concurrency concerns](#swift-concurrency-concerns).

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

## Swift Concurrency Concerns

The Steamworks architecture is thread-based.  For each thread you want to call Steam APIs
you must regularly call `SteamAPI.runCallbacks()` or `SteamAPI.releaseCurrentThreadMemory()`.
The former synchronously calls back into your code to fulfill callbacks; they both do
internal thread-specific housekeeping.

Swift concurrency and its built-in libdispatch-based executors are dead set against users
thinking about threads, with a begrudging exception for 'the main thread'.

To use async-await with Steamworks I think there are two approaches:
1. Keep Steam interactions on the main thread.  Use `@MainActor` and related tools to keep
   your code there (`MainActor.assumeIsolated()` can be a life-saver).  If you need to call
   Steam from another isolation domain then you have to hop over -- just like with AppKit
   and friends.

   Call `SteamAPI.runCallbacks()` as part of your frame loop or similar.

2. Use a Swift custom executor to manage a thread to run your code and do the required
   Steam polling.  Assign instances of these executors to actors to host your program,
   tastefully choosing the number and distribution of threads.

A couple of examples of (1) in the tests, see `TestApiSimple.testCallReturnAsync()` and
`TestApiSimple.testCallbackAsync()` along with their callback-based versions.

A prototype executor for (2) in ``SteamExecutor`` in the `SteamworksConcurrency` module,
along with an example of use in `TestExecutor.testExecutorSteam()`.

I think a practical solution is to mix these: use `@MainActor`-bound code for general
things, using the frame loop to trigger frequent callbacks, and then use one or more
executors to look after gameservers or lower-priority work.

## How To Use This Project

Prereqs:
* Needs Swift 6 beta (Xcode 16+)
* Needs Steam client installed (and logged-in, running for the tests or to do anything useful)
* I'm using macOS 15; should work on Linux; might work on Windows eventually

Install the Steamworks SDK:
* Clone [steamworks-swift-sdk](https://github.com/johnfairh/steamworks-swift-sdk)
* `make install`
(this is far from ideal but hard stuck behind various Swift issues)

Sample `Package.swift`:
```swift
// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "MySteamApp",
  platforms: [
    .macOS("15.0"),
  ],
  dependencies: [
    .package(url: "https://github.com/johnfairh/steamworks-swift", from: "1.0.0"),
  ],
  targets: [
    .executableTarget(
      name: "MySteamApp",
      dependencies: [
        .product(name: "Steamworks", package: "steamworks-swift")
      ],
      swiftSettings: [.interoperabilityMode(.Cxx)]
    )
  ]
)
```

Note that you must set `.interoperabilityMode(.Cxx)` in all targets that depend on
Steamworks, _and_ all targets that depend on them, forever and forever unto the last
dependency.  This virality is part of the current Swift design and unavoidable for now.

Sample skeleton program:
```swift
import Steamworks

@main
public struct MySteamApp {
  public static func main() {
    guard let steam = SteamAPI(appID: .spaceWar, fakeAppIdTxtFile: true) else {
      print("SteamInit failed")
      return
    }
    print("Hello world with Steam name \(steam.friends.getPersonaName())")
  }
}
```

API docs [here](https://johnfairh.github.io/steamworks-swift/index.html).

Fully-fledged AppKit/Metal demo [here](https://github.com/johnfairh/spacewar-swift).

## Implementation notes

### Swift C++ Bugs

Mostly fixed in Swift 6.  Linux still suffering a bit.

Tech limitations, on 6.0 Xcode 16.b3:
* Some structures/classes aren't imported -- is the common factor a `protected`
  destructor?  Verify by trying to use `SteamNetworkingMessage_t`.
* ~Something goes wrong storing pointers to classes and they get nobbled by something.
  Verify by making `SteamIPAddress` a struct and running `TestApiServer`.  Or change
  interfaces to cache the interface pointers.~ incredibly, fixed in Swift 6
* ~Calls to virtual functions aren't generated properly: Swift generates a ref
  to a symbol instead of doing the vtable call.  So the actual C++ interfaces are not
  usable in practice.  Will use the flat API.~ allegedly fixed in Swift 6 but don't
  need due to history.
* Anonymous enums are not imported at all.  Affects callback etc. ID constants.
  Will work around.
* ~sourcekit won't give me a module interface for `CSteamworks` to see what else the
  importer is doing.  Probably Xcode's fault, still not passing the user's flags to
  sourcekit and still doing insultingly bad error-reporting.~ fixed in Xcode 15?!
* ~Linux only: random parts of Glibc silently fail to import. SMH.  Work around in C++.
  See `swift_shims.h`.~ Fixed in 6.0 ("for now")
* ~Linux only: implicit struct constructors are not created, Swift generates a ref
  to a non-existent method that fails at link time.  Work around with dumb C++
  allocate shim.~  ~Sort of fixed in 5.9, but instead `swiftc` crashes on some uses -- on
  both macOS and Linux.  Check by refs to eg. `CSteamNetworkingIPAddr_Allocate()`, see
  `steam_missing.h`.~ Fixed in 6.0.
* Linux only, _again_: SPM test auto-discovery has no clue about C++ interop.  Work around by
  smashing in the flag everywhere... Swift 6 - worse now, utterly broken on Linux with
  yams 3rd-party dependency.  Maybe fixable with swift-testing - for now nobbled those tests
  on Linux.  Yay?
* ~Swift 5.8+ adopts a broken/paranoid model about 'projected pointers' requiring some fairly
  ugly code to work around.   Verify with the `__ unsafe` stuff in `ManualTypes.swift`.~
  fixed by Swift 6ish

### Non-Swift Problems

* Some [Steamworks SDK issues](#json-notes), nothing too serious.
* CI really needs a private runner with a logged-in steam account, current version
  just runs the non-steam-requiring tests.

### Weird Steam messages

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

## Contributions

Welcome: open an issue / johnfairh@gmail.com / @johnfairh@mastodon.social

## License

Distributed under the MIT license.  Except the Steamworks SDK parts.
