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
        if let others = items[.other], others.count > 0 {
            print("  others: \(others)")
        }
    }

    /// Ordered list of named topics and topic articles
    var docStructure: [(String, [String])] {
        var result: [(String, [String])] = []
        for kind in Generated.Kind.allCases {
            guard kind != .other, let kindItems = items[kind], kindItems.count > 0 else {
                continue
            }
            result.append((kind.englishName, kindItems.map(\.name)))
        }
        return result
    }

    var jazzyIndexYaml: String {
        ([
            "- name: \(title)", "  topics:"
        ] + docStructure.map { (topic, articles) in
            [
                "- name: \(topic)",
                "  children:"
            ] + articles.map { "    - \($0) "}
        }.joined().yamlIndented()).yamlIndented().joined(separator: "\n")
    }
}

extension Sequence where Element == DocSection {
    var jazzyIndexYaml: String {
        map(\.jazzyIndexYaml).joined(separator: "\n")
    }
}

struct DocStructure {
    let io: IO
    let generated: Generated

    init(io: IO, generated: Generated) {
        self.io = io
        self.generated = generated
    }

    /// Root headers to parse.
    static let rootHeaders = Set([
        "steam_api.h",
        "steam_gameserver.h",
        "steamnetworkingfakeip.h"
    ])

    /// Common Types is a special catch-all
    static let commonTypesHeader = "steamclientpublic.h"

    /// 'Primary' headers each generate a section in the docs.
    /// 'Secondary' headers' contents are merged over into their primaries.
    static let secondaryHeaderMap = [
        /* primary : secondary */
        "isteammatchmaking.h" : ["matchmakingtypes.h"],
        "isteamhttp.h" : ["steamhttpenums.h"],
        "isteamnetworkingutils.h" : ["steamnetworkingtypes.h"], /* bit arbitrary */
        "isteamnetworkingsockets.h" : ["steamnetworkingfakeip.h"],
        commonTypesHeader : ["steamtypes.h", "steamuniverse.h", "steam_api_common.h", "steam_gameserver.h"]
    ]

    static let secondaryHeaders = Set(secondaryHeaderMap.values.joined())

    /// Does this header file's types warrant inclusion in a docs section?
    func doesFileNeedCollection(filename: String) -> Bool {
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

        return Self.secondaryHeaders.contains(filename) ||
                 filename.hasPrefix("isteam") ||
                 filename == Self.commonTypesHeader
    }

    typealias SwiftTypeSets = [String : Set<SwiftType>]

    // should figure out callbacks too
    // final tweako is completely new types, that aren't found in the SDK, but need inserting into the
    // doc tree as though they were.
    // need to make sort stable, split out those multi-interface places
    func generate() throws {
        let typeSets = mergeSecondaryHeaders(types: try swiftTypesFromRootHeaders())
            .filter { doesFileNeedCollection(filename: $0.key) }

        let sections = createDocSections(typeSets: typeSets)
            .sorted(by: { l, r in l.title < r.title })

        try io.writeDocStructure(fileName: "jazzy-custom-groups.yaml", contents: sections.jazzyIndexYaml)
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
            .map(\.unnested)
            .map { nodes in
                (nodes.filename, Set(nodes.compactMap { $0.swiftTypeName }))
            }
        )
    }

    /// Add the secondary files' types into their primary files' sets, remove the secondaries from the list
    private func mergeSecondaryHeaders(types: SwiftTypeSets) -> SwiftTypeSets {
        var result = types
        for (prim, secs) in Self.secondaryHeaderMap {
            for sec in secs {
                guard let secTypes = result.removeValue(forKey: sec) else {
                    fatalError("Can't find sec types for \(sec)")
                }
                guard result[prim] != nil else {
                    print("files: \(types.keys)")
                    preconditionFailure("Can't find prim types for \(prim)")
                }
                result[prim]?.formUnion(secTypes)
            }
        }
        return result
    }

    /// Types that we've invented from whole cloth that need inserting as though they were from Steamworks
    static let additionalTypesByHeader: [String : [(Generated.Kind, SwiftType)]] = [
        "isteammatchmaking.h" : [
            (.enum, "FavoriteFlags"),
            (.struct, "MatchMakingKeyValuePairs") /* Should be mmservers, todo split */
        ],
        "isteamnetworkingutils.h" : [
            (.enum, "SteamNetworkConnectionInfoFlags"),
            (.enum, "SteamNetworkingSendFlags")
        ]
    ]

    /// Take list of types per file and produce the doc structure, grouped by kind (interfaces/structures/etc)
    private func createDocSections(typeSets: SwiftTypeSets) -> [DocSection] {
        typeSets.map { (filename, types) in
            var typesByKind: [Generated.Kind : [SwiftType]] = [:]
            for swiftType in types {
                let kind = generated.find(type: swiftType) ?? .other
                typesByKind[kind, default: []].append(swiftType)
            }
            Self.additionalTypesByHeader[filename].map {
                for typeinfo in $0 {
                    typesByKind[typeinfo.0, default: []].append(typeinfo.1)
                }
            }
            let title: String

            // Special cases for header files that define multiple interfaces,
            // have to hard-code which of them are in-charge.  This is an
            // aesthetic decision.
            if let interfaces = typesByKind[.interface] {
                if interfaces.count == 1 {
                    title = interfaces[0].name
                } else {
                    title = interfaces.findHighPrioInterface
                }
            } else if filename == Self.commonTypesHeader {
                title = "Common Types"
            } else {
                preconditionFailure("Missing an interface in \(filename), just got: \(types)")
            }
            return DocSection(title: title, items: typesByKind.mapValues { $0.sorted() })
        }
    }

    static let highPrioInterfaces = Set(["SteamNetworkingSockets", "SteamMatchmaking"])
}

