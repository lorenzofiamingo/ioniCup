//
//  TeamCollection.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 13/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct TeamCollection: View {
    
    
    @State private var selectedView = 1
    
    var viewsName = ["Fase a gironi", "Fase a eliminazione"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Spacer()
                VStack(spacing: 0) {
                    TeamMCard().padding(.top)
                    TeamMCard().padding(.top)
                    TeamMCard().padding(.top)
                    TeamMCard().padding(.top)
                }.padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct TeamCollection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TeamCollection()
        }
    }
}
