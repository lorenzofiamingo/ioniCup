//
//  Group.swift
//  ioniCup
//
//  Created by Lorenzo Fiamingo on 05/03/2020.
//

import Ballcap

extension DB {
    
    struct Group {
        
        typealias Document = DB.Document<Group.Model>
        
        typealias Collection = DB.Collection<Document>
        
        struct Model: Codable, Modelable, Orderable, Colorable {
            
            static func == (lhs: DB.Group.Model, rhs: DB.Group.Model) -> Bool {
                lhs.name == rhs.name && lhs.order == rhs.order
            }
            
            
            var name: String = ""
            
            var order: Int = 0
            
            var color: Color = DB.Color()
        }
    }
}
