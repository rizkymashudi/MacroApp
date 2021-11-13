//
//  TextField.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct CopastView: View {

    private let placeHolderString = "Ketuk untuk menampilkan informasi \n yang anda salin"
    @Binding var yourText: String
    @State private var showingAlert = false

    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: colorPallete.primary.opacity(0.2) ,radius: 10 ,x: 1 , y: 5)

                ScrollView(.vertical, showsIndicators: false){
                    VStack(){
                        TextEditor(text: $yourText)
                            .frame(width: 320, height: 390, alignment: .center)
                            .cornerRadius(8)
                    }
                }
                .overlay(
                    VStack{
                        Spacer()
                        if yourText.isEmpty {
                            Button {
                                print("Button hand.tap was tapped")
                                let pasteboard = UIPasteboard.general
                                if pasteboard.hasStrings {
                                    yourText = pasteboard.string!
                                    showingAlert = false
                                }
                                else {
                                    showingAlert = true
                                }
                            } label: {
                                Image(systemName: "hand.tap")
                                    .foregroundColor(colorPallete.symbol)
                                    .font(.system(size: 75))
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(
                                    title: Text("Clipboard Kosong"),
                                    message: Text("salin/copy teks terlebih dahulu untuk \n ditempel/paste"),
                                    dismissButton: .default(Text("Oke"))
                                )
                            }

                            Text(placeHolderString)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 17))
                        }

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

