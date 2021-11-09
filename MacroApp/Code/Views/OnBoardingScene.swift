//
//  OnBoardingScene.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct OnBoardingScene: View {
//    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        ZStack{
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            VStack{
                HeaderOnboarding()
                Spacer()
            }
            VStack{
                Spacer()
                    .frame(height: 230)
                CardOnboarding()
                ButtonStartOnboarding()
                    .position(x: 195, y: 50)
            }
        }
    }
}

struct OnBoardingScene_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScene()
    }
}