private extension Collection where Element == SwiftType {
    var findHighPrioInterface: String {
        for f in self {
            if DocStructure.highPrioInterfaces.contains(f.name) {
                return f.name
            }
        }
        preconditionFailure("Can't find high prio interface: \(self)")
    }
}

// MARK: Running Clang and getting the output

struct ClangNode: Decodable {
    let id: String?
    let kind: String

    // missing pieces of 'loc' mean use previous in file..
    struct Loc: Decodable {
        let file: String?
    }
    let loc: Loc?

    let inner: [ClangNode]?
    let name: String?

    var swiftTypeName: SwiftType? {
        guard !isForwardDeclaration else {
            return nil
        }
        return name.map { SteamType($0).swiftType }
    }

    // Identify forward type declarations, don't want to match these
    var isForwardDeclaration: Bool {
        guard kind == "CXXRecordDecl" else {
            // not a type we care about
            return false
        }
        guard let inner, inner.count > 0 else {
            // record with no inner -> forward-decl
            return true
        }
        // Think this means clang has only the fwd-decl, so has to put
        // something inside it to remember the alignment is known?
        return inner.count == 1 && inner.first!.kind == "MaxFieldAlignmentAttr"
    }

    init(file: URL) throws {
        // clang++ -std=c++11 -x c++-header -fsyntax-only -Xclang -ast-dump=json
        let results = Exec.run("/usr/bin/env",
                               "clang++", "-std=c++11", "-x", "c++-header", "-fsyntax-only", "-Xclang", "-ast-dump=json", file.path)
        if results.terminationStatus != 0 {
            throw Failed("Couldn't run clang++ on \(file.path): \(results.terminationStatus)")
        }

        self = try JSONDecoder().decode(Self.self, from: results.data)
    }

    init(from: ClangNode, renamed: String) {
        self.id = from.id
        self.kind = from.kind
        self.loc = from.loc
        self.inner = from.inner
        self.name = renamed
    }
}

extension Collection where Element == ClangNode {
    var filepath: String {
        first!.loc!.file!
    }

    var filename: String {
        URL(filePath: filepath).lastPathComponent
    }

    /// Sometimes Steam puts enum declarations inside a struct or class.
    /// This takes a file's worth of clang-nodes, hunts out any such nested enums, and moves them
    /// to the global scope.
    var unnested: [ClangNode] {
        var nestedNodes: [ClangNode] = []
        for outerDecl in self {
            guard let inner = outerDecl.inner else {
                continue
            }
            for innerDecl in inner {
                if innerDecl.kind == "EnumDecl", let innerName = innerDecl.name, let outerName = outerDecl.name {
                    // Must give it the fully-qualified name for name-matching to work.
                    // leave it where it was too, harmless
                    nestedNodes.append(ClangNode(from: innerDecl, renamed: "\(outerName)::\(innerName)"))
                }
                if outerDecl.kind == "LinkageSpecDecl" && innerDecl.kind == "TypedefDecl" {
                    // Function pointer typedefs come out nested
                    nestedNodes.append(innerDecl)
                }
            }
        }
        return Array(self) + nestedNodes
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
