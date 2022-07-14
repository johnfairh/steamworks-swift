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
            try io.write(fileName: "\(interface.name.swiftType).swift",
                         contents: interface.generate())
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
    func accessVia(getter: SwiftExpr) -> String {
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
        let shortName = SteamName(db.name.name.re_sub("^ISteam", with: "")).swiftName // "ISteamFriends" -> "friends"

        let docComment =
            """
            /// Steamworks [`\(db.name)`](https://partner.steamgames.com/doc/api/\(db.name))
            ///
            /// Access via \(accessVia(getter: shortName)).
            public \(swiftTypeKind) \(db.name.swiftType) {
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

extension MetadataDB.Interface {
    func generate() -> String {
        let declaration = access.declaration(db: self)
        let methods = methods.values
            .sorted(by: { $0.flatName.normalizedApiName < $1.flatName.normalizedApiName })
            .filter(\.shouldGenerate)
            .map { $0.generate(context: name) }
            .joined(separator: "\n\n")
        return declaration + "\n" + methods + "\n}"
    }
}

// MARK: Method Parameters

/// A field in Steam JSON that describes the length of an 'out'
/// array or string.
///
/// Have to cope with:
///  * Numeric constant, eg. "1024"
///  * Parameter SteamName, eg. "nMaxMessages"
///  * Constant name, eg. "MAX_MESSAGES"
///  * Arithmetic expression of the above, eg. "MAX_MESSAGE_BUF / 8"
struct SteamParameterExpr: StringFungible {
    let expr: String
    init(_ expr: String) { self.expr = expr }
    var _val: String { expr }

    var swiftExpr: SwiftExpr {
        swiftExprBase(prefix: "")
    }

    var swiftExprPublic: SwiftExpr {
        swiftExprBase(prefix: "SteamConstants.")
    }

    private func swiftExprBase(prefix: String) -> SwiftExpr {
        // recurse for arithmetic
        if expr.contains(" ") {
            return SwiftExpr(expr.split(separator: " ")
                .map { SteamParameterExpr($0).swiftExprBase(prefix: prefix).expr }
                .joined(separator: " "))
        }
        // numeric constant, unchanged
        if expr.re_isMatch(#"^\d*$"#) {
            return SwiftExpr(expr)
        }
        // check for ref to a constant (YIKES XXX just look up name?)
        if expr.first!.isCased && (expr.uppercased() == expr || expr.hasPrefix("k_")) {
            if prefix.isEmpty {
                return "Int(\(expr))"
            } else {
                return "\(prefix)\(SteamHungarianName(expr).swiftName)"
            }
        }
        // must be a parameter ref
        return SteamHungarianName(expr).swiftParameterName
    }
}

extension SteamHungarianName {
    /// Parameters - special behaviour for 'out' parameters, need to strip off
    /// the various expressions of 'out' in the steam name.
    var swiftParameterName: SwiftExpr {
        let name = swiftName
        if name.expr.re_isMatch("^out[A-Z]") {
            return SteamHungarianName(name).swiftName
        }
        if name.expr.hasSuffix("TimedOut") {
            return name
        }
        return SwiftExpr(name.expr.re_sub("(?<=[a-z])Out$", with: ""))
    }
}

private extension SwiftExpr {
    /// New identifiers from old
    func withPrefix(_ prefix: String) -> SwiftExpr {
        "\(prefix)\(expr.prefix(1).uppercased())\(expr.dropFirst())"
    }
}

final class SteamParam {
    let db: MetadataDB.Method.Param

    var swiftName: SwiftExpr {
        db.name.swiftParameterName
    }

    var steamType: SteamType {
        db.type
    }

    private enum Style {
        case `in` // pass by value or const ref, flat, cast at time of use
        case in_array // pass by value but a Swift array, use a temporary to cast, no copy-back
        case in_string_array // pass by value, array of strings

        case in_array_count(SteamParam) // a C param for the length of an `in_array` param that is absent in Swift

        case out // create on stack, return in a tuple
        case out_transparent // create on stack, return in a tuple, no need to convert type
        case out_array(SteamParameterExpr) // create on stack, return in a tuple, array.  Expr is required length.
        case out_transparent_array(SteamParameterExpr) // create on stack, return in a tuple, array, no need to convert type.
                                                       // Expr is required length.
        case out_string(SteamParameterExpr) // create on stack, return in a type, string.  Expr is length.

        case in_out // pass in, return new value in tuple
    }
    private let style: Style

    /// Does this C-API param go in the return tuple in the Swift API?
    var includeInReturnTuple: Bool {
        switch style {
        case .out, .out_transparent, .out_array, .out_transparent_array, .out_string, .in_out:
            return true
        default:
            return false
        }
    }

    /// The 'base' swift type of the param.  If the param is an array
    /// then this is the array element, not the array itself -- use `swiftType` to access the actual type
    private let swiftBaseType: SwiftType

    /// The Swift type for this param
    var swiftType: SwiftType {
        switch style {
        case .in_array, .out_array, .out_transparent_array: return "[\(swiftBaseType)]"
        default: return swiftBaseType
        }
    }

    /// What appears in the function param list.  Nil if nothing.
    ///
    /// Nullable out params need a flag to request its return.
    /// Nullable in params get an optional.
    var swiftParamClause: String? {
        let typeSuffix = db.nullable ? "?" : ""
        let defaultValue = db.defaultValue.map { " = \($0.swiftExprPublic)"} ?? ""

        switch style {
        case .in, .in_string_array, .in_out, .in_array:
            return "\(swiftName): \(swiftType)\(typeSuffix)\(defaultValue)"

        case .out, .out_transparent, .out_array, .out_transparent_array, .out_string:
            precondition(defaultValue.isEmpty, "Not set up to deal with default values for out params")
            return db.nullable ? "\(returnParamName): Bool = true" : nil

        case .in_array_count:
            return nil
        }
    }

    /// Clause to forward a value to a similarly shaped function
    var swiftParamForwardingClause: SwiftExpr? {
        let paramName: SwiftExpr
        switch style {
        case .out, .out_transparent, .out_array, .out_transparent_array, .out_string:
            if db.nullable {
                paramName = returnParamName
            } else {
                fallthrough
            }

        case .in, .in_string_array, .in_out, .in_array:
            paramName = swiftName

        case .in_array_count:
            return nil
        }
        return "\(paramName): \(paramName)"
    }

    /// A default instance for a (out) param for cases we can't get a real value
    var swiftReturnDummyInstance: SwiftExpr {
        switch style {
        case .out_array, .out_transparent_array:
            return "[]"
        case .out, .out_transparent, .in_out, .out_string:
            // exclam is about non-optional bufferpointers, should not arise
            return steamType.swiftTypeInstance!
        default:
            preconditionFailure("Not an out param: \(style)")
        }
    }

    /// The name of the local variable to store the Steam version of the type for an out param
    private var tempName: SwiftExpr {
        swiftName.withPrefix("tmp")
    }

    /// The name of the parameter controlling a nullable out param
    private var returnParamName: SwiftExpr {
        swiftName.withPrefix("return")
    }

    /// What code (if any) is required before calling the Steamworks API
    var preCallLines: [String] {
        var line = ""
        var deallocateTemp = false

        switch style {
        case .in:
            if db.nullable && steamType.needsParameterCast {
                let typeName = steamType.swiftNativeType
                line = "let \(tempName) = SteamNullable<\(typeName)>(\(swiftName))"
                deallocateTemp = true
            }

        case .in_string_array:
            line = "let \(tempName) = StringArray(\(swiftName))"
            deallocateTemp = true

        case .in_array:
            if steamType.needsParameterCast {
                line = "var \(tempName) = \(swiftName).map { \(steamType.swiftNativeType.instance("$0")) }"
            }

        case .in_array_count:
            break

        case .out, .out_transparent:
            let nativeType = steamType.swiftNativeType
            if !db.nullable {
                line = "var \(tempName) = \(nativeType.instance())"
            } else {
                line = "let \(tempName) = SteamNullable<\(nativeType)>(isReal: \(returnParamName))"
                deallocateTemp = true
            }

        case .in_out:
            let nativeType = steamType.swiftNativeType
            if !db.nullable {
                line = "var \(tempName) = \(nativeType.instance(swiftName))"
            } else {
                line = "let \(tempName) = SteamNullable<\(nativeType)>(\(swiftName))"
                deallocateTemp = true
            }

        case .out_array(let size):
            let nativeType = steamType.swiftNativeType
            let nullability = db.nullable ? ", \(returnParamName)" : ""
            line = "let \(tempName) = SteamOutArray<\(nativeType)>(\(size.swiftExpr)\(nullability))"

        case .out_transparent_array(let size):
            precondition(!db.nullable, "Can't do transparent-out-array-nullable, regress to !transparent")
            line = "var \(swiftName) = \(swiftType)(repeating: .init(), count: \(size.swiftExpr))"

        case .out_string(let size):
            let nullability = db.nullable ? ", isReal: \(returnParamName)" : ""
            line = "let \(tempName) = SteamString(length: \(size.swiftExpr)\(nullability))"
        }

        return line.isEmpty ? [] : deallocateTemp ? [line, "defer { \(tempName).deallocate() }"] : [line]
    }

    /// How to refer to the param in the Steamworks API call
    var callName: SwiftExpr {
        switch style {
        case .in:
            if db.nullable && steamType.needsParameterCast {
                return "\(tempName).steamValue"
            } else {
                return swiftName.asCast(to: steamType.parameterCast)
            }

        case .in_array:
            if !db.nullable {
                return steamType.needsParameterCast ? "&\(tempName)" : swiftName
            } else {
                return tempName
            }

        case .in_array_count(let ap):
            return SwiftExpr("\(ap.swiftName).count").asCast(to: steamType.parameterCast)

        case .in_string_array:
            return ".init(\(tempName))"

        case .out, .out_transparent, .in_out:
            return db.nullable ? "\(tempName).steamValue" : "&\(tempName)"

        case .out_transparent_array:
            return "&\(swiftName)"

        case .out_array:
            return "\(tempName).steamArray"

        case .out_string:
            return "\(tempName).charBuffer"
        }
    }

    /// Return-type tuple-builder
    var outParamReturnExpression: SwiftExpr {
        var outCast: SwiftType? = swiftType

        switch style {
        case .out_transparent:
            outCast = nil
            fallthrough

        case .out, .in_out:
            guard db.nullable else {
                return tempName.asCast(to: outCast)
            }
            return "\(tempName).swiftValue(dummy: \(swiftReturnDummyInstance))"

        case .out_array:
            let subscrpt = db.outArrayValidLength.map { $0.asCast(to: SwiftType("Int")) } ?? ""
            return "\(tempName).swiftArray(\(subscrpt))"

        case .out_transparent_array:
            return db.outArrayValidLength.map { "\(swiftName).safePrefix(\($0))" } ?? swiftName

        case .out_string:
            return "\(tempName).swiftString"

        default:
            preconditionFailure("Not out param: \(self)")
        }
    }

    init(_ db: MetadataDB.Method.Param, inArrayParam: SteamParam? = nil) {
        self.db = db
        self.swiftBaseType = db.type.swiftType

        if let arrayParam = inArrayParam {
            // phantom param not present in swift, we just look at the array length
            style = .in_array_count(arrayParam)
        } else if db.arrayCount != nil {
            style = .in_array
        } else if db.probablyOutParam {
            // out parameter (probably) for return tuple
            if let outStringLength = db.outStringLength {
                style = .out_string(outStringLength)
            } else if let outLength = db.outArrayLength {
                if !db.nullable && !db.type.needsParameterCast {
                    style = .out_transparent_array(outLength)
                } else {
                    style = .out_array(outLength)
                }
            } else if !db.type.needsParameterCast {
                style = .out_transparent
            } else if db.inOut {
                style = .in_out
            } else {
                style = .out
            }
        } else if swiftBaseType == "[String]" {
            style = .in_string_array
        } else {
            style = .in
        }
    }
}

extension Array where Element == MetadataDB.Method.Param {
    var asSwiftParams: [SteamParam] {
        var params = [SteamParam]()
        var lookingForCount = [SteamHungarianName : SteamParam]() // count name : array param
        var arrayParams = [SteamHungarianName : SteamParam]() // array name : array param

        forEach { p in
            if let countParamName = p.arrayCount {
                let param = SteamParam(p, inArrayParam: nil)
                lookingForCount[countParamName] = param
                arrayParams[p.name] = param
            }
        }

        forEach { p in
            let param = arrayParams.removeValue(forKey: p.name) ??
                        SteamParam(p, inArrayParam: lookingForCount.removeValue(forKey: p.name))
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

extension Array where Element == SteamParam {
    /// Formal parameter list
    var functionParams: String {
        compactMap(\.swiftParamClause).commaJoined
    }

    /// Steamworks call parameter list
    var callParams: String {
        map(\.callName.expr).commaJoined
    }

    /// Call params when forwarding from async to callback API version
    var asyncForwardingParams: String {
        compactMap(\.swiftParamForwardingClause?.expr).commaJoined
    }

    /// Figure out how to express a 0/1 RC with the N (0+) out-params in a single type or a tuple.
    /// 1-element tuples are not allowed!
    private func entupleWithApiRc<T: StringFungible>(rcText: String?, paramField: KeyPath<SteamParam, T>) -> T? {
        if isEmpty {
            return rcText.map { T($0) }
        } else if rcText == nil && count == 1 {
            return T(self[0][keyPath: paramField].description.re_sub("^.*: ", with: ""))
        } else {
            let rcTuple = rcText.flatMap { "rc: \($0), "} ?? ""
            let outTuple = map { param in
                "\(param.swiftName): \(param[keyPath: paramField])"
            }.commaJoined
            return T("(\(rcTuple)\(outTuple))")
        }
    }

    /// If the Steam API returns X, what does the Swift API return taking out params into account?
    func returnTypeWithOutParams(apiReturnType: SwiftType?) -> SwiftType? {
        entupleWithApiRc(rcText: apiReturnType?.name, paramField: \.swiftType)
    }

    /// Create a return value/tuple from the params
    func returnValueWithOutParams(apiReturnType: SwiftType?) -> SwiftExpr? {
        entupleWithApiRc(rcText: apiReturnType.map { _ in "rc" }, paramField: \.outParamReturnExpression)
    }

    /// Create a return value/tuple with dummy values, for after a failed API call
    func returnValueWithDummyOutParams(apiReturnType: SwiftType?) -> SwiftExpr? {
        entupleWithApiRc(rcText: apiReturnType.map { _ in "rc" }, paramField: \.swiftReturnDummyInstance)
    }

    /// Lines to add before the API call
    var preCallLines: [String] {
        flatMap(\.preCallLines)
    }
}

// MARK: Methods

struct SteamMethod {
    let db: MetadataDB.Method

    enum Style {
        case normal(apiReturnType: SwiftType?, swiftReturnType: SwiftType?) // 0+ args, return value that may be a tuple of out-params
        case callReturn(SwiftType) // 0+ args, async return value with given Swift struct type

        var callReturnType: SwiftType? {
            switch self {
            case .normal: return nil
            case .callReturn(let type): return type
            }
        }
    }

    /// Swift cast needed, if any, to convert Steam API return type to fit the Swift type
    var swiftApiCast: SwiftType? {
        switch style {
        case .normal:
            return db.returnType.returnValueCast
        case .callReturn:
            return nil
        }
    }

    let style: Style
    let params: [SteamParam] // all params
    let outParams: [SteamParam] // subset of params that are out-params

    init(_ db: MetadataDB.Method) {
        self.db = db
        params = db.params.asSwiftParams
        outParams = params.filter(\.includeInReturnTuple)
        if let callResult = db.callResult {
            style = .callReturn(callResult.swiftType)
        } else {
            let baseType = db.returnType.swiftType
            let apiReturnType = baseType.isVoid ? nil : baseType

            style = .normal(apiReturnType: apiReturnType,
                            swiftReturnType: outParams.returnTypeWithOutParams(apiReturnType: apiReturnType))
        }
    }

    var declLine: String {
        switch style {
        case .normal(_, .some(let returnType)):
            if db.isVar {
                return "public var \(db.varName): \(returnType) {"
            }
            return "public func \(db.funcName)(\(params.functionParams)) -> \(returnType) {"

        case .normal(_, .none):
            precondition(!db.isVar)
            return "public func \(db.funcName)(\(params.functionParams)) {"

        case .callReturn(let type):
            precondition(!db.isVar)
            let done = "completion: @escaping (\(type)?) -> Void"
            return "public func \(db.funcName)(\(params.functionParams.commaAppend(done))) {"
        }
    }

    /// Expression returning the Swift type of the API
    var callExpression: SwiftExpr {
        let paramList = params.isEmpty ? "" : ", \(params.callParams)"
        let steamCall = SwiftExpr("\(db.flatName)(interface\(paramList))")
        return steamCall.asCast(to: swiftApiCast)
    }

    enum ReturnSyntax {
        case implicit // <steam API call> } (end of function)
        case explicit // return <steam API call>
        case intermediate // rc = <steam API call> then more stuff
    }

    var returnSyntax: ReturnSyntax {
        switch style {
        case .callReturn, .normal(_, nil):
            return .implicit
        case .normal:
            if !outParams.isEmpty {
                return .intermediate
            }
            if params.preCallLines.isEmpty {
                return .implicit
            }
            return .explicit
        }
    }

    var callLines: [String] {
        switch style {
        case .callReturn:
            return [
                "let rc = \(callExpression)",
                "SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))"
            ]
        case .normal(let apiReturn, _):
            switch (returnSyntax, apiReturn == nil) {
            case (.implicit, _),
                 (.intermediate, true):
                return [callExpression.expr]
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
              case let .normal(apiReturnType, _) = style,
              let expr = outParams.returnValueWithOutParams(apiReturnType: apiReturnType) else {
            return []
        }
        guard let testExpr = db.outParamIffRc else {
            return ["return \(expr)"]
        }
        guard let elseExpr = outParams.returnValueWithDummyOutParams(apiReturnType: apiReturnType) else {
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
        let comment = style.callReturnType.flatMap { _ in "\(baseComment), callback" } ?? baseComment
        let attrLine = db.discardableResult ? ["@discardableResult"] : []
        return [comment] + attrLine + [declLine] + bodyLines.indented(1) + ["}"]
    }

    /// Asynchronous version of the entire function, [] for functions without an async version
    func asyncDecl(comment: String) -> [String] {
        guard let type = style.callReturnType else {
            return []
        }
        return [
            "",
            "\(comment), async",
            "public func \(db.funcName)(\(params.functionParams)) async -> \(type)? {",
            "    await withUnsafeContinuation {",
            "        \(db.funcName)(\(params.asyncForwardingParams.commaAppend("completion: $0.resume")))",
            "    }",
            "}",
        ]
    }

    /// All the Swift code for this API method
    func decl(comment: String) -> [String] {
        syncDecl(comment: comment) + asyncDecl(comment: comment)
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
    var funcName: SwiftExpr {
        let base = name.swiftName
        guard let overloaded = flatName.name.re_match(#"Get.*(Float|Double|Int)(?:\d\d)?$"#) else {
            return base
        }
        return "\(base)\(overloaded[1])"
    }

    var varName: SwiftExpr {
        SteamName(name.name.dropFirst(3)).swiftName
    }

    func generate(context: SteamType) -> String {
        let swiftMethod = SteamMethod(self)
        let comment = "/// Steamworks `\(context)::\(name)()`"
        return swiftMethod.decl(comment: comment).indented(1).joined(separator: "\n")
    }
}
