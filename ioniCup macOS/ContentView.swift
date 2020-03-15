//
//  ContentView.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/12/2019.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var tab: Tab
    
    var body: some View {
        tab.view()
            .frame(minWidth: 896, idealWidth: 1024, maxWidth: .infinity, minHeight: 512, idealHeight: 768, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
