//
//  Interfaces.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

/// Code gen the API interfaces
///
/// The point of this is to generate reasonable Swift versions of all the methods.
///
/// Higher-level things can be hand-crafted in non-generated code, typically in awkward cases
/// of multiple returned values and buffer allocation.
struct Interfaces {
    let io: IO
    let metadata: Metadata

    init(io: IO, metadata: Metadata) {
        self.io = io
        self.metadata = metadata
    }

    func generate() throws {
        let includes = Set<String>([
            "ISteamFriends",
            "ISteamUtils",
            "ISteamUser",
            "ISteamUserStats",
            "ISteamAppList",
            "ISteamApps",
            "ISteamGameServer"
        ])
        try metadata.db.interfaces.values.forEach { interface in
            guard includes.contains(interface.name) else {
                return
            }
            let swiftName = interface.name.asSwiftTypeName
            try io.write(fileName: "\(swiftName).swift",
                         contents: interface.generate(context: swiftName))
        }
    }
}

// MARK: Struct declaration and plumbing

// Accessor generation
//
// Instinct is to cache the `ISteamWhatever` pointer in the member rather than
// figure it out each time.  But this falls foul of Swift C++ interop issues:
//
// 1. Generates link errors, missing refs to `__cxa_pure_virtual` etc.
//    So manually add `-lc++` and this goes away.
//
// 2. But now the cached value gets clobbered somehow at runtime: it's correct
//    when called but then later referencing it, has changed to very bad value
//    that is mostly zeroes with the top (63rd) bit set.
//    So, erm, this must be a limitation to do with storing refs to base
//    classes or something?
//
// Hence current approach of figuring out each time, never storing a ref to
// the thing.
//
// Last checked Xcode 13.2 beta 2, Nov 24 2021.

extension MetadataDB.Interface.Access {
    /// Generate a doc comment snippet
    func accessVia(getter: String) -> String {
        switch self {
        case .user: return "`SteamAPI.\(getter)`"
        case .gameserver: return "`SteamGameServerAPI.\(getter)`"
        case .global, .userAndServer:
            return "`SteamBaseAPI.\(getter)` through a `SteamAPI` or `SteamGameServerAPI` instance"
        }
    }

    /// Generate the Swift declaration for the interface.
    ///
    /// Complicated by some of them being user/server dual
    func declaration(name: String) -> String {
        let shortName = name.re_sub("^ISteam", with: "").asSwiftIdentifier  // "ISteamFriends" -> "friends"

        let docComment =
            """
            /// Steamworks [`\(name)`](https://partner.steamgames.com/doc/api/\(name))
            ///
            /// Access via \(accessVia(getter: shortName)).
            public struct \(name.asSwiftTypeName) {
            """

        let decl: String

        switch self {
        case .user(let accessor), .gameserver(let accessor), .global(let accessor):
            decl = """
                       var interface: UnsafeMutablePointer<\(name)> {
                           \(accessor)()
                       }

                       init() {
                       }
                   """
        case .userAndServer(let userAccess, let serverAccess):
            decl = """
                       private let isServer: Bool
                       var interface: UnsafeMutablePointer<\(name)> {
                           isServer ? \(serverAccess)() : \(userAccess)()
                       }

                       init(isServer: Bool) {
                           self.isServer = isServer
                       }
                   """
        }

        return "\(docComment)\n\(decl)\n"
    }
}

extension MetadataDB.Interface {
    func generate(context: String) -> String {
        let declaration = access.declaration(name: name)
        let methods = methods.values
            .sorted(by: { $0.flatName < $1.flatName })
            .filter(\.shouldGenerate)
            .map { $0.generate(context: name) }
        return declaration + "\n" + methods.joined(separator: "\n\n") + "\n}"
    }
}

// MARK: Method Parameters

final class SwiftParam {
    let db: MetadataDB.Method.Param

    var swiftName: String {
        db.name.asSwiftParameterName
    }

    var steamTypeName: String {
        db.type
    }

