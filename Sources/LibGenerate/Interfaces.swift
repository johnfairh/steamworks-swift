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

private extension String {
    /// This is a native steam (C) type
    ///
    /// If this is a type that should be out or in-out (!const `Foo *` or `Foo &`) then return it.
    var asOutSteamTypeBaseType: String? {
        if hasPrefix("const") {
            return nil
        }
        if re_isMatch("(?:&|\\*)$") {
            // Filter out stuff like 'uint8 *' which we model as 'in' params
            // (because buffer allocation)
            if !isSteamPointerTypePassedByValue {
                // `Foo *` -> `Foo`, `Foo **` -> `Foo *`
                return desuffixed
            }
        }
        return nil
    }

    /// This is a native steam (C) type
    ///
    /// If it's a `const Foo &` return the `Foo` else return the whole thing.
    /// Same semantics for Swift.
    var asInSteamTypeBaseType: String {
        if isSteamPointerTypePassedByValue {
            return self
        }
        if let match = re_match("const +(.*?) +(\\*|&)") {
            return match[1]
        }
        return self
    }
}

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
        case `in` // pass by value or const ref, flat, cast at time of use
        case in_string_array // pass by value, array of strings
        case out  // return in a tuple
        case out_transparent // return in a tuple, no temporary
        case out_transparent_array(String) // return in a tuple, array, no temporary
        case in_out // pass in, return in a tuple
        case in_array // pass by value but a Swift array, use a temporary to cast, no copy-back
        case in_array_count(SwiftParam) // a C param for the length of an `in_array` param that is absent in Swift
        case out_array(String) // pass inout, temporary to cast, copy-back, array.  Required size given by another param.
                               // 'nullable' pattern here is super-ugly, review all uses when done and maybe make different case.
                               // also check how to use, `nil` inout is tricky - better to gen a separate function?
        case out_string(String) // return in a tuple, length comes from somewhere else
                                // if nullable than can request to not produce, comes back empty
    }
    private let style: Style

    var includeInReturnTuple: Bool {
        switch style {
        case .out, .out_transparent, .out_array, .out_transparent_array, .out_string, .in_out: return true
        default: return false
        }
    }

    /// What is the type of the param in the Swift version of the function - nil if omitted
    private var swiftParamType: String? {
        let optional = db.nullable ? "?" : ""
        switch style {
        case .in, .in_string_array, .in_out: return swiftTypeBaseName + optional
        case .in_array: return "[\(swiftTypeBaseName)]"
        case .out, .out_transparent, .out_array, .out_transparent_array, .out_string: return nil
        case .in_array_count: return nil
        }
    }

    /// What actually appears in the formal param list - complicated by nullable out params
    /// xxx can merge with above now?
    var swiftParamClause: String? {
        switch (style, db.nullable) {
        case (.out, true), (.out_transparent, true), (.out_array, true), (.out_transparent_array, true), (.out_string, true):
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
        case (.out, true), (.out_transparent, true), (.out_array, true), (.out_transparent_array, true), (.out_string, true):
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
        switch style {
        case .out_array, .out_transparent_array: return "[\(swiftTypeBaseName)]"
        default: return swiftTypeBaseName
        }
    }

    /// A default instance for the Swift return tuple
    var swiftReturnDummyInstance: String {
        // big yikes here, figure out properly
        switch style {
        case .out_array, .out_transparent_array: return "[]"
        case .out_string: return #""""#
        default:
            // exclam is about non-optional bufferpointers that we can't just fabricate
            return steamTypeName.desuffixed.asSwiftTypeInstance!
        }
    }

    /// The name of the local variable to store the Steam version of the type for an out param
    private var tempName: String {
        modifiedName("tmp")
    }

    /// The name of the parameter controlling a nullable out param
    private var returnParamName: String {
        modifiedName("return")
    }

    private func modifiedName(_ modifier: String) -> String {
        modifier + swiftName.prefix(1).uppercased() + String(swiftName.dropFirst())
    }

    /// What code (if any) is required before calling the Steamworks API
    /// (Need to review for stack-allocation, new APIs in Swift 5.6 might help)
    var preCallLines: [String] {
        switch style {
        case .in:
            guard db.nullable && !steamTypeName.isSteamTypePassedInTransparently else {
                return []
            }
            let typeName = steamTypeName.desuffixed.asExplicitSwiftTypeForPassingIntoSteamworks
            return [
                "let \(tempName) = SteamNullable<\(typeName)>(\(swiftName))",
                "defer { \(tempName).deallocate() }"
                ]
        case .in_array_count:
            return []
        case .in_string_array:
            return [
                "let \(tempName) = StringArray(\(swiftName))",
                "defer { \(tempName).deallocate() }"
            ]
        case .in_array:
            return ["var \(tempName) = \(swiftName).map { \(steamTypeName.desuffixed.asExplicitSwiftTypeForPassingIntoSteamworks)($0) }"]
        case .out, .out_transparent:
            if !db.nullable {
                return ["var \(tempName) = \(steamTypeName.desuffixed.asExplicitSwiftInstanceForPassingIntoSteamworks())"]
            }
            let typeName = steamTypeName.desuffixed.asExplicitSwiftTypeForPassingIntoSteamworks
            return [
                "let \(tempName) = SteamNullable<\(typeName)>(isReal: \(returnParamName))",
                "defer { \(tempName).deallocate() }"
            ]
        case .in_out:
            if !db.nullable {
                return ["var \(tempName) = \(steamTypeName.desuffixed.asExplicitSwiftInstanceForPassingIntoSteamworks(swiftName))"]
            }
            let typeName = steamTypeName.desuffixed.asExplicitSwiftTypeForPassingIntoSteamworks
            return [
                "let \(tempName) = SteamNullable<\(typeName)>(\(swiftName))",
                "defer { \(tempName).deallocate() }"
            ]
        case .out_array(let sizeParam):
            let typeName = steamTypeName.desuffixed.asExplicitSwiftTypeForPassingIntoSteamworks
            let nullability = db.nullable ? ", \(returnParamName)" : ""
            return [ "let \(tempName) = SteamOutArray<\(typeName)>(\(sizeParam.asArraySizeExpression)\(nullability))" ]
        case .out_transparent_array(let sizeParam):
            precondition(!db.nullable, "Can't do transparent-out-array-nullable")
            return ["var \(swiftName) = Array<\(swiftTypeBaseName)>(repeating: .init(), count: \(sizeParam.asArraySizeExpression))"]
        case .out_string(let sizeParam):
            let nullability = db.nullable ? ", isReal: \(returnParamName)" : ""
            return [
                "let \(tempName) = SteamString(length: \(sizeParam.asArraySizeExpression)\(nullability))"
            ]
        }
    }

    /// How to refer to the param in the Steamworks API call
    var callName: String {
        switch style {
        case .in:
            if db.nullable && !steamTypeName.isSteamTypePassedInTransparently {
                return "\(tempName).steamValue"
            } else {
                return swiftName.asCast(to: steamTypeName.asSwiftTypeForPassingIntoSteamworks)
            }
        case .in_string_array:
            return ".init(\(tempName))"
        case .out, .out_transparent, .in_out:
            return db.nullable ? "\(tempName).steamValue" : "&\(tempName)"
        case .in_array:
            if !db.nullable {
                return "&\(tempName)"
            } else {
                return "\(tempName)"
            }
        case .out_transparent_array:
            return "&\(swiftName)"
        case .in_array_count(let ap):
            return "\(ap.swiftName).count".asCast(to: steamTypeName.asSwiftTypeForPassingIntoSteamworks)
        case .out_array:
            return "\(tempName).steamArray"
        case .out_string:
            return "\(tempName).charBuffer"
        }
    }

    /// Return-type tuple-builder
    var outParamReturnExpression: String {
        switch style {
        case .out, .in_out:
            guard db.nullable else {
                return "\(swiftTypeBaseName)(\(tempName))"
            }
            return "\(tempName).swiftValue(dummy: \(swiftReturnDummyInstance))"

        case .out_transparent:
            guard db.nullable else {
                return tempName
            }
            return "\(tempName).swiftValue(dummy: \(swiftReturnDummyInstance))"

        case .out_array:
            let subscrpt = db.outArrayValidLength.map { $0.asCast(to: "Int") } ?? ""
            return "\(tempName).swiftArray(\(subscrpt))"

        case .out_transparent_array:
            return db.outArrayValidLength.map { "\(swiftName).safePrefix(\($0))" } ?? swiftName

        case .out_string:
            return "\(tempName).swiftString"

        default:
            preconditionFailure("Not out param: \(self)")
        }
    }

    init(_ db: MetadataDB.Method.Param, inArrayParam: SwiftParam? = nil) {
        self.db = db
        if let arrayParam = inArrayParam {
            swiftTypeBaseName = "ERROR"
            style = .in_array_count(arrayParam)
        } else if let outSteamType = db.type.asOutSteamTypeBaseType {
            if let outStringLength = db.outStringLength {
                swiftTypeBaseName = "String"
                style = .out_string(outStringLength)
            } else {
                swiftTypeBaseName = outSteamType.asSwiftTypeName
                if let outLength = db.outArrayLength {
                    if !db.nullable && outSteamType.isTransparentOutType {
                        style = .out_transparent_array(outLength)
                    } else {
                        style = .out_array(outLength)
                    }
                } else if outSteamType.isTransparentOutType {
                    style = .out_transparent
                } else if db.arrayCount != nil {
                    // steam APIs aren't very const-correct so some out-looking
                    // params are actually in-only
                    style = .in_array
                } else if db.inOut {
                    style = .in_out
                } else {
                    style = .out
                }
            }
        } else {
            swiftTypeBaseName = db.type.asInSteamTypeBaseType.asSwiftTypeName
            if swiftTypeBaseName == "[String]" {
                style = .in_string_array
            } else if db.arrayCount != nil {
                style = .in_array
            } else {
                style = .in
            }
        }
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
            if outParams.isEmpty  {
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

    /// Code to go following the API call.  This builds the return value/tuple.
    ///
    /// Usually, steamworks says that even if the API call fails the out params are updated to some 'invalid' value,
    /// meaning we must return them anyway.
    ///
    /// But infrequently this does not happen, so we must not access the out params for fear of out-of-range
    /// typechecks and uninitialized data UB.  Our patch json says what test to apply to `rc`.
    ///
    var postCallLines: [String] {
        guard returnSyntax == .intermediate,
              case let .normal(apiIsVoid, _) = style,
              let expr = outParams.returnValueWithOutParams(apiIsVoid: apiIsVoid) else {
            return []
        }
        guard let testExpr = db.outParamIffRc else {
            return ["return \(expr)"]
        }
        guard let elseExpr = outParams.returnValueWithDummyOutParams(apiIsVoid: apiIsVoid) else {
            preconditionFailure("Can't be no dummy-params if there are no-dummy params")
        }

        return [
            "if rc \(testExpr.isEmpty ? "" : "\(testExpr) "){",
            "return \(expr)".indented(1),
            "} else {",
            "return \(elseExpr)".indented(1),
            "}"
        ]
    }

    /// Function body
    var bodyLines: [String] {
        params.preCallLines + callLines + postCallLines
    }

    /// Synchronous version of the entire function
    func syncDecl(comment baseComment: String) -> [String] {
        let comment = callReturnType.flatMap { _ in "\(baseComment), callback" } ?? baseComment
        let attrLine = db.discardableResult ? ["@discardableResult"] : []
        return [comment] + attrLine + [declLine] + bodyLines.indented(1) + ["}"]
    }

    /// Asynchronous version of the entire function, [] for functions without an async version
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

    /// All the Swift code for this API method
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
