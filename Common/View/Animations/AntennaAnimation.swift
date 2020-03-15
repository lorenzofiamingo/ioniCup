//
//  AntennaAnimation.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 06/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct AntennaAnimation: View {
    
    @State private var startAnimation: Bool = false
    
    var animation: Animation {
        Animation
            .easeOut(duration: 2)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack{
            Image("􀖀.wave")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .opacity(startAnimation ? 0 : 3)
                .scaleEffect(startAnimation ? 1 : 0)
                .animation(animation)
            Image("􀖀.wave")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .opacity(startAnimation ? 0 : 4)
                .scaleEffect(startAnimation ? 1 : 0)
                .animation(animation.delay(1))
            Image("􀖀.pin")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.9)
                .foregroundColor(.white)
        }
        .onAppear {
            self.startAnimation = true
        }
    }
}
