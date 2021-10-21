# swift-steamworks

Experiment with Steamworks SDK and Swift C++ importer.

* Needs Swift 5.5
* Needs Steam client installed
* Needs Steamworks SDK downloaded as `sdk` at the top level of the package, or
  set `STEAM_SDK`
* Needs macOS; should work on Linux; might work on Windows

State:
* `make` builds and runs a Swift program that directly accesses API from the C++
   Steam API to initialize & then shut it down.  Might have to run it twice to
   get the build working 🙃
* The Xcode project basically works, assumes `sdk` exists.  SourceKit can manage
  tab completion even if module interface gen is beyond it.

Limitations, on 5.5 and also swift/main as of 20/Oct:
* Importing `Foundation` and `-enable-cxx-interop` and a C++ module crashes the
  compiler.  Various bugs for this on swift.org, will have to work around through
  module structure.
* Calls to (?pure) virtual functions aren't linked properly.  So the actual C++
  interfaces are not usable in practice.  Will use the flat API.
* Anonymous enums are not imported at all.  Affects callback etc. ID constants.
  Will work around.
* sourcekit won't give me a module interface for `CSteamworks` to see what else the
  importer is doing.  Need to build the compiler and debug.

Plan then:
* Offer a pure Swift module covering all of the current Steamworks API that does
  not dump the entire steamworks namespace into user code.
* Do not diverge too far from the 'real' API names to aid docs / searching / porting:
  I think this is a better starting point than doing a complete OO analysis to carve
  out function -- we'll see I guess.  Can always build that kind of thing on top of
  the API port.  Name etc. changes planned though at least:
   * Use Swift properties for 0-arg getters
   * Drop the intermittent Hungarian notation (argh the 1990s are calling)
   * Use Swift closures for callbacks as well as async-await sugar
* Provide custom API-lifetime and message dispatch classes.
* Provide strongly typed handles.
* Use a purely static namespacing for steamworks APIs that don't offer separate
  client/server interfaces eg. `SteamFriends.joinClanChatRoom(...)`.
* Use an instance style, still available via static namespace for the interfaces
  that are separate, eg. `SteamUtils.client.secondsSinceAppActive`.
* Use code gen to deal with the ~1100 APIs and their types, taking advantage of the
  handy JSON file.  Types are unfortunately the biggest roadbump here; it seemse
  necessary though to avoid dumping the C into users' code, avoiding C++ limitations,
  and taking advantage of any Swift type prettiness.  This code-gen piece is the
  actual main work in this project.
