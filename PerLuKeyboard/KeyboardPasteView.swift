//
//  KeyboardPasteView.swift
//  PerLuKeyboard
//
//  Created by Rizky Mashudi on 25/11/21.
//

import SwiftUI

struct KeyboardPasteView: View {
    var body: some View {
        VStack{
//            HStack{
//                Button(action: {
//
//                }){
//                    Image(systemName: "xmark")
//                        .foregroundColor(.white)
//                }
//
//                Button(action: {
//
//                }){
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(.white)
//                }
//
//                Button(action: {
//
//                }){
//                    Image(systemName: "magnifyingglass")
//                        .foregroundColor(.white)
//                }
//            }
//            .background(.green)
//            .frame(height: 50)
            
            VStack{
                Text("Paste disini")
            }
            .frame(height: 200)
            
        }
        frame(width: 375, height: 250)
    }
}

struct KeyboardPasteView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardPasteView()
    }
}