    private let swiftTypeBaseName: String

    private enum Style {
        case `in` // pass by value, flat, cast at time of use
        case out  // pass inout, use a temporary to cast, copy-back
        case out_transparent // pass inout, no temporary
        case out_transparent_array // pass inout, array, no temporary
        case in_array // pass by value but a Swift array, use a temporary to cast, no copy-back
        case in_array_count(SwiftParam) // a C param for the length of an `in_array` param that is absent in Swift
        case out_array(String) // pass inout, temporary to cast, copy-back, array.  Required size given by another param.
        case out_string(String) // pass inout, temp buffer of user-set length, convert to string
                                // eventually review and switch to String(unsafeUninit... to avoid the copy)
    }
    private let style: Style

    /// How should the param appear (or not) in the Swift version of the function
    var swiftParamType: String? {
        switch style {
        case .in: return swiftTypeBaseName
        case .out, .out_transparent: return "inout \(swiftTypeBaseName)"
        case .in_array: return "[\(swiftTypeBaseName)]"
        case .in_array_count: return nil
        case .out_array, .out_transparent_array: return "inout [\(swiftTypeBaseName)]"
        case .out_string: return "inout String"
        }
    }

    /// The name of the local variable to store the Steam version of the type for an out param
    private var tempName: String {
        "tmp_\(swiftName)"
    }

    /// What code (if any) is required before calling the Steamworks API
    /// SW isn't a particularly good `const` citizen
    /// (Need to review for stack-allocation, new APIs in Swift 5.6 might help)
    var preCallLines: [String] {
        switch style {
        case .in, .in_array_count, .out_transparent, .out_transparent_array: return []
        case .in_array: return ["var \(tempName) = \(swiftName).map { \(steamTypeName.depointered.asExplicitSwiftTypeForPassingIntoSteamworks)($0) }"]
        case .out: return ["var \(tempName) = \(steamTypeName.depointered.asExplicitSwiftInstanceForPassingIntoSteamworks)"]
        case .out_array(let sizeParam):
            let typeName = steamTypeName.depointered.asExplicitSwiftTypeForPassingIntoSteamworks
            return [
                "let \(tempName) = UnsafeMutableBufferPointer<\(typeName)>.allocate(capacity: \(sizeParam.asSwiftParameterExpression))",
                "defer { \(tempName).deallocate() }"
            ]
        case .out_string(let sizeParam):
            return [
                "let \(tempName) = UnsafeMutableBufferPointer<CChar>.allocate(capacity: \(sizeParam.asSwiftParameterExpression))",
                "defer { \(tempName).deallocate() }"
            ]
        }
    }

    /// How to refer to the param in the Steamworks API call
    var callName: String {
        switch style {
        case .in:
            return swiftName.asCast(to: steamTypeName.asSwiftTypeForPassingIntoSteamworks)
        case .out, .in_array:
            return "&\(tempName)"
        case .out_transparent, .out_transparent_array:
            return "&\(swiftName)"
        case .in_array_count(let ap):
            return "\(ap.swiftName).count".asCast(to: steamTypeName.asSwiftTypeForPassingIntoSteamworks)
        case .out_array, .out_string:
            return "\(tempName).baseAddress"
        }
    }

    /// What code (if any) is required after calling the Steamworks API
    var postSuccessCallLine: String? {
        switch style {
        case .in, .in_array, .in_array_count, .out_transparent, .out_transparent_array: return nil
        case .out: return "\(swiftName) = \(swiftTypeBaseName)(\(tempName))"
        case .out_array:
            return "\(swiftName) = \(tempName).map { \(swiftTypeBaseName)($0) }"
        case .out_string:
            return "\(swiftName) = String(\(tempName))" // null-termination done inside, see TypeUtils.swift
        }
    }

