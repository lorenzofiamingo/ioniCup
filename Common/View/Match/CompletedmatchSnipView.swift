//
//  CompletedmatchSnipView.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct CompletedmatchSnipView: View {
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Text("Partite concluse")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.medium)
                Spacer()
            }
            Group {
                MatchSCard()
                MatchSCard()
                MatchSCard()
                MatchSCard()
            }.padding(.top, 6)
            
        }.padding()
    }
}


struct CompletedmatchSnipView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedmatchSnipView()
    }
}
