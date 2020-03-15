//
//  PhotoCardView.swift
//  ionicup
//
//  Created by Lorenzo Fiamingo on 05/12/2019.
//  Copyright © 2019 Lorenzo Fiamingo. All rights reserved.
//

import SwiftUI

struct PhotoCardView: View {
    
    var body: some View {
        Image("B")
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.5), radius: 6)
        
    }
}

struct PhotoCardView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCardView()
    }
}
