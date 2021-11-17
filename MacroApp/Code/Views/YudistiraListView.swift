//
//  YudistiraListView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 08/11/21.
//

import SwiftUI
import SwiftUINavigationBarStyling


struct YudistiraListView: View {
    
    var body: some View {
        YudistiraListViewSupport()
            .navigationTitle("Hasil pencarian hoax")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
    }
}

struct YudistiraListView_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListView()
    }
}

