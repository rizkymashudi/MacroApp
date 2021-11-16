//
//  SearchEngineButton.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 16/11/21.
//

import SwiftUI

struct SearchEngineButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(size: 13, weight: .medium))
            .background(colorPallete.button)
            .foregroundColor(.black)
//            .cornerRadius(6)
//            .frame(width: 344, height: 56)
    }
}

struct GrowingSearchEngineButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(size: 13, weight: .medium))
            .frame(width: 297, height: 42)
            .background(colorPallete.button)
            .foregroundColor(.black)
            .cornerRadius(6)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


