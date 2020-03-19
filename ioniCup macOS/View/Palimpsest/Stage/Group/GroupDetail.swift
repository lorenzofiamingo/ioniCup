//
//  GroupDetail.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 16/03/2020.
//

import SwiftUI
import FirebaseFirestore

struct GroupDetail: View {
    
    @ObservedObject var group: DB.Group.Document
    
    @State private var showTeamPicker: Bool = false
    
    @ObservedObject private var teamCollection: DB.Team.Collection
    
    init(group: DB.Group.Document) {
        self.group = group
        teamCollection = DB.Team.Collection(reference: group.documentReference.parent.parent!.parent.parent!.collection("teams"))
    }
    
    var selectedTeams: [DB.Team.Document] {
        teamCollection.documents.filter { group[\.teamReferences].contains($0.documentReference) }
    }
    
    var body: some View {
        VSplitView {
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(selectedTeams) { team in
                        TeamCard(team: team)
                            .aspectRatio(1, contentMode: .fill)
                    }
                }
            }.frame(minHeight: 140, maxHeight: 200)
            
            ScrollView {
                VStack {
                    HStack {
                        Button("Selezione le squadre") { self.showTeamPicker.toggle() }
                            .popover(isPresented: $showTeamPicker) {
                                TeamPicker(teamCollection: self.teamCollection, selectedTeams: self.selectedTeams) { selectedTeams in
                                    self.group[\.teamReferences] = selectedTeams.map { $0.documentReference }
                                    self.group.update()
                                }
                        }
                        Spacer()
                    }
                }.padding()
            }.frame(minHeight: 10, maxHeight: 100)
            
            RoundNav(roundCollection: DB.Round.Collection(reference: group.documentReference.collection("rounds"))).frame(minHeight: 10)
        }
    }
}


//
//Prima di continuare rendi tournament un environment object
//
