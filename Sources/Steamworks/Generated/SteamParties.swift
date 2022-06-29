//
//  SteamParties.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamParties`](https://partner.steamgames.com/doc/api/ISteamParties)
///
/// Access via `SteamAPI.parties`.
public struct SteamParties {
    var interface: UnsafeMutablePointer<ISteamParties> {
        SteamAPI_SteamParties_v002()
    }

    init() {
    }

    /// Steamworks `ISteamParties::CancelReservation()`
    public func cancelReservation(beacon: PartyBeaconID, user: SteamID) {
        SteamAPI_ISteamParties_CancelReservation(interface, PartyBeaconID_t(beacon), UInt64(user))
    }

    /// Steamworks `ISteamParties::ChangeNumOpenSlots()`, callback
    public func changeNumOpenSlots(beacon: PartyBeaconID, openSlots: Int, completion: @escaping (ChangeNumOpenSlotsCallback?) -> Void) {
        let rc = SteamAPI_ISteamParties_ChangeNumOpenSlots(interface, PartyBeaconID_t(beacon), uint32(openSlots))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamParties::ChangeNumOpenSlots()`, async
    public func changeNumOpenSlots(beacon: PartyBeaconID, openSlots: Int) async -> ChangeNumOpenSlotsCallback? {
        await withUnsafeContinuation {
            changeNumOpenSlots(beacon: beacon, openSlots: openSlots, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamParties::CreateBeacon()`, callback
    public func createBeacon(openSlots: Int, beaconLocation: SteamPartyBeaconLocation, connectString: String, metadata: String, completion: @escaping (CreateBeaconCallback?) -> Void) {
        let rc = CSteamAPI_ISteamParties_CreateBeacon(interface, uint32(openSlots), SteamPartyBeaconLocation_t(beaconLocation), connectString, metadata)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamParties::CreateBeacon()`, async
    public func createBeacon(openSlots: Int, beaconLocation: SteamPartyBeaconLocation, connectString: String, metadata: String) async -> CreateBeaconCallback? {
        await withUnsafeContinuation {
            createBeacon(openSlots: openSlots, beaconLocation: beaconLocation, connectString: connectString, metadata: metadata, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamParties::DestroyBeacon()`
    @discardableResult
    public func destroyBeacon(beacon: PartyBeaconID) -> Bool {
        SteamAPI_ISteamParties_DestroyBeacon(interface, PartyBeaconID_t(beacon))
    }

    /// Steamworks `ISteamParties::GetAvailableBeaconLocations()`
    public func getAvailableBeaconLocations(maxNumLocations: Int) -> (rc: Bool, locationList: [SteamPartyBeaconLocation]) {
        let tmpLocationList = SteamOutArray<SteamPartyBeaconLocation_t>(maxNumLocations)
        let rc = SteamAPI_ISteamParties_GetAvailableBeaconLocations(interface, tmpLocationList.steamArray, uint32(maxNumLocations))
        return (rc: rc, locationList: tmpLocationList.swiftArray())
    }

    /// Steamworks `ISteamParties::GetBeaconByIndex()`
    public func getBeaconByIndex(index: Int) -> PartyBeaconID {
        PartyBeaconID(SteamAPI_ISteamParties_GetBeaconByIndex(interface, uint32(index)))
    }

    /// Steamworks `ISteamParties::GetBeaconDetails()`
    public func getBeaconDetails(beaconID: PartyBeaconID, metadataSize: Int) -> (rc: Bool, beaconOwner: SteamID, location: SteamPartyBeaconLocation, metadata: String) {
        var tmpBeaconOwner = CSteamID()
        var tmpLocation = SteamPartyBeaconLocation_t()
        let tmpMetadata = SteamString(length: metadataSize)
        let rc = SteamAPI_ISteamParties_GetBeaconDetails(interface, PartyBeaconID_t(beaconID), &tmpBeaconOwner, &tmpLocation, tmpMetadata.charBuffer, CInt(metadataSize))
        return (rc: rc, beaconOwner: SteamID(tmpBeaconOwner), location: SteamPartyBeaconLocation(tmpLocation), metadata: tmpMetadata.swiftString)
    }

    /// Steamworks `ISteamParties::GetBeaconLocationData()`
    public func getBeaconLocationData(beaconLocation: SteamPartyBeaconLocation, data: SteamPartyBeaconLocationData, dataStringOutSize: Int) -> (rc: Bool, dataString: String) {
        let tmpDataString = SteamString(length: dataStringOutSize)
        let rc = SteamAPI_ISteamParties_GetBeaconLocationData(interface, SteamPartyBeaconLocation_t(beaconLocation), ESteamPartyBeaconLocationData(data), tmpDataString.charBuffer, CInt(dataStringOutSize))
        return (rc: rc, dataString: tmpDataString.swiftString)
    }

    /// Steamworks `ISteamParties::GetNumActiveBeacons()`
    public func getNumActiveBeacons() -> Int {
        Int(SteamAPI_ISteamParties_GetNumActiveBeacons(interface))
    }

    /// Steamworks `ISteamParties::GetNumAvailableBeaconLocations()`
    public func getNumAvailableBeaconLocations() -> (rc: Bool, numLocations: Int) {
        var tmpNumLocations = uint32()
        let rc = SteamAPI_ISteamParties_GetNumAvailableBeaconLocations(interface, &tmpNumLocations)
        return (rc: rc, numLocations: Int(tmpNumLocations))
    }

    /// Steamworks `ISteamParties::JoinParty()`, callback
    public func joinParty(beaconID: PartyBeaconID, completion: @escaping (JoinPartyCallback?) -> Void) {
        let rc = SteamAPI_ISteamParties_JoinParty(interface, PartyBeaconID_t(beaconID))
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamParties::JoinParty()`, async
    public func joinParty(beaconID: PartyBeaconID) async -> JoinPartyCallback? {
        await withUnsafeContinuation {
            joinParty(beaconID: beaconID, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamParties::OnReservationCompleted()`
    public func onReservationCompleted(beacon: PartyBeaconID, user: SteamID) {
        SteamAPI_ISteamParties_OnReservationCompleted(interface, PartyBeaconID_t(beacon), UInt64(user))
    }
}
