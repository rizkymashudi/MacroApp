//
//  MainView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/01/22.
//

import SwiftUI

struct MainTabBar: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.red
    }
    
    var body: some View {
        TabView {
            PasteViewScene()
                .tabItem{
                    Label("Scan Text", systemImage: "doc.text.magnifyingglass")
                }
            
            LatestNewsList()
                .tabItem{
                    Label("Berita terbaru", systemImage: "newspaper")
                }
            
            SettingsView()
                .tabItem{
                    Label("Pengaturan", systemImage: "gearshape")
                }
        }
        .accentColor(.black)
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
