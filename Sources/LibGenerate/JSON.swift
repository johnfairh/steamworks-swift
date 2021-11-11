//
//  JSON.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

/// Description of the `steam_api_patch.json` file that holds additions and corrections
/// to the SDK json.
///
/// Features:
/// * Enums: use OptionSet or Enum in Swift
/// * Methods: correct the return type
///
struct APIPatch: Codable {
    struct Enum: Codable {
        let is_set: Bool? // values are bit-sig, model as OptionSet
    }
    let enums: [String : Enum] // enumname key

    struct Method: Codable {
        let returntype: String? // patch returntype
    }
    let methods: [String : Method] // methodname key

    init(data: Data) throws {
        self = try JSONDecoder().decode(APIPatch.self, from: data)
    }
}

/// Decoded SDK `steam_api.json`.
///
/// A model of the structure on disk _plus_ features added by the `APIPatch` outlined
/// above.
///
/// We read it off disk, apply the patch, and store the result.
struct SteamAPI: Codable {
    struct CallbackStruct: Codable {
        struct Field: Codable {
            let fieldname: String
            let fieldtype: String
        }
        let callback_id: Int
        let fields: [Field]
        let `struct`: String
    }
    let callback_structs: [CallbackStruct]

    struct Const: Codable {
        let constname: String
        let consttype: String
        let constval: String // ??
    }
    let consts: [Const]

    struct Enum: Codable {
        struct Value: Codable {
            let name: String
            let value: String
        }
        let enumname: String
        let values: [Value]
        let is_set: Bool? // patch adds

        init(base: Enum, patch: APIPatch.Enum) {
            enumname = base.enumname
            values = base.values
            is_set = patch.is_set
        }
    }
    let enums: [Enum]

    struct Interface: Codable {
        let classname: String
        struct Method: Codable {
            let callresult: String?
            let methodname: String
            let methodname_flat: String

            struct Param: Codable {
                let paramname: String
                let paramtype: String
                let paramtype_flat: String?
                let out_struct: String?
                let out_array_call: String?
                let array_count: String?
                let out_string_count: String?
                let buffer_count: String?

                var type: String {
                    paramtype_flat ?? paramtype
                }
            }
            let params: [Param]
            let returntype: String // patch can overwrite
            // unused let returntype_flat: String?

            init(base: Method, patch: APIPatch.Method) {
                callresult = base.callresult
                methodname = base.methodname
                methodname_flat = base.methodname_flat
                params = base.params
                returntype = patch.returntype ?? base.returntype
            }
        }
        let methods: [Method]

        init(base: Interface, patch: APIPatch) {
            classname = base.classname
            methods = base.methods.map { baseMethod in
                patch.methods[baseMethod.methodname_flat].map {
                    Method(base: baseMethod, patch: $0)
                } ?? baseMethod
            }
        }
    }
    let interfaces: [Interface]

    init(data: Data) throws {
        self = try JSONDecoder().decode(SteamAPI.self, from: data)
    }

    init(base: SteamAPI, patch: APIPatch) {
        callback_structs = base.callback_structs
        consts = base.consts
        enums = base.enums.map { baseEnum in
            patch.enums[baseEnum.enumname].map {
                Enum(base: baseEnum, patch: $0)
            } ?? baseEnum
        }
        interfaces = base.interfaces.map {
            Interface(base: $0, patch: patch)
        }
    }
}

/// Sharable reference wrapper around the API JSON
///
/// The API available here is the patched version.
final class JSON: CustomStringConvertible {
    let io: IO
    let api: SteamAPI

    init(io: IO) throws {
        self.io = io

        let baseAPI = try SteamAPI(data: io.loadSdkJson())
        let patch = try APIPatch(data: io.loadPatchJson())

        self.api = SteamAPI(base: baseAPI, patch: patch)
    }

    var description: String {
        """
          Callback structs: \(api.callback_structs.count)
          Constants: \(api.consts.count)
          Enums: \(api.enums.count)
          Interfaces: \(api.interfaces.count)
          Interface methods: \(api.interfaces.reduce(0) { $0 + $1.methods.count })
        """
    }
}
