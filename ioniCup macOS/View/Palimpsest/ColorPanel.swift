//
//  ColorPanel.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 09/01/2020.
//

import AppKit
import Combine

class ColorPanel {
    
    static var shared = ColorPanel()
    
    private let cp = NSColorPanel.shared
    
    private var subscriber: AnyCancellable?

    private let publisher = PassthroughSubject<NSColor, Never>().throttle(for: 5, scheduler: DispatchQueue.global(qos: .background), latest: true)
    
    private var changeColor: (NSColor) -> Void = {_ in }
    
    init() {
        cp.setTarget(self)
        cp.setAction(#selector(colorDidChange(sender:)))
        cp.isContinuous = true
        cp.showsAlpha = true
    }
    
    func show(changeColor: @escaping (NSColor) -> Void, receiveColor: @escaping (NSColor) -> Void) {
        self.changeColor = changeColor
        
        self.subscriber = nil
        self.subscriber = self.publisher.sink(receiveValue: receiveColor)
        cp.makeKeyAndOrderFront(nil)
    }
    
    @objc func colorDidChange(sender: NSColorPanel) {
        changeColor(sender.color)
        self.publisher.upstream.send(sender.color)
    }
}

