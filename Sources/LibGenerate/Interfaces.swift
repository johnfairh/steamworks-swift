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
    let json: JSON

    init(io: IO, json: JSON) {
        self.io = io
        self.json = json
    }

    func generate() throws {
        try json.api.interfaces.forEach { interface in
            guard interface.classname == "ISteamFriends" else {
                return
            }
            let swiftName = interface.classname.asSwiftTypeName
            try io.write(fileName: "\(swiftName)+Methods.swift",
                         contents: interface.generate(context: swiftName))
        }
    }
}

extension SteamAPI.Interface {
    func generate(context: String) -> String {
        let swiftName = classname.asSwiftTypeName

        let declaration = """
                          // MARK: Interface methods
                          public extension \(swiftName) {

                          """
        let methods = methods.map {
            $0.generate(context: classname)
        }
        return declaration + methods.joined(separator: "\n\n") + "\n}"
    }
}

extension SteamAPI.Interface.Method {
    var isVar: Bool {
        params.count == 0 && methodname.starts(with: "Get")
    }

    var funcName: String {
        methodname.asSwiftIdentifier
    }

    var varName: String {
        String(methodname.dropFirst(3)).asSwiftIdentifier
    }

    func generate(context: String) -> String {
        let comment = "    /// Steamworks `\(context)::\(methodname)()`"
        let swiftReturnType = returntype == "void" ? nil : returntype.asSwiftTypeName
        let decl: String
        if isVar {
            decl = "    var \(varName): \(swiftReturnType!) {"
            precondition(callresult == nil)
        } else {
            let args = params.map { param in
                "\(param.paramname): \(param.type.asSwiftTypeName)"
            }.joined(separator: ", ")
            let extraArg: String
            let returnsDecl: String
            if let callresult = callresult {
                returnsDecl = ""
                extraArg = ", completion: @escaping (\(callresult.asSwiftTypeName)) -> Void"
            } else {
                returnsDecl = swiftReturnType.flatMap { " -> \($0)" } ?? ""
                extraArg = ""
            }
            decl = "    func \(funcName)(\(args)\(extraArg))\(returnsDecl) {"
        }

        let args = params.map { param in
            let inboundCast = param.type.asSwiftTypeForPassingIntoSteamworks
            return ", \(param.paramname.asCast(to: inboundCast))"
        }.joined()
        let call = "\(methodname_flat)(interface\(args))"
        let resultExpr = call.asCast(to: returntype.asSwiftTypeForPassingOutOfSteamworks)
        var lines = [String]()
        if swiftReturnType == nil {
            lines.append("        " + resultExpr)
        } else {
            lines.append("        let rc = \(resultExpr)")
            if callresult != nil {
                lines.append("        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))")
            } else {
                lines.append("        return rc")
            }
        }

        return ([comment, decl] + lines + ["    }"]).joined(separator: "\n")
    }
}

extension String {
    func asCast(to: String?) -> String {
        to.flatMap { "\($0)(\(self))" } ?? self
    }
}
