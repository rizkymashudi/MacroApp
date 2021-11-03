//
//  TextField.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct CopastView: View {
    
    @State private var yourText: String = "Tempelkan / Paste Informasi yang anda dapat disini"
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white)
                .shadow(color: colorPallete.primary.opacity(0.2) ,radius: 10 ,x: 1 , y: 5)
            
            ScrollView(.vertical, showsIndicators: true){
                VStack{
                    TextEditor(text: $yourText)
                        .opacity(0.3)
                        .frame(width: 320, height: 390, alignment: .center)
                        .cornerRadius(8)
                }
                .padding(.top)
            }
    
    
        }
        .frame(width: 350, height: 420, alignment: .center)
    }
}

struct CopastView_Previews: PreviewProvider {
    static var previews: some View {
        CopastView()
    }
}
