//
//  YudistiraListViewSupport.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 08/11/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Shimmer

struct YudistiraListViewSupport: View {
    
    @ObservedObject var newsYudistira = ApiYudistira()
    
    var body: some View {
        List(newsYudistira.finalNews){ newsItemsData in
            NavigationLink(destination: ListDetailViewSupport(newsItems: newsItemsData)){
                HStack{
                    if newsItemsData.imgUrl != "" {
                        WebImage(url: URL(string: newsItemsData.imgUrl)!)
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
                        Text(newsItemsData.title)
                            .fontWeight(.semibold)
                            .font(.system(size: 17))
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Image(systemName: "calendar")
                                    .padding(.bottom, 4)
                                    .foregroundColor(colorPallete.labelColor)
                                Text("Dibuat : \(newsItemsData.date)")
                                    .font(.system(size: 13).weight(.regular))
                                
                            }
                            HStack{
                                Image(systemName: "person.fill")
                                    .padding(.bottom, 4)
                                    .foregroundColor(colorPallete.labelColor)
                                Text("Penulis : \(newsItemsData.authors)")
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

struct YudistiraListViewSupport_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListViewSupport()
    }
}
