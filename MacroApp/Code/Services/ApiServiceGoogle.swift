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


    @Published var googleResultModel = [tagsOrganicResult]()
    @Published var linkGoogle: String!

    func fetchGoogle(userRawText: String, completion: @escaping (Bool) -> Void) {
        let baseUrl: String = "https://serpapi.com/search.json"
        let apiKeySerpApi = "39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"
        let body: [String:Any] = ["q": userRawText, "api_key": apiKeySerpApi, "hl": "en"]

        guard let url = URL(string: baseUrl) else {
            print("Cannot create url")
            completion(false)
            return
        }

        AF.request(url, parameters: body).responseJSON(completionHandler: { response in

            switch response.result {
            case .success:
                guard let data = response.data else { return }
//                print("JSON String: \(String(data: data, encoding: .utf8))")

                do {
                    let result = try? JSONDecoder().decode(tagsDeveloper.self, from: data)
                    self.linkGoogle = result?.organicResults[0].link
//                    print(self.linkGoogle!)
                } catch {
                    print("Error to decode")
                }
            case .failure(_):
                print("Error Connect to Server")
                completion(false)
            }
        })

    }

}
