//
//  Generated.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

/// Summary of the Swift stuff that's been generated.
///
/// Used by the documentation structure generator to understand what's important from the C++ headers.
final class Generated {
    enum Kind: CaseIterable {
        case interface
        case typedef
        case `enum`
        case `struct`
        case `protocol`
        case callback
        case client
        case constants
        case other

        var englishName: String {
            switch self {
            case .interface: "Interfaces"
            case .typedef: "Simple types"
            case .enum: "Enumerations and Option Sets"
            case .struct: "Structures"
            case .protocol: "Protocols"
            case .callback: "Callbacks"
            case .client: "Clients"
            case .constants: "Constants"
            case .other: "Other"
            }
        }
    }

    private var typeToKind: [SwiftType : Kind]

    init() {
        typeToKind = [:]
        addManualTypes()
    }

    /// Steamworks types that are implemented manually instead of being generated.
    /// They should appear in doc sections driven by the header files.
    private static var manualTypes: [(String, Kind)] = [
        ("SteamID", .struct),
        ("GameID", .struct),
        ("SteamIPAddress", .struct),
        ("SteamInputActionEvent", .struct),
        ("ServerNetAdr", .struct),
        ("SteamNetworkingIPAddr", .struct),
        ("SteamNetworkingIdentity", .struct),
        ("SteamNetworkingMessage", .struct),
        ("SteamNetworkingConfigValue", .struct),
        ("SteamAPIWarningMessageHook", .typedef),
        ("SteamMatchmakingPingResponse", .protocol),
        ("SteamMatchmakingPlayersResponse", .protocol),
        ("SteamMatchmakingRulesResponse", .protocol),
        ("SteamMatchmakingServerListResponse", .protocol),
        ("MatchMakingKeyValuePairs", .typedef)
    ]

    private func addManualTypes() {
        for t in Self.manualTypes {
            add(type: SwiftType(t.0), kind: t.1)
        }
    }

    func add(type: SwiftType, kind: Kind) {
        if let oldKind = typeToKind[type] {
            guard oldKind == .struct, kind == .callback else {
                preconditionFailure("Duplicate type \(type): already \(oldKind) now \(kind)")
            }
        }
        typeToKind[type] = kind
    }

    func find(type: SwiftType) -> Kind? {
        typeToKind[type]
    }

    func all(kind: Kind) -> [SwiftType] {
        Array(typeToKind.filter { _, v in v == kind }.keys)
    }
}
