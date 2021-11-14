//
//  ContentView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 21/10/21.
//

import SwiftUI

///Jangan dihapus
//struct MainView: View {
//    @State var shouldShowOnboarding: Bool = true
//
//    var body: some View{
//        ZStack{
//            PasteViewScene()
//
//        }
//        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
//            OnBoardingScene(shouldShowOnboarding: $shouldShowOnboarding)
//                .transition(.move(edge: .trailing))
//        })
//        .animation(.default)
//
//    }
//}

struct MainView: View {
    @AppStorage("Onboard") var shouldShowOnboarding: Bool = true
    @State var isActive : Bool = false
    @State var animate : Bool = false
    
    var body: some View{
        VStack{
            if isActive {
                if shouldShowOnboarding {
                    OnBoardingScene()
                } else {
                    PasteViewScene()
                }
            } else {
                LaunchScreen(animate: $animate)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation{
                    isActive = true
                    animate.toggle()
                }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
