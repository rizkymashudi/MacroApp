//
//  DetailViewSupport.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 08/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListDetailViewSupport: View {
    
    //ambil data dari model newsYudistira
    let newsItems: NewsYudistira
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    if newsItems.imgUrl != "" {
                        WebImage(url: URL(string: newsItems.imgUrl)!)
                            .resizable()
                            .frame(width: 390, height: 212)
                            .scaledToFill()
                            .background(Color.secondary)
                            .padding(.top, 16)
                            .border(Color.secondary, width: 0.3)
                    } else {
                        Image("loader")
                            .resizable()
                            .frame(width: 85, height: 101)
                            .background(Color.secondary)
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading){
                        Text(newsItems.title)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .lineLimit(5)
                        Label{
                            Text("Dibuat: \(newsItems.date)")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "calendar")
                        }
                        .font(.system(size: 13).weight(.regular))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 1)
                        
                        Label{
                            Text("Penulis: \(newsItems.authors)")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "person.fill")
                        }
                        .font(.system(size: 13).weight(.regular))
                    }
                    .padding(16)
                    Spacer(minLength: -5)
                    VStack(alignment: .leading){
                        Text(newsItems.content)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(16)
                    }
                    Spacer()
                }
                .toolbar{
                    Button(action: {
                        print("share tapped")
                    }) {
                        Image(systemName: "square.and.arrow.up").imageScale(.large)
                            .foregroundColor(colorPallete.primary)
                    }
                }
            }
        }
    }
}

//struct ListDetailViewSupport_Previews: PreviewProvider {
//    static var previews: some View {
//        ListDetailViewSupport()
//    }
//}
