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
    @State var hideTapToPasteArea = false

    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.white)
//                    .shadow(color: colorPallete.primary.opacity(0.2) ,radius: 10 ,x: 1 , y: 5)
                    .background(RoundedRectangle(cornerRadius: 8.0).stroke(colorPallete.symbol, lineWidth: 4.0))
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        Spacer(minLength: 10)
                        TextEditor(text: $yourText)
                            .frame(width: 320, height: 390, alignment: .center)
                            .cornerRadius(8)
                    }
                }
                .overlay(
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button {
                                print("Button Bersihkan was tapped")
                                yourText = ""
                                hideTapToPasteArea = false
                            } label: {
                                Image(systemName: "trash")
                            }
                                .buttonStyle(GrowingClearButton())
                        }
                        .padding(.trailing, 10)
                        .padding(.bottom, 20)
                    }
                )
                .overlay(
                    VStack(alignment: .center, spacing: 10){
                        if yourText.isEmpty {
                            VStack{
                                ZStack{
                                    Image(systemName: "hand.tap")
                                        .foregroundColor(colorPallete.symbol)
                                        .font(.system(size: 75))
                                    Image("BgTapIcon")
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                }
                                Text(placeHolderString)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 17))
                            }
                        }
                    }
                    .frame(width: 350, height: 420, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(colorPallete.bgListview))
                    .onTapGesture {
                        let pasteboard = UIPasteboard.general
                        if pasteboard.hasStrings {
                            print("clipboard contain value")
                            guard let pasteText = pasteboard.string else {
                                showingAlert = true
                                return
                            }

                            if pasteText == "" {
                                showingAlert = true
                            } else {
                                yourText = pasteText
                                hideTapToPasteArea = true
                            }

                        } else {
                            showingAlert = true
                            print("doesnt contain value")
                        }

                    }
                    .opacity(hideTapToPasteArea ? 0 : 1)
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Clipboard Kosong"),
                            message: Text("salin/copy teks terlebih dahulu untuk \n ditempel/paste"),
                            dismissButton: .default(
                                Text("Oke"), action: {
                                    print("Button Alert Oke was tapped")
//                                    hideTapToPasteArea = false
                                }
                            )
                        )
                    }
                    
                )
            }
            .frame(width: 350, height: 420)


        }
    }
}

#if canImport(UIKit)
extension View {
    func disappearKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

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

