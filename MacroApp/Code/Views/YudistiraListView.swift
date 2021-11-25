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
    @State var isNotfoundStateHidden = true
    @State var text : String = ""
    var body: some View {
        
        Group{
            if newsYudistira.isLoading{
                YudistiraListViewSupport(newsYudistira: newsYudistira)
                    .navigationTitle("Hasil pencarian hoax")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
                    
            }else{
                if newsYudistira.finalNews.isEmpty {
                    NotfoundStateView()
                        .navigationTitle("Hasil pencarian hoax")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
                } else {
                    YudistiraListViewSupport(newsYudistira: newsYudistira)
                        .navigationTitle("Hasil pencarian hoax")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
                }
            }
        }.onAppear(perform: {       newsYudistira.fetch(userRawText: text) { result in
            print(result)
        }})
    }
}

struct YudistiraListView_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListView()
    }
}

