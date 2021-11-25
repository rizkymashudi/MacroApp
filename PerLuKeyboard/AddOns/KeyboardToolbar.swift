//
//  KeyboardToolbar.swift
//  PerLuKeyboard
//
//  Created by Rizky Mashudi on 25/11/21.
//

import SwiftUI
import KeyboardKit
import Foundation

struct KeyboardToolbar: View {
    var body: some View {
        HStack(alignment: .center){
            Button(action: {
                print("button switch tapped")
                
            }){
                Image("keyboardButtonSm")
            }
            .padding(.top, 5)
            .padding(.leading, 5)
            Spacer()
        }
        .frame(height: 50)
    }
}

struct KeyboardToolbar_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardToolbar()
    }
}
