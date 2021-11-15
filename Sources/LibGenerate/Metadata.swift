//
//  Metadata.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation
import OrderedCollections

/// Decoded SDK `steam_api.json`.
struct SteamJSON: Codable {
    struct Struct: Codable {
        struct Field: Codable {
            let fieldname: String
            let fieldtype: String
        }
        let callback_id: Int?
        let enums: [Enum]?
        let fields: [Field]
        let `struct`: String
        let methods: [Method]?
    }
    let callback_structs: [Struct]

    struct Const: Codable {
        let constname: String
        let consttype: String
        let constval: String
    }
    let consts: [Const]

    struct Enum: Codable {
        struct Value: Codable {
            let name: String
            let value: String
        }
        let enumname: String
        let fqname: String?
        let values: [Value]

        var name: String {
            fqname ?? enumname
        }
    }
    let enums: [Enum]

    struct Method: Codable {
        let callresult: String?
        let methodname: String
        let methodname_flat: String

        struct Param: Codable {
            let paramname: String
            let paramtype: String
            let paramtype_flat: String?
            let array_count: String?
            let buffer_count: String?
            let out_struct: String?
            let out_array_call: String?
            let out_array_count: String?
            let out_string_count: String?
            let out_buffer_count: String?
        }
        let params: [Param]
        let returntype: String
    }

    struct Interface: Codable {
        let classname: String
        let methods: [Method]
    }
    let interfaces: [Interface]

    let structs: [Struct]

    struct Typedef: Codable {
        let typedef: String
        let type: String
    }
    let typedefs: [Typedef]

    init(data: Data) throws {
        self = try JSONDecoder().decode(SteamJSON.self, from: data)
    }
}

/// Description of the `steam_api_patch.json` file that holds additions and corrections
/// to the SDK json.
///
/// Features:
/// * Enums: use OptionSet or Enum in Swift
/// * Enums: value prefix to strip -- Steam has a clear convention for this but breaks it in
///   various ways that we have to hard-code.
/// * Enums: token to insert to avoid enum cases starting with numbers
/// * Enums: hint to generate a static member instead of an enum case
/// * Methods: correct the return type
/// * Methods: specify out-param behaviour when API call fails
///
struct PatchJSON: Codable {
    struct Enum: Codable {
        let is_set: Bool? // values are bit-sig, model as OptionSet
        let prefix: String? // enum values non-default prefix
        let numeric_prefix: String? // numeric-identifier workaround

        struct Value: Codable {
            let force_static: Bool? // generate a static member instead of an enum case
        }
        let values: [String : Value]? // valuename key
    }
    let enums: [String : Enum] // name (== fqname ?? enumname) key

    struct Method: Codable {
        let returntype: String? // patch returntype
        let out_param_iff_rc: String? // only copyback out-params if method rc matches

        struct Param: Codable {
            let type: String? // patch paramtype
        }
        let params: [String : Param]?
    }
    let methods: [String : Method] // methodname_flat key

    init(data: Data) throws {
        self = try JSONDecoder().decode(PatchJSON.self, from: data)
    }
}

/// Actual API metadata database with useful data from the json and our patch.
///
/// Also fast lookups and central access for weird special cases of knowledge needs
/// (like 'is this random string an enum?')
///
struct MetadataDB {
    typealias Const = SteamJSON.Const
    /// Indexed by `constname`, order from original file
    let consts: OrderedDictionary<String, Const>

    final class Enum {
        let name: String
        let is_set: Bool
        let prefix: String
        let numeric_prefix: String?

        struct Value: Codable {
            let name: String
            let value: String
            let force_static: Bool

            init(base: SteamJSON.Enum.Value, patch: PatchJSON.Enum.Value?) {
                name = base.name
                value = base.value
                force_static = patch?.force_static ?? false
            }
        }
        let values: OrderedDictionary<String, Value>

        init(base: SteamJSON.Enum, patch: PatchJSON.Enum?) {
            name = base.name
            is_set = patch?.is_set ?? false
            prefix = patch?.prefix ?? name
            numeric_prefix = patch?.numeric_prefix
            values = .init(uniqueKeysWithValues: base.values.map {
                ($0.name, Value(base: $0, patch: patch?.values?[$0.name]))
            })
        }
    }
    /// Indexed by `enumname`, order from original file
    let enums: OrderedDictionary<String, Enum>

    struct Method: Codable {
        let methodname: String
        let methodname_flat: String
        let callresult: String?

        struct Param: Codable {
            let name: String
            let type: String
            let array_count: String?
            let out_array_length: String?
            // ?? let out_string_count: String?
            // ?? let buffer_count: String?

            init(base: SteamJSON.Method.Param, patch: PatchJSON.Method.Param?) {
                self.name = base.paramname
                self.type = patch?.type ?? base.paramtype_flat ?? base.paramtype
                self.array_count = base.array_count

                if let arrayCall = base.out_array_call {
                    // comma-separated list, first is param name, rest is dynamic recipe on how to calculate.
                    // used so sparingly (once) ignore the clever part.
                    self.out_array_length = String(arrayCall.split(separator: ",")[0])
                } else if let arrayCount = base.out_array_count {
                    // const or param with the length
                    self.out_array_length = arrayCount
                } else {
                    self.out_array_length = nil
                }
            }
        }
        let params: [Param]
        let returntype: String
        let out_param_iff_rc: String?

