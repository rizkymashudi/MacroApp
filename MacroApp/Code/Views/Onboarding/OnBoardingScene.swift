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
                        GeometryReader { geo in
                            Image("Onboard Illustration")
                                .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.25)
                                .frame(width: geo.size.width)
                                .offset(y: geo.size.height / 9)
                        }
                    }
                    Spacer()
                }
                
                VStack{
                    Spacer()
                    CardOnboarding()
                        .padding(.top, 340)
                    ButtonStartOnboarding()
                        .padding(.bottom, 30)
                    Spacer()
                }
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
