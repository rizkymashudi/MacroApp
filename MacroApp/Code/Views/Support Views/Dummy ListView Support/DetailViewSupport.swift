//
//  DetailViewSupport.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 04/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailViewSupport: View {
    
    let newsItem: NewsApiModel
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    WebImage(url: URL(string: newsItem.image)!)
                        .resizable()
                        .frame(width: 390, height: 212)
                        .scaledToFill()
                        .background(Color.secondary)
                        .padding(.top, 16)
                        .border(Color.secondary, width: 0.3)
                        
                    
                    VStack(alignment: .leading){
                        Text(newsItem.title)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .lineLimit(5)
                        Label{
                            Text("Dibuat: \(newsItem.date)")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "calendar")
                        }
                        .font(.system(size: 13).weight(.regular))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 1)
                        
                        Label{
                            Text("Penulis: \(newsItem.author)")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "person.fill")
                        }
                        .font(.system(size: 13).weight(.regular))
                    }
                    .padding(16)
                    Spacer(minLength: -5)
                    VStack(alignment: .leading){
                        Text(newsItem.content)
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

//struct DetailViewSupport_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailViewSupport(newsItem: newsItem)
//    }
//}