        init(base: SteamJSON.Method, patch: PatchJSON.Method?) {
            methodname = base.methodname
            methodname_flat = base.methodname_flat
            callresult = base.callresult
            params = base.params.map { .init(base: $0, patch: patch?.params?[$0.paramname]) }
            returntype = patch?.returntype ?? base.returntype
            out_param_iff_rc = patch?.out_param_iff_rc
        }
    }

    struct Interface: Codable {
        let classname: String
        /// Indexed by `methodname_flat`, order from original file ... `methodname` is not unique...
        let methods: OrderedDictionary<String, Method>

        init(base: SteamJSON.Interface, patch: PatchJSON) {
            classname = base.classname
            methods = .init(uniqueKeysWithValues: base.methods.map { baseMethod in
                (baseMethod.methodname_flat, Method(base: baseMethod, patch: patch.methods[baseMethod.methodname_flat]))
            })
        }
    }
    /// Indexed by `classname`, order from original file
    let interfaces: OrderedDictionary<String, Interface>

    /// Shared type between callback-structs and regular structs - regular structs don't have
    /// a callback ID and may have methods (though these are rarely coherent)
    struct Struct {
        typealias Field = SteamJSON.Struct.Field
        let name: String // "struct" too annoying
        let fields: [Field]
        let callback_id: Int?
        /// Indexed by `name`, order from original file ...
        let enums: OrderedDictionary<String, Enum>
        /// Indexed by `methodname_flat`, order from original file ... `methodname` is not unique...
        let methods: OrderedDictionary<String, Method>

        init(base: SteamJSON.Struct, patch: PatchJSON) {
            name = base.struct
            fields = base.fields
            callback_id = base.callback_id

            enums = .init(uniqueKeysWithValues: (base.enums ?? []).map { baseEnum in
                (baseEnum.name, Enum(base: baseEnum, patch: patch.enums[baseEnum.name]))
            })

            methods = .init(uniqueKeysWithValues: (base.methods ?? []).map { baseMethod in
                (baseMethod.methodname_flat, Method(base: baseMethod, patch: patch.methods[baseMethod.methodname_flat]))
            })
        }
    }
    /// Indexed by `struct`, order from original file -- 'callback structs' first
    let structs: OrderedDictionary<String, Struct>

    typealias Typedef = SteamJSON.Typedef
    /// Indexed by `typedef`, order from original file
    let typedefs: OrderedDictionary<String, Typedef>

    init(base: SteamJSON, patch: PatchJSON) {
        consts = .init(uniqueKeysWithValues: base.consts.map {
            ($0.constname, $0)
        })

        enums = .init(uniqueKeysWithValues: base.enums.map {
            ($0.name, Enum(base: $0, patch: patch.enums[$0.name]))
        })

        interfaces = .init(uniqueKeysWithValues: base.interfaces.map {
            ($0.classname, Interface(base: $0, patch: patch))
        })

        structs = .init(uniqueKeysWithValues: (base.callback_structs + base.structs).map {
            ($0.struct, Struct(base: $0, patch: patch))
        })

        typedefs = .init(uniqueKeysWithValues: base.typedefs.map {
            ($0.typedef, $0)
        })
    }
}


/// Sharable reference wrapper around the API metadata
///
/// The API available here is the patched version.
final class Metadata: CustomStringConvertible {
    let io: IO
    let db: MetadataDB

    private let nestedEnums: [String : MetadataDB.Enum]

    init(io: IO) throws {
        self.io = io

        let baseAPI = try SteamJSON(data: io.loadSdkJson())
        let patch = try PatchJSON(data: io.loadPatchJson())

        self.db = MetadataDB(base: baseAPI, patch: patch)

        // cache enums that aren't in the normal place
        self.nestedEnums = .init(uniqueKeysWithValues: db.structs.values.flatMap {
            $0.enums.values.map { ($0.name, $0) }
        })

        Self.shared = self
    }

    var description: String {
        """
          Constants: \(db.consts.count)
          Enums: \(db.enums.count)
          Nested enums: \(nestedEnums.count)
          Interfaces: \(db.interfaces.count)
          Interface methods: \(db.interfaces.values.reduce(0) { $0 + $1.methods.count })
          Structs: \(db.structs.count)
          Typedefs: \(db.typedefs.count)
        """
    }

    static private(set) var shared: Metadata!

    static private func findEnum(name: String) -> MetadataDB.Enum? {
        shared.db.enums[name] ?? shared.nestedEnums[name]
    }

    static func isEnum(steamType name: String) -> Bool {
        findEnum(name: name) != nil
    }

    static func isOptionSetEnum(steamType name: String) -> Bool {
        findEnum(name: name)?.is_set ?? false
    }
}
