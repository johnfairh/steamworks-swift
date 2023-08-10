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
        case other

        var englishName: String {
            switch self {
            case .interface: "Interfaces"
            case .typedef: "Simple types"
            case .enum: "Enumerations and Option Sets"
            case .struct: "Structures"
            case .other: "Other"
            }
        }
    }

    private var typesByKind: [Kind : [SwiftType]]
    private var typeToKind: [SwiftType : Kind]

    init() {
        typesByKind = [:]
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
        ("SteamNetworkingConfigValue", .struct)
    ]

    private func addManualTypes() {
        for t in Self.manualTypes {
            add(type: SwiftType(t.0), kind: t.1)
        }
    }

    func add(type: SwiftType, kind: Kind) {
        if let oldKind = typeToKind[type] {
            preconditionFailure("Duplicate type \(type): already \(oldKind) now \(kind)")
        }
        typeToKind[type] = kind
        typesByKind[kind, default: []].append(type)
    }

    func find(type: SwiftType) -> Kind? {
        typeToKind[type]
    }
}
