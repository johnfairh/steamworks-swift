//
//  Callbacks.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

/// Code gen the callbacks interfaces -- the broadcast notification things.
struct Callbacks {
    let io: IO
    let metadata: Metadata
    let generated: Generated

    init(io: IO, metadata: Metadata, generated: Generated) {
        self.io = io
        self.metadata = metadata
        self.generated = generated
    }

    /// Figure out which structs need callback APIs.  Not exactly straightforward.
    var callbackStructs: [MetadataDB.Struct] {
        var callResults: Set<SteamType> = []
        var explicitCallbacks: Set<SteamType> = []

        // Scan through and find structs with identified uses
        metadata.db.interfaces.values.forEach { interface in
            interface.methods.values.forEach { method in
                if let cr = method.callResult {
                    callResults.insert(cr)
                }
                if let cb = method.callback {
                    explicitCallbacks.insert(cb)
                    print("Add ExCB: \(cb)")
                }
            }
        }

        // Some things are used for both callback and callresult
        callResults.subtract(explicitCallbacks)

        // And so generate callback APIs for structs that are either explicitly
        // identified as such or are _not_ identified for callresult.
        return Array(metadata.db.structs.values.filter { strct in
            !strct.ignore && strct.callbackID != nil && !callResults.contains(strct.name)
        })
    }

    func generate() throws {
        let callbacks = callbackStructs.sorted(by: { $0.name < $1.name })
        callbacks.forEach { generated.add(type: $0.name.swiftType, kind: .callback) }
        let contents = """
                       public extension SteamBaseAPI {
                           // MARK: Callbacks

                       \(callbacks.map(\.callbackSyncLines).joined(separator: "\n\n"))
                       }

                       public extension SteamBaseAPI {
                           // MARK: `AsyncStream` callbacks

                       \(callbacks.map(\.callbackAsyncLines).joined(separator: "\n\n"))
                       }
                       """
        try io.write(fileName: "SteamBaseAPI+Callbacks.swift", contents: contents)
    }
}

extension MetadataDB.Struct {
    var callbackSyncLines: String {
        let swiftType = name.swiftType
        return """
                   /// Registration for Steamworks `\(name)` callback
                   func on\(swiftType)(_ client: @Sendable @escaping (sending \(swiftType)) -> Void) {
                       callbacks.add(callbackID: CallbackID(\(callbackID!)), rawClient: SteamBaseAPI.makeRaw(client))
                   }
               """
    }

    var callbackAsyncLines: String {
        let swiftType = name.swiftType
        return """
                   /// Async stream of Steamworks `\(name)` callbacks
                   var \(SteamName(swiftType).swiftName): AsyncStream<\(swiftType)> {
                       AsyncStream { on\(swiftType)($0.yield0) }
                   }
               """
    }
}

extension Callbacks {
    static func syncSymbolName(_ callback: SwiftType) -> String {
        "on\(callback)"
    }

    static func syncDocSymbol(_ callback: SwiftType) -> String {
        "\(syncSymbolName(callback))(_:)"
    }

    static func asyncSymbolName(_ callback: SwiftType) -> SwiftExpr {
        SteamName(callback).swiftName // gets the lower-casing
    }

    static func asyncDocSymbol(_ callback: SwiftType) -> String {
        asyncSymbolName(callback).expr
    }
}
