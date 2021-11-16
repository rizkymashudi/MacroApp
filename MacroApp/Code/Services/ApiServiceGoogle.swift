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
//
//    @Published var loading = false
//
//    //https://serpapi.com/search?engine=google&q=Gatot+Subroto+Kanker&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982
//        let baseUrl : String = "https://serpapi.com/search?engine=google&q="
//        let accessKey : String = "&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"
//
//    init() {
//        loading = true
//    }
//
//    func loadDataGoogle(q: String) {
//        AF.request("\(baseUrl)\(q)\(accessKey)")
//            .responseJSON { response in
//                switch response.result {
//                case .success:
//                    guard let data = response.data else { return }
//                    let googleData = try! JSONDecoder().decode(googleAPIModel.self, from: data)
//                    DispatchQueue.main.async {
//                        self.googleSearchResult = googleData
//                        self.loading = false
//                    }
//                case .failure:
//                    print("Error Connect to Server")
//                }
//        }
//    }

    func getMethod() {

        AF.request("http://dummy.restapiexample.com/api/v1/employees", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }

                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
    }

}
