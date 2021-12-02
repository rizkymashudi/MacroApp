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
    @Published var linkGoogle: String = ""

    func fetchGoogle(userRawText: String, completion: @escaping (Bool) -> Void) {
        let baseUrl: String = "https://serpapi.com/search.json"
        let apiKeySerpApi = "0dd324915702c8c985e627afc597f897287cfbc82ce17c1594f66d8347c632c9"
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

                do {
                    let result = try? JSONDecoder().decode(tagsDeveloper.self, from: data)
                    self.linkGoogle = result?.organicResults[0].link ?? "https://www.google.com"
                    print(self.linkGoogle)
                } catch {
                    print("Error to decode")
                }
            case .failure(_):
                print("Error Connect to Server SerpApi")
                completion(false)
            }
        })
    }
}
