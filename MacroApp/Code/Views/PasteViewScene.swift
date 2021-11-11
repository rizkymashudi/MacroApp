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
  
    var body: some View {
        ZStack{
            NavigationView{
                ZStack{
                    HeaderView()
                    VStack{
                        NavigationLink(destination: YudistiraListView(), isActive: $isShowingDetailView){ YudistiraListView() }
                        .hidden()
                        VStack(alignment: .leading){
                            Text("Temukan fakta dengan cepat dan mudah")
                                .font(.system(size: 28, weight: .medium))
                                .foregroundColor(.white)
                                .frame(width: 350, alignment: .leading)
                                .padding(.bottom, 1)
                            Text("Cukup tempelkan informasi yang anda dapat dan temukan faktanya.")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(.white)
                                .frame(width: 350, alignment: .leading)
                            Spacer()
                        }
                        .frame(width: 250, height: 140)
                        CopastView(yourText: $yourText)
                        Spacer(minLength: 50)
                        
                        Button("Pindai teks dan mulai pencarian"){
                            print("button pressed")
                            isShowingDetailView = true
                        }
                        .buttonStyle(GrowingSearchButton())
                        .disabled(yourText.isEmpty)
                        .opacity(yourText.isEmpty ? 0.5 : 1)
                            .position(x: 195, y: 50)
                        Spacer(minLength: 90)
                    }
                }
                .navigationBarHidden(true)
            }.onTapGesture {
                self.hideKeyboard()
            }
        }
    }
    
}

struct PasteViewScene_Previews: PreviewProvider {
    static var previews: some View {
        PasteViewScene()
    }
}

struct CustomTextEditor: View {
    let placeHolder: String
    @Binding var yourText: String

    var body: some View {
    
        ZStack(alignment: .topLeading) {
            if yourText.isEmpty {
                Text(placeHolder)
                .opacity(0.3)
                .padding(.top, 10)
            }

            TextEditor(text: $yourText)
                .frame(width: 320, height: 390, alignment: .center)
                .cornerRadius(8)
        }
        .onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }

    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
