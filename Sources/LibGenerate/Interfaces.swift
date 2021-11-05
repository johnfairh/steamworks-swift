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
            $0.generate(context: swiftName)
        }
        return declaration + methods.joined(separator: "\n\n") + "\n}"
    }
}

extension SteamAPI.Interface.Method {
    func generate(context: String) -> String {
        ""
    }
}
