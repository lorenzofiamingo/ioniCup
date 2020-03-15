//
//  Team.swift
//  ioniCup
//
//  Created by Lorenzo Fiamingo on 07/03/2020.
//


import Ballcap
import MapKit
import FirebaseFirestore

extension DB {
    
    struct Team {
        
        typealias Document = DB.Document<Team.Model>
        
        typealias Collection = DB.Collection<Document>
        
        struct Model: Codable, Modelable, Orderable, Colorable {
            
            static func == (lhs: DB.Team.Model, rhs: DB.Team.Model) -> Bool {
                lhs.name == rhs.name && lhs.order == rhs.order
            }
            
            var name: String = ""
            
            var shortName: String = ""
            
            var city: City = .init()
            
            var players: [Player] = []
            
            var coaches: [Coach] = []
            
            var order: Int = 0
            
            var color: Color = DB.Color()
            
            var logoURL: String = ""
        }
    }
}

extension DB.Team.Model {
    
    struct Player: Codable {
        
        var name: String = ""
        
        var surname: String = ""
        
        var number: String = ""
    }
    
    struct Coach: Codable {
        
        var name: String = ""
        
        var surname: String = ""
    }
    
    struct City: Codable {
        
        var name: String = ""
        
        var coordinate: GeoPoint = .init(latitude: 0, longitude: 0)
    }
}

extension DB.Team.Document {
    
    func addPlayer() {
        data?.players.append(DB.Team.Model.Player())
        update()
    }
    
    func addCoach() {
        data?.coaches.append(DB.Team.Model.Coach())
        update()
    }
}
