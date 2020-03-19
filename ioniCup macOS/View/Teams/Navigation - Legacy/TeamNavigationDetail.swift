//
//  TeamNavigationDetail.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/03/2020.
//

import SwiftUI

struct TeamNavigationDetail: View {
    @ObservedObject var team: DB.Team.Document
    
    var body: some View {
        TeamDetailEditor(team: team.copy())
    }
}
