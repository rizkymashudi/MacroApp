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
            ZStack(alignment: .topLeading){
                Image("HeaderBG")
                    .resizable()
                    .frame(width: 390, height: 320, alignment: .center)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading){
                    Text("Temukan fakta dengan cepat dan mudah")
                        .font(.system(size: 28, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 300, alignment: .leading)
                        .padding(.bottom, 1)
                    Text("Cukup tempelkan informasi yang anda dapat dan temukan faktanya.")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.white)
                        .frame(width: 310, alignment: .leading)
                }
                .position(x: 175, y: 95)
            }
        }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
