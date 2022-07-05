//
//  Metadata.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation
import Yams

/// Decoded SDK `steam_api.json`.
struct SteamJSON: Codable {
    struct Struct: Codable {
        struct Field: Codable {
            let fieldname: String
            let fieldtype: String
            let `private`: Bool?
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
        let callback: String?
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

    struct Accessor: Codable {
        let kind: String
        let name_flat: String
    }

    struct Interface: Codable {
        let classname: String
        let enums: [Enum]?
        let methods: [Method]
        let accessors: [Accessor]?
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

    init(_ parts: [SteamJSON]) {
        self.callback_structs = parts.flatMap(\.callback_structs)
        self.consts = parts.flatMap(\.consts)
        self.enums = parts.flatMap(\.enums)
        self.interfaces = parts.flatMap(\.interfaces)
        self.structs = parts.flatMap(\.structs)
        self.typedefs = parts.flatMap(\.typedefs)
    }
}

/// Description of the `steam_api_patch.yaml` file that holds additions and corrections
/// to the SDK json.  Yaml rather easier to write and read by humans.
///
/// Features:
/// * Constants: Fix value to something Swift understands
/// * Constants: Correct the type
/// * Constants: ignore constants
/// * Constants: nesting control
/// * Enums: use OptionSet or Enum in Swift
/// * Enums: value prefix to strip -- Steam has a clear convention for this but breaks it in
///   various ways that we have to hard-code.
/// * Enums: token to insert to avoid enum cases starting with numbers
/// * Enums: hint to generate a static member instead of an enum case
/// * Enums: generate from-IntX
/// * Enums: special-case the type name
/// * Enums: override the value
/// * Methods: correct the return type
/// * Methods: specify out-param behaviour when API call fails
/// * Methods: specify partially-completed out-arrays
/// * Methods: correct a parameter type
/// * Methods: correct a parameter name
/// * Methods: set discardableResult
/// * Methods: patch in missed `out_string_count` etc.
/// * Methods: ignore entirely
/// * Methods: modify flatname
/// * Structs: correct a field type (steam or swift)
/// * Structs: ignore field or entire struct
/// * Structs: correct the steam name
/// * Structs: generate a swift->steam converter
/// * Interfaces: Patch the C++ type name...
///
struct Patch: Codable {
    struct Const: Codable {
        let value: String? // patch C expression for value
        let type: String? // patch C type
        let nested_name: String? // patch name for nesting under typedef
    }
    let consts: [String: Const] // constname key
    let consts_to_ignore: [String]

    let typedefs_to_ignore: [String]

    struct Enum: Codable {
        let is_set: String? // values are bit-sig, model as OptionSet, pass to steamworks as given type
        let prefix: String? // enum values non-default prefix
        let numeric_prefix: String? // numeric-identifier workaround
        let manual_swift_name: String? // hard-code swift name
        let intx_to_self: String? // require converter from some int-type

        struct Value: Codable {
            let force_static: Bool? // generate a static member instead of an enum case
            let value: String? // patch value
        }
        let values: [String : Value]? // valuename key
    }
    let enums: [String : Enum] // name (== fqname ?? enumname) key

    struct Method: Codable {
        let returntype: String? // patch returntype (steam type)
        let out_param_iff_rc: String? // only copyback out-params if method rc matches
        let discardable_result: Bool? // set that attr
        let ignore: String? // ignore this method for interface-gen
        var bIgnore: Bool { ignore != nil }
        let callresult: String? // missing callresult
        let flat_name: String? // change called method

        struct Param: Codable {
            let type: String? // patch paramtype (steam type)
            let name: String? // patch param name
            let out_string_count: String? // patch out_string_count
            let out_array_count: String? // patch out_array_count
            let out_array_valid_count: String? // expr for actual valid prefix of out_array
            let array_count: String? // patch array_count
            let in_out: Bool? // mark up actual inout params
            let nullable: Bool? // out/array param can be null (nil)
        }
        let params: [String : Param]?
    }
    let methods: [String : Method] // methodname_flat key

    struct Struct: Codable {
        struct Field: Codable {
            let fieldtype: String? // patch fieldtype (steam type)
            let ignore: String? // filter out broken / too weird fields
            var bIgnore: Bool { ignore != nil }
        }
        let fields: [String : Field]? // fieldname key
        let ignore: String? // filter out broken / too weird structs
        var bIgnore: Bool { ignore != nil }
        let name: String? // the steam json name is wrong...
        let manual_swift_name: String?
        let swift_to_steam: Bool? // generate swift->steam converter
    }
    let structs: [String: Struct] // struct.name key

    struct Interface: Codable {
        let real_classname: String? // override C++ class name
        let ignore: String? // filter out weird things
        var bIgnore: Bool { ignore != nil }
        var getter: String? // non-default name of API to create this
    }
    let interfaces: [String: Interface] // interface.classname key

