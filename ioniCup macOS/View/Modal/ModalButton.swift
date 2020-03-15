//
//  ModalButton.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/12/2019.
//

import SwiftUI

struct ModalButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
            configuration
                .label
                .opacity(configuration.isPressed ? 0.2 : 1)
    }
}

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
        .buttonStyle(ModalButtonStyle())
    }
}
struct ModalButton_Previews: PreviewProvider {
    static var previews: some View {
        ModalButton(modal: Spacer()) {
            Spacer()
        }
    }
}
