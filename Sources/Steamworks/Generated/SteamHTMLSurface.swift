//
//  SteamHTMLSurface.swift
//  Steamworks
//
//  Licensed under MIT (https://github.com/johnfairh/swift-steamworks/blob/main/LICENSE
//
//  This file is generated code: any edits will be overwritten.

@_implementationOnly import CSteamworks

/// Steamworks [`ISteamHTMLSurface`](https://partner.steamgames.com/doc/api/ISteamHTMLSurface)
///
/// Access via `SteamAPI.htmlSurface`.
public struct SteamHTMLSurface {
    var interface: UnsafeMutablePointer<ISteamHTMLSurface> {
        SteamAPI_SteamHTMLSurface_v005()
    }

    init() {
    }

    /// Steamworks `ISteamHTMLSurface::AddHeader()`
    public func addHeader(browserHandle: HHTMLBrowser, key: String, value: String) {
        SteamAPI_ISteamHTMLSurface_AddHeader(interface, CSteamworks.HHTMLBrowser(browserHandle), key, value)
    }

    /// Steamworks `ISteamHTMLSurface::AllowStartRequest()`
    public func allowStartRequest(browserHandle: HHTMLBrowser, allowed: Bool) {
        SteamAPI_ISteamHTMLSurface_AllowStartRequest(interface, CSteamworks.HHTMLBrowser(browserHandle), allowed)
    }

