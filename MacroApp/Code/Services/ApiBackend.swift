//
//  ApiBackend.swift
//  MacroApp
//
//  Created by Evita Sihombing on 22/11/21.
//

import Foundation
import Alamofire

class ApiBackend : ObservableObject {
    func passRawText (copasTeks : String) {
        let baseUrl : String = "https://keywordsproject.herokuapp.com/api/keyword/"
    
        let body : [String:Any] = ["text": copasTeks]
        print(body)
        guard let url = URL(string: baseUrl) else {
            print("Cannot create url")
            
            return
        }

//        AF.request(url, method: .post, parameters: body, encoder: JSONEncoding.default as! ParameterEncoder, headers: nil).responseJSON{ response in
//            switch response.result {
//            case .success:
//                guard  let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
//                                print("Error: Cannot convert data to JSON object")
//                                return
//                print("abc")
//                print(response.result)
//            case .failure:
//                print("post failure")
//            }
//        }
         
    }
}
