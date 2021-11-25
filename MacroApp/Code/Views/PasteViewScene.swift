//
//  PasteViewScene.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct PasteViewScene: View {

    @State var yourText = ""
    @State var isShowingDetailView = false
    @StateObject var apiBackend = ApiBackend()
    @ObservedObject var apiYudistira = ApiYudistira()
  
    var body: some View {
            NavigationView{
                ZStack{
                    VStack{
                        HeaderView()
                        Spacer()
                    }
                    VStack(alignment: .center, spacing: 10){
                        NavigationLink(destination: YudistiraListView(text: yourText), isActive: $isShowingDetailView){ }
                        .hidden()
                        VStack(alignment: .leading){
                            Text("Temukan hoax dengan cepat dan mudah")
                                .font(.system(size: 28, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 350, alignment: .leading)
                                .padding(.bottom, 1)
                            Text("Cukup tempelkan informasi yang anda dapat dan temukan faktanya.")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(.white)
                                .frame(width: 350, alignment: .leading)
//                            Spacer()
                        }
                        .frame(width: 250, height: 140)
                        .padding(.top, 40)
                        .padding(.bottom, 10)
        
                        CopastView(yourText: $yourText)
                        Spacer()
                        
                        Button(action: {
                            isShowingDetailView = true
                        }){
                            Text("Mulai Pencarian")
                        }
                        .buttonStyle(GrowingSearchButton())
                        .disabled(yourText.isEmpty)
                        .opacity(yourText.isEmpty ? 0.5 : 1)
                        Spacer()
                    }
                    .ignoresSafeArea(.all)
                }
                .navigationBarHidden(true)
                .onTapGesture {
                    self.hideKeyboard()
                }
        }
    
    }
    
}

//struct PasteViewScene_Previews: PreviewProvider {
//    static var previews: some View {
//        PasteViewScene()
//    }
//}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
