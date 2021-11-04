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
        let contents = json.api.enums.map(\.generated).joined(separator: "\n\n")
        try io.write(fileName: "Enums.swift", contents: contents)
    }

    // MARK: Knowledge about Steamworks naming special cases

    /// Exceptions to the normal rules of enum element prefiix, the part to remove.
    private static let valuePrefixExceptions: [String : String] = [
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

    /// The prefix used by steamworks for values in this enum that we will
    /// remove because Swift has different namespacing rules.
    ///
    /// Steam has a clear convention for this but breaks it in various ways that we
    /// have to hard-code.
    static func valuePrefixPattern(enumName: String) -> String {
        valuePrefixExceptions[enumName, default: enumName]
    }

    /// Veeery special cases to avoid starting identifiers with digits
    static func valuePrefixAddition(enumName: String, valueName: String) -> String {
        switch enumName {
        case "EHTTPStatusCode":
            return valueName.contains("Invalid") ? "" : "http"
        case "EDurationControlNotification":
            return valueName.contains("Hour") ? "in" : ""
        default:
            return ""
        }
    }

    /// Exception list of enum elements with duplicate values
    private static let duplicateValues: [String : Set<String>] = [
        "EWorkshopFileType" : ["k_EWorkshopFileTypeFirst"],
        "ESteamNetConnectionEnd" : [
            "k_ESteamNetConnectionEnd_App_Generic",
            "k_ESteamNetConnectionEnd_AppException_Generic",
            ]
    ]

    static func isDuplicate(enumName: String, valueName: String) -> Bool {
        duplicateValues[enumName]?.contains(valueName) ?? false
    }
}

extension String {
    /// Convert a steamworks enum member name to Swift.
    ///
    /// Stripping the prefix:
    /// * _Almost_ always begins with `k_`
    /// * _Rarely_ has an `n`
    /// * Scope string is usually constant but sometimes regexp and rarely case-incorrect
    func asSwiftCaseName(in enumName: String) -> String {
        re_sub("^(?:k_)?n?\(Enums.valuePrefixPattern(enumName: enumName))_?",
               with: Enums.valuePrefixAddition(enumName: enumName, valueName: self),
               options: .i)
            .asSwiftIdentifier
    }
}

// MARK: Structure generation

extension SteamAPI.Enum {
    /// So far Steam consistently names only bitflag enums as "...Flags"...
    var isEnumNotOptionSet: Bool {
        !enumname.hasSuffix("Flags")
    }

    var rawType: String {
        values.contains(where: { $0.value.hasPrefix("-") }) ? "Int32" : "UInt32"
    }

    /// The Swift declaration for the enum or optionset struct
    var generated: String {
        let swiftTypeName = enumname.asSwiftTypeName
        let rawType = rawType

        let typeDecl: String
        let valueGen: (Value, String) -> String

        if isEnumNotOptionSet {
            typeDecl = "public enum \(swiftTypeName): \(rawType) {"
            valueGen = generateEnumCaseDecl
        } else {
            typeDecl = """
                       public struct \(swiftTypeName): OptionSet {
                           /// The flags value.
                           public let rawValue: \(rawType)
                           /// Create a new instance with `rawValue` flags set.
                           public init(rawValue: \(rawType)) { self.rawValue = rawValue }
                       """
            valueGen = generateOptionSetDecl
        }

        let elements = values
            .map { value in
                """
                    /// Steamworks `\(value.name)`
                    \(valueGen(value, swiftTypeName))
                """
            }
            .joined(separator: "\n")

        return """
               /// Steamworks `\(enumname)`
               \(typeDecl)
               \(elements)
               }
               """
    }

    /// I have to admit I learnt more about the finickitiness of option sets getting these working
    /// than I learnt in the past five years... who made 0 magical ...
    func generateOptionSetDecl(value: Value, swiftTypeName: String) -> String {
        let initArgs: String
        if value.value == "0" && !isEnumNotOptionSet {
            initArgs = "[]"
        } else {
            initArgs = "rawValue: \(value.value)"
        }
        return "public static let \(value.name.asSwiftCaseName(in: enumname)) = \(swiftTypeName)(\(initArgs))"
    }

    /// The Swift declaration for the enum case.
    ///
    /// In the very rare case of duplicate values we treat it like an optionset member and force the
    /// init (it's optional for us, `RawRepresentable`) trusting it to actually be a duplicate.
    func generateEnumCaseDecl(value: Value, swiftTypeName: String) -> String {
        guard !Enums.isDuplicate(enumName: enumname, valueName: value.name) else {
            return generateOptionSetDecl(value: value, swiftTypeName: swiftTypeName) + "!"
        }
        return "case \(value.name.asSwiftCaseName(in: enumname)) = \(value.value)"
    }
}
