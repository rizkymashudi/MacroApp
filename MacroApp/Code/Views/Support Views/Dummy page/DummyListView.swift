//
//  DummyListView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 04/11/21.
//

import SwiftUI

struct DummyListView: View {
    var body: some View {
        NavigationView{
            DummyListSupport()
                .navigationTitle("Hasil Pencarian")
                .navigationBarTitleDisplayMode(.inline)
                
        }
        
    }
}

struct DummyListView_Previews: PreviewProvider {
    static var previews: some View {
        DummyListView()
    }
}

