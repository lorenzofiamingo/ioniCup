//
//  TeamsView.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 07/03/2020.
//

import SwiftUI
import FirebaseFirestore
import Ballcap

struct TeamsView: View {
    @ObservedObject var tournament = DB.Tournament.Document(Firestore.firestore().collection("tournaments").document("DbPGt9rk9xa1EZSC2j25"))
    
    var body: some View {
        TeamNavigation(teamCollection: DB.Team.Collection(reference: tournament.documentReference.collection("teams")))
    }
}
