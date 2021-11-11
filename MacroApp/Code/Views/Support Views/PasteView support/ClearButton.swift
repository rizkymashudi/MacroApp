//
//  ClearButton.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 08/11/21.
//

import SwiftUI

struct buttonClear: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(size: 17, weight: .medium))
            .background(colorPallete.trashColor)
            .foregroundColor(.white)
            .cornerRadius(40)
            .frame(width: 41, height: 41)
    }
}

struct GrowingClearButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(size: 17, weight: .medium))
            .frame(width: 41, height: 41)
            .background(colorPallete.trashColor)
            .foregroundColor(.white)
            .cornerRadius(40)
            .scaleEffect(configuration.isPressed ? 1.9 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
    }
}
