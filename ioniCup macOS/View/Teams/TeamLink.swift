//
//  TeamCard.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 07/03/2020.
//

import SwiftUI

struct TeamLink: View {
    
    @ObservedObject var team: DB.Team.Document
    
    var body: some View {
        NavigationLink(destination: TeamDetailEditing(team: team)) {
            HStack {
                TeamLogoImage(url: self.team[\.logoURL]).frame(width: 40, height: 40)
                TextField("Squadra", text: self.$team[\.shortName], onCommit: { self.team.update() })
                    .foregroundColor(.black)
                    .font(.system(.subheadline, design: .rounded))
            }
        }
        .onAppear { self.team.listen() }
        .onDisappear { self.team.listener?.remove() }
    }
}

