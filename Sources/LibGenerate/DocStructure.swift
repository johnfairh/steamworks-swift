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

    static let commonTypesTitle = "Common Types"

    static let apiClientsSection = DocSection(
        title: "API Clients",
        items: [
            .client : [
                "SteamBaseAPI",
                "SteamAPI",
                "SteamGameServerAPI",
                "SteamEncryptedAppTicket",
                "SteamExecutor" // XXX for now, should move to a separate concurrency section
            ]
        ]
    )

    static let constantsSection = DocSection(
        title: "Constants",
        items: [.constants : ["SteamConstants"]]
    )

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
            ] + articles.map { "    - \($0)"}
        }.joined().yamlIndented()).yamlIndented().joined(separator: "\n")
    }

    /// Markdown for an entire file, a category file, listing a bunch of topics (one per kind)
    var doccCategoryMarkdown: String {
        let intro = ["# \(doccTitle)", "", "## Topics"]
        let topics = docStructure.map { (topic, articles) in
            ["", "### \(topic)"] + articles.map { "- ``\($0)``" }
        }
        return (intro + topics.joined()).joined(separator: "\n")
    }

    /// Markdown for a topic in the Documentation.md, assumed to have just one kind populated
    var doccTopicMarkdown: String {
        (["### \(title)"] + items.first!.value.map { "- ``\($0)``"})
            .joined(separator: "\n")
    }

    /// DocC can't handle types & articles with the same name so we stick 'Interface' on the end
    /// of the interface's main type for the pageref.
    var doccTitle: String {
        title.contains(" ") ? title : "\(title) Interface"
    }

    /// <doc:something-something> - syntax to link to this thing
    var doccRefLink: String {
        "<doc:\(doccTitle.replacingOccurrences(of: " ", with: "-"))>"
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

    /// A fabricated header that we use to hold common types purely created by Steamworks-swift
    static let fakeCommonTypesHeader = "fakecommon.h"

    /// 'Primary' headers each generate a section in the docs.
    /// 'Secondary' headers' contents are merged over into their primaries.
    static let secondaryHeaderMap = [
        /* primary : secondary */
        "isteammatchmaking.h" : ["matchmakingtypes.h"],
        "isteamhttp.h" : ["steamhttpenums.h"],
        "isteamnetworkingutils.h" : ["steamnetworkingtypes.h"], /* bit arbitrary */
        "isteamnetworkingsockets.h" : ["steamnetworkingfakeip.h"],
        commonTypesHeader : [
            "steamtypes.h", "steamuniverse.h", "steam_api_common.h",
            "steam_gameserver.h", "steam_api.h", fakeCommonTypesHeader
        ]
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

    /// List of SwiftType type names found per header file
    typealias SwiftTypeSets = [String : Set<SwiftType>]

    /// Types that need to go into the common types docs that are not found from the Steam headers
    static let fakeCommonTypes: [(String, Generated.Kind)] = [
        ("SteamUncheckedSendable", .struct),
        ("SteamUnsafeRawPointer", .typedef),
        ("SteamUnsafeMutablePointer", .typedef),
        ("SteamUnsafeMutableRawPointer", .typedef)
    ]

    func addFakeCommonTypes(types: SwiftTypeSets) -> SwiftTypeSets {
        var fakeTypes: Set<SwiftType> = []
        for (name, kind) in Self.fakeCommonTypes {
            let swiftType = SwiftType(name)
            fakeTypes.insert(swiftType)
            generated.add(type: swiftType, kind: kind)
        }
        var types = types
        types[Self.fakeCommonTypesHeader] = fakeTypes
        return types
    }

    /// Generate ToC / Index for jazzy/bebop/j2 and docc structured 'semantically',
    /// that is by steam interface.  Broadly use the SDK header files to figure out
    /// which enums/structs etc. are associated with which interfaces, but a fair bit
    /// of hard-coding necessary.
    func generate() throws {
        let typeSets = mergeSecondaryHeaders(types: try swiftTypesFromRootHeaders())
            .filter { doesFileNeedCollection(filename: $0.key) }

        let (interfaceSections, commonTypesSection) = createDocSections(typeSets: typeSets)

        try generateJazzy(interfaceSections: interfaceSections, commonTypesSection: commonTypesSection)

        try generateDocC(interfaceSections: interfaceSections, commonTypesSection: commonTypesSection)
    }

    /// Jazzy gets one MD file to be pasted into the main yaml
    private func generateJazzy(interfaceSections: [DocSection], commonTypesSection: DocSection) throws {
        // Jazzy gets one MD file to be pasted into the main yaml
        let jazzySections =
            [DocSection.apiClientsSection] +
            interfaceSections +
            [commonTypesSection, DocSection.constantsSection]

        try io.writeDocStructure(fileName: "jazzy-custom-groups.yaml", contents: jazzySections.jazzyIndexYaml)
    }

    /// DocC gets one complete category file per interface + common-types -- the only
    /// way to get collapsing sections in the left nav -- and a topics snippet for pasting
    /// into the Documentation.md and a topics snippet for pasting into SteamBaseAPI.md
    private func generateDocC(interfaceSections: [DocSection], commonTypesSection: DocSection) throws {
        // collections
        for section in interfaceSections + [commonTypesSection] {
            try io.writeDoccCollection(fileName: "\(section.doccTitle).md", contents: section.doccCategoryMarkdown)
        }

        // snippet for overall index
        let doccStart = "## Topics\n\n" + DocSection.apiClientsSection.doccTopicMarkdown + "\n"
        let doccInterfaces = (["### Interfaces"] + interfaceSections.map {
            "- \($0.doccRefLink)"
        }).joined(separator: "\n")
        let doccEnd = "\n### \(DocSection.commonTypesTitle)\n- <doc:Common-Types>\n- ``SteamConstants``"

        try io.writeDocStructure(fileName: "docc-custom-topics.md",
                                 contents: doccStart + doccInterfaces + doccEnd)

        // snippet for baseapi, all the callbacks - bit annoying doesn't work manually
        let callbackNames = generated.all(kind: .callback).sorted()
        let cbks = "### Callbacks\n" + callbackNames.map {
            "- ``\(Callbacks.syncDocSymbol($0))``"
        }.joined(separator: "\n") + "\n\n### `AsyncStream` callbacks\n " + callbackNames.map {
            "- ``\(Callbacks.asyncDocSymbol($0))``"
        }.joined(separator: "\n")
        try io.writeDocStructure(fileName: "docc-steambase-callbacks.md", contents: cbks)
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
        Dictionary((try ClangNode(file: url).inner ?? [])
            .segmentify { $0.loc?.file != nil }
            .filter { $0.filepath.hasPrefix(io.includeURL.path) }
            .map { nodes in
                if nodes.filename == "isteammatchmaking.h" {
                    return decomposeMatchMaking(nodes)
                }
                return [nodes]
            }
            .joined()
            .map(\.unnested)
            .map { nodes in
                (nodes.filename, Set(nodes.compactMap { $0.swiftTypeName }))
            },
            uniquingKeysWith: { a, b in a.union(b) }
        )
    }

    /// Add the secondary files' types into their primary files' sets, remove the secondaries from the list
    private func mergeSecondaryHeaders(types: SwiftTypeSets) -> SwiftTypeSets {
        var result = addFakeCommonTypes(types: types)
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

    /// Take list of types per file and produce the doc structure, grouped by kind (interfaces/structures/etc)
    private func createDocSections(typeSets: SwiftTypeSets) -> (interfaces: [DocSection], commonTypes: DocSection) {
        var interfaceSections: [DocSection] = []
        var commonSection: DocSection? = nil

        for (filename, types) in typeSets {
            var typesByKind: [Generated.Kind : [SwiftType]] = [:]
            for swiftType in types {
                let kind = generated.find(type: swiftType) ?? .other
                typesByKind[kind, default: []].append(swiftType)
            }
            Metadata.extraEnumsFor(header: filename).map {
                typesByKind[.enum, default: []].append(contentsOf: $0.map(\.swiftType))
            }
            let items = typesByKind.mapValues { $0.sorted() }

            // Special cases for the fakeudpport interface which is not a regular
            // steam interface.
            if let interfaces = typesByKind[.interface] {
                let title = interfaces.first(where: { $0.name != "SteamNetworkingFakeUDPPort"})!.name
                interfaceSections.append(DocSection(title: title, items: items))
            } else if filename == Self.commonTypesHeader {
                commonSection = DocSection(title: DocSection.commonTypesTitle, items: items)
            } else {
                preconditionFailure("Missing an interface in \(filename), just got: \(types)")
            }
        }

        return (interfaceSections.sorted(by: { l, r in l.title < r.title }), commonSection!)
    }

    /// isteammatchmaking is annoying because it contains four separate interfaces that would
    /// normally be in their own header file.  Hard-coded here what to do:
    /// start of file: isteammatchmaking
    /// ...
    /// HServerListRequest: start ISteamMatchmakingServers
    /// ...
    /// k_unFavoriteFlagNone: start ISteamGameSearch
    /// ...
    /// ESteamPartyBeaconLocationType: start ISteamParties
    /// ...
    /// FavoritesListChanged_t: start callbacks for ISteamMatchmaking
    /// ...
    /// SearchForGameProgressCallback_t: start callbacks for ISteamGameSearch
    /// ...
    /// JoinPartyCallback_t: start callbacks for ISteamParties
    ///
    /// We could figure out the callback associating by diving into them and finding the callback enum base value
    /// but I can't be bothered!
    private func decomposeMatchMaking(_ nodes: [ClangNode]) -> [[ClangNode]]{
        var nodes = nodes

        var mm = nodes.removeNodesUpToDecl(name: "HServerListRequest")
        nodes[0] = ClangNode(from: nodes[0], filename: "isteammatchmakingservers.h")
        let mms = nodes.removeNodesUpToDecl(name: "k_unFavoriteFlagNone")
        nodes[0] = ClangNode(from: nodes[0], filename: "isteamgamesearch.h")
        var gs = nodes.removeNodesUpToDecl(name: "ESteamPartyBeaconLocationType")
        nodes[0] = ClangNode(from: nodes[0], filename: "isteamparties.h")
        var ps = nodes.removeNodesUpToDecl(name: "FavoritesListChanged_t")
        mm += nodes.removeNodesUpToDecl(name: "SearchForGameProgressCallback_t")
        gs += nodes.removeNodesUpToDecl(name: "JoinPartyCallback_t")
        ps += nodes

        return [mm, mms, gs, ps]
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

    init(from: ClangNode, filename: String) {
        self.id = from.id
        self.kind = from.kind
        self.loc = Loc(file: filename)
        self.inner = from.inner
        self.name = from.name
    }
}

extension Array where Element == ClangNode {
    var filepath: String {
        first!.loc!.file!
    }

    var filename: String {
        URL(fileURLWithPath: filepath).lastPathComponent
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
        return self + nestedNodes
    }

    mutating func removeNodesUpToDecl(name: String) -> [ClangNode] {
        guard let declIndex = firstIndex(where: { $0.name == name }) else {
            preconditionFailure("Can't find \(name) in nodes")
        }
        defer { self = Array(self[declIndex...]) }
        return Array(self[startIndex..<declIndex])
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
