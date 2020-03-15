//
//  MatchCollection.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 07/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct MatchCollection: View {
    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
    
    @State private var searchText = ""
    
    @State private var showCancelButton: Bool = false
    
    @State private var selectedMatchType = 0
    
    var matchType = ["Giocatori", "Parziali", "Extra"]
    
    var body: some View {
        
        VStack {
            // Search view
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Cerca", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        print("onCommit")
                    }).foregroundColor(.primary)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground).opacity(1))
                .cornerRadius(10.0)
                .padding(.top, showCancelButton ? 12 : 0)
                
                if showCancelButton  {
                    Button("Annulla") {
                        UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                        self.searchText = ""
                        self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(showCancelButton)
            
            Picker(selection: $selectedMatchType, label: EmptyView()) {
                ForEach(0..<matchType.count){
                    Text(self.matchType[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .zIndex(1)
            .padding()
            
            VStack {
                List {
                    // Filtered list of names
                    MatchSCard()
                    MatchSCard()
                    MatchSCard()
                    MatchSCard()
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                }
                .resignKeyboardOnDragGesture()
            }
        }
        .navigationBarTitle("Partite")
        .animation(.easeOut(duration: 0.2))
    }
    
}
struct MatchAllView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MatchCollection()
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