    init(_ db: MetadataDB.Method.Param, inArrayParam: SwiftParam? = nil) {
        self.db = db
        let naiveSwiftTypeName = db.type.asSwiftTypeName
        if let arrayParam = inArrayParam {
            swiftTypeBaseName = "ERROR"
            style = .in_array_count(arrayParam)
        } else if let depointered = naiveSwiftTypeName.depointeredType {
            if let outStringLength = db.outStringLength {
                swiftTypeBaseName = "String"
                style = .out_string(outStringLength)
            } else {
                swiftTypeBaseName = depointered.asSwiftTypeName
                if let outLength = db.outArrayLength {
                    if depointered.isTransparentOutType {
                        style = .out_transparent_array
                    } else {
                        style = .out_array(outLength)
                    }
                } else if depointered.isTransparentOutType {
                    style = .out_transparent
                } else if db.arrayCount == nil {
                    style = .out
                } else {
                    style = .in_array
                }
            }
        } else {
            swiftTypeBaseName = naiveSwiftTypeName
            style = .in
        }
    }
}

extension String {
    var depointeredType: String? {
        re_match("^(.*) \\*$").flatMap { $0[1] }
    }
}

extension Array where Element == MetadataDB.Method.Param {
    var asSwiftParams: [SwiftParam] {
        var params = [SwiftParam]()
        var lookingForCount = [String : SwiftParam]()

        forEach { p in
            let param = SwiftParam(p, inArrayParam: lookingForCount.removeValue(forKey: p.name))
            params.append(param)
            if let countParamName = p.arrayCount {
                lookingForCount[countParamName] = param
            }
        }

        if !lookingForCount.isEmpty {
            print("Couldn't match up 'arrayCount', leftovers: \(lookingForCount)")
            print("Method is \(self)")
            preconditionFailure()
        }
        return params
    }
}

extension Array where Element == SwiftParam {
    /// Formal parameter list
    var functionParams: String {
        compactMap { param in
            param.swiftParamType.flatMap { "\(param.swiftName): \($0)" }
        }.joined(separator: ", ")
    }

    /// Lines to add before the API call
    var preCallLines: [String] {
        flatMap { $0.preCallLines }
    }

    /// Steamworks call parameter list
    var callParams: String {
        map { $0.callName }.joined(separator: ", ")
    }

    /// Lines to add after the API call if it honoured out params
    var postSuccessCallLines: [String] {
        compactMap { $0.postSuccessCallLine }
    }

    /// Call params when forwarding from async to callback API version
    var asyncForwardingParams: String {
        compactMap { param in
            param.swiftParamType.flatMap { _ in "\(param.swiftName): \(param.swiftName)" }
        }.joined(separator: ", ")
    }
}

// MARK: Methods

struct SwiftMethod {
    let db: MetadataDB.Method

    enum Style {
        case normal(String) // 0+ args, return value
        case void // 0+ args, no return value
        case callReturn(String) // 0+ args, async return value
    }

    var callReturnType: String? {
        guard case let .callReturn(type) = style else {
            return nil
        }
        return type
    }

    let style: Style
    let params: [SwiftParam]

    init(_ db: MetadataDB.Method) {
        self.db = db
        if let callResult = db.callResult {
            style = .callReturn(callResult.asSwiftTypeName)
        } else if db.returnType != "void" {
            style = .normal(db.returnType.asSwiftTypeName)
        } else {
            style = .void
        }
        params = db.params.asSwiftParams
    }

    var declLine: String {
        switch (style, db.isVar) {
        case (.normal(let type), true):
            return "public var \(db.varName): \(type) {"
        case (.normal(let type), false):
            return "public func \(db.funcName)(\(params.functionParams)) -> \(type) {"
        case (.void, false):
            return "public func \(db.funcName)(\(params.functionParams)) {"
        case (.callReturn(let type), false):
            let done = "completion: @escaping (\(type)?) -> Void"
            return "public func \(db.funcName)(\(params.functionParams.commaJoin(done))) {"
        default:
            preconditionFailure("Unexpected var-match: \(db)")
        }
    }

