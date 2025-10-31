//
//  GameView.swift
//  TrickOrTreat
//
//  Created by Joao Filipe Reis Justo da Silva on 10/10/25.
//

import SwiftUI

struct EdgeInsetsRatio {
    var top: CGFloat
    var leading: CGFloat
    var bottom: CGFloat
    var trailing: CGFloat
}

struct GameView: View {
    private let cols: Int = 3
    private let rows: Int = 4
    private let insetRatio: CGFloat = 0.12 // 12%
    
    var body: some View {
        shelf
            
//            Grid {
//                GridRow { ForEach(0..<3) {_ in boxPlaceholder }}.padding()
//                GridRow { ForEach(0..<3) {_ in boxPlaceholder }}.padding()
//                GridRow { ForEach(0..<3) {_ in boxPlaceholder }}.padding()
//                GridRow { ForEach(0..<3) {_ in boxPlaceholder }}.padding()
//            }
    }
    
    var shelf: some View {
        let cols: Int = 3
        let rows: Int = 4
        
        // Quanto “folga” dentro de cada célula (0.20 = 20% menor que a célula)
        let cellInsetRatio: CGFloat = 0.20
        
        // Inset proporcional para alinhar com a madeira útil (topeiras/bordas curvas)
        let contentInsets: EdgeInsetsRatio = .init(
            top: 0.18,
            leading: 0.07,
            bottom: 0.06,
            trailing: 0.07
        )
        
        return Image("shelf")
            .resizable()
            .scaledToFit()
            .overlay {
                GeometryReader { geo in
                    let width = geo.size.width
                    let height = geo.size.height
                    
                    // Área útil por proporção
                    let x0 = width * contentInsets.leading
                    let y0 = height * contentInsets.top
                    
                    let innerW = width * (1 - contentInsets.leading - contentInsets.trailing)
                    let innerH = height * (1 - contentInsets.top - contentInsets.bottom)
                    
                    let cellW = innerW / CGFloat(cols)
                    let cellH = innerH / CGFloat(rows)
                    let side  = min(cellW, cellH) * (1 - cellInsetRatio)
                    
                    // (Opcional) caixa de debug da área útil
                     Path { p in p.addRect(CGRect(x: x0, y: y0, width: innerW, height: innerH)) }
                         .stroke(.red.opacity(0.4), lineWidth: 1)
                    
                    ForEach(0..<rows, id: \.self) { r in
                        ForEach(0..<cols, id: \.self) { c in
                            boxPlaceholder
                                .frame(width: side, height: side)
                                .position(
                                    x: x0 + (CGFloat(c) + 0.5) * cellW,
                                    y: y0 + (CGFloat(r) + 0.5) * cellH
                                )
                        }
                    }
                }
            }
    }
    
    var boxPlaceholder: some View {
        RoundedRectangle(cornerRadius: 8)
            .foregroundStyle(Color.placeholderDark)
            .frame(width: 64, height: 64)
    }
}

#Preview {
    GameView()
}
