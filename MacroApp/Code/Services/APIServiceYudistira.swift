//
//  ApiServiceYudistira.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 01/11/21.
//

import Foundation
import Combine
class ApiYudistira: ObservableObject {
    
//    @Published var news: [News] = []
    
    let baseUrl : String = "https://yudistira.turnbackhoax.id/api/antihoax/search/"
    let acessKey : String = "528b200c3b53ce5c797a881ww31b0ac2"
    

    
    func fetch() {
        guard let url = URL(string:baseUrl) else {
            return
        }
        
        let urlSession = URLSession(configuration: .ephemeral)
        
        //body
        let body : [String:Any] = ["key": acessKey,"method": "content","value": "pemilu"]
        let bodyData = try? JSONSerialization.data(withJSONObject: body)
        
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.httpBody = bodyData
//        print(req.self)
        
        let task = urlSession.dataTask(with: req) { [weak self](data, response, error) in
            guard let self = self else {return}
            if let d  = data{
                print(d)
                do{
                    let jsonString = try JSONDecoder().decode(String.self, from: d)
                    print(jsonString)
                    let jsonData = jsonString.data(using: .utf8)!
                    let decode = try JSONDecoder().decode([NewsObject].self, from: jsonData)
                    print(decode)
                }catch{
                    print(error)
                }
                
                
            }
        }
        
        
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            //convert to JSON
//            do {
//                let news = try JSONDecoder().decode([News].self, from: data)
//                DispatchQueue.main.async {
//                    self?.news = news
//                }
//                print(news)
//            } catch {
//                print(error)
//            }
//        }
        task.resume()
    }
}


struct News:Decodable{
    let list : [NewsObject]
}

struct NewsObject:Decodable{
    let id, authors, status, classification: String
    let title, content, fact: String
    let references: String
    let sourceIssue: String
    let sourceLink: String
    let picture1: String
    let picture2, tanggal, tags, conclusion: String
}
