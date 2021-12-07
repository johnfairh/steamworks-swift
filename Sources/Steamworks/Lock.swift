//
//  Lock.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

//
// macOS 12, Xcode 13.1, `import Dispatch` does not make `DispatchSemaphore`
// available.  Blame C++ interop I suppose.  Rewrite when fixed.
//
// (Remember Foundation + C++ is broken, so NSLock() is no good)
//

#if canImport(Darwin)
@_implementationOnly import Darwin
#elseif canImport(Glibc)
@_implementationOnly import Glibc
#else
#error("Better get Dispatch working")
#endif

final class Lock {
    private let mutex: UnsafeMutablePointer<pthread_mutex_t>

    init() {
        mutex = .allocate(capacity: 1)
        mutex.initialize(to: pthread_mutex_t())
        let rc = pthread_mutex_init(&mutex.pointee, nil)
        precondition(rc == 0)
    }

    func lock() {
        let rc = pthread_mutex_lock(&mutex.pointee)
        precondition(rc == 0)
    }

    func unlock() {
        let rc = pthread_mutex_unlock(&mutex.pointee)
        precondition(rc == 0)
    }

    var isLocked: Bool {
        pthread_mutex_trylock(&mutex.pointee) != 0
    }

    @discardableResult
    func locked<T>(_ call: () throws -> T) rethrows -> T {
        lock()
        defer { unlock() }
        return try call()
    }
}
