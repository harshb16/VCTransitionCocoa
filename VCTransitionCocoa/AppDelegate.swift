//
//  AppDelegate.swift
//  VCTransitionCocoa
//
//  Created by Harsh Bhatia on 12/09/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    let initialVC = InitialViewController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentViewController = initialVC
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

