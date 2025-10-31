//
//  OptionLink.swift
//  TrickOrTreat
//
//  Created by Joao Filipe Reis Justo da Silva on 10/10/25.
//

import SwiftUI

struct OptionLink<Destination: View>: View {
    let title: String
    var height: CGFloat
    @ViewBuilder var destination: () -> Destination
    

    var body: some View {
        NavigationLink(destination: destination) {
            RoundedRectangle(cornerRadius: DS.cornerRadius)
                .fill(Color.placeholder)
                .frame(height: height)
                .overlay(
                    HStack {
                        Text(title)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal, DS.item)
                )
        }
        .buttonStyle(.plain)             // mantém o visual do cartão
        .contentShape(Rectangle())       // área de toque = cartão inteiro
    }
}
