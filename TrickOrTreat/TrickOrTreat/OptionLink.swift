//
//  OptionLink.swift
//  TrickOrTreat
//
//  Created by Joao Filipe Reis Justo da Silva on 10/10/25.
//

import SwiftUI

struct OptionLink<Destination: View>: View {
    let title: String
    let color: Color
    var height: CGFloat
    @ViewBuilder var destination: () -> Destination
    

    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                RoundedRectangle(cornerRadius: DS.cornerRadius)
                    .fill(color)
                    .frame(height: height)
                    .shadow(color: .white.opacity(1), radius: 0, x: -4, y: 4)
                    .overlay(
                            Text(title)
                                .font(.sigmar(size: 32))
                                .foregroundStyle(.white)
                                .textCase(.lowercase)
                            .padding(.horizontal, DS.item)
                    )
            }
        }
        .buttonStyle(.plain)             // mantém o visual do cartão
        .contentShape(Rectangle())       // área de toque = cartão inteiro
    }
}

#Preview {
    OpenView()
}
