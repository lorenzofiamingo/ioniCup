//
//  RoundLink.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 18/03/2020.
//

import SwiftUI

struct RoundLink: View {
    
    @ObservedObject var round: DB.Round.Document
    
    var body: some View {
        NavigationLink(destination: MatchNav(matchCollection: DB.Match.Collection(reference: round.documentReference.collection("rounds")))) {
            HStack {
//                ZStack {
//                    Text("􀎑")
//                        .opacity(0.28)
//                    RoundedRectangle(cornerRadius: 5, style: .continuous)
//                        .aspectRatio(1, contentMode: .fit)
//                        .foregroundColor(self.round[\.color].color)
//                        .onLongPressGesture(perform: self.round.showColorPanel)
//                }
                TextField("Round", text: self.$round[\.name], onCommit: { self.round.update() })
                    .foregroundColor(.black)
                    .font(.system(.subheadline, design: .rounded))
            }
        }
    }
}
