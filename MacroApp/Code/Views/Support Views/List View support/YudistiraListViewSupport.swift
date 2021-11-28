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
    
    var newsYudistira : ApiYudistira
    @State var isCardTapped = false
    
    let imageNotFound = "https://dummyimage.com/358x172/d1d1d1/757575.png&text=Image+not+found"
    
    var body: some View {
        VStack{
            Spacer()
            LabelMafindo()
            VStack{
                VStack(alignment: .leading){
                    Text("Hasil Pencarian \"\" dari data Mafindo").font(.system(size: 13))
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 350, alignment: .leading)
                        .lineLimit(6)
                }
                .redacted(reason: newsYudistira.isLoading ? .placeholder : [])
                .shimmering(active: newsYudistira.isLoading)
                
                VStack{
                    if newsYudistira.selectedNews?.imgUrl != "" {
                        WebImage(url: URL(string: newsYudistira.selectedNews?.imgUrl ?? imageNotFound))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 358, height: 172)
                            .background(Color.secondary)
                            .cornerRadius(6)
                    } else {
                        Image("Notfound")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 6.0))
                            .background(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 6).fill(Color.gray))
                            .frame(width: 358, height: 172)
                            .clipped()
                    }
                    
                    VStack(alignment: .leading){
                        Text(newsYudistira.selectedNews?.title ?? "title")
                            .fontWeight(.semibold)
                            .font(.system(size: 17))
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: 330, height: 50, alignment: .leading)
                        VStack(alignment: .leading, spacing: 3){
                            HStack{
                                Image(systemName: "calendar")
                                    .padding(.bottom, 4)
                                    .foregroundColor(colorPallete.labelColor)
                                Text("Dibuat : \(newsYudistira.selectedNews?.date ?? "date")")
                                    .font(.system(size: 13).weight(.regular))
                            }
                            HStack(spacing: 3){
                                Text("7").font(.system(size: 13).weight(.bold))
                                Text("Kata ditemukan").font(.system(size: 13).weight(.regular))
                            }.padding(.bottom, 10)
                        }
                    }
                }
                .frame(width: 358)
                .redacted(reason: newsYudistira.isLoading ? .placeholder : [])
                .shimmering(active: newsYudistira.isLoading)
                .foregroundColor(newsYudistira.isLoading ? .blue : .black)
                .background(RoundedRectangle(cornerRadius: 6.0).fill(.white))
                .onTapGesture {
                    isCardTapped = true
                }.disabled(newsYudistira.isLoading)
                NavigationLink(destination: TopListDetailView(relatedNews: newsYudistira.selectedNews), isActive: $isCardTapped) {}
                
                Spacer()
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
                                    HStack(spacing: 3){
                                        Text("5")
                                            .font(.system(size: 13).weight(.bold))
                                        Text("kata ditemukan")
                                            .font(.system(size: 13).weight(.regular))
                                    }
                                    
                                }
                            }

                        }
                        .redacted(reason: newsYudistira.isLoading ? .placeholder : [])
                        .shimmering(active: newsYudistira.isLoading)
                        .foregroundColor(newsYudistira.isLoading ? .blue : .black)
                    }
                    .disabled(newsYudistira.isLoading)
                    .listRowBackground(colorPallete.bgListview)
                }
                .listStyle(PlainListStyle())
                .environment(\.defaultMinListRowHeight, 130)
//                .mask(
//                    LinearGradient(gradient: Gradient(colors: [colorPallete.bgListview, colorPallete.bgListview.opacity(0)]), startPoint: .bottom, endPoint: .top)
//                )
            }
        }
        .background(colorPallete.bgListview)
    }
}

//struct YudistiraListViewSupport_Previews: PreviewProvider {
//    static var previews: some View {
//        YudistiraListViewSupport(newsYudistira: ApiYudistira())
//    }
//}


