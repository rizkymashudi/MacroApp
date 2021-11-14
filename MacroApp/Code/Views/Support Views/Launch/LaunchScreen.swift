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
        Image("Launch")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 90, height: 90, alignment: .center)
            .scaleEffect(animate ? 30 : 1.5)
            .animation(Animation.easeIn(duration: 1.5))
                       
   }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen(animate: .constant(false))
    }
}
