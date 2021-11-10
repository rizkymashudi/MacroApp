//
//  PasteViewScene.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct PasteViewScene: View {

    @State private var isShowingDetailView = false
  
    var body: some View {
        NavigationView{
            ZStack{
                HeaderView()
                VStack{
                    NavigationLink(destination: YudistiraListView(), isActive: $isShowingDetailView){ YudistiraListView() }
                    .navigationBarHidden(true)
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
                    CopastView()
                    Spacer(minLength: 50)
                    Button("Pindai teks dan mulai pencarian"){
                        print("button pressed")
                        isShowingDetailView = true
                    }
                    .buttonStyle(GrowingSearchButton())
                        .position(x: 195, y: 50)
                    Spacer(minLength: 90)
                }
            }
        }.onTapGesture {
            self.hideKeyboard()
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
