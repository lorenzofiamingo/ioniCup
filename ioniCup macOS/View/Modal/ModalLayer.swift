//
//  ModalLayer.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/12/2019.
//

import SwiftUI

struct ModalLayer<Content: View>: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            content()
            Divider()
            HStack {
                Button("Esci") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                Button("Modifica") {}

            }
            .padding(.vertical)
        }.frame(width: 800) // c'è un bug quando si modifica la larghezza... controllare fra una anno
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}

struct ModalCapsule_Previews: PreviewProvider {
    static var previews: some View {
        ModalLayer {
            Spacer()
        }
    }
}
