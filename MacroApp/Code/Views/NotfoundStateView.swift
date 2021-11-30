//
//  NotfoundStateView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 16/11/21.
//

import SwiftUI
import Shimmer

struct NotfoundStateView: View {
    @State var showingAlert: Bool = false
    @State var isLoading = false
    @State var isShowingSearchEngineView = false
    @Binding var text: String
//    @ObservedObject var apiServiceGoogle = ApiServiceGoogle()

    
    var body: some View {
        VStack{
            LabelMafindo()
                .padding(.top, 10)
            
            if isLoading {
                Spacer()
                VStack{
                    VStack{
                        Image("notfoundbw")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 6.0))
                            .background(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 6).fill(Color.gray))
                            .frame(width: 358, height: 172)
                            .clipped()
                        
                        
                        VStack(alignment: .leading){
                            Text("newsYudistira.selectedNews?.title ?? title")
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
                                    Text("Dibuat : newsYudistira.selectedNews?.date ?? date")
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
                    .redacted(reason: isLoading ? .placeholder : [])
                    .shimmering(active: isLoading)
                    .foregroundColor(isLoading ? .blue : .black)
                    .background(RoundedRectangle(cornerRadius: 6.0).fill(.white))
                    
                    Spacer()
                    List(0..<10){ newsItemsData in
                            HStack{
                                Image("loader")
                                    .resizable()
                                    .frame(width: 85, height: 101)
                                    .background(Color.secondary)
                                    .cornerRadius(8)
                                
                                
                                VStack(alignment: .leading, spacing: 10){
                                    Text("newsItemsData.title")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 17))
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                    
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(systemName: "calendar")
                                                .padding(.bottom, 4)
                                                .foregroundColor(colorPallete.labelColor)
                                            Text("Dibuat : newsItemsData.date")
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
                            .redacted(reason: isLoading ? .placeholder : [])
                            .shimmering(active: isLoading)
                            .foregroundColor(isLoading ? .blue : .black)
                        
                            .disabled(isLoading)
                            .listRowBackground(colorPallete.bgListview)
                    }
                    .listStyle(PlainListStyle())
                    .environment(\.defaultMinListRowHeight, 130)

                }
            } else {
                Spacer()
                VStack{
                    Image("notfoundbw")
                    Text("Maaf, Hasil pencarian data Mafindo tidak ditemukan")
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 100)
                NavigationLink(destination: SearchEngineView(text: $text), isActive: $isShowingSearchEngineView){ }
                .hidden()
                Button(action: {
                    print("alert")
                    showingAlert = true
                }){
                    Text("Lanjutkan pencarian di search engine")
                }
                .buttonStyle(GrowingSearchEngineButton())
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Maaf, Hasil pencarian pada data Mafindo tidak ditemukan"),
                        message: Text("apakah anda ingin  melanjutkan pencarian melalui search engine?"),
                        primaryButton: .default(Text("Ya")) {
                                           print("Move to web view")
                                           isShowingSearchEngineView = true
                                       },
                        secondaryButton: .cancel(Text("Nanti saja")) {
                            print("Cancel")
                        }
                    )
                }
            }
            Spacer()
        }
        .onAppear{
            fakeNetworkCall()
//            apiServiceGoogle.fetchGoogle(userRawText: $text, completion: true)
        }
    }
    
    func fakeNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading = false
        }
        
    }
}

//struct NotfoundStateView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotfoundStateView()
//    }
//}