    /// Expression returning the Swift type of the API (or, er, not for callReturn)
    var callExpression: String {
        let paramList = params.isEmpty ? "" : ", \(params.callParams)"
        let steamCall = "\(db.flatName)(interface\(paramList))"
        switch style {
        case .normal:
            return steamCall.asCast(to: db.returnType.asSwiftTypeForPassingOutOfSteamworks)
        case .void, .callReturn:
            return steamCall
        }
    }

    enum ReturnSyntax {
        case implicit
        case explicit
        case intermediate
    }

    var returnSyntax: ReturnSyntax {
        switch style {
        case .callReturn, .void: return .implicit
        case .normal:
            if params.postSuccessCallLines.isEmpty {
                if params.preCallLines.isEmpty {
                    return .implicit
                }
                return .explicit
            }
            return .intermediate
        }
    }

    var callLines: [String] {
        switch style {
        case .callReturn:
            return [
                "let rc = \(callExpression)",
                "SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))"
            ]
        case .normal, .void:
            switch returnSyntax {
            case .implicit:
                return [callExpression]
            case .explicit:
                return ["return \(callExpression)"]
            case .intermediate:
                return ["let rc = \(callExpression)"]
            }
        }
    }

    /// Code to go following the API call.  This does copy-back of out params.
    ///
    /// Usually, steamworks says that even if the API call fails the out params are updated to some 'invalid' value,
    /// meaning we must do the copyback anyway.
    ///
    /// But infrequently this does not happen, so we must not try to copy-back for fear of out-of-range typechecks
    /// and uninitialized data UB.  Our patch json says what test to apply to `rc` - we may be able to generalize
    /// based on type later on but leave it manual for now.
    var postCallLines: [String] {
        let successLines = params.postSuccessCallLines
        guard !successLines.isEmpty,
            let test = db.outParamIffRc else {
            return successLines
        }
        return ["if rc \(test.count == 0 ? "" : "\(test) "){"] + successLines.indented(1) + ["}"]
    }

    var finalBodyLines: [String] {
        returnSyntax == .intermediate ? ["return rc"] : []
    }

    var bodyLines: [String] {
        params.preCallLines + callLines + postCallLines + finalBodyLines
    }

    func syncDecl(comment baseComment: String) -> [String] {
        let comment = callReturnType.flatMap { _ in "\(baseComment), callback" } ?? baseComment
        let attrLine = db.discardableResult ? ["@discardableResult"] : []
        return [comment] + attrLine + [declLine] + bodyLines.indented(1) + ["}"]
    }

    func asyncDecl(comment: String) -> [String] {
        guard let type = callReturnType else {
            return []
        }
        return [
            "",
            "\(comment), async",
            "func \(db.funcName)(\(params.functionParams)) async -> \(type)? {",
            "    await withUnsafeContinuation {",
            "        \(db.funcName)(\(params.asyncForwardingParams.commaJoin("completion: $0.resume")))",
            "    }",
            "}",
        ]
    }

    func decl(comment: String) -> [String] {
        syncDecl(comment: comment) + asyncDecl(comment: comment)
    }
}

private extension String {
    func commaJoin(_ with: String) -> String {
        isEmpty ? with : "\(self), \(with)"
    }
}

extension MetadataDB.Method {
    var shouldGenerate: Bool {
        !ignore
    }

    var isVar: Bool {
        false
        // Originally had this generating `var`s for 0-arg functions.
        //     params.count == 0 && name.starts(with: "Get")
        // No longer convinced this is right though - drops the 1:1 with
        // the SW API name, meaning searches etc. don't work as expected.
        // There are very few of them anyway.
    }

    var funcName: String {
        name.asSwiftIdentifier
    }

    var varName: String {
        String(name.dropFirst(3)).asSwiftIdentifier
    }

    func generate(context: String) -> String {
        let swiftMethod = SwiftMethod(self)
        let comment = "/// Steamworks `\(context)::\(name)()`"
        return swiftMethod.decl(comment: comment).indented(1).joined(separator: "\n")
    }
}
