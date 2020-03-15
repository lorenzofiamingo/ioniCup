//
//  MatchSmallCard.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct MatchSCard: View {
    
    let background = LinearGradient(gradient: Gradient(colors: [.random, .random]), startPoint: .leading, endPoint: .trailing)
    
    
    var body: some View {
        ModalButton(modal: MatchDetail()) {
            HStack {
                HStack {
                    Image("example1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                    Text("Eutimo Locri")
                        .minimumScaleFactor(.leastNonzeroMagnitude)
                    Spacer()
                }
                Text("20 - 13")
                HStack {
                    Spacer()
                    Text("YMCA")
                        .minimumScaleFactor(.leastNonzeroMagnitude)
                    Image("example2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
            }
            .padding(.vertical, 6)
            .padding(.horizontal)
            .background(self.background)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.5), radius: 6)
            .font(.system(.headline, design: .rounded))
            .frame(height: 35)
        }
    }
}

struct CompletedmatchCardView_Previews: PreviewProvider {
    static var previews: some View {
        MatchSCard().padding()
    }
}
