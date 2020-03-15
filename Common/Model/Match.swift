//
//  Match.swift
//  ioniCup
//
//  Created by Lorenzo Fiamingo on 15/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI
import Combine
import FirebaseFirestore

final class Match: ObservableObject {
    
    private var matchReference: DocumentReference
    
    private var listener: ListenerRegistration?
    
    @Published var model = Model()
    
    func startListening() {
        listener = matchReference
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let dict = document.data() else {
                    print("Document data was empty.")
                    return
                }
                print("Current data: \(dict)")
                let data = try! JSONSerialization.data(withJSONObject: dict, options: [])
                self.model = try! JSONDecoder().decode(Model.self, from: data)
        }
    }
    
    func stopListening() {
        listener?.remove()
    }
    
    init(matchReference: DocumentReference) {
        self.matchReference = matchReference
    }
}

extension Match {
    
    struct Model: Codable {
        
        var isLive: Bool = false
        
        var isOver: Bool = false
        
        var teamA: String = ""
        
        var teamB: String = ""
        
        var court: String = ""
        
        var period: String = ""
        
        var players: Players = Players()
        
        var points: Points = Points()
        
        var round: String = ""
        
        var group: String = ""
        
        var score: Score = Score()
        
        var time: String = ""
        
        var stopwatch: Stopwatch = Stopwatch()
        
        var colors: Colors = Colors()
    }
}

extension Match.Model {
    
    struct Players: Codable {
        
        var teamA: [Player] = []
        
        var teamB: [Player] = []
    }
    
    struct Points: Codable {
        
        var teamA: String = ""
        
        var teamB: String = ""
    }
    
    struct Score: Codable {
        
        var teamA: String = ""
        
        var teamB: String = ""
    }
    
    struct Stopwatch: Codable {
        
        var seconds: String = ""
        
        var minutes: String = ""
    }
    
    struct Colors: Codable {
        
        var teamA: Color = Color()
        
        var teamB: Color = Color()
    }
}

extension Match.Model.Players {
    
    struct Player: Codable {
        
        var name: String = ""
        
        var surname: String = ""
        
        var number: String = ""
    }
}

extension Match.Model.Colors {
    
    struct Color: Codable {
        
        var red: Double = 0
        
        var green: Double = 0
        
        var blue: Double = 0
        
        var color: SwiftUI.Color {
            SwiftUI.Color(red: red, green: green, blue: blue)
        }
    }
}

extension Match.Model.Score {
    
    struct Partials: Codable {
        
        var first: Partial = Partial()
        
        var second: Partial = Partial()
        
        var third: Partial = Partial()
        
        var fourth: Partial = Partial()
        
        var fifth: Partial = Partial()
        
        var sixth: Partial = Partial()
        
        var overtime: Partial = Partial()
    }
}

extension Match.Model.Score.Partials {
    
    struct Partial: Codable {
        
        var teamA: String = ""
        
        var teamB: String = ""
    }
}
