//
//  SteamEncryptedAppTicket.swift
//  SteamworksEncryptedAppTicket
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

@_implementationOnly import CSteamworks
@_implementationOnly import CSteamworksEncryptedAppTicket
import Steamworks

/// Wrap up the `SteamEncryptedAppTicket` functions.
///
/// See [Encrypted Application Tickets](https://partner.steamgames.com/doc/features/auth#encryptedapptickets)
public struct SteamEncryptedAppTicket: Sendable {
    /// Expected length in bytes of the encryption key
    public static let symmetricKeyLen = Int(k_nSteamEncryptedAppTicketSymmetricKeyLen)

    /// The decrypted ticket
    private let decrypted: [UInt8]

    /// So, all the getters here are declared taking the decrypted ticket as `uint8 *`with no `const`... the author
    /// manages to use `const` elsewhere but not here -- I'm betting it's just a mistake rather than the ticket containing
    /// some record of what's done to it, or something.
    private func withTicket<T>(call: (UnsafeMutablePointer<UInt8>) -> T) -> T {
        decrypted.withContiguousStorageIfAvailable { ubp in
            call(.init(mutating: ubp.baseAddress!))
        }!
    }

    /// Using the secret key, attempt to decrypt an encrypted app ticket previously returned by
    /// `ISteamUser::GetEncryptedAppTicket()`.
    ///
    /// Returns `nil` if the Steam API fails or the key isn't long enough.
    ///
    /// Steamworks `SteamEncryptedAppTicket_BDecryptTicket()`.
    public init?(encryptedBytes: [UInt8], key: [UInt8]) {
        guard key.count >= Self.symmetricKeyLen else {
            return nil
        }

        var rc = false
        decrypted = .init(unsafeUninitializedCapacity: encryptedBytes.count) { buf, size in
            var decryptedSize = UInt32(encryptedBytes.count)
            rc = SteamEncryptedAppTicket_BDecryptTicket(
                encryptedBytes,
                UInt32(encryptedBytes.count),
                buf.baseAddress,
                &decryptedSize,
                key,
                Int32(key.count))
            size = Int(decryptedSize)
        }
        if !rc {
            return nil
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_BIsTicketForApp()`
    public func isFor(appID: AppID) -> Bool {
        withTicket { ticket in
            SteamEncryptedAppTicket_BIsTicketForApp(ticket, UInt32(decrypted.count), appID.value)
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_GetTicketIssueTime()`
    public var issueTime: Steamworks.RTime32 {
        withTicket { ticket in
            .init(SteamEncryptedAppTicket_GetTicketIssueTime(ticket, UInt32(decrypted.count)))
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_GetTicketSteamID()`
    public var steamID: SteamID {
        withTicket { ticket in
            var cSteamID = CSteamID()
            SteamEncryptedAppTicket_GetTicketSteamID(ticket, UInt32(decrypted.count), &cSteamID)
            return SteamID(cSteamID.ConvertToUint64())
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_GetTicketAppID()`
    public var appID: AppID {
        withTicket { ticket in
            AppID(SteamEncryptedAppTicket_GetTicketAppID(ticket, UInt32(decrypted.count)))
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_BUserOwnsAppInTicket()`
    public func userOwns(app: AppID) -> Bool {
        withTicket { ticket in
            SteamEncryptedAppTicket_BUserOwnsAppInTicket(ticket, UInt32(decrypted.count), app.value)
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_BUserIsVacBanned()`
    public var userIsVacBanned: Bool {
        withTicket { ticket in
            SteamEncryptedAppTicket_BUserIsVacBanned(ticket, UInt32(decrypted.count))
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_GetUserVariableData()`
    public var userVariableData: [UInt8]? {
        withTicket { ticket -> [UInt8]? in
            var userDataSize = UInt32(0)
            guard let userDataPtr = SteamEncryptedAppTicket_GetUserVariableData(ticket, UInt32(decrypted.count), &userDataSize),
                  userDataSize > 0 else {
                return nil
            }
            return Array(UnsafeBufferPointer(start: userDataPtr, count: Int(userDataSize)))
        }
    }
}

#if os(Windows)

/// APIs in the header file that are not in the macOS dylib (1.52) but are in the Windows DLL.
extension SteamEncryptedAppTicket {
    /// Steamworks `SteamEncryptedAppTicket_BGetAppDefinedValue()`
    public var appDefinedValue: Int? {
        withTicket { ticket in
            var val = UInt32(0)
            let rc = SteamEncryptedAppTicket_BGetAppDefinedValue(ticket, UInt32(decrypted.count), &val)
            return rc ? Int(val) : nil
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_BIsTicketSigned()`
    public func isSigned(pubRSAKey: [UInt8]) -> Bool {
        withTicket { ticket in
            SteamEncryptedAppTicket_BIsTicketSigned(ticket, UInt32(decrypted.count), pubRSAKey, UInt32(pubRSAKey.count))
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_BIsLicenseBorrowed()`
    public var isLicenseBorrowed: Bool {
        withTicket { ticket in
            SteamEncryptedAppTicket_BIsLicenseBorrowed(ticket, UInt32(decrypted.count))
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_BIsLicenseTemporary()`
    public var isLicenseTemporary: Bool {
        withTicket { ticket in
            SteamEncryptedAppTicket_BIsLicenseTemporary(ticket, UInt32(decrypted.count))
        }
    }
}

#endif // Windows
