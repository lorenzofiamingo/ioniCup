//
//  NavigationButton.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 23/12/2019.
//

import SwiftUI

struct NavigationButton<Destination: View, Content: View>: View  {
    
    let destination: Destination
    
    let content: () -> Content
    
    
    var body: some View {
        NavigationLink(destination: destination) {
            content()
        }
        .buttonStyle(ModalButtonStyle())
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(destination: Spacer()) {
            Text("Prova")
        }
    }
}
