//
//  PasteViewScene.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI
import SwiftUIKit

struct PasteViewScene: View {

    @State var yourText = ""
    @State var isShowingDetailView = false
    @State var isShowingActivationView = false
    
    @ObservedObject var apiYudistira = ApiYudistira()

    var body: some View {
            NavigationView{
                ZStack{
                    VStack{
                        HeaderView()
                        Spacer()
                    }
//                    VStack(alignment: .trailing){
//                        NavigationLink(destination: KeyboardActivationView(), isActive: $isShowingActivationView) {}
//                        .hidden()
//                        Button(action: {
//                            isShowingActivationView = true
//                            print("Keyboard Setting tapped")
//                        }){
//                            Image(systemName: "keyboard.badge.ellipsis")
//                                .foregroundColor(colorPallete.symbol)
//                                .font(.system(size: 25))
//                        }
//                        .frame(width: 44, height: 44)
//                        .position(x: 350, y: 30)
//                    }

                    VStack(alignment: .center, spacing: 10){
                        NavigationLink(destination: YudistiraListView(text: yourText, yourText: $yourText), isActive: $isShowingDetailView){ }
                        .hidden()
                        
                        Spacer()
                        VStack(alignment: .leading){
                            Spacer()
                            Text("Periksa informasi dengan cepat dan mudah")
                                .font(.system(size: 28, weight: .medium))
                                .foregroundColor(colorPallete.symbol)
                                .frame(width: 350, alignment: .leading)
                                .padding(.bottom, 1)
                            Text("Cukup tempelkan informasi yang anda dapat dan temukan faktanya.")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(colorPallete.symbol)
                                .frame(width: 340, alignment: .leading)
                        }
                        .frame(width: 140, height: 120)
                   
                        Spacer()
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
//                        .padding()
                        .padding(.bottom, 25)
                        Spacer()
                    }
                    .ignoresSafeArea(.all)
                }
                .navigationBarHidden(true)
                .onTapGesture {
                    hideKeyboard()
                }
        }
    
    }
    
}

struct PasteViewScene_Previews: PreviewProvider {
    static var previews: some View {
        PasteViewScene()
    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
