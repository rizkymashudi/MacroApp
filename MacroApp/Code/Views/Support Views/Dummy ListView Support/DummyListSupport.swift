//
//  DummyListSupport.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 04/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DummyListSupport: View {
    //model
    @ObservedObject var news = NewsService()
    
  
    var body: some View {
            List(news.data){ newsData in
                NavigationLink(destination: DetailViewSupport(newsItem: newsData)){
                    HStack{
                        if newsData.image != "" {
                            WebImage(url: URL(string: newsData.image)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 85, height: 101)
                                .background(Color.secondary)
                                .cornerRadius(8)
                        } else {
                            Image("loader")
                                .resizable()
                                .frame(width: 85, height: 101)
                                .background(Color.secondary)
                                .cornerRadius(8)
                        }
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text(newsData.title)
                                .fontWeight(.semibold)
                                .font(.system(size: 17))
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "calendar")
                                        .padding(.bottom, 4)
                                        .foregroundColor(colorPallete.labelColor)
                                    Text("Dibuat : \(newsData.date)")
                                        .font(.system(size: 13).weight(.regular))
                                    
                                }
                                HStack{
                                    Image(systemName: "person.fill")
                                        .padding(.bottom, 4)
                                        .foregroundColor(colorPallete.labelColor)
                                    Text("Penulis : \(newsData.author)")
                                        .font(.system(size: 13).weight(.regular))
                                }
                                
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .environment(\.defaultMinListRowHeight, 130)
    
    }
}

struct DummyListSupport_Previews: PreviewProvider {
    static var previews: some View {
        DummyListSupport()
    }
}
