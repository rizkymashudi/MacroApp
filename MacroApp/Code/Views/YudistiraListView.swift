//
//  YudistiraListView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 08/11/21.
//

import SwiftUI
import SwiftUINavigationBarStyling
import Shimmer


struct YudistiraListView: View {
    
    @ObservedObject var newsYudistira = ApiYudistira()
    @StateObject var apiServiceGoogle = ApiServiceGoogle()
    @ObservedObject var networkManager = NetworkManager()
    @State var isNotfoundStateHidden = true
    @State var text : String = ""
    @Binding var yourText: String
    
    var body: some View {
        
        Group{
           
            if networkManager.isConnected {
                if newsYudistira.isBadConnection{
                    OfflineStateView()
                        .navigationTitle("Hasil pencarian")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
                } else if newsYudistira.isLoading {
                    YudistiraListViewSupport(newsYudistira: newsYudistira, yourText: $yourText)
                        .navigationTitle("Hasil pencarian")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
                    
                }else{
                    if newsYudistira.finalNews.isEmpty {
                        NotfoundStateView()
                            .navigationTitle("Hasil pencarian")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
                    } else {
                        YudistiraListViewSupport(newsYudistira: newsYudistira, yourText: $yourText)
                            .navigationTitle("Hasil pencarian")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
                    }
                }
            } else {
                OfflineStateView()
                    .navigationTitle("Hasil pencarian")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
            }
        }.onAppear(perform: { newsYudistira.fetch(userRawText: text) { result in
//            print(result)
        }})
    }
      

}

struct YudistiraListView_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListView(yourText: .constant(""))
    }
}

