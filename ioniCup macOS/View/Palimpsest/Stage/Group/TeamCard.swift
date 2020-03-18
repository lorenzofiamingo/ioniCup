//
//  TeamCard.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 16/03/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct TeamCard: View {
    
    @ObservedObject var team: DB.Team.Document
    
    @State var isSelected: Bool = false
    
    @State private var showPopover: Bool = false
    
    var onSelection: ((Bool) -> Void)? = nil
    
    var body: some View {
        VStack {
            Spacer()
            WebImage(url: URL(string: team[\.logoURL]))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade) // Fade Transition
                .scaledToFit().padding(5)
                .background(isSelected ? Color.gray.opacity(0.4).cornerRadius(5) : Color.gray.opacity(0).cornerRadius(0))
            Spacer()
            Text(team[\.shortName])
                .lineLimit(1)
                .truncationMode(.middle).padding(2)
                .background(isSelected ? Color.blue.opacity(1).cornerRadius(2) : Color.blue.opacity(0).cornerRadius(0))
                .foregroundColor(isSelected ? .white : .black)
        }
        .padding()
        .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity, alignment: .top)
        .onTapGesture {
            if let onSelection = self.onSelection {
                self.isSelected.toggle()
                onSelection(self.isSelected)
            }
        }
        .onLongPressGesture {
            self.showPopover.toggle()
        }.popover(isPresented: $showPopover) {
            TeamDetailEditing(team: self.team).frame(idealWidth: 600)
        }
    }
}
