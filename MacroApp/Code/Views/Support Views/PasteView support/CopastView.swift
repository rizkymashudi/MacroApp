//
//  TextField.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct CopastView: View {

    private let placeHolderString = "Tempelkan / Paste Informasi yang anda dapat disini"
    @State var yourText = ""

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
                    .padding(.top)
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

            StartSearchButton(yourText: $yourText)
                .position(x: 195, y: 90)

        }
    }
}

struct CustomTextEditor: View {
    let placeHolder: String
    @Binding var yourText: String

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                if yourText.isEmpty {
                    Text(placeHolder)
                    .opacity(0.3)
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

//            if !yourText.isEmpty {
//                    Button {
//                        print("Button Bersihkan was tapped")
//                        yourText = ""
//                    } label: {
//                        Label("Bersihkan", systemImage: "trash")
//                    }.buttonStyle(buttonClear())
//            }
        }
    }
}

struct StartSearchButton: View {
    @Binding var yourText: String

    var body: some View {
        ZStack{
            Button("Mulai Pencarian"){
                print("button pressed")
            }
            .buttonStyle(GrowingSearchButton())
            .disabled(yourText.isEmpty)
            .opacity(yourText.isEmpty ? 0.5 : 1)
        }
    }
}



struct CopastView_Previews: PreviewProvider {
    static var previews: some View {
        CopastView()
    }
}

extension View {
    func getSafeArea()->UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

