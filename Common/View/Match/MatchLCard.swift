//
//  MatchLCard.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 04/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct MatchLCard: View {
    
    @ObservedObject var match = Match(matchReference: Firestore.firestore()
        .collection("tournaments")
        .document("DbPGt9rk9xa1EZSC2j25")
        .collection("matches")
        .document("Kp9gy43XIWt408cFm4B3"))
    
    @State var showModal: Bool = false
    
    var background: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [self.match.model.colors.teamA.color, self.match.model.colors.teamB.color]), startPoint: .leading, endPoint: .trailing)
    }
    
    var body: some View {
        ModalButton(modal: MatchDetail()) {
            ZStack {
                VStack {
                    HStack {
                        Text(self.match.model.group)
                            .padding([.top])
                    }
                    HStack {
                        HStack {
                            Spacer()
                            VStack{
                                Image("example1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 60)
                                Text(self.match.model.teamA)
                                    .frame(height: 20)
                                    .minimumScaleFactor(.leastNonzeroMagnitude)
                                Text(self.match.model.points.teamA)
                                    .font(.system(size: 70, design: .rounded))
                                    .minimumScaleFactor(.leastNonzeroMagnitude)
                            }
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            VStack{
                                Image("example2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 60)
                                Text(self.match.model.teamB)
                                    .frame(height: 20)
                                    .minimumScaleFactor(.leastNonzeroMagnitude)
                                Text(self.match.model.points.teamB)
                                    .font(.system(size: 70, design: .rounded))
                                    .minimumScaleFactor(.leastNonzeroMagnitude)
                            }
                            Spacer()
                        }
                    }
                }.font(.system(.headline, design: .rounded))
                
                VStack {
                    HStack {
                        AntennaAnimation()
                            .aspectRatio(contentMode: .fit)
                            .padding(.leading, 6)
                            .frame(height: 45)
                        Spacer()
                    }
                    Spacer()
                }.opacity(self.match.model.isLive ? 1 : 0)
            }
            .frame(width: 300, height: 220)
            .background(self.background)
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.5), radius: 6)
        }
        .onAppear {
            self.match.startListening()
        }.onDisappear {
            self.match.stopListening()
        }
    }
}


struct LivematchCardView_Previews: PreviewProvider {
    static var previews: some View {
        MatchLCard()
    }
}
