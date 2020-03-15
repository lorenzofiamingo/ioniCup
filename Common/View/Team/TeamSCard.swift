//
//  TeamSCard.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 08/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct TeamSCard: View {
    
    @State var name: String = "Eutimo Locri"
    
    let background = Color.random
    
    var body: some View {
        ModalButton(modal: TeamDetail()) {
            HStack {
                Image("example1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                Text("Eutimo Locri")
                    .minimumScaleFactor(.leastNonzeroMagnitude)
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

struct TeamSCard_Previews: PreviewProvider {
    static var previews: some View {
        TeamSCard()
    }
}
