//
//  OpenView.swift
//  TrickOrTreat
//
//  Created by Joao Filipe Reis Justo da Silva on 10/10/25.
//

import SwiftUI

struct OpenView: View {
    private var logoHeight: CGFloat = 160
    private var optionHeight: CGFloat = 56
    
    
    var body: some View {
        NavigationStack {
            VStack {
                logo.padding(.horizontal, 35)
                Spacer()
                VStack(spacing: DS.item) {
                    OptionLink(title: "Play", height: optionHeight) { GameView() }
                    OptionLink(title: "About", height: optionHeight) { EmptyView() }
                }.padding(.horizontal, 67)
            }
        }
        .padding(DS.page)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .navigationTitle("TrickOrTreat")
    }
    
    var logo: some View {
        RoundedRectangle(cornerRadius: DS.cornerRadius)
            .foregroundStyle(Color.placeholder)
            .frame(height: logoHeight)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    OpenView()
}
