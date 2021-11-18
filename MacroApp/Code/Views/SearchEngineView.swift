//
//  SearchEngineView.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 18/11/21.
//

import SwiftUI
import SwiftUINavigationBarStyling

struct SearchEngineView: View {
    var body: some View {
        WebView(url: "https://www.google.com/search?q=gatot+subroto+kanker")
            .navigationTitle("Hasil Pencarian")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
    }
}

struct SearchEngineView_Previews: PreviewProvider {
    static var previews: some View {
        SearchEngineView()
    }
}


