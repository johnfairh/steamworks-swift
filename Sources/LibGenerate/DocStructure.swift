//
//  DocStructure.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation

struct DocStructure {
    let io: IO
    let decoder: JSONDecoder

    init(io: IO) {
        self.io = io
        let decoder = JSONDecoder()
        decoder.allowsJSON5 = true
        self.decoder = decoder
    }

    /// Root headers to parse.  For unknown reasons there is just one odd one out.
    static let rootHeaders = [
        "steam_api.h",
        "steamnetworkingfakeip.h"
    ]

    /// Does this header file's types warrant inclusion in a docs section?
    func doesFileNeedCollection(filename: String) -> Bool {
        // Things that begin with "isteam" but we don't want
        let ignoredISteamHeaders = [
            "isteamclient.h", // internal
            "isteamcontroller.h", // obsolete
            "isteamgamecoordinator.h", // ??
            "isteamps3overlayrenderer.h", // PS3
        ]

        guard !ignoredISteamHeaders.contains(filename) else {
            return false
        }

        // Things that don't begin with "isteam" that we do want
        // TBD how to associate these with the right parent
        let secondaryHeaders = [
            "matchmakingtypes.h",
            "steamhttpenums.h",
            "steamnetworkingfakeip.h",
            "steamnetworkingtypes.h"
        ]

        return secondaryHeaders.contains(filename) || filename.hasPrefix("isteam")
    }

    // Types for all this, avoid repeating
    // Add 'target' types by datatype
    // Get it working, sort into 'other' maybe
    // struct/enum/typedef/interface/other -
    // then generate some kind of tree file from that
    func generate() throws {
        var allTypeNames: [String : Set<SwiftType>] = [:]
        for rootHeader in Self.rootHeaders {
            let headerURL = io.includeURL.appendingPathComponent(rootHeader)
            let typeNames = try swiftNamesFromHeader(url: headerURL)
            allTypeNames.merge(typeNames, uniquingKeysWith: { l, _ in l })
        }

        for info in allTypeNames {
            print("\(info.key): \(info.value)")
        }
    }

    func swiftNamesFromHeader(url: URL) throws -> [String : Set<SwiftType>] {
        let results = Exec.run("/usr/bin/env", "clang++", "-std=c++11", "-x", "c++-header", "-fsyntax-only", "-Xclang", "-ast-dump=json", url.path)
        if results.terminationStatus != 0 {
            throw Failed("Couldn't run clang++ on \(url.path): \(results.terminationStatus)")
        }

        let rawClangNode = try decoder.decode(RawClangNode.self, from: results.data)

        guard let bodyNodes = rawClangNode.inner else {
            throw Failed("Clang produced AST JSON with no content nodes for \(url.path)")
        }

        var types: [String : Set<SwiftType>] = [:]

        var currentFile: String? = nil
        var currentTypes: Set<SwiftType> = []

        func saveCurrent() {
            if currentFile != nil {
                if doesFileNeedCollection(filename: URL(filePath: currentFile!).lastPathComponent) {
                    types[currentFile!] = currentTypes
                }
                currentFile = nil
                currentTypes = []
            }
        }

        for node in bodyNodes {
            if let newFile = node.loc?.file {
                // Started a new file of declarations - possible end of a previous
                saveCurrent()
                currentFile = newFile
            }
            if let name = node.name {
                currentTypes.insert(SteamType(name).swiftType)
            }
        }
        saveCurrent()

        return types
    }
}

struct RawClangNode: Decodable {
    let id: String?
    let kind: String

    // missing pieces of 'loc' mean use previous in file..
    struct Loc: Decodable {
        let file: String?
        let line: Int?
    }
    let loc: Loc?

    let inner: [RawClangNode]?
    let name: String?
}

/// Namespace for utilities to execute a child process.
enum Exec {
    /// How to handle stderr output from the child process.
    enum Stderr {
        /// Treat stderr same as parent process.
        case inherit
        /// Send stderr to /dev/null.
        case discard
        /// Merge stderr with stdout.
        case merge
    }

    /// The result of running the child process.
    struct Results {
        /// The process's exit status.
        let terminationStatus: Int32
        /// The data from stdout and optionally stderr.
        let data: Data
        /// The `data` reinterpreted as a string with whitespace trimmed; `nil` for the empty string.
        var string: String? {
            let encoded = String(data: data, encoding: .utf8) ?? ""
            let trimmed = encoded.trimmingCharacters(in: .whitespacesAndNewlines)
            return trimmed.isEmpty ? nil : trimmed
        }
    }

    /**
    Run a command with arguments and return its output and exit status.

    - parameter command: Absolute path of the command to run.
    - parameter arguments: Arguments to pass to the command.
    - parameter currentDirectory: Current directory for the command.  By default
                                  the parent process's current directory.
    - parameter stderr: What to do with stderr output from the command.  By default
                        whatever the parent process does.
    */
    static func run(_ command: String,
                    _ arguments: String...,
                    currentDirectory: String = FileManager.default.currentDirectoryPath,
                    stderr: Stderr = .inherit) -> Results {
        return run(command, arguments, currentDirectory: currentDirectory, stderr: stderr)
    }

    /**
     Run a command with arguments and return its output and exit status.

     - parameter command: Absolute path of the command to run.
     - parameter arguments: Arguments to pass to the command.
     - parameter currentDirectory: Current directory for the command.  By default
                                   the parent process's current directory.
     - parameter stderr: What to do with stderr output from the command.  By default
                         whatever the parent process does.
     */
     static func run(_ command: String,
                     _ arguments: [String] = [],
                     currentDirectory: String = FileManager.default.currentDirectoryPath,
                     stderr: Stderr = .inherit) -> Results {
        let process = Process()
        process.arguments = arguments

        let pipe = Pipe()
        process.standardOutput = pipe

        switch stderr {
        case .discard:
            // FileHandle.nullDevice does not work here, as it consists of an invalid file descriptor,
            // causing process.launch() to abort with an EBADF.
            process.standardError = FileHandle(forWritingAtPath: "/dev/null")!
        case .merge:
            process.standardError = pipe
        case .inherit:
            break
        }

        do {
            process.executableURL = URL(fileURLWithPath: command)
            process.currentDirectoryURL = URL(fileURLWithPath: currentDirectory)
            try process.run()
        } catch {
            return Results(terminationStatus: -1, data: Data())
        }

        let file = pipe.fileHandleForReading
        let data = file.readDataToEndOfFile()
        process.waitUntilExit()
        return Results(terminationStatus: process.terminationStatus, data: data)
    }
}
