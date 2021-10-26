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
