//
//  StartSearchButton.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct buttonSearch: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(size: 17, weight: .medium))
            .background(colorPallete.button)
            .foregroundColor(.black)
            .cornerRadius(6)
            .frame(width: 344, height: 56)
    }
}

struct GrowingSearchButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .font(.system(size: 17, weight: .medium))
            .frame(width: 344, height: 56)
            .background(colorPallete.button)
            .foregroundColor(.black)
            .cornerRadius(6)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

//struct StartSearchButton: View {
//    var body: some View {
//       Text(" ")
//    }
//}

//struct StartSearchButton_Previews: PreviewProvider {
//    static var previews: some View {
//        StartSearchButton()
//    }
//}

