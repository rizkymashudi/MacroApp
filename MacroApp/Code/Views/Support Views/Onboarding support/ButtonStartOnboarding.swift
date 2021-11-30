//
//  ButtonStartOnboarding.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI


//struct buttonStart: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .font(.system(size: 17, weight: .medium))
//            .background(colorPallete.symbol)
//            .foregroundColor(colorPallete.button)
//            .cornerRadius(6)
//            .frame(width: 344, height: 56)
//    }
//}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geo in
            configuration.label
                .padding()
                .font(.system(size: 17, weight: .medium))
                .frame(width: geo.size.width * 0.9, height: 56)
                .background(colorPallete.symbol)
                .foregroundColor(colorPallete.button)
                .cornerRadius(6)
                .scaleEffect(configuration.isPressed ? 1.1 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
                .frame(width: geo.size.width)
                .offset(y: geo.size.height / 1.2)
        }
    }
}


struct ButtonStartOnboarding: View {
    @AppStorage("Onboard") var shouldShowOnboarding: Bool = true
    
    var body: some View {
        ZStack{
            Button(action: {
//                shouldShowOnboarding.toggle()
                shouldShowOnboarding = false
                print("move")
            }){
                Text("Ayo mulai!")
            }
            .buttonStyle(GrowingButton())
        }
        
    }
}

struct ButtonStartOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStartOnboarding(shouldShowOnboarding: true)
    }
}
