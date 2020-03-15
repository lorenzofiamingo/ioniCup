//
//  GroupCard.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 05/03/2020.
//

import SwiftUI
import Ballcap

struct GroupCard: View {
    
    @ObservedObject var group: DB.Group.Document
    
    var body: some View {
        NavigationLink(destination: Text("CIAOOO").frame(maxWidth: .infinity, maxHeight: .infinity)) {
            HStack {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(self.group[\.color].color)
                    .onLongPressGesture(perform: self.group.showColorPanel)
                TextField("Gruppo", text: self.$group[\.name], onCommit: { self.group.update() })
                    .foregroundColor(.black)
                    .font(.system(.subheadline, design: .rounded))
            }
        }
        .onAppear { self.group.listen() }
        .onDisappear { self.group.listener?.remove() }
    }
}
