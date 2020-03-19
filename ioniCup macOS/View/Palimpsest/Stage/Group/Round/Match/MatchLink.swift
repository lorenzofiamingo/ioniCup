//
//  MatchLink.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 18/03/2020.
//

import SwiftUI

struct MatchLink: View {
    
    @ObservedObject var match: DB.Match.Document
    
    var body: some View {
        NavigationLink(destination: MatchDetailEditor(match: match)) {
            HStack {
                TextField("Partita", text: self.$match[\.name], onCommit: { self.match.update() })
                    .foregroundColor(.black)
                    .font(.system(.subheadline, design: .rounded))
            }
        }
    }
}

