//
//  LeaderboardCard.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct LeaderboardCard: View {
    
    let background = Color.blue
    
    var body: some View {
        ModalButton(modal: LeaderboardDetail()) {
            VStack {
                Text("Gruppo A")
                    .font(.system(size:24, weight: Font.Weight.heavy, design: .rounded))
                
                HStack {
                    Image("example1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("Eutimo Locri")
                    Spacer()
                }
                .frame(height: 30)
                
                HStack{
                    Image("example2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("YMCA")
                    Spacer()
                }
                .frame(height: 30)
                
                HStack{
                    Image("example1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("Cesena")
                    Spacer()
                }
                .frame(height: 30)
                HStack{
                    Image("example2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("Milan")
                    Spacer()
                }
                .frame(height: 30)
            }.padding()
                .font(.system(.headline, design: .rounded))
                .background(self.background)
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.5), radius: 6)
        }
        
    }
}

struct LeaderboardCardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardCard().padding()
    }
}
