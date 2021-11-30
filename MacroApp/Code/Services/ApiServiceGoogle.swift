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

    func fetchGoogle(userRawText: String, completion: @escaping (Bool) -> Void) {
        let group = DispatchGroup()
        let baseUrl: String = "https://serpapi.com/search.json"
        let apiKeySerpApi = "39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"
        let body: [String:Any] = ["q": userRawText, "api_key": apiKeySerpApi]

        guard let url = URL(string: baseUrl) else {
            print("Cannot create url")
            completion(false)
            return
        }

        AF.request(url, parameters: body).responseJSON(completionHandler: { response in
//            print(type(of: response))
//            print(type(of: response))

            switch response.result {
            case .success:
                print(response.result)
                guard let data = response.data else { return }
                print(data)
                let result = try! JSONDecoder().decode([tagsOrganicResult].self, from: data)
                print(result)
//                if result.isEmpty {
//                    print("Data Empty")
//                    completion(true)
//                }

//                for i in result {
//                    group.enter()
//
//                    let link = i.link
//
////                    DispatchQueue.main.async {
////                        <#code#>
////                    }
//                }
            case .failure(_):
                print("Error Connect to Server")
                completion(false)
            }
        })

//        AF.request(url, parameters: body)
//            .responseJSON { response in
//                print("Response \(response.response)")
//                print("Request \(response.request)")
//                print("Result \(response.result)")
//
//                switch response.result {
//                case .success:
//                    guard let data = response.data else { return }
//                    let googleResult = try! JSONDecoder().decode([tagsOrganicResult].self, from: data)
//                    DispatchQueue.main.async {
//                        self.googleResultModel = googleResult
//                    }
//                case .failure(_):
//                    print("Error Connect to Server")
//                }
//            }
    }

}
