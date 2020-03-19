//
//  GroupNav.swift
//  
//
//  Created by Lorenzo Fiamingo on 24/12/2019.
//

import SwiftUI

struct GroupNav: View {
    
    @ObservedObject var groupCollection: DB.Group.Collection
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Gruppi").padding(.top).font(.headline)
                List {
                    ForEach(groupCollection.documents) { group in
                        GroupLink(group: group)
                            .padding(.vertical, 8)
                            .contextMenu {
                                Button("􀎗 Modifica colore", action: group.showColorPanel)
                                Button("􀏳 Elimina") { group.delete() }
                        }
                    }.onMove(perform: groupCollection.moveDocuments).onDelete(perform: groupCollection.deleteDocuments)
                }
                .listStyle(SidebarListStyle())
                HStack {
                    Button(action: groupCollection.addDocument) {
                        Text("􀏱 Aggiungi gruppo")
                            .padding()
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
            }
            .frame(minWidth: 150, idealWidth: 175, maxWidth: 200)
            Text("Seleziona un girone")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
