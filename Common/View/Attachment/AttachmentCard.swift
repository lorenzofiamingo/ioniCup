//
//  AttachmentCard.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct AttachmentCard: View {
    var body: some View {
        ModalButton(modal: AttachmentDetail()) {
            Text("Regolamento Ionicup Arena")
                .font(.system(.headline, design: .rounded))
                .fontWeight(.heavy)
                .padding([.top, .bottom], 6)
                .padding([.leading, .trailing])
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.5), radius: 6)
                .frame(height: 35)
        }
    }
}

struct AttachmentCard_Previews: PreviewProvider {
    static var previews: some View {
        AttachmentCard()
    }
}