    /// Steamworks `ISteamHTMLSurface::CopyToClipboard()`
    public func copyToClipboard(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_CopyToClipboard(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::CreateBrowser()`, callback
    public func createBrowser(userAgent: String, userCSS: String, completion: @escaping (HTMLBrowserReady?) -> Void) {
        let rc = SteamAPI_ISteamHTMLSurface_CreateBrowser(interface, userAgent, userCSS)
        SteamBaseAPI.CallResults.shared.add(callID: rc, rawClient: SteamBaseAPI.makeRaw(completion))
    }

    /// Steamworks `ISteamHTMLSurface::CreateBrowser()`, async
    func createBrowser(userAgent: String, userCSS: String) async -> HTMLBrowserReady? {
        await withUnsafeContinuation {
            createBrowser(userAgent: userAgent, userCSS: userCSS, completion: $0.resume)
        }
    }

    /// Steamworks `ISteamHTMLSurface::ExecuteJavascript()`
    public func executeJavascript(browserHandle: HHTMLBrowser, script: String) {
        SteamAPI_ISteamHTMLSurface_ExecuteJavascript(interface, CSteamworks.HHTMLBrowser(browserHandle), script)
    }

    /// Steamworks `ISteamHTMLSurface::FileLoadDialogResponse()`
    public func fileLoadDialogResponse(browserHandle: HHTMLBrowser, selectedFiles: [String]) {
        SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse(interface, CSteamworks.HHTMLBrowser(browserHandle), SteamStringArray(selectedFiles).cStrings)
    }

    /// Steamworks `ISteamHTMLSurface::Find()`
    public func find(browserHandle: HHTMLBrowser, searchStr: String, currentlyInFind: Bool, reverse: Bool) {
        SteamAPI_ISteamHTMLSurface_Find(interface, CSteamworks.HHTMLBrowser(browserHandle), searchStr, currentlyInFind, reverse)
    }

    /// Steamworks `ISteamHTMLSurface::GetLinkAtPosition()`
    public func getLinkAtPosition(browserHandle: HHTMLBrowser, x: Int, y: Int) {
        SteamAPI_ISteamHTMLSurface_GetLinkAtPosition(interface, CSteamworks.HHTMLBrowser(browserHandle), Int32(x), Int32(y))
    }

    /// Steamworks `ISteamHTMLSurface::GoBack()`
    public func goBack(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_GoBack(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::GoForward()`
    public func goForward(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_GoForward(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::Init()`
    public func `init`() -> Bool {
        SteamAPI_ISteamHTMLSurface_Init(interface)
    }

    /// Steamworks `ISteamHTMLSurface::JSDialogResponse()`
    public func jsDialogResponse(browserHandle: HHTMLBrowser, result: Bool) {
        SteamAPI_ISteamHTMLSurface_JSDialogResponse(interface, CSteamworks.HHTMLBrowser(browserHandle), result)
    }

    /// Steamworks `ISteamHTMLSurface::KeyChar()`
    public func keyChar(browserHandle: HHTMLBrowser, unicodeChar: Int, htmlKeyModifiers: SteamHTMLSurface.EHTMLKeyModifiers) {
        SteamAPI_ISteamHTMLSurface_KeyChar(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(unicodeChar), Int32(htmlKeyModifiers))
    }

    /// Steamworks `ISteamHTMLSurface::KeyDown()`
    public func keyDown(browserHandle: HHTMLBrowser, nativeKeyCode: Int, htmlKeyModifiers: SteamHTMLSurface.EHTMLKeyModifiers, isSystemKey: Bool) {
        SteamAPI_ISteamHTMLSurface_KeyDown(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(nativeKeyCode), Int32(htmlKeyModifiers), isSystemKey)
    }

    /// Steamworks `ISteamHTMLSurface::KeyUp()`
    public func keyUp(browserHandle: HHTMLBrowser, nativeKeyCode: Int, htmlKeyModifiers: SteamHTMLSurface.EHTMLKeyModifiers) {
        SteamAPI_ISteamHTMLSurface_KeyUp(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(nativeKeyCode), Int32(htmlKeyModifiers))
    }

    /// Steamworks `ISteamHTMLSurface::LoadURL()`
    public func loadURL(browserHandle: HHTMLBrowser, url: String, postData: String) {
        SteamAPI_ISteamHTMLSurface_LoadURL(interface, CSteamworks.HHTMLBrowser(browserHandle), url, postData)
    }

    /// Steamworks `ISteamHTMLSurface::MouseDoubleClick()`
    public func mouseDoubleClick(browserHandle: HHTMLBrowser, mouseButton: SteamHTMLSurface.EHTMLMouseButton) {
        SteamAPI_ISteamHTMLSurface_MouseDoubleClick(interface, CSteamworks.HHTMLBrowser(browserHandle), ISteamHTMLSurface.EHTMLMouseButton(mouseButton))
    }

    /// Steamworks `ISteamHTMLSurface::MouseDown()`
    public func mouseDown(browserHandle: HHTMLBrowser, mouseButton: SteamHTMLSurface.EHTMLMouseButton) {
        SteamAPI_ISteamHTMLSurface_MouseDown(interface, CSteamworks.HHTMLBrowser(browserHandle), ISteamHTMLSurface.EHTMLMouseButton(mouseButton))
    }

    /// Steamworks `ISteamHTMLSurface::MouseMove()`
    public func mouseMove(browserHandle: HHTMLBrowser, x: Int, y: Int) {
        SteamAPI_ISteamHTMLSurface_MouseMove(interface, CSteamworks.HHTMLBrowser(browserHandle), Int32(x), Int32(y))
    }

    /// Steamworks `ISteamHTMLSurface::MouseUp()`
    public func mouseUp(browserHandle: HHTMLBrowser, mouseButton: SteamHTMLSurface.EHTMLMouseButton) {
        SteamAPI_ISteamHTMLSurface_MouseUp(interface, CSteamworks.HHTMLBrowser(browserHandle), ISteamHTMLSurface.EHTMLMouseButton(mouseButton))
    }

    /// Steamworks `ISteamHTMLSurface::MouseWheel()`
    public func mouseWheel(browserHandle: HHTMLBrowser, delta: Int) {
        SteamAPI_ISteamHTMLSurface_MouseWheel(interface, CSteamworks.HHTMLBrowser(browserHandle), int32(delta))
    }

    /// Steamworks `ISteamHTMLSurface::OpenDeveloperTools()`
    public func openDeveloperTools(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_OpenDeveloperTools(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::PasteFromClipboard()`
    public func pasteFromClipboard(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_PasteFromClipboard(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::Reload()`
    public func reload(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_Reload(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::RemoveBrowser()`
    public func removeBrowser(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_RemoveBrowser(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::SetBackgroundMode()`
    public func setBackgroundMode(browserHandle: HHTMLBrowser, backgroundMode: Bool) {
        SteamAPI_ISteamHTMLSurface_SetBackgroundMode(interface, CSteamworks.HHTMLBrowser(browserHandle), backgroundMode)
    }

    /// Steamworks `ISteamHTMLSurface::SetCookie()`
    public func setCookie(hostname: String, key: String, value: String, path: String, expires: RTime32, secure: Bool, httpOnly: Bool) {
        SteamAPI_ISteamHTMLSurface_SetCookie(interface, hostname, key, value, path, CSteamworks.RTime32(expires), secure, httpOnly)
    }

    /// Steamworks `ISteamHTMLSurface::SetDPIScalingFactor()`
    public func setDPIScalingFactor(browserHandle: HHTMLBrowser, dpiScaling: Float) {
        SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor(interface, CSteamworks.HHTMLBrowser(browserHandle), dpiScaling)
    }

    /// Steamworks `ISteamHTMLSurface::SetHorizontalScroll()`
    public func setHorizontalScroll(browserHandle: HHTMLBrowser, absolutePixelScroll: Int) {
        SteamAPI_ISteamHTMLSurface_SetHorizontalScroll(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(absolutePixelScroll))
    }

    /// Steamworks `ISteamHTMLSurface::SetKeyFocus()`
    public func setKeyFocus(browserHandle: HHTMLBrowser, hasKeyFocus: Bool) {
        SteamAPI_ISteamHTMLSurface_SetKeyFocus(interface, CSteamworks.HHTMLBrowser(browserHandle), hasKeyFocus)
    }

    /// Steamworks `ISteamHTMLSurface::SetPageScaleFactor()`
    public func setPageScaleFactor(browserHandle: HHTMLBrowser, zoom: Float, pointX: Int, pointY: Int) {
        SteamAPI_ISteamHTMLSurface_SetPageScaleFactor(interface, CSteamworks.HHTMLBrowser(browserHandle), zoom, Int32(pointX), Int32(pointY))
    }

    /// Steamworks `ISteamHTMLSurface::SetSize()`
    public func setSize(browserHandle: HHTMLBrowser, width: Int, height: Int) {
        SteamAPI_ISteamHTMLSurface_SetSize(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(width), uint32(height))
    }

    /// Steamworks `ISteamHTMLSurface::SetVerticalScroll()`
    public func setVerticalScroll(browserHandle: HHTMLBrowser, absolutePixelScroll: Int) {
        SteamAPI_ISteamHTMLSurface_SetVerticalScroll(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(absolutePixelScroll))
    }

    /// Steamworks `ISteamHTMLSurface::Shutdown()`
    public func shutdown() -> Bool {
        SteamAPI_ISteamHTMLSurface_Shutdown(interface)
    }

    /// Steamworks `ISteamHTMLSurface::StopFind()`
    public func stopFind(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_StopFind(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::StopLoad()`
    public func stopLoad(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_StopLoad(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::ViewSource()`
    public func viewSource(browserHandle: HHTMLBrowser) {
        SteamAPI_ISteamHTMLSurface_ViewSource(interface, CSteamworks.HHTMLBrowser(browserHandle))
    }

    /// Steamworks `ISteamHTMLSurface::EHTMLKeyModifiers`
    public struct SteamHTMLSurface.EHTMLKeyModifiers: OptionSet {
    /// The flags value.
    public let rawValue: UInt32
    /// Create a new instance with `rawValue` flags set.
    public init(rawValue: UInt32) { self.rawValue = rawValue }
        /// Steamworks `k_eHTMLKeyModifier_None`
        public static let none = SteamHTMLSurface.EHTMLKeyModifiers([])
        /// Steamworks `k_eHTMLKeyModifier_AltDown`
        public static let altDown = SteamHTMLSurface.EHTMLKeyModifiers(rawValue: 1)
        /// Steamworks `k_eHTMLKeyModifier_CtrlDown`
        public static let ctrlDown = SteamHTMLSurface.EHTMLKeyModifiers(rawValue: 2)
        /// Steamworks `k_eHTMLKeyModifier_ShiftDown`
        public static let shiftDown = SteamHTMLSurface.EHTMLKeyModifiers(rawValue: 4)
    }

    /// Steamworks `ISteamHTMLSurface::EHTMLMouseButton`
    public enum SteamHTMLSurface.EHTMLMouseButton: UInt32 {
        /// Steamworks `eHTMLMouseButton_Left`
        case left = 0
        /// Steamworks `eHTMLMouseButton_Right`
        case right = 1
        /// Steamworks `eHTMLMouseButton_Middle`
        case middle = 2
        /// Some undocumented value
        case unrepresentedInSwift = 3
    }

    /// Steamworks `ISteamHTMLSurface::EMouseCursor`
    public enum SteamHTMLSurface.EMouseCursor: UInt32 {
        /// Steamworks `dc_user`
        case user = 0
        /// Steamworks `dc_none`
        case none = 1
        /// Steamworks `dc_arrow`
        case arrow = 2
        /// Steamworks `dc_ibeam`
        case ibeam = 3
        /// Steamworks `dc_hourglass`
        case hourglass = 4
        /// Steamworks `dc_waitarrow`
        case waitarrow = 5
        /// Steamworks `dc_crosshair`
        case crosshair = 6
        /// Steamworks `dc_up`
        case up = 7
        /// Steamworks `dc_sizenw`
        case sizenw = 8
        /// Steamworks `dc_sizese`
        case sizese = 9
        /// Steamworks `dc_sizene`
        case sizene = 10
        /// Steamworks `dc_sizesw`
        case sizesw = 11
        /// Steamworks `dc_sizew`
        case sizew = 12
        /// Steamworks `dc_sizee`
        case sizee = 13
        /// Steamworks `dc_sizen`
        case sizen = 14
        /// Steamworks `dc_sizes`
        case sizes = 15
        /// Steamworks `dc_sizewe`
        case sizewe = 16
        /// Steamworks `dc_sizens`
        case sizens = 17
        /// Steamworks `dc_sizeall`
        case sizeall = 18
        /// Steamworks `dc_no`
        case no = 19
        /// Steamworks `dc_hand`
        case hand = 20
        /// Steamworks `dc_blank`
        case blank = 21
        /// Steamworks `dc_middle_pan`
        case middlepan = 22
        /// Steamworks `dc_north_pan`
        case northpan = 23
        /// Steamworks `dc_north_east_pan`
        case northeastpan = 24
        /// Steamworks `dc_east_pan`
        case eastpan = 25
        /// Steamworks `dc_south_east_pan`
        case southeastpan = 26
        /// Steamworks `dc_south_pan`
        case southpan = 27
        /// Steamworks `dc_south_west_pan`
        case southwestpan = 28
        /// Steamworks `dc_west_pan`
        case westpan = 29
        /// Steamworks `dc_north_west_pan`
        case northwestpan = 30
        /// Steamworks `dc_alias`
        case alias = 31
        /// Steamworks `dc_cell`
        case cell = 32
        /// Steamworks `dc_colresize`
        case colresize = 33
        /// Steamworks `dc_copycur`
        case copycur = 34
        /// Steamworks `dc_verticaltext`
        case verticaltext = 35
        /// Steamworks `dc_rowresize`
        case rowresize = 36
        /// Steamworks `dc_zoomin`
        case zoomin = 37
        /// Steamworks `dc_zoomout`
        case zoomout = 38
        /// Steamworks `dc_help`
        case help = 39
        /// Steamworks `dc_custom`
        case custom = 40
        /// Steamworks `dc_last`
        case last = 41
        /// Some undocumented value
        case unrepresentedInSwift = 42
    }
}

extension ISteamHTMLSurface.EHTMLKeyModifiers: RawConvertible { typealias From = SteamHTMLSurface.SteamHTMLSurface.EHTMLKeyModifiers }
extension SteamHTMLSurface.SteamHTMLSurface.EHTMLKeyModifiers: RawConvertible { typealias From = ISteamHTMLSurface.EHTMLKeyModifiers }

extension ISteamHTMLSurface.EHTMLMouseButton: RawConvertible { typealias From = SteamHTMLSurface.SteamHTMLSurface.EHTMLMouseButton }
extension SteamHTMLSurface.SteamHTMLSurface.EHTMLMouseButton: EnumWithUnrepresented { typealias From = ISteamHTMLSurface.EHTMLMouseButton }

extension ISteamHTMLSurface.EMouseCursor: RawConvertible { typealias From = SteamHTMLSurface.SteamHTMLSurface.EMouseCursor }
extension SteamHTMLSurface.SteamHTMLSurface.EMouseCursor: EnumWithUnrepresented { typealias From = ISteamHTMLSurface.EMouseCursor }
