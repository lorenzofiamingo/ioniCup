//
//  MatchDetail.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct MatchDetail: View {
    
    @State private var selectedView = 1
    
    var viewsName = ["Giocatori", "Parziali", "Extra"]
    
    var body: some View {
        VStack(spacing:0) {
            Text("Primo tempo")
                .font(.system(size: 30, design: .rounded))
            
            HStack(spacing: 0) {
                HStack {
                    Spacer()
                    Text("2")
                }
                Text(":")
                HStack {
                    Text("44")
                    Spacer()
                }
            }
            .font(.system(size: 100, design: .rounded))
            
            HStack(spacing: 20) {
                TeamLCard()
                TeamLCard(name: "YMCA")
            }
            .frame(height: 150)
            
            HStack(spacing: 20) {
                HStack {
                    Spacer()
                    Text("23")
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("44")
                    Spacer()
                }
            }
            .font(.system(size: 80, design: .rounded))
            
            Picker(selection: self.$selectedView, label: EmptyView()) {
                ForEach(0..<self.viewsName.count){
                    Text(self.viewsName[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            
            ScrollView(showsIndicators: false) {
                self.switchView().padding(.top)
            }
        }.padding(.horizontal)
    }
    
    func switchView() -> AnyView {
        switch selectedView {
        case 0: return AnyView(MatchTeamView())
        case 1: return AnyView(MatchScoreView())
        case 2: return AnyView(Spacer())
        default:
            return AnyView(Spacer())
        }
    }
}


struct LivematchModalView_Previews: PreviewProvider {
    static var previews: some View {
        MatchDetail()
    }
}
