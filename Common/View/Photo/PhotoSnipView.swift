//
//  PhotoSnipView.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct PhotoSnipView: View {
    
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Text("Foto")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.medium)
                    .padding(.bottom, -10.0)
                Spacer()
            }
            .padding([.top, .leading])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    PhotoCardView()
                    PhotoCardView()
                    PhotoCardView()
                    PhotoCardView()
                    Spacer()
                }.padding()
            }
        }
    }
}
struct PhotoSnipView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSnipView()
    }
}
