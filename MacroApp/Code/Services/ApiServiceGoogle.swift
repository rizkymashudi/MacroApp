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

    @Published var googleResultModel: [tagsDeveloper] = []
    @Published var linkInGoogle = [GoogleLinksModel]()
    
    let link = "https://serpapi.com/search.json?q=Gatot+Subroto+kanker&hl=en&gl=us&google_domain=google.com&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"

    let baseUrl : String = "https://serpapi.com/search?engine=google&q="
    let accessKey : String = "&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"

    func fetchGoogle(){
        
        let request = AF.request(link, method: .get)
        
        request.responseJSON { (response) in
         
            
        
            if let data = response.data, let jsonData = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//                print(jsonData)
                let decoder = JSONDecoder()

//                do {
//                    let items = try decoder.decode([tagsDeveloper].self, from: jsonData)
//                    print(items)
//                } catch {
//                    print(error.localizedDescription)
//                }
                
            
            }


        }
        
    }
    

}
