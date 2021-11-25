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
    
    @StateObject var newsYudistira = ApiYudistira()
    @StateObject var apiServiceGoogle = ApiServiceGoogle()
    @State var isNotfoundStateHidden = true

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
                } else {
                    YudistiraListViewSupport(newsYudistira: newsYudistira)
                        .navigationTitle("Hasil pencarian hoax")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
                }
            }
        }.onAppear{
            apiServiceGoogle.fetchGoogle()
        }
    }
}

struct YudistiraListView_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListView()
    }
}

