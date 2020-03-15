//
//  MatchScoreView.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct MatchScoreView: View {
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Group{
                            Text("66")
                                .fontWeight(.bold)
                                .padding(.bottom)
                            Text("10")
                            Text("23")
                            Text("34")
                            Text("10")
                            Text("23")
                            Text("34")
                            Text("10")
                        }.frame(height: 30)
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Group{
                            Text("Totale")
                                .fontWeight(.bold)
                                .padding(.bottom)
                            Text("Primo")
                            Text("Secondo")
                            Text("Terzo")
                            Text("Quarto")
                            Text("Quinto")
                            Text("Sesto")
                            Text("Overtime")
                        }.frame(height: 30)
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Group{
                            Text("55")
                                .fontWeight(.bold)
                                .padding(.bottom)
                            Text("10")
                            Text("23")
                            Text("34")
                            Text("10")
                            Text("23")
                            Text("34")
                            Text("10")
                        }.frame(height: 30)
                    }
                    Spacer()
                }
            }
            .lineLimit(1)
            .font(.system(size: 24, weight: .regular, design: .rounded))
        }.padding([.top, .bottom])
    }
}

struct MatchScoreView_Previews: PreviewProvider {
    static var previews: some View {
        MatchScoreView()
    }
}
