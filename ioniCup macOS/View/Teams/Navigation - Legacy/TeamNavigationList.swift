//
//  TeamNavigationList.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/03/2020.
//

import SwiftUI

struct TeamNavigationList: View {
    @ObservedObject var teamCollection: DB.Team.Collection
    @Binding var selectedTeam: DB.Team.Document?
    
    var body: some View {
        List(selection: $selectedTeam) {
            ForEach(teamCollection.documents) { team in
                NavigationLink(destination: TeamDetailEditor(team: team.copy())) {
                    TeamNavigationRow(team: team)
                        .padding(.vertical, 8)
                        .contextMenu {
                            Button("􀎗 Modifica colore", action: team.showColorPanel)
                            Button("􀏳 Elimina") { team.delete() }
                    }
                }
            }.onMove(perform: teamCollection.moveDocuments)
        }
        .listStyle(SidebarListStyle())
        
    }
}
