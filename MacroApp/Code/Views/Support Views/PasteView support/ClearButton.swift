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
            .background(colorPallete.buttonClearColor)
            .foregroundColor(.black)
            .cornerRadius(6)
            .frame(width: 344, height: 56)
    }
}
