//
//  YudistiraListView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 08/11/21.
//

import SwiftUI
import SwiftUINavigationBarStyling


struct YudistiraListView: View {
    @Binding var yourText: String
    var body: some View {
        YudistiraListViewSupport(yourText: $yourText)
            .navigationTitle("Hasil pencarian hoax")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
    }
}

//struct YudistiraListView_Previews: PreviewProvider {
//    static var previews: some View {
//        YudistiraListView(yourText: $yourText)
//    }
//}

