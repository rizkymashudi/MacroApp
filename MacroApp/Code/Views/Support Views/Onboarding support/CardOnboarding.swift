//
//  CardOnboarding.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct CardOnboarding: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white)
                .shadow(color: colorPallete.primary.opacity(0.2) ,radius: 10 ,x: 1 , y: 5)
            
            HStack(alignment: .center, spacing: 10){
                VStack(alignment: .center){
                    Image(systemName: "doc.on.clipboard")
                        .foregroundColor(colorPallete.primary)
                        .font(.system(size: 45))
                        .padding(.leading, 15)
                        .padding(.bottom, 30)
                        .padding(.top)
                    Image(systemName: "magnifyingglass.circle.fill")
                        .foregroundColor(colorPallete.primary)
                        .font(.system(size: 45))
                        .padding(.leading, 15)
                        .padding(.bottom, 30)
                        .padding(.top, 15)
                    Image(systemName: "square.and.arrow.up.on.square.fill")
                        .foregroundColor(colorPallete.primary)
                        .font(.system(size: 45))
                        .padding(.leading, 15)
                        .padding(.bottom, 30)
                        .padding(.top, 15)
                }
                .padding(.leading, 5)
                .padding(.trailing, 2)
                
                
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Tempelkan Informasi")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                        Text("Masukkan informasi yang ingin kamu cari tahu kebenaranya")
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom, 40)
                    .padding(.top)
                    
                    VStack(alignment: .leading){
                        Text("Lakukan Pencarian")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                        Text("Menampilkan hasi pencarian sejenis dari Mafindo dan Search Engine")
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom, 25)
                    
                    VStack(alignment: .leading){
                        Text("Bagi ke orang terdekat")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                        Text("Bagi kebenarannya dengan orang terdekat kamu")
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom, 30)
                }
                .padding(.trailing, 10)
            }
        }
        .frame(width: 350, height: 420, alignment: .center)
    }
}

struct CardOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        CardOnboarding()
    }
}
