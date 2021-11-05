//
//  TypeUtils.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// Protocol added to Swift structs meaning they have a corresponding Steam (C) type
protocol SteamCreatable {
    associatedtype SteamType
    init(_ steam: SteamType)
}

/// Type of Steam Callback ID used as interface from Generated/Callbacks -> SteamCallbacks
typealias CallbackID = Int32

extension String {
    /// For converting strings received from Steamworks.  We promote `nullptr` to empty string for
    /// ease, this may be wrong though for some API or other, tbd.
    init(_ cString: UnsafePointer<CChar>?) {
        if let cString = cString {
            self.init(cString: cString)
        } else {
            self = ""
        }
    }
}
