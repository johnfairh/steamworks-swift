//
//  Enums.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

/// Code gen the steamworks enums
///
/// `Enums`is responsible for the top-level enums.  Some structures have nested enums defined in
/// them -- we honour that structure (although it's probably a style bug) and have them generated from
/// the corresponding Struct definition.
struct Enums {
    let io: IO
    let json: JSON

    init(io: IO, json: JSON) {
        self.io = io
        self.json = json
    }

    func generate() throws {
        let contents = json.api.enums.map(\.generated).joined(separator: "\n")
        try io.write(fileName: "Enums.swift", contents: contents)
    }
}

extension SteamAPI.Enum {
    /// The Swift declaration for the enum
    var generated: String {
        """
        /// Steamworks `\(enumname)`
        public enum \(enumname.asSwiftTypeName): Int {
        \(values.map { generate(value: $0) }.joined(separator: "\n"))
        }

        """
    }

    /// The Swift declaration for the enum case.
    ///
    /// In the very rare case of duplicate values we declare an alias differently.
    func generate(value: Value) -> String {
        let declaration: String

        if let duplicates = enumCaseDuplicates[enumname],
           duplicates.contains(value.name) {
            declaration =
            "    public static let \(generate(valueName: value.name)) = Self.init(rawValue: \(value.value))!"
        } else {
            declaration =
            "    case \(generate(valueName: value.name)) = \(value.value)"
        }
        return "    /// Steamworks `\(value.name)`\n\(declaration)"
    }

    /// The prefix used by steamworks for values in this enum that we will
    /// remove because Swift has different namespacing rules.
    ///
    /// Steam has a clear convention for this but breaks it in various ways that we
    /// have to hard-code.
    var valuePrefixRemovePattern: String {
        valuePrefixExceptions[enumname] ?? enumname
    }

    /// Veeery special cases to avoid starting identifiers with digits
    func valuePrefixReplacement(valueName: String) -> String {
        switch enumname {
        case "EHTTPStatusCode":
            return valueName.contains("Invalid") ? "" : "http"
        case "EDurationControlNotification":
            return valueName.contains("Hour") ? "in" : ""
        default:
            return ""
        }
    }

    // optionset EChatSteamIDInstanceFlags EMarketNotAllowedReasonFlags EFriendFlags ESteamItemFlags

    /// Convert the steamworks member name of this enum to Swift.
    ///
    /// Stripping the prefix:
    /// * _Almost_ always begins with `k_`
    /// * _Rarely_ has an `n`
    /// * Scope string is usually constant but sometimes regexp and rarely case-incorrect
    func generate(valueName: String) -> String {
        valueName
            .re_sub("^(?:k_)?n?\(valuePrefixRemovePattern)_?",
                    with: valuePrefixReplacement(valueName: valueName),
                    options: .i)
            .asSwiftIdentifier
    }
}

/// Exceptions to the normal rules of enum element prefiix.
private let valuePrefixExceptions: [String : String] = [
    "EDenyReason" : "EDeny",
    "EUserHasLicenseForAppResult" : "EUserHasLicenseResult",
    "ENotificationPosition" : "EPosition",
    "EMarketNotAllowedReasonFlags" : "EMarketNotAllowedReason",
    "EGameSearchErrorCode_t" : "EGameSearchErrorCode",
    "EPlayerResult_t" : "EPlayerResult",
    "EFriendFlags" : "EFriendFlag",
    "EUserRestriction" : "UserRestriction",
    "EUGCReadAction" : "EUGCRead",
    "AudioPlayback_Status" : "AudioPlayback",
    "ESteamItemFlags" : "ESteamItem",
    "EParentalFeature" : "EFeature",
    "ESteamNetworkingConfigScope" : "ESteamNetworkingConfig(?:Scope)?",
    "ESteamNetworkingConfigDataType" : "ESteamNetworkingConfig(?:DataType)?",
    "ESteamNetworkingConfigValue" : "ESteamNetworkingConfig(?:Value)?",
    "ESteamNetworkingGetConfigValueResult" : "ESteamNetworkingGetConfigValue(?:Result)?",
    "EChatSteamIDInstanceFlags" : "EChat(?:InstanceFlag)?",
    "EDurationControlProgress" : "EDurationControl(?:Progress)?",
    "ERegisterActivationCodeResult": "ERegisterActivationCode(?:Result)?"
]

/// Exception list of enum elements with duplicate values
private let enumCaseDuplicates: [String : Set<String>] = [
    "EWorkshopFileType" : ["k_EWorkshopFileTypeFirst"],
    "ESteamNetConnectionEnd" : [
        "k_ESteamNetConnectionEnd_App_Generic",
        "k_ESteamNetConnectionEnd_AppException_Generic",
        ]
]