    init(data: Data) throws {
        self = try YAMLDecoder().decode(from: data)
    }
}

/// Actual API metadata database with useful data from the json and our patch.
///
/// Also fast lookups and central access for weird special cases of knowledge needs
/// (like 'is this random string an enum?')
///
struct MetadataDB {
    struct Const {
        let name: SteamHungarianName
        let type: SteamType
        let value: SteamConstantExpr
        let nestedName: SwiftExpr?

        init(base: SteamJSON.Const, patch: Patch.Const?) {
            self.name = SteamHungarianName(base.constname)
            self.type = SteamType(patch?.type ?? base.consttype)
            self.value = SteamConstantExpr(patch?.value ?? base.constval)
            self.nestedName = patch?.nested_name.map { .init($0) }
        }
    }

    /// Indexed by `constname`, filtered by patch exclude-list
    let consts: [SteamHungarianName : Const]

    final class Enum {
        let name: SteamType
        let setPassedInTypeName: SwiftNativeType?
        var isSet: Bool { setPassedInTypeName != nil }
        let prefix: String
        let numericPrefix: String?
        let manualSwiftName: SwiftType?
        let intXToSelf: SwiftNativeType?

        struct Value {
            let name: SteamName
            let value: SwiftExpr
            let forceStatic: Bool

            init(base: SteamJSON.Enum.Value, patch: Patch.Enum.Value?) {
                name = SteamName(base.name)
                value = SwiftExpr(patch?.value ?? base.value)
                forceStatic = patch?.force_static ?? false
            }
        }
        let values: [Value]

        init(base: SteamJSON.Enum, patch: Patch.Enum?) {
            name = SteamType(base.name)
            setPassedInTypeName = patch?.is_set.map { .init($0) }
            prefix = patch?.prefix ?? base.name
            numericPrefix = patch?.numeric_prefix
            manualSwiftName = patch?.manual_swift_name.map { .init($0) }
            intXToSelf = patch?.intx_to_self.map { .init($0) }
            values = base.values.map {
                Value(base: $0, patch: patch?.values?[$0.name])
            }
        }
    }
    /// Indexed by `enumname`
    let enums: [SteamType : Enum]

    struct Method {
        let name: SteamName
        let flatName: SteamName
        let callResult: SteamType?
        let callback: SteamType?

        struct Param {
            let name: SteamHungarianName
            let type: SteamType
            let probablyOutParam: Bool
            let arrayCount: SteamHungarianName?
            let outArrayLength: SteamParameterExpr?
            let outArrayValidLength: SwiftExpr?
            let outStringLength: SteamParameterExpr?
            let inOut: Bool
            let nullable: Bool

            init(base: SteamJSON.Method.Param, patch: Patch.Method.Param?) {
                self.name = SteamHungarianName(patch?.name ?? base.paramname)
                let nativeSteamType = SteamType(patch?.type ?? base.paramtype_flat ?? base.paramtype)
                self.type = nativeSteamType.asParameterType
                self.probablyOutParam = nativeSteamType.isProbablyOutParameter
                self.inOut = patch?.in_out ?? false
                self.nullable = patch?.nullable ?? false
                if let patchedArrayCount = patch?.array_count, patchedArrayCount == "DELETE" {
                    self.arrayCount = nil // fix a mistake
                } else {
                    self.arrayCount = (patch?.array_count ?? base.array_count).map { .init($0) }
                }

                if let arrayCall = base.out_array_call {
                    // comma-separated list, first is param name, rest is dynamic recipe on how to calculate.
                    // used so sparingly (once) ignore the clever part.
                    self.outArrayLength = SteamParameterExpr(arrayCall.split(separator: ",")[0])
                } else if let arrayCount = patch?.out_array_count ?? base.out_array_count {
                    // const or param with the length
                    self.outArrayLength = SteamParameterExpr(arrayCount)
                } else {
                    self.outArrayLength = nil
                }
                self.outArrayValidLength = patch?.out_array_valid_count.map { .init($0) }

                if let outStringCount = patch?.out_string_count ?? base.out_string_count {
                    self.outStringLength = SteamParameterExpr(outStringCount)
                } else {
                    self.outStringLength = nil
                }
//              precondition(arrayCount == nil || outArrayLength == nil, "base=\(base), patch=\(patch)")
                // something weird in inventory...
                precondition(outArrayLength == nil || outStringLength == nil)
            }
        }
        let params: [Param]
        let returnType: SteamType
        let outParamIffRc: SwiftExpr?
        let discardableResult: Bool
        let ignore: Bool

