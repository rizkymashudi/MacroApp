//
//  LaunchScreen.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 14/11/21.
//

import SwiftUI

struct LaunchScreen: View {
    @Binding var animate: Bool
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [colorPallete.primary, colorPallete.secondary, colorPallete.ternary, colorPallete.orangeGradient]), startPoint: .bottomLeading, endPoint: .topTrailing)
            Image("LogoLaunch")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60, alignment: .center)
                .scaleEffect(animate ? 30 : 1.5)
                .animation(Animation.easeIn(duration: 1.5))
        }
        .edgesIgnoringSafeArea(.all)
        
   }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen(animate: .constant(false))
    }
}
