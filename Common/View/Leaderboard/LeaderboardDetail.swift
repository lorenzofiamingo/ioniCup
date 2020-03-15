//
//  LeaderboardDetail.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 07/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct LeaderboardDetail: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Girone A")
                .font(.system(size: 30, weight: .bold, design: .rounded))
            HStack(alignment: .bottom) {
                
                Group{
                    VStack(spacing: 10) {
                        Group {
                            TeamSCard()
                            TeamSCard()
                            TeamSCard()
                            TeamSCard()
                            TeamSCard()
                            TeamSCard()
                        }
                        .frame(height: 30)
                    }
                    Spacer()
                }
                Group{
                    VStack(spacing: 10) {
                        Group {
                            Text("PG")
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
                Group{
                    VStack(spacing: 10) {
                        Group {
                            Text("PV")
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
                Group{
                    VStack(spacing: 10) {
                        Group {
                            Text("PP")
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
                Group{
                    VStack(spacing: 10) {
                        Group {
                            Text("PT")
                                .fontWeight(.bold)
                            Text("23")
                                .fontWeight(.bold)
                            Text("34")
                                .fontWeight(.bold)
                            Text("10")
                                .fontWeight(.bold)
                            Text("23")
                                .fontWeight(.bold)
                            Text("34")
                                .fontWeight(.bold)
                            Text("10")
                                .fontWeight(.bold)
                        }
                        .frame(height: 30)
                    }
                    Spacer()
                }
            }
            .padding(.vertical)
            Spacer()
            Text("Le prime 2 squadre sono in corsa per il titolo")
            Text("Le prime 2 squadre sono in corsa per il titolo")
            Text("Le prime 2 squadre sono in corsa per il titolo")
            Spacer()
            AttachmentCard()
            Spacer()
            Spacer()
        }.padding([.top, .horizontal])
    }
}

struct LeaderboardDetail_Previews: PreviewProvider {
    static var previews: some View {
        ModalLayer {
            LeaderboardDetail()
        }
    }
}
