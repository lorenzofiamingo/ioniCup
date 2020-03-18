//
//  TeamPicker.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 16/03/2020.
//

import SwiftUI
import FirebaseFirestore

struct TeamPicker: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var teamCollection: DB.Team.Collection
    
    @State var selectedTeams: [DB.Team.Document] = []
    
    var onCommit: ([DB.Team.Document]) -> Void = {_ in}
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                VStack {
                    Spacer()
                    HStack {
                        ForEach(teamCollection.documents) { team in
                            TeamCard(team: team, isSelected: self.selectedTeams.contains(team)) { isSelected in
                                if isSelected {
                                    self.selectedTeams.append(team)
                                } else {
                                    self.selectedTeams = self.selectedTeams.filter { $0 != team }
                                }
                            }
                            .aspectRatio(1, contentMode: .fit)
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
                Button("Conferma") {
                    self.presentationMode.wrappedValue.dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Previene che la view non sia ricaricata prima che la modal venga dismissata. (Probabile bug di SwiftUI)
                        self.onCommit(self.selectedTeams)
                    }
                }
            }.padding([.bottom, .horizontal], 8)
        }.frame(minWidth: 512, idealWidth: 768, minHeight: 144, idealHeight: 192, maxHeight: 384)
    }
}
