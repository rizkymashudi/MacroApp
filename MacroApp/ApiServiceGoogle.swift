//
//  ApiServiceGoogle.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 31/10/21.
//

import Foundation
import Alamofire

class ApiServiceGoogle: ObservableObject {
//    @Published var googleSearchModel = GoogleSearchModel(position: 0, title: "", link: "", displayedLink: "", snippet: "", date: "")
    @Published var searchList = SearchList(results: [])
    @Published var loading = false

//    https://serpapi.com/search.json?q=yayasan+miracle+hope&hl=en&gl=us&google_domain=google.com&api_key=secret_api_key
    private let apiURLBase = "https://serpapi.com/search.json?q="
    private let apiKey = "hl=en&gl=us&google_domain=google.com&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"
//    private let q = "yayasan+miracle+hope"

    init() {
        loading = true
    }

    func loadData(q: String) {
        AF.request("\(apiURLBase)\(q)\(apiKey)")
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    let googleSearch = try! JSONDecoder().decode(SearchList.self, from: data)
                    DispatchQueue.main.async {
                        self.searchList = googleSearch
                        self.loading = false
                    }
                case .failure:
                    print("Error Connect to Server")
                }
            }
    }
}
