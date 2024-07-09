//
//  Lock.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

// Swift 5.7 -- `import Dispatch` appears to work again in C++ mode...
// Swift 6 - Swift's Synchronization.Mutex doesn't seem to exist yet...
import Dispatch

final class Lock: Sendable {
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
