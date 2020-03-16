//
//  Tab.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 23/12/2019.
//

import SwiftUI

class Tab: ObservableObject {
    
    @Published var value: Int = 1
    
    var labels = ["􀇴", "Palinsesto", "Calendario", "Squadre", "Regolamento"]
}

extension Tab {
    
    func view() -> AnyView {
        switch value {
        case 0:
            return AnyView(HomeView())
        case 1:
            return AnyView(PalimpsestView())
        case 3:
            return AnyView(TeamsView())
        default:
            return AnyView(Text(labels[value]))
        }
    }
}
