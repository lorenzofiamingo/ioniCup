//
//  RoundNav.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 18/03/2020.
//

import SwiftUI

struct RoundNav: View {
    
    @ObservedObject var roundCollection: DB.Round.Collection
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Round").padding(.top).font(.subheadline)
                List {
                    ForEach(roundCollection.documents) { round in
                        RoundLink(round: round)
                            .padding(.vertical, 8)
                            .contextMenu {
                                Button("􀎗 Modifica colore", action: round.showColorPanel)
                                Button("􀏳 Elimina") { round.delete() }
                        }
                    }.onMove(perform: roundCollection.moveDocuments).onDelete(perform: roundCollection.deleteDocuments)
                }
                .listStyle(SidebarListStyle())
                HStack {
                    Button(action: roundCollection.addDocument) {
                        Text("􀏱 Aggiungi round")
                            .padding()
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
            }
            .frame(minWidth: 140, idealWidth: 180, maxWidth: 300)
            Text("Seleziona un round")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
