//
//  ApiServiceYudistira.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 01/11/21.
//

import Foundation
import Combine
import Alamofire


class ApiYudistira: ObservableObject {
    
    //var news untuk tampung data dari url
    @Published var news: [WelcomeElement] = []
    
    //untuk tampung data setelah di looping
    @Published var finalNews = [NewsYudistira]()
    
    @Published var isLoading: Bool = false
    
    @Published var selectedNews: NewsYudistira?
    
    init() {
        
        isLoading = true
        
        let baseUrl : String = "https://yudistira.turnbackhoax.id/api/antihoax/search/"
        let acessKey : String = "528b200c3b53ce5c797a881ww31b0ac2"
        
        //declare body
        let body : [String:Any] = ["key": acessKey, "method": "content", "value": "gatot", "limit" : 49]
        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded", "Accept": "application/json"]
        
        //request method post dengan alamofire
        AF.request(baseUrl, method: .post, parameters: body, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                let news = try! JSONDecoder().decode([WelcomeElement].self, from: data)
                print(news.count)
                
                //di loop index dalam array news
                for i in news {
                    
                    let id = i.id
                    let authors = i.authors
                    let title = i.title
                    let content = i.content
                    let fact = i.fact
                    
                    let ref = i.references
                    let arrRef = ref.components(separatedBy: "\r\n")
                    let resRef = arrRef[0]
                    
                    let imgUrl = i.picture1
                    let date = i.tanggal
                    let conclusion = i.conclusion

                    DispatchQueue.main.async {
                        //tampung ke model yudistira var finalItems
                        self.finalNews.append(NewsYudistira(id: id ?? "-", authors: authors ?? "-", title: title ?? "-", content: content ?? "-", fact: fact ?? "-", references: resRef, imgUrl: imgUrl, date: date ?? "-", conclusion: conclusion ?? "-"))
                        
                        //sementara
                        if self.finalNews.count > 0 && self.finalNews.count < 50{
                            self.selectedNews = self.finalNews[0]
                        }
                        self.isLoading = false
                    }
                    
                }
                self.relatedData()
                
            case .failure:
                print("Error Connect to Server")
            }
        }
    }
    
    
    func relatedData() {
        
        let searchValue = "2222"
        var currentIndex = 0

        for id in self.finalNews{
            if id.id == searchValue {
            print("Found \(id) for index \(currentIndex)")
            break
        }

        currentIndex += 1
        }
    }
}


