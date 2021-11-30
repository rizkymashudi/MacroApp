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
    @ObservedObject var apiServiceGoogle = ApiServiceGoogle()
    @State var isNotfoundStateHidden = true
    @State var text : String = ""
    var body: some View {
        
        Group{
            if newsYudistira.isLoading{
                YudistiraListViewSupport(newsYudistira: newsYudistira)
                    .navigationTitle("Hasil pencarian hoax")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
                    
            }else{
                if newsYudistira.finalNews.isEmpty {
                    NotfoundStateView()
                        .navigationTitle("Hasil pencarian hoax")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
//                        .onAppear(perform: apiServiceGoogle.fetchGoogle(userRawText: text) { result in }})
                } else {
                    YudistiraListViewSupport(newsYudistira: newsYudistira)
                        .navigationTitle("Hasil pencarian hoax")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
                }
            }
        }.onAppear(perform: { apiServiceGoogle.fetchGoogle(userRawText: text) { result in
//            print(result)
        }})
    }
}

struct YudistiraListView_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListView()
    }
}

