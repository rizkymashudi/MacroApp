//
//  TextField.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct CopastView: View {

    private let placeHolderString = "Ketuk untuk menampilkan informasi yang anda salin"
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
//                    .padding(.top, 10)
                }
                .overlay(
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button {
                                print("Button Bersihkan was tapped")
                                yourText = ""
                            } label: {
                                Image(systemName: "trash")
                            }
                                .buttonStyle(GrowingClearButton())
                        }
                        .padding(.trailing, 10)
                        .padding(.bottom, 20)
                    }
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

//extension View {
//    func getSafeArea()->UIEdgeInsets {
//        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//}

