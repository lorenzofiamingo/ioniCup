//
//  GroupLink.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 05/03/2020.
//

import SwiftUI
import Ballcap

struct GroupLink: View {
    
    @ObservedObject var group: DB.Group.Document
    
    var body: some View {
        NavigationLink(destination: GroupDetail(group: group)) {
            HStack {
                ZStack {
                    Text("􀎑")
                        .opacity(0.28)
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundColor(self.group[\.color].color)
                        .onLongPressGesture(perform: self.group.showColorPanel)
                }
                TextField("Gruppo", text: self.$group[\.name], onCommit: { self.group.update() })
                    .foregroundColor(.black)
                    .font(.system(.subheadline, design: .rounded))
            }
        }
    }
}
