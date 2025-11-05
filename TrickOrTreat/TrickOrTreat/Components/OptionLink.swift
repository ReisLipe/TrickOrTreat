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

    @State private var isActive = false     // controle da navegação

    var body: some View {
        ZStack {
            NavigationLink(destination: destination(),
                           isActive: $isActive) {
                EmptyView()
            }
            .hidden()

            Button {
                hapticManager.play(option: (.pop()))
                isActive = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: DS.cornerRadius)
                        .fill(color)
                        .frame(height: height)
                        .shadow(color: .branco.opacity(1), radius: 0, x: -4, y: 4)
                        .overlay(
                            Text(title)
                                .font(.sigmar(size: 32))
                                .foregroundStyle(.branco)
                                .textCase(.lowercase)
                                .padding(.horizontal, DS.item)
                        )
                }
            }
            .buttonStyle(.plain)
            .contentShape(Rectangle())
        }
    }
}
