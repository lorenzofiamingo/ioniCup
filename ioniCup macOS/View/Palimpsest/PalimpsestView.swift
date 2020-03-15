//
//  PalimpsestView.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 23/12/2019.
//

import SwiftUI
import FirebaseFirestore
import Ballcap

struct PalimpsestView: View {
    
    @ObservedObject var tournament = DB.Tournament.Document(Firestore.firestore()
        .collection("tournaments")
        .document("DbPGt9rk9xa1EZSC2j25"))
    
    var body: some View {
        StageNav(stageCollection: DB.Stage.Collection(reference: tournament.documentReference.collection("stages")))
            .onAppear{ self.tournament.listen() }
            .onDisappear(perform: tournament.listener?.remove)
    }
}

struct PalimpsestView_Previews: PreviewProvider {
    static var previews: some View {
        PalimpsestView()
    }
}
