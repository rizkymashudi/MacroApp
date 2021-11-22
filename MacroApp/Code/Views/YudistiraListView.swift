//
//  YudistiraListView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 08/11/21.
//

import SwiftUI
import SwiftUINavigationBarStyling


struct YudistiraListView: View {
    
    @ObservedObject var newsYudistira = ApiYudistira()
    @State var isNotfoundStateHidden = true

    var body: some View {
        Group{
            if newsYudistira.finalNews.isEmpty {
                if isNotfoundStateHidden {
                    NotfoundStateView()
                        .hidden()
                        .navigationTitle("Hasil pencarian hoax")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
                } else {
                    NotfoundStateView()
                        .navigationTitle("Hasil pencarian hoax")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
                }
            } else {
                YudistiraListViewSupport()
                    .navigationTitle("Hasil pencarian hoax")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isNotfoundStateHidden = false
            }
        }
    }
}

struct YudistiraListView_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListView()
    }
}

