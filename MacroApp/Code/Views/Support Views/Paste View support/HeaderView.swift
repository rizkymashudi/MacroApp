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
            ZStack{
                colorPallete.primary
                Circle() //top leading
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [colorPallete.orangeGradient, colorPallete.secondary, colorPallete.primary]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 298, height: 298)
                    .position(x: -30, y: 40)
                    .clipped()
                Circle() //bottom trailing background
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [colorPallete.primary, colorPallete.secondary, colorPallete.orangeGradient]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 298, height: 298)
                    .position(x: 320, y: 230)
                    .clipped()
                Circle() //top trailing
                    .fill(LinearGradient(gradient: Gradient(colors: [colorPallete.primary, colorPallete.secondary, colorPallete.orangeGradient]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .frame(width: 298, height: 298)
                    .position(x: 410, y: 15)
                    .clipped()
                Circle()
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [colorPallete.orangeGradient, colorPallete.primary]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                    .frame(width: 430, height: 430)
                    .position(x: 350, y: 410)
                    .clipped()
            }
            .frame(height: 320)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
