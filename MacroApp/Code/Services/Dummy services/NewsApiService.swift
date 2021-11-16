//
//  NewsApiService.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import Foundation
import Combine
import SwiftyJSON

class NewsService: ObservableObject {
    
    @Published var data = [NewsApiModel]()
    
    let dateShort = DateShortFormat()
 
    init() {
        let url = "Https://newsapi.org/v2/top-headlines?country=id&apiKey=e2f9a83801fd4deca11ab303f832013f"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) {(data, _, err) in
           
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            let items = json["articles"].array!
//            print("ini item")
//            print(items)
//            
            for i in items {
                let author = i["author"].stringValue
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let content = i["content"].stringValue
                let imgUrl = i["urlToImage"].stringValue
                let rawDate = i["publishedAt"].stringValue
                let date = self.dateShort.DateToShort(rawDate)
                
                DispatchQueue.main.async {
                    self.data.append(NewsApiModel(title: title, image: imgUrl, desc: description, content: content, author: author, date: date))
                }
                
            }
        }.resume()
    }
}


