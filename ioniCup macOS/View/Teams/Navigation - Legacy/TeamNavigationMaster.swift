//
//  TeamNavigationMaster.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/03/2020.
//

import SwiftUI

struct TeamNavigationMaster: View {
    @ObservedObject var teamCollection: DB.Team.Collection
    @Binding var selectedTeam: DB.Team.Document?
    
    var body: some View {
        VStack {
            TeamNavigationList(teamCollection: teamCollection, selectedTeam: $selectedTeam)
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
        .frame(minWidth: 225, maxWidth: 300)
    }
}

