//
//  Match.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 18/03/2020.
//

import Ballcap
import FirebaseFirestore

extension DB {
    
    struct Match {
        
        typealias Document = DB.Document<Match.Model>
        
        typealias Collection = DB.Collection<Document>
        
        struct Model: Codable, Modelable, Orderable, Colorable {
            
            static func == (lhs: DB.Match.Model, rhs: DB.Match.Model) -> Bool {
                lhs.name == rhs.name && lhs.order == rhs.order
            }
            
            var name: String = ""
            
            var order: Int = 0
            
            var court: String = ""
            
            var color: Color = DB.Color()
            
            var teamAReference: DocumentReference = DB.Team.Document().documentReference
            
            var teamBReference: DocumentReference = DB.Team.Document().documentReference
            
            var status: Status = Status()
            
            var scoreBoard: ScoreBoard = ScoreBoard()
        }
    }
}

extension DB.Match.Model {
    
    struct Status: Codable {
        
        var isAppointed: Bool = false

        var isLive: Bool = false
        
        var isOver: Bool = false
    }
    
    struct ScoreBoard: Codable {
        
        var stopWatch: Stopwatch = Stopwatch()
        
        var currentPeriod: Int = 0
        
        var periods: [Period] = []
        
        var total: Score = Score()
    }
}

extension DB.Match.Model.ScoreBoard {
    
    struct Point: Codable {
        
        var teamA: String = ""
        
        var teamB: String = ""
    }
    
    struct Score: Codable {
        
        var effective: Point = Point()
        
        var basket: Point = Point()
    }
    
    struct Stopwatch: Codable {
        
        var seconds: String = ""
        
        var minutes: String = ""
    }
    
    struct Period: Codable, Orderable {
        
        var name: String = ""
        
        var order: Int = 0
        
        var score: Score = Score()
    }
}
