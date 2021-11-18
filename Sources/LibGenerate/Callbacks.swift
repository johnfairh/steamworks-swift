//
//  Callbacks.swift
//  LibGenerate
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

import Foundation
import OrderedCollections

/// Code gen the callbacks interfaces -- the broadcast notification things.
struct Callbacks {
    let io: IO
    let metadata: Metadata

    init(io: IO, metadata: Metadata) {
        self.io = io
        self.metadata = metadata
    }

    /// Figure out which structs need callback APIs.  Not exactly straightforward.
    var callbackStructs: [MetadataDB.Struct] {
        var callResults: Set<String> = []
        var explicitCallbacks: Set<String> = []

        // Scan through and find structs with identified uses
        metadata.db.interfaces.values.forEach { interface in
            interface.methods.values.forEach { method in
                if let cr = method.callResult {
                    callResults.insert(cr)
                }
                if let cb = method.callback {
                    explicitCallbacks.insert(cb)
                }
            }
        }

        // Some things are used for both callback and callresult
        callResults.subtract(explicitCallbacks)

        // And so generate callback APIs for structs that are either explicitly
        // identified as such or are _not_ identified for callresult.
        return Array(metadata.db.structs.values.filter { strct in
            strct.callbackID != nil && !callResults.contains(strct.name)
        })
    }

    func generate() throws {
        let callbacks = callbackStructs
        let contents = """
                       public extension SteamBaseAPI {
                           // MARK: Callback registration
                       \(callbacks.map(\.callbackSyncLines).joined(separator: "\n\n"))
                       }

                       public extension SteamBaseAPI {
                           // MARK: AsyncStream callback registration
                       \(callbacks.map(\.callbackAsyncLines).joined(separator: "\n\n"))
                       }
                       """
        try io.write(fileName: "Callbacks.swift", contents: contents)
    }
}

extension MetadataDB.Struct {
    var callbackSyncLines: String {
        let swiftTypeName = name.asSwiftTypeName
        return """
                   /// Registration for Steamworks `\(name)` callback
                   func on\(swiftTypeName)(_ client: @escaping (\(swiftTypeName)) -> Void) {
                       callbacks.add(callbackID: CallbackID(\(callbackID!)), rawClient: SteamBaseAPI.makeRaw(client))
                   }
               """
    }

    var callbackAsyncLines: String {
        let swiftTypeName = name.asSwiftTypeName
        return """
                   /// Async stream of Steamworks `\(name)` callbacks
                   var \(swiftTypeName.asSwiftIdentifier): AsyncStream<\(swiftTypeName)> {
                       AsyncStream { continuation in
                           on\(swiftTypeName) { continuation.yield($0) }
                       }
                   }
               """
    }
}
