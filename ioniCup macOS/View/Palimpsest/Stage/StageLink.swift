//
//  StageLink.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 23/12/2019.
//

import SwiftUI
import Ballcap

struct StageLink: View {
    
    @ObservedObject var stage: DB.Stage.Document
    
    var body: some View {
        NavigationLink(destination: GroupNav(groupCollection: DB.Group.Collection(reference: stage.documentReference.collection("groups")))) {
            HStack {
//                ZStack {
//                    Text("􀎑")
//                        .opacity(0.28)
//                    RoundedRectangle(cornerRadius: 5, style: .continuous)
//                        .aspectRatio(1, contentMode: .fit)
//                        .foregroundColor(self.stage[\.color].color)
//                        .onLongPressGesture(perform: self.stage.showColorPanel)
//                }
                TextField("Fase", text: self.$stage[\.name], onCommit: { self.stage.update() })
                    .foregroundColor(.black)
                    .font(.system(.subheadline, design: .rounded))
            }
        }
    }
}

//struct ColorForm: View {
//
//    typealias ColorableModel = Model: Modelable & Codable & Colorable
//
//    @Binding var colorable: DB.Document<Model: Modelable & Codable & Colorable>
//
//    var body: some View {
//        ZStack {
//            Text("􀎑")
//                .opacity(0.28)
//            RoundedRectangle(cornerRadius: 5, style: .continuous)
//                .aspectRatio(1, contentMode: .fit)
//                .foregroundColor(self.colorable.color.color)
//                .onLongPressGesture(perform: self.colorable.showColorPanel)
//        }
//    }
//}
