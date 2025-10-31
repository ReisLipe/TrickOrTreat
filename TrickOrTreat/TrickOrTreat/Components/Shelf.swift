//
//  Shelf.swift
//  TrickOrTreat
//
//  Created by mih on 31/10/25.
//

import SwiftUI

struct Shelf: View {
    let columns = [
        GridItem(.fixed(100), spacing: 2),
        GridItem(.fixed(100), spacing: 2),
        GridItem(.fixed(100), spacing: 2)
    ]
    
    let images = ["acucar", "sangue", "calda", "acucar", "sangue", "calda","acucar", "sangue", "calda","acucar", "sangue", "calda"]
    
    var body: some View {
        
        ZStack {
            Image("shelf")
                .resizable()
                .scaledToFit()
                .frame(width: 360)
            //            .padding(.bottom, 140)

            LazyVGrid(columns: columns, spacing: 40) {
                ForEach(0..<12, id: \.self) { index in
                    Button {
                        
                    } label: {
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    Shelf()
}
