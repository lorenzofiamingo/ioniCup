//
//  Tournament.swift
//  ioniCup
//
//  Created by Lorenzo Fiamingo on 23/12/2019.
//

import SwiftUI
import Combine
import FirebaseFirestore
import Ballcap

extension DB {
    
    struct Tournament {
        
        typealias Document = DB.Document<Tournament.Model>
        
        typealias Collection = DB.Collection<Document>

        struct Model: Codable, Modelable, Orderable {
            
            var order: Int = 0
            
            var isLive: Bool = false
            
            var name: String = ""
            
            var year: String = ""
        }
    }
}
