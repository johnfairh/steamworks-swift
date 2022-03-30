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
        try metadata.db.interfaces.values.forEach { interface in
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
        case .instance(let actualGetter): return "`\(actualGetter)`"
        case .user: return "`SteamAPI.\(getter)`"
        case .gameserver: return "`SteamGameServerAPI.\(getter)`"
        case .global, .userAndServer:
            return "`SteamBaseAPI.\(getter)` through a `SteamAPI` or `SteamGameServerAPI` instance"
        }
    }

    var swiftTypeKind: String {
        switch self {
        case .instance: return "final class"
        case .user, .gameserver, .global, .userAndServer: return "struct"
        }
    }

    /// Generate the Swift declaration for the interface.
    ///
    /// Complicated by some of them being user/server dual
    func declaration(db: MetadataDB.Interface) -> String {
        let shortName = db.name.re_sub("^ISteam", with: "").asSwiftIdentifier  // "ISteamFriends" -> "friends"

        let docComment =
            """
            /// Steamworks [`\(db.name)`](https://partner.steamgames.com/doc/api/\(db.name))
            ///
            /// Access via \(accessVia(getter: shortName)).
            public \(swiftTypeKind) \(db.name.asSwiftTypeName) {
            """

        let decl: String

        let swiftType = db.realClassName ?? "UnsafeMutablePointer<\(db.name)>"

        switch self {
        case .instance:
            decl = """
                       private let interface: \(swiftType)
                       init(_ interface: \(swiftType)) {
                           self.interface = interface
                       }
                   """
        case .user(let accessor), .gameserver(let accessor), .global(let accessor):
            decl = """
                       var interface: \(swiftType) {
                           \(accessor)()
                       }

                       init() {
                       }
                   """
        case .userAndServer(let userAccess, let serverAccess):
            decl = """
                       private let isServer: Bool
                       var interface: \(swiftType) {
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

private extension String {
    var cless: String {
        re_sub("^C", with: "")
    }
}

extension MetadataDB.Interface {
    func generate(context: String) -> String {
        let declaration = access.declaration(db: self)
        let methods = methods.values
            .sorted(by: { $0.flatName.cless < $1.flatName.cless })
            .filter(\.shouldGenerate)
            .map { $0.generate(context: name) }
            .joined(separator: "\n\n")
        return declaration + "\n" + methods + "\n}"
    }
}

private extension String {
    /// Interpret a json term for the size of an 'out' array - might have to get a lot cleverer but seems
    /// easy for now.
    var asArraySizeExpression: String {
        // check for ref to a constant, so far all upper-case
        if self.uppercased() == self {
            return "Int(\(self))"
        }
        // must be a parameter, convert
        return asSwiftParameterExpression
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
        case in_ref // pass by value but convert and take address to pass [xlation of C++ '&' reference]
        case in_string_array // pass by value, array of strings
        case out  // return in a tuple
        case out_transparent // return in a tuple, no temporary
        case out_transparent_array // pass inout, array, no temporary
        case in_out // pass inout, pass current val to API, copy-back
        case in_array // pass by value but a Swift array, use a temporary to cast, no copy-back
        case in_array_count(SwiftParam) // a C param for the length of an `in_array` param that is absent in Swift
        case out_array(String) // pass inout, temporary to cast, copy-back, array.  Required size given by another param.
                               // 'nullable' pattern here is super-ugly, review all uses when done and maybe make different case.
                               // also check how to use, `nil` inout is tricky - better to gen a separate function?
        case out_string(String) // pass inout, temp buffer of user-set length, convert to string
                                // eventually review and switch to String(unsafeUninit... to avoid the copy)
                                // see 'nullable' qualms also
    }
    private let style: Style

    var includeInReturnTuple: Bool {
        switch style {
        case .out, .out_transparent: return true
        default: return false
        }
    }

    /// What is the type of the param in the Swift version of the function - nil if omitted
    private var swiftParamType: String? {
        let optional = db.nullable ? "?" : ""
        switch style {
        case .in: return swiftTypeBaseName + optional
        case .in_string_array, .in_ref: return swiftTypeBaseName
        case .out, .out_transparent: return nil
        case .in_out: return "inout \(swiftTypeBaseName)\(optional)"
        case .in_array: return "[\(swiftTypeBaseName)]"
        case .in_array_count: return nil
        case .out_array, .out_transparent_array: return "inout [\(swiftTypeBaseName)]\(optional)"
        case .out_string: return "inout String\(optional)"
        }
    }

    /// What actually appears in the formal param list - complicated by nullable out params
    /// xxx can merge with above now?
    var swiftParamClause: String? {
        switch (style, db.nullable) {
        case (.out, true), (.out_transparent, true):
            return "\(returnParamName): Bool = true"
        default:
            guard let swiftType = swiftParamType else {
                return nil
            }
            return "\(swiftName): \(swiftType)"
        }
    }

    /// Clause to forward a value to a similarly shaped function
    /// xxx obviously stuff to refactor...
    var swiftParamForwardingClause: String? {
        let paramName: String
        switch (style, db.nullable) {
        case (.out, true), (.out_transparent, true):
            paramName = returnParamName
        case (.in_array_count, _):
            return nil
        default:
            paramName = swiftName
        }
        return "\(paramName): \(paramName)"
    }

    /// How should the param appear in the Swift return tuple
    var swiftReturnType: String {
        swiftTypeBaseName
    }

    /// A default instance for the Swift return tuple
    var swiftReturnDummyInstance: String {
        // big yikes here
        // exclam is about non-optional bufferpointers that we can't just fabricate
        steamTypeName.depointered.asSwiftTypeInstance!
    }

    /// The name of the local variable to store the Steam version of the type for an out param
    private var tempName: String {
        "tmp_\(swiftName)" // xxx refactor with uppered below, into Names
    }

    /// The name of the parameter controlling a nullable out param
    private var returnParamName: String {
        let uppered = swiftName.prefix(1).uppercased() + swiftName.dropFirst()
        return "return\(uppered)"
    }

    /// What code (if any) is required before calling the Steamworks API
    /// SW isn't a particularly good `const` citizen
    /// (Need to review for stack-allocation, new APIs in Swift 5.6 might help)
    var preCallLines: [String] {
        switch style {
        case .in:
            guard db.nullable && !steamTypeName.isSteamTypePassedInTransparently else {
                return []
            }
            return [
                "let \(tempName) = UnsafeMutablePointer<\(steamTypeName)>.initAllocate(\(swiftName))",
                "defer { \(tempName)?.deallocate() }"
                ]
        case .in_array_count, .out_transparent_array:
            return []
        case .in_string_array:
            return [
                "let \(tempName) = StringArray(\(swiftName))",
                "defer { \(tempName).deallocate() }"
            ]
        case .in_array:
            return ["var \(tempName) = \(swiftName).map { \(steamTypeName.depointered.asExplicitSwiftTypeForPassingIntoSteamworks)($0) }"]
        case .out, .out_transparent:
            if !db.nullable {
                return ["var \(tempName) = \(steamTypeName.depointered.asExplicitSwiftInstanceForPassingIntoSteamworks())"]
            }
            let typeName = steamTypeName.depointered.asExplicitSwiftTypeForPassingIntoSteamworks
            return [
                "let \(tempName) = \(returnParamName) ? UnsafeMutablePointer<\(typeName)>.allocate(capacity: 1) : nil",
                "defer { \(tempName)?.deallocate() }"
            ]
        case .in_out, .in_ref:
            return ["var \(tempName) = \(steamTypeName.desuffixed.asExplicitSwiftInstanceForPassingIntoSteamworks(swiftName))"]
        case .out_array(let sizeParam):
            let typeName = steamTypeName.depointered.asExplicitSwiftTypeForPassingIntoSteamworks
            let lines: [String]
            if !db.nullable {
                lines = [
                    "let \(tempName) = UnsafeMutableBufferPointer<\(typeName)>.allocate(capacity: \(sizeParam.asArraySizeExpression))",
                    "defer { \(tempName).deallocate() }"
                ]
            } else {
                lines = [
                    "let \(tempName) = \(swiftName).map { _ in UnsafeMutableBufferPointer<\(typeName)>.allocate(capacity: \(sizeParam.asArraySizeExpression)) }",
                    "defer { \(tempName)?.deallocate() }"
                ]
            }
            return lines
        case .out_string(let sizeParam):
            let lines: [String]
            if !db.nullable {
                lines = [
                    "let \(tempName) = UnsafeMutableBufferPointer<CChar>.allocate(capacity: \(sizeParam.asArraySizeExpression))",
                    "defer { \(tempName).deallocate() }"
                ]
            } else {
                lines = [
                    "let \(tempName) = \(swiftName).map { _ in UnsafeMutableBufferPointer<CChar>.allocate(capacity: \(sizeParam.asArraySizeExpression)) }",
                    "defer { \(tempName)?.deallocate() }"
                ]
            }

            return lines
        }
    }

    /// How to refer to the param in the Steamworks API call
    var callName: String {
        switch style {
        case .in:
            if db.nullable && !steamTypeName.isSteamTypePassedInTransparently {
                return tempName
            } else {
                return swiftName.asCast(to: steamTypeName.asSwiftTypeForPassingIntoSteamworks)
            }
        case .in_string_array:
            return ".init(\(tempName))"
        case .out, .out_transparent:
            return db.nullable ? tempName : "&\(tempName)"
        case .in_out, .in_array, .in_ref:
            if !db.nullable {
                return "&\(tempName)"
            } else {
                return "\(tempName)"
            }
        case .out_transparent_array:
            return "&\(swiftName)"
        case .in_array_count(let ap):
            return "\(ap.swiftName).count".asCast(to: steamTypeName.asSwiftTypeForPassingIntoSteamworks)
        case .out_array, .out_string:
            if !db.nullable {
                return "\(tempName).baseAddress"
            } else {
                return "\(tempName).flatMap { $0.baseAddress }"
            }
        }
    }

    /// What code (if any) is required after calling the Steamworks API
    var postSuccessCallLine: String? {
        switch style {
        case .in, .in_string_array, .in_array, .in_array_count, .out_transparent_array, .in_ref: return nil
        case .out, .out_transparent:
            return nil
        case .in_out:
            if !db.nullable {
                return "\(swiftName) = \(swiftTypeBaseName)(\(tempName))"
            } else {
                return "\(tempName).map { \(swiftName) = \(swiftTypeBaseName)($0.pointee) }"
            }
        case .out_array:
            let subscr = db.outArrayValidLength.map { "[0..<\($0)]" } ?? ""
            if !db.nullable {
                return "\(swiftName) = \(tempName)\(subscr).map { \(swiftTypeBaseName)($0) }"
            } else {
                return "\(tempName).map { \(swiftName) = $0\(subscr).map { \(swiftTypeBaseName)($0) } }"
            }
        case .out_string:
            if !db.nullable {
                return "\(swiftName) = String(\(tempName))" // null-termination done inside, see TypeUtils.swift
            } else {
                return "\(tempName).map { \(swiftName) = String($0) }"
            }
        }
    }

    /// Return-type tuple-builder
    var outParamReturnExpression: String {
        switch style {
        case .out:
            guard db.nullable else {
                return "\(swiftTypeBaseName)(\(tempName))"
            }
            return "\(tempName).map { \(swiftTypeBaseName)($0.pointee) } ?? \(swiftReturnDummyInstance)"

        case .out_transparent:
            return tempName

        default:
            preconditionFailure("Not out param: \(self)")
        }
    }

    init(_ db: MetadataDB.Method.Param, inArrayParam: SwiftParam? = nil) {
        self.db = db
        let naiveSwiftTypeName = db.type.asSwiftTypeName
        if let arrayParam = inArrayParam {
            swiftTypeBaseName = "ERROR"
            style = .in_array_count(arrayParam)
        } else if naiveSwiftTypeName.hasSuffix("*"), let depointered = db.type.depointeredType {
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
                } else if db.inOut {
                    style = .in_out
                } else if db.arrayCount != nil {
                    style = .in_array
                } else {
                    style = .out
                }
            }
        } else if let dereferenced = db.type.dereferencedType {
            swiftTypeBaseName = dereferenced.asSwiftTypeName
            style = .in_ref
        } else {
            swiftTypeBaseName = naiveSwiftTypeName
            if swiftTypeBaseName == "[String]" {
                style = .in_string_array
            } else {
                style = .in
            }
        }
    }
}

extension String {
    var depointeredType: String? {
        re_match("^(.*?) ?\\*$").flatMap { $0[1] }
    }

    var dereferencedType: String? {
        re_match("^(.*) &$").flatMap { $0[1] }
    }
}

extension Array where Element == MetadataDB.Method.Param {
    var asSwiftParams: [SwiftParam] {
        var params = [SwiftParam]()
        var lookingForCount = [String : SwiftParam]() // count name : array param
        var arrayParams = [String : SwiftParam]() // array name : array param

        forEach { p in
            if let countParamName = p.arrayCount {
                let param = SwiftParam(p, inArrayParam: nil)
                lookingForCount[countParamName] = param
                arrayParams[p.name] = param
            }
        }

        forEach { p in
            let param = arrayParams.removeValue(forKey: p.name) ??
                        SwiftParam(p, inArrayParam: lookingForCount.removeValue(forKey: p.name))
            params.append(param)
        }

        if !lookingForCount.isEmpty {
            print("Couldn't match up 'arrayCount', leftovers: \(lookingForCount)")
            print("Method is \(self)")
            preconditionFailure()
        }
        if !arrayParams.isEmpty {
            print("Utterly confused by everything: \(arrayParams)")
            preconditionFailure()
        }
        return params
    }
}

extension Array where Element == SwiftParam {

    func namedParamList(filter: KeyPath<SwiftParam, String?>) -> String {
        compactMap { param in
            param[keyPath: filter].flatMap { "\(param.swiftName): \($0)" }
        }.joined(separator: ", ")
    }

    func namedParamList(filter: KeyPath<SwiftParam, String>) -> String {
        map { param in
            "\(param.swiftName): \(param[keyPath: filter])"
        }.joined(separator: ", ")
    }

    /// Formal parameter list
    var functionParams: String {
        compactMap { $0.swiftParamClause }.joined(separator: ", ")
    }

    /// If the routine naturally returns X, what does it return taking out params into account?
    func returnTypeWithOutParams(rcType: String?) -> String? {
        entupleWithApiRc(rcText: rcType, paramField: \.swiftReturnType)
    }

    /// Actually make the tuple including out params
    func returnValueWithOutParams(apiIsVoid: Bool) -> String? {
        entupleWithApiRc(rcText: apiIsVoid ? nil : "rc", paramField: \.outParamReturnExpression)
    }

    /// Make the tuple with dummy values, for a failed API call
    func returnValueWithDummyOutParams(apiIsVoid: Bool) -> String? {
        entupleWithApiRc(rcText: apiIsVoid ? nil : "rc", paramField: \.swiftReturnDummyInstance)
    }

    /// Figure out how to express a 0/1 RC with the N (0+) out-params in a single type or a tuple.
    /// 1-element tuples are not allowed!
    private func entupleWithApiRc(rcText: String?, paramField: KeyPath<SwiftParam,String>) -> String? {
        if isEmpty {
            return rcText
        } else if rcText == nil && count == 1 {
            return self[0][keyPath: paramField].re_sub("^.*: ", with: "")
        } else {
            let rcTuple = rcText.flatMap { "rc: \($0), "} ?? ""
            let outTuple = namedParamList(filter: paramField)
            return "(\(rcTuple)\(outTuple))"
        }
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
        compactMap(\.swiftParamForwardingClause).joined(separator: ", ")
    }
}

extension MetadataDB.Method {
    var swiftReturnType: String? {
        returnType == "void" ? nil : returnType.asSwiftReturnTypeName
    }
}

// MARK: Methods

struct SwiftMethod {
    let db: MetadataDB.Method

    enum Style {
        case normal(apiIsVoid: Bool, returnType: String?) // 0+ args, return value that may be a tuple of out-params
        case callReturn(String) // 0+ args, async return value with given Swift struct type
    }

    var callReturnType: String? {
        guard case let .callReturn(type) = style else {
            return nil
        }
        return type
    }

    let style: Style
    let params: [SwiftParam] // all params
    let outParams: [SwiftParam] // subset of params that are out-params

    init(_ db: MetadataDB.Method) {
        self.db = db
        params = db.params.asSwiftParams
        outParams = params.filter(\.includeInReturnTuple)
        if let callResult = db.callResult {
            style = .callReturn(callResult.asSwiftTypeName)
        } else {
            let apiReturnType = db.swiftReturnType
            style = .normal(apiIsVoid: apiReturnType == nil,
                            returnType: outParams.returnTypeWithOutParams(rcType: apiReturnType))
        }
    }

    var declLine: String {
        switch (style, db.isVar) {
        case (.normal(false, .some(let type)), true):
            return "public var \(db.varName): \(type) {"
        case (.normal(_, .some(let type)), false):
            return "public func \(db.funcName)(\(params.functionParams)) -> \(type) {"
        case (.normal(_, .none), false):
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
        case .normal(false, _):
            return steamCall.asCast(to: db.returnType.asSwiftTypeForPassingOutOfSteamworks)
        case .normal(true, _), .callReturn:
            return steamCall
        }
    }

    enum ReturnSyntax {
        case implicit // <steam API call> } (end of function)
        case explicit // return <steam API call>
        case intermediate // rc = <steam API call> then more stuff
    }

    var returnSyntax: ReturnSyntax {
        switch style {
        case .callReturn, .normal(_, nil): return .implicit
        case .normal:
            if outParams.isEmpty && params.postSuccessCallLines.isEmpty { // XXX ?? postCallLines ?? include iff stuff?
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
        case .normal(let apiIsVoid, _):
            switch (returnSyntax, apiIsVoid) {
            case (.implicit, _),
                 (.intermediate, true):
                return [callExpression]
            case (.explicit, _):
                return ["return \(callExpression)"]
            case (.intermediate, false):
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
        linesConditionalOnRc(params.postSuccessCallLines)
    }

    private func linesConditionalOnRc(_ lines: [String], elseLines: [String] = []) -> [String] {
        guard !(lines.isEmpty && elseLines.isEmpty),
              let testExpr = db.outParamIffRc else {
            return lines
        }
        let test = "if rc \(testExpr.isEmpty ? "" : "\(testExpr) "){"
        let elseLines = elseLines.isEmpty ? [] : (["} else {"] + elseLines.indented(1))
        return [test] + lines.indented(1) + elseLines + ["}"]
    }

    var finalBodyLines: [String] {
        guard returnSyntax == .intermediate,
              case let .normal(apiIsVoid, _) = style,
              let expr = outParams.returnValueWithOutParams(apiIsVoid: apiIsVoid) else {
            return []
        }
        guard let elseExpr = outParams.returnValueWithDummyOutParams(apiIsVoid: apiIsVoid) else {
            preconditionFailure("Can't be no dummy-params if there are no-dummy params")
        }
        return linesConditionalOnRc(["return \(expr)"], elseLines: ["return \(elseExpr)"])
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
            "public func \(db.funcName)(\(params.functionParams)) async -> \(type)? {",
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
        // Plus API guidelines about 'low cost'.
    }

    /// Normally take the C++ version of the function name.
    /// Because 'out' params are in the return tuple, add back the type cookie to the name to avoid
    /// forcing users to make return types explicit, eg: `GetUserStatInt(..) -> Int` instead
    /// of `GetUserStat(...) -> Int`, `GetUserStat(...) -> Float`.
    var funcName: String {
        let base = name.asSwiftIdentifier
        guard let overloaded = flatName.re_match(#"Get.*(Float|Double|Int)(?:\d\d)?$"#) else {
            return base
        }
        return "\(base)\(overloaded[1])"
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
