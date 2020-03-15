//
//  TeamNav.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 07/03/2020.
//

import SwiftUI

struct TeamNav: View {
    
    @ObservedObject var teamCollection: DB.Team.Collection
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(teamCollection.documents) { team in
                        TeamCard(team: team)
                            .padding(.vertical, 8)
                            .contextMenu {
                                Button("􀎗 Modifica colore", action: team.showColorPanel)
                                Button("􀏳 Elimina") { team.delete() }
                        }
                    }.onMove(perform: teamCollection.moveDocuments)
                }
                .listStyle(SidebarListStyle())
                HStack {
                    Button(action: teamCollection.addDocument) {
                        Text("􀏱 Aggiungi squadra")
                            .padding()
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
            }
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300)
            Text("Seleziona una fase")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
    }
}
