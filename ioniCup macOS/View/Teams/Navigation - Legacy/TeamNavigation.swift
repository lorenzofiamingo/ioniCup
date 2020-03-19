//
//  TeamNavigation.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/03/2020.
//

import SwiftUI

struct TeamNavigation: View {
    @ObservedObject var teamCollection: DB.Team.Collection
    @State private var selectedTeam: DB.Team.Document?
    
    var body: some View {
        NavigationView {
            TeamNavigationMaster(teamCollection: teamCollection, selectedTeam: $selectedTeam)
            
            if selectedTeam != nil {
                TeamNavigationDetail(team: selectedTeam!.copy())
            }
        }.frame(minWidth: 700, minHeight: 300)
    }
}

//struct TeamNavigation_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamNavigation()
//    }
//}
