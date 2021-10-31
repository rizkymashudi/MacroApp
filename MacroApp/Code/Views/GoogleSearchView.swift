//
//  GoogleSearchView.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 31/10/21.
//

import SwiftUI
import CoreData

struct GoogleSearchView: View {

    @ObservedObject var apiServiceGoogle = ApiServiceGoogle()

    var body: some View {
        ScrollView {
            VStack () {
                Text("Word")
                if apiServiceGoogle.loading {
                    ProgressView()
                } else {
                    List(apiServiceGoogle.searchList.results) { search in
                        NavigationLink(destination: DetailSearch(position: search.position)) {
                            SearchRow(search: search)
                        }
                    }
                }
            }.onAppear {
                self.apiServiceGoogle.loadData(q: "yayasan+miracle+hope")
            }
        }
    }
}



