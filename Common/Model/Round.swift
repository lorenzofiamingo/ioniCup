//
//  Round.swift
//  ioniCup
//
//  Created by Lorenzo Fiamingo on 05/03/2020.
//

import Ballcap

extension DB {
    
    struct Round {
        
        typealias Document = DB.Document<Round.Model>
        
        typealias Collection = DB.Collection<Document>
        
        struct Model: Codable, Modelable, Orderable, Colorable {
            
            static func == (lhs: DB.Round.Model, rhs: DB.Round.Model) -> Bool {
                lhs.name == rhs.name && lhs.order == rhs.order
            }
            
            var name: String = ""
            
            var order: Int = 0
            
            var color: Color = DB.Color()
        }
    }
}
