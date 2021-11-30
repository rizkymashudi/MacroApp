//
//  CardOnboarding.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct CardOnboarding: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.white)
                    .background(RoundedRectangle(cornerRadius: 8.0).stroke(.gray, lineWidth: 1))
                VStack(alignment: .leading, spacing: 30){
                    HStack{
                        Image(systemName: "doc.on.clipboard")
                               .foregroundColor(colorPallete.symbol)
                               .font(.system(size: 45))
                               .padding(.leading, 10)
                               .padding(.trailing,10)
                               .padding(.bottom)
                               .padding(.top)
                        VStack(alignment: .leading, spacing: 10){
                            Text("Tempelkan Informasi")
                                    .font(.headline)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                            Text("Masukkan informasi yang ingin kamu cari tahu kebenaranya")
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .padding(.trailing, 10)
                        }
                        
                    }
                    HStack{
                        Image(systemName: "magnifyingglass.circle.fill")
                                .foregroundColor(colorPallete.symbol)
                                .font(.system(size: 48))
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .padding(.bottom)
                                .padding(.top, 10)
                        VStack(alignment: .leading, spacing: 10){
                            Text("Lakukan Pencarian")
                                .font(.headline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                            Text("Menampilkan hasil pencarian sejenis dari Mafindo dan Search Engine")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .padding(.trailing, 10)
                        }
                    }
                    HStack{
                        Image(systemName: "square.and.arrow.up.on.square.fill")
                                .foregroundColor(colorPallete.symbol)
                                .font(.system(size: 45))
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .padding(.bottom)
                                .padding(.top)
                        VStack(alignment: .leading, spacing: 10){
                            Text("Bagi ke orang terdekat")
                                .font(.headline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                            Text("Bagi kebenarannya dengan orang terdekat kamu")
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .padding(.trailing, 20)
                        }
                    }
                }
                .padding(.top, 30)
                .padding(.bottom, 30)
            }
            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.4)
            .frame(width: geo.size.width)
            .offset(y: geo.size.height / 2.9)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct CardOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        CardOnboarding()
    }
}
