//
//  HeaderView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack{
            Image("HeaderBG")
                .resizable()
                .frame(width: 390, height: 320, alignment: .center)
                .edgesIgnoringSafeArea(.all)
            Spacer()
        }

    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
