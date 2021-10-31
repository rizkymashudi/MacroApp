//
//  SearchRow.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 31/10/21.
//

import SwiftUI

struct SearchRow: View {
    var search: GoogleSearchModel

    var body: some View {
        HStack {

            VStack(alignment: .leading, spacing: 0) {
                Text(search.title)
                    .font(.system(size: 20))
                    .bold()
                Text(search.date ?? "")
                    .font(.system(size: 18))
                Text(search.displayedLink)
                    .font(.system(size: 18))
                Text(search.link)
                    .font(.system(size: 18))
                Text(search.snippet)
                    .font(.system(size: 18))

            }.padding(.leading, 8)
        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
}

