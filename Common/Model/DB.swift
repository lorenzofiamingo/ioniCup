//
//  DB.swift
//  ioniCup
//
//  Created by Lorenzo Fiamingo on 26/12/2019.
//

import SwiftUI

struct DB {
    
    struct Color: Codable {
        
        var red: Double = 0
        
        var green: Double = 0
        
        var blue: Double = 0
        
        var alpha: Double = 0
        
        var color: SwiftUI.Color {
            SwiftUI.Color(red: red, green: green, blue: blue, opacity: alpha)
        }
    }
}
