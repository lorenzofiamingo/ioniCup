//
//  DetailWindowController.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 03/01/2020.
//

import Cocoa
import SwiftUI

class DetailWindowController<RootView: View>: NSWindowController {
    
    convenience init(rootView: RootView) {
        let hostingController = NSHostingController(rootView:
            rootView
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        let window = NSPanel(contentViewController: hostingController)
        window.setContentSize(NSSize(width: 250, height: 250))
        self.init(window: window)
    }
}
