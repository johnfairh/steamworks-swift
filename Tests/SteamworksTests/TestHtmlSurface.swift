//
//  TestHtmlSurface.swift
//  SteamworksTests
//
//  Licensed under MIT (https://github.com/johnfairh/steamworks-swift/blob/main/LICENSE
//

import Steamworks
import XCTest

/// Exercise the htmlsurface as prep for texture rendering
class TestHtmlSurface: XCTestCase {
    func testHtmlLoader() throws {
        let steam = try TestClient.getClient()

        let rc = steam.htmlSurface.initialize()
        guard rc else {
            return
        }

        steam.onHTMLStartRequest { request in
            print("onHTMLStartRequest: \(request)")
            steam.htmlSurface.allowStartRequest(browserHandle: request.browserHandle, allowed: true)
        }

        steam.onHTMLFinishedRequest { request in
            print("onHTMLFinishedRequest: \(request)")
        }

        steam.onHTMLChangedTitle { msg in
            print("onHTMLChangedTitle: \(msg.title)")
        }

        steam.onHTMLNeedsPaint{ paint in
            print("onHTMLNeedsPaint: \(paint)")

            // wait for the real draw call
            if paint.wide == 400 {
                TestClient.stopRunningFrames()
                steam.htmlSurface.removeBrowser(browserHandle: paint.browserHandle)
                steam.htmlSurface.shutdown()
            }
        }

        steam.onHTMLNewWindow { newWnd in
            print("onHTMLNewWindow: \(newWnd)")
        }

        steam.htmlSurface.createBrowser(userAgent: nil, userCSS: nil) { b in
            guard let b else {
                XCTFail("Couldn't create browser")
                TestClient.stopRunningFrames()
                steam.htmlSurface.shutdown()
                return
            }
            steam.htmlSurface.setSize(browserHandle: b.browserHandle, width: 400, height: 800)
            steam.htmlSurface.loadURL(browserHandle: b.browserHandle, url: "http://www.google.com/", postData: nil)
        }

        TestClient.runFrames()
    }
}
