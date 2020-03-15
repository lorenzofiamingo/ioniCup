//
//  TeamCard.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 07/03/2020.
//

import SwiftUI

struct TeamCard: View {
    
    @ObservedObject var team: DB.Team.Document
    
    var body: some View {
        NavigationLink(destination: TeamDetailEditing(team: team)) {
            HStack {
//                RoundedRectangle(cornerRadius: 5, style: .continuous)
//                    .aspectRatio(1, contentMode: .fit)
//                    .foregroundColor(self.team[\.color].color)
//                    .onLongPressGesture(perform: self.team.showColorPanel)
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