        init(base: SteamJSON.Method, patch: Patch.Method?) {
            name = SteamName(base.methodname)
            flatName = SteamName(patch?.flat_name ?? base.methodname_flat)
            callResult = (patch?.callresult ?? base.callresult).map { SteamType($0) }
            callback = base.callback.map { SteamType($0) }
            params = base.params.map { .init(base: $0, patch: patch?.params?[$0.paramname]) }
            returnType = SteamType(patch?.returntype ?? base.returntype).asReturnType
            outParamIffRc = patch?.out_param_iff_rc.map { $0 == " " ? "" : $0 }.map { .init($0) }
            discardableResult = patch?.discardable_result ?? false
            ignore = patch?.bIgnore ?? false
        }
    }

    struct Interface {
        let name: SteamType
        let realClassName: SteamType?
        /// Indexed by `name`
        let enums: [SteamType : Enum]
        /// Indexed by `methodname_flat` ... `methodname` is not unique...
        let methods: [String : Method]

        enum Access {
            case instance(String)
            case global(String)
            case user(String)
            case gameserver(String)
            case userAndServer(String, String)
        }
        let access: Access

        init?(base: SteamJSON.Interface, patch: Patch) {
            let ipatch = patch.interfaces[base.classname]
            if let ipatch = ipatch, ipatch.bIgnore {
                return nil
            }
            name = SteamType(base.classname)
            realClassName = ipatch?.real_classname.map { .init($0) }
            methods = .init(uniqueKeysWithValues: base.methods.map { baseMethod in
                (baseMethod.methodname_flat, Method(base: baseMethod, patch: patch.methods[baseMethod.methodname_flat]))
            })
            enums = .init(uniqueKeysWithValues: (base.enums ?? []).map { baseEnum in
                (SteamType(baseEnum.name), Enum(base: baseEnum, patch: patch.enums[baseEnum.name]))
            })
            guard let accessors = base.accessors else {
                access = .instance(ipatch?.getter ?? "")
                return
            }
            let accessorMap = Dictionary(uniqueKeysWithValues: accessors.map { ($0.kind, $0.name_flat) })
            if let g = accessorMap["global"] {
                access = .global(g)
            } else {
                let u = accessorMap["user"]
                let g = accessorMap["gameserver"]
                if let u = u {
                    if let g = g {
                        access = .userAndServer(u, g)
                    } else {
                        access = .user(u)
                    }
                } else if let g = g {
                    access = .gameserver(g)
                } else {
                    preconditionFailure("Confused by accessors for \(base.classname)")
                }
            }
        }
    }
    /// Indexed by `classname`
    let interfaces: [SteamType : Interface]

    /// Shared type between callback-structs and regular structs - regular structs don't have
    /// a callback ID and may have methods (though these are rarely coherent)
    struct Struct {
        struct Field {
            let name: SteamHungarianName
            let type: SteamType
            let ignore: Bool

            init(base: SteamJSON.Struct.Field, patch: Patch.Struct.Field?) {
                name = SteamHungarianName(base.fieldname)
                type = SteamType(patch?.fieldtype ?? Self.patch(name: name, type: base.fieldtype))
                ignore = base.private ?? patch?.bIgnore ?? false
            }

            /// Patch up some systemic errors / C-alignment-reasoning in types
            static func patch(name: SteamHungarianName, type: String) -> String {
                if name.name.starts(with: "m_b") {
                    return "bool"
                }
                if type == "uint64" {
                    if name.name.re_isMatch("steamid", options: .i) { return "CSteamID" }
                    if name.name.re_isMatch("gameid", options: .i) { return "CGameID" }
                }
                return type
            }
        }

        let name: SteamType // "struct" too annoying
        let manualSwiftName: SwiftType?
        let fields: [Field]
        let callbackID: Int?
        let ignore: Bool
        let swiftToSteam: Bool
        /// Indexed by `enum.name`
        let enums: [SteamType : Enum]

        init(base: SteamJSON.Struct, patch: Patch) {
            let structPatch = patch.structs[base.struct]
            name = SteamType(structPatch?.name ?? base.struct)
            manualSwiftName = structPatch?.manual_swift_name.map { .init($0) }
            fields = base.fields.map {
                .init(base: $0, patch: structPatch?.fields?[$0.fieldname])
            }
            callbackID = base.callback_id
            ignore = structPatch?.bIgnore ?? false
            swiftToSteam = structPatch?.swift_to_steam ?? false

            enums = .init(uniqueKeysWithValues: (base.enums ?? []).map { baseEnum in
                (SteamType(baseEnum.name), Enum(base: baseEnum, patch: patch.enums[baseEnum.name]))
            })
        }
    }
    /// Indexed by `struct` -- 'callback structs' first
    let structs: [SteamType : Struct]

    struct Typedef {
        let typedef: SteamType
        let type: SteamType

        init(base: SteamJSON.Typedef) {
            typedef = SteamType(base.typedef)
            type = SteamType(base.type)
        }
    }

    /// Indexed by `typedef`, order from original file
    let typedefs: [SteamType : Typedef]

