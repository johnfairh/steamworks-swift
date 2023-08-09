//
//  DocStructure.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Foundation

struct DocSection {
    let title: String
    let items: [Generated.Kind : [SwiftType]]

    func dump() {
        print(title)
        for kv in items {
            print("  \(kv.key): \(kv.value.count)")
        }
    }
}

struct DocStructure {
    let io: IO
    let generated: Generated

    init(io: IO, generated: Generated) {
        self.io = io
        self.generated = generated
    }

    /// Root headers to parse.  For unknown reasons there is just one odd one out.
    static let rootHeaders = Set([
        "steam_api.h",
        "steam_gameserver.h",
        "steamnetworkingfakeip.h"
    ])

    /// 'Primary' headers each generate a section in the docs.
    /// 'Secondary' headers' contents are merged over into their primaries.
    static let secondaryHeaderMap = [
        /* primary : secondary */
        "isteammatchmaking.h" : "matchmakingtypes.h",
        "isteamhttp.h" : "steamhttpenums.h",
        "isteamnetworkingutils.h" : "steamnetworkingtypes.h" /* bit arbitrary */
    ]

    static var secondaryHeaders = Set(secondaryHeaderMap.values)

    /// Does this header file's types warrant inclusion in a docs section?
    func doesFileNeedCollection(filename: String) -> Bool {
        // Include the annoying special case
        if filename == "steamnetworkingfakeip.h" {
            return true
        }

        // Things that begin with "isteam" but we don't want
        let ignoredISteamHeaders = Set([
            "isteamclient.h", // internal
            "isteamcontroller.h", // obsolete
            "isteamgamecoordinator.h", // ??
            "isteamps3overlayrenderer.h", // PS3
            "isteamnetworking.h", // deprecated
        ])

        guard !ignoredISteamHeaders.contains(filename) else {
            return false
        }

        return Self.secondaryHeaders.contains(filename) || filename.hasPrefix("isteam")
    }

    typealias SwiftTypeSets = [String : Set<SwiftType>]

    // then generate some kind of tree file from that
    // pretty-print in some way - i guess to a file, the eventual output of all this
    // should figure out callbacks too
    func generate() throws {
        let typeSets = mergeSecondaryHeaders(types: try swiftTypesFromRootHeaders())
            .filter { doesFileNeedCollection(filename: $0.key) }

        let sections = createDocSections(typeSets: typeSets)

        for section in sections.sorted(by: { l, r in l.title < r.title }) {
            section.dump()
        }
    }

    /// Merge together the unfortunately plural root headers - expect that if we do pull in the same
    /// header multiple times then it will have the same content and can pick arbitrarily.
    private func swiftTypesFromRootHeaders() throws -> SwiftTypeSets {
        try Self.rootHeaders.map {
            try swiftTypesFromHeader(url: io.includeURL.appendingPathComponent($0))
        }.reduce(into: [:], { $0.merge($1, uniquingKeysWith: { l, _ in l }) })
    }

    /// Take the URL of a header file and return a collection of all its referenced (#include'd) files
    /// along with the Swift versions of the top-level types they define.
    private func swiftTypesFromHeader(url: URL) throws -> SwiftTypeSets {
        Dictionary(uniqueKeysWithValues: (try ClangNode(file: url).inner ?? [])
            .segmentify { $0.loc?.file != nil }
            .filter { $0.filepath.hasPrefix(io.includeURL.path) }
            .map { nodes in
                (nodes.filename, Set(nodes.compactMap { $0.swiftTypeName }))
            }
        )
    }

    /// Add the secondary files' types into their primary files' sets, remove the secondaries from the list
    private func mergeSecondaryHeaders(types: SwiftTypeSets) -> SwiftTypeSets {
        var result = types
        for (prim, sec) in Self.secondaryHeaderMap {
            guard let secTypes = result.removeValue(forKey: sec) else {
                fatalError("Can't find sec types for \(sec)")
            }
            guard result[prim] != nil else {
                print("files: \(types.keys)")
                preconditionFailure("Can't find prim types for \(prim)")
            }
            result[prim]?.formUnion(secTypes)
        }
        return result
    }

    /// Take list of types per file and produce the doc structure, grouped by kind (interfaces/structures/etc)
    private func createDocSections(typeSets: SwiftTypeSets) -> [DocSection] {
        typeSets.map { (filename, types) in
            var typesByKind: [Generated.Kind : [SwiftType]] = [:]
            for swiftType in types {
                let kind = generated.find(type: swiftType) ?? .other
                typesByKind[kind, default: []].append(swiftType)
            }
            guard let interface = typesByKind[.interface]?.first else {
                preconditionFailure("Missing an interface in \(filename), just got: \(types)")
            }
            return DocSection(title: interface.name, items: typesByKind)
        }
    }
}

// MARK: Running Clang and getting the output

struct ClangNode: Decodable {
    let id: String?
    let kind: String // XXX don't think we need this one

    // missing pieces of 'loc' mean use previous in file..
    struct Loc: Decodable {
        let file: String?
    }
    let loc: Loc?

    let inner: [ClangNode]?
    let name: String?

    var swiftTypeName: SwiftType? {
        name.map { SteamType($0).swiftType }
    }

    init(file: URL) throws {
        let results = Exec.run("/usr/bin/env",
                               "clang++", "-std=c++11", "-x", "c++-header", "-fsyntax-only", "-Xclang", "-ast-dump=json", file.path)
        if results.terminationStatus != 0 {
            throw Failed("Couldn't run clang++ on \(file.path): \(results.terminationStatus)")
        }

        self = try JSONDecoder().decode(Self.self, from: results.data)
    }
}

/// Namespace for utilities to execute a child process.
fileprivate enum Exec {
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

extension Collection {
    func segmentify(newSeg: (Element) -> Bool) -> [[Element]] {
        var output: [[Element]] = []
        var curSeg: [Element] = []
        func saveCurrent() {
            if !curSeg.isEmpty {
                output.append(curSeg)
                curSeg = []
            }
        }
        for el in self {
            if newSeg(el) {
                saveCurrent()
                curSeg.append(el)
            }
            if !curSeg.isEmpty { // skip builtins at start that are not in a segment
                curSeg.append(el)
            }
        }
        saveCurrent()
        return output
    }
}

extension Collection where Element == ClangNode {
    var filepath: String {
        first!.loc!.file!
    }

    var filename: String {
        URL(filePath: filepath).lastPathComponent
    }
}
