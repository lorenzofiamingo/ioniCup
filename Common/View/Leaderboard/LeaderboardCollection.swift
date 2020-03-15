//
//  LeaderboardCollection.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 12/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct LeaderboardCollection: View {
    
    @State private var selectedView = 1
    
    var viewsName = ["Fase a gironi", "Fase a eliminazione"]
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                HStack {
                    Spacer()
                    VStack(spacing: 0) {

                        Picker(selection: self.$selectedView, label: EmptyView()) {
                            ForEach(0..<self.viewsName.count){
                                Text(self.viewsName[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        LeaderboardLCard().padding(.top)
                        LeaderboardLCard().padding(.top)
                        LeaderboardLCard().padding(.top)
                        LeaderboardLCard().padding(.top)
                    }.padding()
                    Spacer()
                }
            }
        }
    }
}

struct LeaderboardCollection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LeaderboardCollection()
        }
    }
}
