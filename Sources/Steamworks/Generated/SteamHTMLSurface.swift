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
    public func createBrowser(userAgent: String, userCSS: String) async -> HTMLBrowserReady? {
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
        let tmpSelectedFiles = StringArray(selectedFiles)
        defer { tmpSelectedFiles.deallocate() }
        SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse(interface, CSteamworks.HHTMLBrowser(browserHandle), .init(tmpSelectedFiles))
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
    public func keyChar(browserHandle: HHTMLBrowser, unicodeChar: Int, htmlKeyModifiers: HTMLKeyModifiers) {
        SteamAPI_ISteamHTMLSurface_KeyChar(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(unicodeChar), ISteamHTMLSurface.EHTMLKeyModifiers(htmlKeyModifiers))
    }

    /// Steamworks `ISteamHTMLSurface::KeyDown()`
    public func keyDown(browserHandle: HHTMLBrowser, nativeKeyCode: Int, htmlKeyModifiers: HTMLKeyModifiers, isSystemKey: Bool) {
        SteamAPI_ISteamHTMLSurface_KeyDown(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(nativeKeyCode), ISteamHTMLSurface.EHTMLKeyModifiers(htmlKeyModifiers), isSystemKey)
    }

    /// Steamworks `ISteamHTMLSurface::KeyUp()`
    public func keyUp(browserHandle: HHTMLBrowser, nativeKeyCode: Int, htmlKeyModifiers: HTMLKeyModifiers) {
        SteamAPI_ISteamHTMLSurface_KeyUp(interface, CSteamworks.HHTMLBrowser(browserHandle), uint32(nativeKeyCode), ISteamHTMLSurface.EHTMLKeyModifiers(htmlKeyModifiers))
    }

    /// Steamworks `ISteamHTMLSurface::LoadURL()`
    public func loadURL(browserHandle: HHTMLBrowser, url: String, postData: String) {
        SteamAPI_ISteamHTMLSurface_LoadURL(interface, CSteamworks.HHTMLBrowser(browserHandle), url, postData)
    }

    /// Steamworks `ISteamHTMLSurface::MouseDoubleClick()`
    public func mouseDoubleClick(browserHandle: HHTMLBrowser, mouseButton: HTMLMouseButton) {
        SteamAPI_ISteamHTMLSurface_MouseDoubleClick(interface, CSteamworks.HHTMLBrowser(browserHandle), ISteamHTMLSurface.EHTMLMouseButton(mouseButton))
    }

    /// Steamworks `ISteamHTMLSurface::MouseDown()`
    public func mouseDown(browserHandle: HHTMLBrowser, mouseButton: HTMLMouseButton) {
        SteamAPI_ISteamHTMLSurface_MouseDown(interface, CSteamworks.HHTMLBrowser(browserHandle), ISteamHTMLSurface.EHTMLMouseButton(mouseButton))
    }

    /// Steamworks `ISteamHTMLSurface::MouseMove()`
    public func mouseMove(browserHandle: HHTMLBrowser, x: Int, y: Int) {
        SteamAPI_ISteamHTMLSurface_MouseMove(interface, CSteamworks.HHTMLBrowser(browserHandle), Int32(x), Int32(y))
    }

    /// Steamworks `ISteamHTMLSurface::MouseUp()`
    public func mouseUp(browserHandle: HHTMLBrowser, mouseButton: HTMLMouseButton) {
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
}
