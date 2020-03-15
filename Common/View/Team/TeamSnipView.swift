//
//  TeamSnipView.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct TeamSnipView: View {
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Text("Squadre")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.bottom, -10.0)
            .padding([.top, .leading])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    TeamMCard()
                    TeamMCard()
                    TeamMCard()
                    TeamMCard()
                    TeamMCard()
                    Spacer()
                }.padding()
            }
        }
    }
}
    
    struct TeamSnipView_Previews: PreviewProvider {
        static var previews: some View {
            TeamSnipView()
        }
}
