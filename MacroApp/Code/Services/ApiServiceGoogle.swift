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

        let link = "https://serpapi.com/search.json?q=Gatot+Subroto+kanker&hl=en&gl=us&google_domain=google.com&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"
    
        let baseUrl : String = "https://serpapi.com/search?engine=google&q="
        let accessKey : String = "&api_key=39517d6f8267e5c27393fbd818c0504820975b2fe24a38f86d199f06255e1982"

    func fetchGoogle(){
        
        let request = AF.request(link)
        
        request.responseJSON { (data) in
            print(data)
        }
        
    }
    

}
