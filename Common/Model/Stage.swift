//
//  Stage.swift
//  ioniCup
//
//  Created by Lorenzo Fiamingo on 23/12/2019.
//

import Ballcap

extension DB {
    
    struct Stage {
        
        typealias Document = DB.Document<Stage.Model>
        
        typealias Collection = DB.Collection<Document>
        
        struct Model: Codable, Modelable, Orderable, Colorable {
            
            static func == (lhs: DB.Stage.Model, rhs: DB.Stage.Model) -> Bool {
                lhs.name == rhs.name && lhs.order == rhs.order
            }
            
            var name: String = ""
            
            var order: Int = 0
            
            var color: Color = DB.Color()
        }
    }
}
