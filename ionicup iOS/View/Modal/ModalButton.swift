//
//  ModalButton.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 08/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct ModalButton<Modal: View, Content: View>: View  {
    
    @State private var showModal: Bool = false
    
    let modal: Modal
    
    let content: () -> Content
    
    
    var body: some View {
        Button(action: {
            self.showModal.toggle()
        }) {
            content()
        }.sheet(isPresented: $showModal) {
            ModalLayer {
                self.modal
            }
        }
    }
}
struct ModalButton_Previews: PreviewProvider {
    static var previews: some View {
        ModalButton(modal: Spacer()) {
            Spacer()
        }
    }
}
