//
//  CauldronAnimation.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//

import SwiftUI

struct CauldronAnimation: View {
    @Binding var isAnimating: Bool
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    let images = ["caldeirao1", "caldeirao2", "caldeirao3","caldeirao2", "caldeirao3", "caldeirao2"]
    
    var body: some View {
        Image(images[currentIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            .onChange(of: isAnimating) { newValue in
                if newValue {
                    startAnimation()
                } else {
                    stopAnimation()
                }
            }
    }
    
    func startAnimation() {
        currentIndex = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % images.count
        }
    }
    
    func stopAnimation() {
        timer?.invalidate()
        timer = nil
        currentIndex = 0
    }
}
