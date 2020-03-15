//
//  DocumentModel+Colorable.swift
//  ioniCup
//
//  Created by Lorenzo Fiamingo on 07/03/2020.
//

import Ballcap

protocol Colorable {
    
    var color: DB.Color { get set }
}

extension DB.Document where Model: Colorable {
    
    func showColorPanel() {
        ColorPanel.shared.show(changeColor: { color in
            self[\.color].red = Double(color.redComponent)
            self[\.color].green = Double(color.greenComponent)
            self[\.color].blue = Double(color.blueComponent)
            self[\.color].alpha = Double(color.alphaComponent)
        }) { color in
            self.update()
        }
    }
}
