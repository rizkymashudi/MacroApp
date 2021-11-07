//
//  TextField.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct CopastView: View {

    private let placeHolderString = "Tempelkan / Paste Informasi yang anda dapat disini"
    @State private var yourText = ""
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white)
                .shadow(color: colorPallete.primary.opacity(0.2) ,radius: 10 ,x: 1 , y: 5)
            
            ScrollView(.vertical, showsIndicators: true){
                VStack{
                    CustomTextEditor.init(placeHolder: placeHolderString, yourText: $yourText)
                }
                .padding(.top)
            }
    
    
        }
        .frame(width: 350, height: 420, alignment: .center)
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

struct CopastView_Previews: PreviewProvider {
    static var previews: some View {
        CopastView()
    }
}

