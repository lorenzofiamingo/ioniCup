//
//  MatchNav.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 18/03/2020.
//

import SwiftUI

struct MatchNav: View {
    
    @ObservedObject var matchCollection: DB.Match.Collection
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Partite").padding(.top).font(.subheadline)
                List {
                    ForEach(matchCollection.documents) { match in
                        MatchLink(match: match)
                            .padding(.vertical, 8)
                            .contextMenu {
                                Button("􀎗 Modifica colore", action: match.showColorPanel)
                                Button("􀏳 Elimina") { match.delete() }
                        }
                    }.onMove(perform: matchCollection.moveDocuments).onDelete(perform: matchCollection.deleteDocuments)
                }
                .listStyle(SidebarListStyle())
                HStack {
                    Button(action: matchCollection.addDocument) {
                        Text("􀏱 Aggiungi partita")
                            .padding()
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
            }
            .frame(minWidth: 140, idealWidth: 180, maxWidth: 300)
            Text("Seleziona una partita")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

