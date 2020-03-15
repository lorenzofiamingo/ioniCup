//
//  LeaderboardLCard.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 13/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct LeaderboardLCard: View {
    
    let background = Color.blue
    
    @State private var selectedView = 1
    
    var viewsName = ["Fase a gironi", "Fase a eliminazione"]
    
    var body: some View {
        ModalButton(modal: LeaderboardDetail()) {
            VStack {

                Picker(selection: self.$selectedView, label: EmptyView()) {
                    ForEach(0..<self.viewsName.count){
                        Text(self.viewsName[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                
                Text("Gruppo A")
                    .font(.system(size:24, weight: Font.Weight.heavy, design: .rounded))
                HStack {
                    Image("example1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("Eutimo Locri")
                    Spacer()
                    Text("23")
                        .fontWeight(.bold)
                        .padding(.trailing)
                }
                .frame(height: 30)
                
                HStack{
                    Image("example2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("YMCA")
                    Spacer()
                    Text("23")
                        .fontWeight(.bold)
                        .padding(.trailing)
                }
                .frame(height: 30)
                
                HStack{
                    Image("example1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("Cesena")
                    Spacer()
                    Text("23")
                        .fontWeight(.bold)
                        .padding(.trailing)
                }
                .frame(height: 30)
                HStack{
                    Image("example2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("Milan")
                    Spacer()
                    Text("23")
                        .fontWeight(.bold)
                        .padding(.trailing)
                }
                .frame(height: 30)
            }
            .padding()
            .font(.system(.headline, design: .rounded))
            .background(self.background)
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.5), radius: 6)
        }
    }
}

struct LeaderboardLCard_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardLCard()
    }
}
