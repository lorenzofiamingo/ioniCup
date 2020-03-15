//
//  TeamMCard.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct TeamMCard: View {
    
    let background = Color.random
    
    var body: some View {
        ModalButton(modal: TeamDetail()) {
            HStack{
                Image("example1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                Text("Eutimo Locri")
                    .scaledToFit()
                    .minimumScaleFactor(.leastNonzeroMagnitude)
                    .font(.system(size: 90, weight: .semibold, design: .rounded))
            }
            .frame(height: 40)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.5), radius: 6)
            .font(.system(size: 40, weight: .semibold, design: .rounded))
        }
    }
}

struct TeamMCard_Previews: PreviewProvider {
    static var previews: some View {
        TeamMCard()
    }
}
