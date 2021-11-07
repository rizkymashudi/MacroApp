//
//  PasteViewScene.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct PasteViewScene: View {
    var body: some View {
        ZStack{
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            VStack{
                HeaderView()
            }
            VStack{
                Spacer()
                    .frame(height: 190)
                CopastView()
                StartSearchButton()
                    .position(x: 195, y: 90)
            }
        }.onTapGesture {
            self.hideKeyboard()
        }
    }
    
}

struct PasteViewScene_Previews: PreviewProvider {
    static var previews: some View {
        PasteViewScene()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
