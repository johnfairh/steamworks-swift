# swift-steamworks

Experiment with Steamworks SDK and Swift C++ importer.

* Needs Swift 5.5 (Xcode 13.2 beta)
* Needs Steam client installed
* Needs Steamworks SDK downloaded as `sdk` at the top level of the package, or
  set `STEAM_SDK`
* Needs macOS 12; should work on macOS 11, Linux; might work on Windows

State:
* Code gen creates Swift versions of Steam types.  Callbacks and call-returns work.
* Working on polishing `ISteamFriends` before going on.
* `make` builds and runs a Swift program that directly accesses API from the C++
  Steam API to initialize & then shut it down.
* The Xcode project basically works, assumes `sdk` exists.  SourceKit can manage
  tab completion even if module interface gen is beyond it.

Tech limitations, on 5.5 and also swift/main as of 20/Oct:
* Importing `Foundation` and `-enable-cxx-interop` and a C++ module crashes the
  compiler.  Various bugs for this on swift.org, will have to work around through
  module structure.
* Importing `Dispatch` and `-enable-cxx-interop` makes `DispatchSemaphore` disappear
  but not the rest of the module?? Work around.
* Have to manually tell Swift to link with `libc++`?? Workaround.
* Calls to (?pure) virtual functions aren't generated properly: Swift generates a ref
  to a symbol instead of doing the vtable call.  So the actual C++ interfaces are not
  usable in practice.  Will use the flat API.
* Anonymous enums are not imported at all.  Affects callback etc. ID constants.
  Will work around.
* sourcekit won't give me a module interface for `CSteamworks` to see what else the
  importer is doing.  Need to build the compiler and debug.  It does look like 99%+ of
  the thing is coming in well.
* Some [Steamworks SDK issues](#json_notes), nothing too serious.


Plan then:
* Offer a pure Swift module covering all of the current Steamworks API that does
  not dump the entire steamworks namespace into user code.
* Leave out the deprecated and WIN32-only stuff.
* Do not diverge too far from the 'real' API names to aid docs / searching / porting:
  I think this is a better starting point than doing a complete OO analysis to carve
  out function.  Can go to build `SteamworksPatterns` or something if worthwhile.  Name
  etc. changes planned though at least:
   * Use Swift properties for 0-arg getters
   * Drop the intermittent Hungarian notation (argh the 1990s are calling)
   * Use Swift closures for callbacks as well as async-await sugar
   * Map unions onto enums with associated values
* Provide custom API-lifetime and message dispatch classes.
* Provide strongly typed handles.
* Access interfaces via central types.
* Use code gen to deal with the ~900 APIs and their ~400 types, taking advantage of the
  handy JSON file.  This code-gen piece is the actual main work in this project.

### JSON notes

Capture some notes on troubles reflecting the json into the module.

* Json has `ModalGamepadTextInputDismissed_t` as callback 738.  But `isteamutils` has
  `FloatingGamepadTextInputDismissed_t` as 738 along with a
  `ShowFloatingGamepadTextInput()` API where both Json and `flat_api` have
  `ShowModalGamepadTextInput()` with different parameters.  `Readme.txt` mentions the
  _floating_ version -- so Json/flat generated from wrong/old branch?  Will go with
  the _floating_ versions.

* The 'modern' `isteamnetworking` stuff is incomplete somehow - Json describes
  `SteamDatagramGameCoordinatorServerLogin`, `SteamDatagramHostedAddress` are missing
  from the header files.  The online API docs are hilariously broken here, scads of
  broken links.  Have to wait for Valve to fix this.

* Json thinks `SteamNetConnectionInfo_t` has `m_nFlags`.  Nobody else does.

* `SteamNetworkingMessage_t` doesn't import into Swift.  Probably stumbling into a hole
  of C++ struct with function pointer fields.  Trust Apple will get to this eventually,
  can write a zero-cost inline shim if necessary.

* Json (and all non-C languages) struggles with unions.  Thankfully rare:
  `SteamIPAddress_t`, `SteamInputAction_t`, `SteamNetworkingConfigValue_t`.
  `SteamNetworkingConfigValue_t`.  Rare enough to deal with manually.
