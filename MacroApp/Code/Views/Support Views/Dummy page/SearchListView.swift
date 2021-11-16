//
//  SearchListView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import SwiftUI

struct SearchListView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModel.lists, id: \.self) { list in
                    HStack{
                        URLImage(urlString: list.image, data: nil)
                        Text(list.name)
                            .bold()
                    }
                }
            }
            .navigationTitle("Hasil Pencarian")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                viewModel.fetch()
            }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
