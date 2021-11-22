//
//  ApiServiceGoogle.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 17/11/21.
//

import Foundation
import Combine
import Alamofire

class ApiServiceGoogle: ObservableObject {
//    @Published var googleSearchResult: [googleAPIModel] = []

    @Published var loading = false

    let link = "https://serpapi.com/search.json?q=Gatot+Subroto+kanker&hl=en&gl=us&google_domain=google.com&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"
        let baseUrl : String = "https://serpapi.com/search?engine=google&q="
        let accessKey : String = "&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"

    init() {
        loading = true
//        loadDataGoogle()
    }

//    func loadDataGoogle() {
//        AF.request(link)
//            .responseJSON { response in
//                switch response.result {
//                case .success:
//                    guard let data = response.data else { return }
//                    let googleData = try! JSONDecoder().decode(googleAPIModel.self, from: data)
//                    print(googleData)
//
////                    for i in googleData {
////                        let position = i.po
////                    }
////                    DispatchQueue.main.async {
////                        self.googleSearchResult.append(contentsOf: googleAPIModel(position: <#T##Int#>, title: <#T##String#>, link: <#T##String#>, displayedLink: <#T##String#>, snippet: <#T##String#>, cachedPageLink: <#T##String#>, date: <#T##String?#>))
////                        self.loading = false
////                    }
//                case .failure:
//                    print("Error Connect to Server")
//                }
//        }
//    }


}
