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
    @StateObject private var loadingState = ApiYudistira()
    @State var isCardTapped = false
 
    var body: some View {
        VStack{
            Spacer()
            LabelMafindo()
            VStack{
                VStack(alignment: .leading){
                    Text("Hasil Pencarian \"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\" dari data Mafindo").font(.system(size: 13))
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width: 350, alignment: .leading)
                        .lineLimit(6)
//                        .padding(.top, 0.5)
                }
                
                VStack{
                    Image("Notfound")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 6.0))
                        .background(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 6).fill(Color.gray))
                
                    VStack(alignment: .leading){
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
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
                                Text("Dibuat : 2021-11-13")
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
                .redacted(reason: loadingState.isLoading ? .placeholder : [])
                .shimmering(active: loadingState.isLoading)
                .foregroundColor(loadingState.isLoading ? .blue : .black)
                .background(RoundedRectangle(cornerRadius: 6.0).fill(.white))
                .onTapGesture {
                    isCardTapped = true
                }.disabled(loadingState.isLoading)
                NavigationLink(destination: TopListDetailView(), isActive: $isCardTapped) {}
                
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
                        .redacted(reason: loadingState.isLoading ? .placeholder : [])
                        .shimmering(active: loadingState.isLoading)
                        .foregroundColor(loadingState.isLoading ? .blue : .black)
                    }
                    .disabled(loadingState.isLoading)
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

struct YudistiraListViewSupport_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListViewSupport()
    }
}


