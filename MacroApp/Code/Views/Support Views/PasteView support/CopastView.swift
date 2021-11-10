//
//  TextField.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct CopastView: View {

    private let placeHolderString = "Tempelkan / Paste Informasi yang anda dapat disini"
    @Binding var yourText: String

    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: colorPallete.primary.opacity(0.2) ,radius: 10 ,x: 1 , y: 5)

                ScrollView(.vertical, showsIndicators: false){
                    VStack(){
                        CustomTextEditor.init(placeHolder: placeHolderString, yourText: $yourText)
                    }
                    .padding(.top, 10)
                }
                .overlay(
                    Button {
                        print("Button Bersihkan was tapped")
                        yourText = ""
                    } label: {
                        Label("Bersihkan", systemImage: "trash")
                    }
                        .buttonStyle(buttonClear())
                        .padding(.trailing)
                    ,alignment: .bottomLeading
                )
            }
            .frame(width: 350, height: 420)


        }
    }
}




//
//struct CopastView_Previews: PreviewProvider {
//    static var previews: some View {
//        CopastView()
//    }
//}

extension View {
    func getSafeArea()->UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

