//
//  MatchDetail.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 19/03/2020.
//

import SwiftUI

struct MatchDetailEditor: View {
    
    @ObservedObject var match: DB.Match.Document
    
    private let titleWidth: CGFloat = 100
    
    var status = ["Inizializzata", "Designata", "Live", "Terminata"]
    
    var selectedStrength: Binding<Int> {
        Binding<Int>(get: {
            self.match[\.status].isOver == true ? 3 : self.match[\.status].isLive == true ? 2 : self.match[\.status].isAppointed == true ? 1 : 0
        }, set: { newValue in
            switch newValue {
            case 0:
                self.match[\.status].isAppointed = false
                self.match[\.status].isLive = false
                self.match[\.status].isOver = false
            case 1:
                self.match[\.status].isAppointed = true
                self.match[\.status].isLive = false
                self.match[\.status].isOver = false
            case 2:
                self.match[\.status].isAppointed = true
                self.match[\.status].isLive = true
                self.match[\.status].isOver = false
            case 3:
                self.match[\.status].isAppointed = true
                self.match[\.status].isLive = false
                self.match[\.status].isOver = true
            default:
                self.match[\.status].isAppointed = false
                self.match[\.status].isLive = false
                self.match[\.status].isOver = false
            }
            self.match.update()
        })
    }
    
    var body: some View {
            ScrollView {
                HStack {
                    HStack {
                        Spacer()
                        Text("Stato:")
                    }.frame(maxWidth: titleWidth)
                    Picker("", selection: selectedStrength) {
                        ForEach(0..<status.count) {
                            Text(self.status[$0])
                        }
                    }
                }
                Text("appointed: " + (match[\.status].isAppointed ? "true" : "false"))
                Text("live: " + (match[\.status].isLive ? "true" : "false"))
                Text("over: " + (match[\.status].isOver ? "true" : "false"))
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

