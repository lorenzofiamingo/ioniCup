//
//  TeamNavigationRow.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/03/2020.
//

import SwiftUI

struct TeamNavigationRow: View {
    @ObservedObject var team: DB.Team.Document
    
    var body: some View {
        HStack {
            TeamLogoImage(url: self.team[\.logoURL]).frame(width: 40, height: 40)
            TextField("Squadra", text: self.$team[\.shortName], onCommit: { self.team.update() })
                .foregroundColor(.black)
                .font(.system(.subheadline, design: .rounded))
        }
    }
}

//struct TeamNavigationRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamNavigationRow()
//    }
//}
