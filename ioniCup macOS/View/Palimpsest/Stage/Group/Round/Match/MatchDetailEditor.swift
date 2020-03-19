//
//  MatchDetail.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/03/2020.
//

import SwiftUI

struct MatchDetailEditor: View {
    
    @ObservedObject var match: DB.Match.Document
    
    private let titleWidth: CGFloat = 100
    
    var status = ["Inizializzata", "Designata", "Live", "Terminata"]
    
    @ObservedObject private var teamCollection: DB.Team.Collection
    
    var teamA: DB.Team.Document? {
        teamCollection.documents.filter { match[\.teamAReference] == $0.documentReference }.first
    }
    var teamB: DB.Team.Document? {
        teamCollection.documents.filter { match[\.teamBReference] == $0.documentReference }.first
    }
    
    var selectedStrength: Binding<Int> {
        Binding<Int>(get: {
            self.match[\.status].isOver == true ? 3 : self.match[\.status].isLive == true ? 2 : self.match[\.status].isAppointed == true ? 1 : 0
        }, set: { newValue in
            switch newValue {
            case 0:
                self.match[\.status].isAppointed = false
                self.match[\.status].isLive = false
                self.match[\.status].isOver = false
            case 1:
                self.match[\.status].isAppointed = true
                self.match[\.status].isLive = false
                self.match[\.status].isOver = false
            case 2:
                self.match[\.status].isAppointed = true
                self.match[\.status].isLive = true
                self.match[\.status].isOver = false
            case 3:
                self.match[\.status].isAppointed = true
                self.match[\.status].isLive = false
                self.match[\.status].isOver = true
            default:
                self.match[\.status].isAppointed = false
                self.match[\.status].isLive = false
                self.match[\.status].isOver = false
            }
            self.match.update()
        })
    }
    
    init(match: DB.Match.Document) {
        self.match = match
        teamCollection = DB.Team.Collection(reference: match.documentReference.parent.parent!.parent.parent!.parent.parent!.parent.parent!.collection("teams"))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button("Seleziona") {}
                    if teamA != nil {
                        TeamCard(team: teamA!)
                            .aspectRatio(1, contentMode: .fit)
                    }
                    Text("􀅽")
                    if teamB != nil {
                        TeamCard(team: teamB!)
                            .aspectRatio(1, contentMode: .fit)
                    }
                    Button("Seleziona") {}
                }.frame(maxHeight: 200)
                HStack {
                    HStack {
                        Spacer()
                        Text("Stato:")
                    }.frame(maxWidth: titleWidth)
                    Picker("", selection: selectedStrength) {
                        ForEach(0..<status.count) {
                            Text(self.status[$0])
                        }
                    }
                }
            }
            .padding()
        }
        .frame(minWidth: 500, maxWidth: .infinity, maxHeight: .infinity)
    }
}

