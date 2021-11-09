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
    
    var body: some View{
        VStack{
            if shouldShowOnboarding {
                OnBoardingScene()
            } else {
                PasteViewScene()
                    .transition(.move(edge: .trailing))
            }
        }
        .animation(.default)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
