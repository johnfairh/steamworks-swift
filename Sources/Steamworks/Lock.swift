//
//  Lock.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

// Swift 5.7 -- `import Dispatch` appears to work again in C++ mode...
import Dispatch

struct Lock {
    private let dsem: DispatchSemaphore

    init() {
        dsem = DispatchSemaphore(value: 1)
    }

    func locked<T>(_ call: () throws -> T) rethrows -> T {
        dsem.wait()
        defer { dsem.signal() }
        return try call()
    }
}
