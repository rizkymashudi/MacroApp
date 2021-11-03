//
//  HeaderOnboarding.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct HeaderOnboarding: View {
    var body: some View{
        VStack{
            Image("banner")
                .resizable()
                .frame(width: 390, height: 320, alignment: .center)
                .edgesIgnoringSafeArea(.all)
           
        }
    }
}

struct HeaderOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        HeaderOnboarding()
    }
}
