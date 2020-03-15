//
//  TeamLogoImage.swift
//  ioniCup macOS
//
//  Created by Lorenzo Fiamingo on 09/03/2020.
//

import SwiftUI
import URLImage

// INELEGANTE!!!

struct TeamLogoImage: View {
    
    var url: String
    
    var pv = ProgressIndicator()
    
    var body: some View {
        guard url != "loading" else { return AnyView(pv.opacity(0.28)) }
        guard let url = URL(string: url) else { return AnyView(
            GeometryReader { g in
                VStack {
                    Spacer(minLength: 0)
                    HStack {
                        Spacer(minLength: 0)
                        Text("􀏅")
                            .font(.system(size: g.size.height > g.size.width ? g.size.width*0.5: g.size.height*0.5))
                            .opacity(0.28)
                        Spacer(minLength: 0)
                    }
                    Spacer(minLength: 0)
                }
        })}
        return AnyView(
            URLImage(url,
                     placeholder: {
                        ProgressView($0) { progress in
                            self.pv
                                .opacity(0.28).frame(width: 20, height: 10)
                        }
            }, content: { proxy in
                proxy.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onDrag { NSItemProvider(contentsOf: url)! }
            })
        )
    }
}

struct ProgressIndicator: NSViewRepresentable {
    
    var isAnimating: Bool = false
    
    let pi = NSProgressIndicator()
    
    func makeNSView(context: NSViewRepresentableContext<ProgressIndicator>) -> NSProgressIndicator {
        pi.doubleValue = 0
        pi.isIndeterminate = true
        pi.style = .spinning
        pi.startAnimation(nil)
        return pi
    }
    
    func updateNSView(_ nsView: NSProgressIndicator, context: NSViewRepresentableContext<ProgressIndicator>) {
    }
}
