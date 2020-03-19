//
//  StageNav.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 23/12/2019.
//

import SwiftUI
import FirebaseFirestore
import AppKit
import Ballcap

struct StageNav: View {
    
    @ObservedObject var stageCollection: DB.Stage.Collection
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Fasi").padding(.top).font(.headline)
                List {
                    ForEach(stageCollection.documents) { stage in
                        StageLink(stage: stage)
                            .padding(.vertical, 8)
                            .contextMenu {
                                Button("􀎗 Modifica colore", action: stage.showColorPanel)
                                Button("􀏳 Elimina") { stage.delete() }
                        }
                    }.onMove(perform: stageCollection.moveDocuments)
                }
                .listStyle(SidebarListStyle())
                HStack {
                    Button(action: stageCollection.addDocument) {
                        Text("􀏱 Aggiungi fase")
                            .padding()
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
            }
            .frame(minWidth: 150, idealWidth: 175, maxWidth: 200)
            Text("Seleziona una fase")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
