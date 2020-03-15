//
//  HomeView.swift
//  ioniCup iOS
//
//  Created by Lorenzo Fiamingo on 19/12/2019.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                Divider()
                VStack() {
                    LivematchSnipView()
                    CompletedmatchSnipView()
                    HStack{
                        Spacer()
                        NavigationLink(destination: MatchCollection().navigationBarTitle("Partite")) {
                            Text("Tutte le partite")
                                .padding(.top, -12)
                                .padding(.trailing)
                        }
                    }
                    LeaderboardSnipView()
                    HStack{
                        Spacer()
                        NavigationLink(destination: LeaderboardCollection()) {
                            Text("Classifica completa")
                                .padding(.top, -12)
                                .padding(.trailing)
                        }
                    }
                    PhotoSnipView()
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView()) {
                            Text("Tutte le foto")
                                .padding(.top, -12)
                                .padding(.trailing)
                        }
                    }
                    TeamSnipView()
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView()) {
                            Text("Tutte le squadre")
                                .padding(.top, -12)
                                .padding(.trailing)
                        }
                    }
                    AttachmentSnipView()
                }
                Spacer()
            }
            .navigationBarTitle("Ionicup")
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
