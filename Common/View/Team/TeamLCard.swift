//
//  TeamLCard.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 06/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct TeamLCard: View {
    
    let background = Color.random
    
    @State var name: String = "Eutimo Locri"
    
    var body: some View {
        ModalButton(modal: TeamDetail()) {
            HStack {
                Spacer()
                VStack(spacing: 0){
                    Image("example2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                    Text(self.name)
                        .font(.system(size: 50, design: .rounded))
                        .frame(height: 30)
                        .minimumScaleFactor(.leastNonzeroMagnitude)
                }
                Spacer()
            }
            .padding()
            .background(self.background)
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.5), radius: 6)
        }
    }
}

struct TeamModalCardView_Previews: PreviewProvider {
    static var previews: some View {
        TeamLCard()
    }
}