    init(base: SteamJSON, patch: Patch) {
        let ignoredConsts = Set(patch.consts_to_ignore)
        consts = .init(uniqueKeysWithValues: base.consts.compactMap {
            let name = $0.constname
            guard !ignoredConsts.contains(name) else {
                return nil
            }
            return (SteamHungarianName(name), Const(base: $0, patch: patch.consts[name]))
        })

        enums = .init(uniqueKeysWithValues: base.enums.map {
            (SteamType($0.name), Enum(base: $0, patch: patch.enums[$0.name]))
        })

        interfaces = .init(uniqueKeysWithValues: base.interfaces.compactMap {
            Interface(base: $0, patch: patch).map { ($0.name, $0) }
        })

        structs = .init(uniqueKeysWithValues: (base.callback_structs + base.structs).map {
            let s = Struct(base: $0, patch: patch)
            return (s.name, s) // structs can rename themselves...
        })

        let ignoredTypedefs = Set(patch.typedefs_to_ignore)
        typedefs = .init(uniqueKeysWithValues: base.typedefs.compactMap {
            guard !ignoredTypedefs.contains($0.typedef) else {
                return nil
            }
            let t = Typedef(base: $0)
            return (t.typedef, t)
        })
    }
}


/// Sharable reference wrapper around the API metadata
///
/// The API available here is the patched version.
final class Metadata: CustomStringConvertible {
    let io: IO
    let db: MetadataDB

    private let nestedEnums: [SteamType : MetadataDB.Enum]
    private let manualSwiftNames: [SteamType : SwiftType]

    init(io: IO) throws {
        self.io = io

        let baseAPI = try SteamJSON(data: io.loadSDKJSON())
        let extraAPI = try SteamJSON(data: io.loadSDKExtraJSON())
        let patch = try Patch(data: io.loadPatchYAML())

        self.db = MetadataDB(base: SteamJSON([baseAPI, extraAPI]), patch: patch)

        // cache enums that aren't in the normal place
        let nestedStructEnums = db.structs.values.flatMap {
            $0.enums.values.map { ($0.name, $0) }
        }
        let nestedInterfaceEnums = db.interfaces.values.flatMap {
            $0.enums.values.map { ($0.name, $0) }
        }

        self.nestedEnums = .init(uniqueKeysWithValues: nestedStructEnums + nestedInterfaceEnums)
        let eClo: (MetadataDB.Enum) -> (SteamType, SwiftType)? = { enu in
            enu.manualSwiftName.map { (enu.name, $0) }
        }
        let sClo: (MetadataDB.Struct) -> (SteamType, SwiftType)? = { str in
            str.manualSwiftName.map { (str.name, $0) }
        }
        self.manualSwiftNames =
            .init(uniqueKeysWithValues:
                db.enums.values.compactMap(eClo) +
                nestedEnums.values.compactMap(eClo) +
                db.structs.values.compactMap(sClo)
        )

        Self.shared = self
    }

    var description: String {
        """
          Constants: \(db.consts.count)
          Enums: \(db.enums.count)
          Nested enums: \(nestedEnums.count)
          Interfaces: \(db.interfaces.count)
          Interface methods: \(db.interfaces.values.reduce(0) { $0 + $1.methods.count })
          Structs: \(db.structs.count), \(db.structs.values.filter(\.ignore).count) ignored
          Fields: \(db.structs.values.reduce(0) { $0 + $1.fields.count })
          Typedefs: \(db.typedefs.count)
        """
    }

    static private(set) var shared: Metadata?

    var allEnums: [MetadataDB.Enum] {
        Array(db.enums.values) + Array(nestedEnums.values)
    }

    static private func findEnum(steamType: SteamType) -> MetadataDB.Enum? {
        shared?.db.enums[steamType] ?? shared?.nestedEnums[steamType]
    }

    static func isEnum(steamType: SteamType) -> Bool {
        findEnum(steamType: steamType) != nil
    }

    static func isOptionSetEnumPassedUnpredictably(steamType: SteamType) -> SwiftNativeType? {
        findEnum(steamType: steamType)?.setPassedInTypeName
    }

    static func findEnumDefaultInstance(steamType: SteamType) -> SwiftExpr? {
        findEnum(steamType: steamType)?.defaultInstance
    }

    static func isStruct(steamType: SteamType) -> Bool {
        shared.flatMap { $0.db.structs[steamType] != nil } ?? false
    }

    static func isTypedef(steamType: SteamType) -> Bool {
        shared.flatMap { $0.db.typedefs[steamType] != nil } ?? false
    }

    /// Look up any overridden type names from the DB
    static func steamTypeToSwiftType(_ steamType: SteamType) -> SwiftType? {
        shared.flatMap { $0.manualSwiftNames[steamType] }
    }
}
