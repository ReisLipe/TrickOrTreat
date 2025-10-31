//
//  OpenView.swift
//  TrickOrTreat
//
//  Created by Joao Filipe Reis Justo da Silva on 10/10/25.
//

import SwiftUI

struct OpenView: View {
    private var logoHeight: CGFloat = 160
    private var optionHeight: CGFloat = 70
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("bg1")
                    .resizable()
                    .ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    VStack(spacing: DS.button) {
                        OptionLink(title: "jogar", color: .roxo, height: optionHeight) { GameView() }
                        OptionLink(title: "créditos", color: .laranja, height: optionHeight) { Credits() }
                    }.padding(.horizontal, 56)
                }
                .padding(DS.page)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
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
