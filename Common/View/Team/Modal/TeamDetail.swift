//
//  TeamDetail.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 06/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI
import CoreLocation


struct TeamDetail: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                MapView(coordinate: CLLocationCoordinate2D(latitude: 38, longitude: 16))
                    .frame(height: 600)
                    .padding(.top, -300)
                Image("example1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(.top, -75)
                    .shadow(color: Color.black.opacity(0.5), radius: 6)
                VStack(spacing: 0) {
                    Text("Eutimo")
                        .font(.system(size: 40, weight: .semibold, design: .rounded))
                    Text("Locri")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.medium)
                    HStack {
                        Text("Allenatori")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.medium)
                        Spacer()
                    }.padding(.top)
                    
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading) {
                            Group {
                                Text("François Goortioiy")
                                Text("Paolo Maldini")
                                Text("Cesare Maldini")
                            }
                            .frame(height: 30)
                        }
                        Spacer()
                    }
                    HStack {
                        Text("Giocatori")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.medium)
                        Spacer()
                    }.padding(.top)
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading) {
                            Group {
                                Text("François Goortioiy")
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
                        VStack() {
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
                        VStack() {
                            Group{
                                Text("28/02/2018")
                                Text("28/02/2018")
                                Text("28/02/2018")
                                Text("28/02/2018")
                                Text("28/02/2018")
                                Text("28/02/2018")
                                Text("28/02/2018")
                            }
                            .frame(height: 30)
                        }
                        Spacer()
                    }
                }
                .padding([.leading, .trailing])
                .lineLimit(1)
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .minimumScaleFactor(.leastNonzeroMagnitude)
            }
        }.padding(.top, -30)
    }
}


struct TeamModalView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetail()
    }
}
