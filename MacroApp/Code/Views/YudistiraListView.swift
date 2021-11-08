//
//  YudistiraListView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 08/11/21.
//

import SwiftUI

struct YudistiraListView: View {
    var body: some View {
        NavigationView{
            YudistiraListViewSupport()
                .navigationTitle("Hasil Pencarian")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct YudistiraListView_Previews: PreviewProvider {
    static var previews: some View {
        YudistiraListView()
    }
}
