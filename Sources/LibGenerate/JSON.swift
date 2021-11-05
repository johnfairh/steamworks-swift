//
//  JSON.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation

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
            }
            let params: [Param]
            let returntype: String
            let returntype_flat: String?
        }
        let methods: [Method]
    }
    let interfaces: [Interface]

    init(data: Data) throws {
        self = try JSONDecoder().decode(SteamAPI.self, from: data)
    }
}

final class JSON: CustomStringConvertible {
    let io: IO
    let api: SteamAPI

    init(io: IO) throws {
        self.io = io
        self.api = try SteamAPI(data: io.loadJson())
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
