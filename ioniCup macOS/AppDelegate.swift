//
//  AppDelegate.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/12/2019.
//

import Cocoa
import SwiftUI
import Firebase



@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    
    var toolbar: NSToolbar!
    
    var tab: Tab = .init()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        FirebaseApp.configure()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(tab)
        
        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.titleVisibility = .hidden
        window.appearance = NSAppearance(named: NSAppearance.Name.vibrantLight)
        
        // Create the toolbar segmented picker
        toolbar = NSToolbar(identifier: "ionicup.toolbar")
        toolbar.centeredItemIdentifier = NSToolbarItem.Identifier(rawValue: "centerd")
        toolbar.allowsUserCustomization = true
        toolbar.delegate = self
        toolbar.showsBaselineSeparator = true
        
        self.window.toolbar = toolbar
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

extension AppDelegate: NSToolbarDelegate {
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        
        let toolbarItem = NSToolbarItemGroup(itemIdentifier: NSToolbarItem.Identifier(rawValue: "centerd"))
        
        let segmentedControl = NSSegmentedControl(labels: tab.labels, trackingMode: .selectOne, target: self, action: #selector(action(_:)))
        segmentedControl.selectedSegment = tab.value
        segmentedControl.setWidth(90, forSegment: 0)
        segmentedControl.setWidth(90, forSegment: 1)
        segmentedControl.setWidth(90, forSegment: 2)
        segmentedControl.setWidth(90, forSegment: 3)
        segmentedControl.setWidth(90, forSegment: 4)
        
        let segmentedItem = NSToolbarItem()
        segmentedItem.view = segmentedControl
        
        toolbarItem.subitems = [segmentedItem]

        return toolbarItem
    }
    
    @objc func action(_ sender: NSSegmentedControl) {
        tab.value = sender.selectedSegment
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [NSToolbarItem.Identifier(rawValue: "subreddit.search")]
    }

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return self.toolbarDefaultItemIdentifiers(toolbar)
    }

    func toolbarSelectableItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return self.toolbarDefaultItemIdentifiers(toolbar)
    }
}
