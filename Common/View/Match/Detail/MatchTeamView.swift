//
//  MatchTeamView.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 06/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct MatchTeamView: View {
    
    var body: some View {
        HStack(alignment: .top) {
            Spacer()
            VStack(spacing: 10) {
                Group {
                    Text("10")
                    Text("23")
                    Text("34")
                    Text("10")
                    Text("23")
                    Text("34")
                    Text("10")
                }
                .frame(height: 30)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text("Lorenzo Fiamingo")
                    Text("Giovanni Casiero")
                    Text("Lorenzo Fiamingo")
                    Text("Giovanni Casiero")
                    Text("Lorenzo Fiamingo")
                    Text("Giovanni Casiero")
                    Text("Lorenzo Fiamingo")
                }
                .frame(height: 30)
            }
            Group {
                Spacer()
                Spacer()
                Spacer()
            }
            VStack(alignment: .trailing, spacing: 10) {
                Group {
                    Text("François Goo")
                    Text("Paolo Maldini")
                    Text("Cesare Maldini")
                    Text("Daniel Manea")
                    Text("François Goor")
                    Text("Paolo Maldini")
                    Text("Cesare Maldini")
                    
                }
                .frame(height: 30)
            }
            Spacer()
            VStack(spacing: 10) {
                Group{
                    Text("10")
                    Text("23")
                    Text("34")
                    Text("10")
                    Text("23")
                    Text("34")
                    Text("10")
                }
                .frame(height: 30)
            }
            Spacer()
        }
        .font(.system(size: 18, design: .rounded))
        .lineLimit(1)
        .minimumScaleFactor(.leastNonzeroMagnitude)
    }
}


struct MatchTeamView_Previews: PreviewProvider {
    static var previews: some View {
        MatchTeamView()
    }
}
