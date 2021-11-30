//
//  SteamEncryptedAppTicket.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//

@_implementationOnly import CSteamworks

extension SteamUser {
    /// Swift-friendly wrapper to call `getEncryptedAppTicket(...)`.  You still have to know
    /// the max size of the encrypted ticket.
    public func getEncryptedAppTicket(maxSize: Int) -> [UInt8]? {
        var rc = false
        let array: [UInt8] = .init(unsafeUninitializedCapacity: maxSize) { buf, count in
            var actualSize = 0
            if let baseAddress = buf.baseAddress {
                rc = getEncryptedAppTicket(ticket: baseAddress, maxTicketSize: maxSize, ticketSize: &actualSize)
            }
            count = actualSize
        }
        return rc ? array : nil
    }
}

/// Wrap up the `SteamEncryptedAppTicket` functions.
///
/// See [Encrypted Application Tickets](https://partner.steamgames.com/doc/features/auth#encryptedapptickets)
public final class SteamEncryptedAppTicket {
    /// Expected length in bytes of the encryption key
    public static var symmetricKeyLen = Int(k_nSteamEncryptedAppTicketSymmetricKeyLen)

    /// The decrypted ticket
    private var decrypted: [UInt8]

    /// Using the secret key, attempt to decrypt an encrypted app ticket previously returned by
    /// `ISteamUser::GetEncryptedAppTicket()`.
    ///
    /// Returns `nil` if the Steam API fails or the key isn't long enough.
    ///
    /// Steamworks `SteamEncryptedAppTicket_BDecryptTicket()`.
    public init?(ticketEncrypted: [UInt8], key: [UInt8]) {
        guard key.count >= Self.symmetricKeyLen else {
            return nil
        }

        var rc = false
        decrypted = .init(unsafeUninitializedCapacity: ticketEncrypted.count) { buf, size in
            var decryptedSize = UInt32(0)
            rc = SteamEncryptedAppTicket_BDecryptTicket(
                ticketEncrypted,
                UInt32(ticketEncrypted.count),
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
        SteamEncryptedAppTicket_BIsTicketForApp(&decrypted, UInt32(decrypted.count), AppId_t(appID));
    }

    /// Steamworks `SteamEncryptedAppTicket_GetTicketIssueTime()`
    public var issueTime: RTime32 {
        RTime32(SteamEncryptedAppTicket_GetTicketIssueTime(&decrypted, UInt32(decrypted.count)))
    }

    /// Steamworks `SteamEncryptedAppTicket_GetTicketSteamID()`
    public var steamID: SteamID {
        var cSteamID = CSteamID()
        SteamEncryptedAppTicket_GetTicketSteamID(&decrypted, UInt32(decrypted.count), &cSteamID)
        return SteamID(cSteamID)
    }

    /// Steamworks `SteamEncryptedAppTicket_GetTicketAppID()`
    public var appID: AppID {
        AppID(SteamEncryptedAppTicket_GetTicketAppID(&decrypted, UInt32(decrypted.count)))
    }

    /// Steamworks `SteamEncryptedAppTicket_BUserOwnsAppInTicket()`
    public func userOwns(app: AppID) -> Bool {
        SteamEncryptedAppTicket_BUserOwnsAppInTicket(&decrypted, UInt32(decrypted.count), AppId_t(app))
    }

    /// Steamworks `SteamEncryptedAppTicket_BUserIsVacBanned()`
    public var userIsVacBanned: Bool {
        SteamEncryptedAppTicket_BUserIsVacBanned(&decrypted, UInt32(decrypted.count))
    }

    /// Steamworks `SteamEncryptedAppTicket_BGetAppDefinedValue()`
    public var appDefinedValue: Int? {
        var val = UInt32(0)
        let rc = SteamEncryptedAppTicket_BGetAppDefinedValue(&decrypted, UInt32(decrypted.count), &val)
        return rc ? Int(val) : nil
    }

    /// Steamworks `SteamEncryptedAppTicket_GetUserVariableData()`
    public var userVariableData: [UInt8]? {
        var userDataSize = UInt32(0)
        guard let userDataPtr = SteamEncryptedAppTicket_GetUserVariableData(&decrypted, UInt32(decrypted.count), &userDataSize),
              userDataSize > 0 else {
            return nil
        }
        return Array<UInt8>(unsafeUninitializedCapacity: Int(userDataSize)) { buf, done in
            buf.baseAddress!.initialize(from: userDataPtr, count: Int(userDataSize))
            done = Int(userDataSize)
        }
    }

    /// Steamworks `SteamEncryptedAppTicket_BIsTicketSigned()`
    public func isSigned(pubRSAKey: [UInt8]) -> Bool {
        SteamEncryptedAppTicket_BIsTicketSigned(&decrypted, UInt32(decrypted.count), pubRSAKey, UInt32(pubRSAKey.count))
    }

    /// Steamworks `SteamEncryptedAppTicket_BIsLicenseBorrowed()`
    public var isLicenseBorrowed: Bool {
        SteamEncryptedAppTicket_BIsLicenseBorrowed(&decrypted, UInt32(decrypted.count))
    }

    /// Steamworks `SteamEncryptedAppTicket_BIsLicenseTemporary()`
    public var isLicenseTemporary: Bool {
        SteamEncryptedAppTicket_BIsLicenseTemporary(&decrypted, UInt32(decrypted.count))
    }
}
