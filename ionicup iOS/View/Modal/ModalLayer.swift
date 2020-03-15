//
//  ModalCapsule.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 06/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct ModalLayer<Content: View>: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let content: () -> Content
    
    var body: some View {
        ZStack {
            VStack {
                content().padding(.top, 30)
            }
            VStack {
                Capsule()
                    .foregroundColor(Color.gray)
                    .frame(width: 50, height: 5)
                    .padding()
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
        }
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
