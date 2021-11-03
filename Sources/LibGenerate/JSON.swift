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
            let value: String // ??
        }
        let enumname: String
        let values: [Value]
    }
    let enums: [Enum]

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
        """
    }
}
