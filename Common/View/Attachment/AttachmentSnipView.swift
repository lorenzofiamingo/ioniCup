//
//  AttachmentSnipView.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct AttachmentSnipView: View {
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            HStack {
                Text("Documenti")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.medium)
                Spacer()
            }
            Group {
                AttachmentCard()
                AttachmentCard()
                AttachmentCard()
            }.padding(.top, 6)
        }.padding()
    }
}


struct AttachmentSnipView_Previews: PreviewProvider {
    static var previews: some View {
        AttachmentSnipView()
    }
}
