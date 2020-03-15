//
//  LivematchSnipView.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct LivematchSnipView: View {
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Text("Partite live")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.medium)
                    .padding(.bottom, -10.0)
                Spacer()
            }
            .padding([.top, .leading])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    MatchLCard()
                    MatchLCard()
                    MatchLCard()
                    MatchLCard()
                    Spacer()
                }.padding()
            }
        }
    }
}


struct LivematchSnipView_Previews: PreviewProvider {
    static var previews: some View {
        LivematchSnipView()
    }
}
