//
//  TeamPicker.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 16/03/2020.
//

import SwiftUI
import FirebaseFirestore

struct TeamPicker: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var teamCollection: DB.Team.Collection
    
    @State private var selectedTeams: [DB.Team.Document] = []
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                VStack {
                    Spacer()
                    HStack {
                        ForEach(teamCollection.documents) { team in
                            TeamCard(team: team) { isSelected in
                                if isSelected {
                                    self.selectedTeams.append(team)
                                } else {
                                    self.selectedTeams = self.selectedTeams.filter { $0 != team }
                                }
                            }
                        }
                    }
                }
            }
            Divider()
            HStack {
                Spacer()
                Button("Annulla") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                Button("Aggiungi") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }.padding([.bottom, .horizontal], 8)
        }.frame(minWidth: 512, idealWidth: 768, minHeight: 144, idealHeight: 192, maxHeight: 384)
    }
}
