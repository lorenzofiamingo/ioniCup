//
//  GroupDetail.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 16/03/2020.
//

import SwiftUI
import FirebaseFirestore

struct GroupDetail: View {
    
    @ObservedObject var group: DB.Group.Document
    
    @State var showTeamPicker: Bool = false
    
    var body: some View {
        VSplitView {
            ScrollView(.horizontal, showsIndicators: true) {
                VStack {
                    Spacer()
                    HStack {
                        Button(action: { self.showTeamPicker.toggle() }) {
                            VStack {
                                Text("􀏱")
                                Text("Aggiungi")
                                Text("squadra")
                            }
                                .padding()
                                .font(.system(size: 16))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .sheet(isPresented: $showTeamPicker) {
                            TeamPicker(teamCollection: DB.Team.Collection(reference: Firestore.firestore()
                            .collection("tournaments")
                            .document("DbPGt9rk9xa1EZSC2j25").collection("teams")))
                        }
                    }
                    Spacer()
                }
            }.frame(minHeight: 140, maxHeight: 160)
            Text("IMPOSTAZIONI")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Text("PARTITE")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
}
