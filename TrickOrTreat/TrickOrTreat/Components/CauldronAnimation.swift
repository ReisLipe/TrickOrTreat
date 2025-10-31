//
//  CauldronAnimation.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//

import SwiftUI

struct CauldronAnimation: View {
    @State private var currentIndex = 0
        let images = ["caldeirao1", "caldeirao2", "caldeirao3","caldeirao2", "caldeirao3", "caldeirao2"]
        let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
        
        var body: some View {
            Image(images[currentIndex])
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .onReceive(timer) { _ in
                    currentIndex = (currentIndex + 1) % images.count
                }
        }
}

#Preview {
    CauldronAnimation()
}
