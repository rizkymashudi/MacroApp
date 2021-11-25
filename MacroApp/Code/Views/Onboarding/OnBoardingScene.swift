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
        VStack{
            ZStack{
                VStack{
                    ZStack{
                        HeaderView()
                        Image("Onboard Illustration")
                            .padding(.top, 40)
                    }
                    Spacer()
                }
                
                VStack{
                    Spacer()
                    CardOnboarding()
                        .padding(.top, 180)
                    Spacer()
                    ButtonStartOnboarding()
//                        .padding(.top, 30)
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct OnBoardingScene_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingScene()
    }
}
