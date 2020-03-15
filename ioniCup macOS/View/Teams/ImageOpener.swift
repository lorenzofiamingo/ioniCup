//
//  ImageOpener.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 08/03/2020.
//


import AppKit

class ImageOpener {
    
    static var shared = ImageOpener()
    
    private let op = NSOpenPanel()
    
    init() {
        op.canChooseDirectories = false
        op.allowedFileTypes = ["png", "jpeg", "jpg"]
    }
    
    func show(completionHandler: @escaping (URL) -> Void) {
        op.beginSheetModal(for: NSApplication.shared.windows.first!) { (response) in
            if response == NSApplication.ModalResponse.OK {
                guard let url = self.op.url else { return }
                completionHandler(url)
            }
        }
    }
}
