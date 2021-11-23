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
        fetch(completion: { (success) -> Void in
            if success {
                print("fetch completed")
            }else{
                print("fetch error")
            }
        })
    }
    

    func fetch(completion: @escaping (Bool) -> Void) {
        
        isLoading = true
        
        let group = DispatchGroup()
        
        let baseUrl : String = "https://yudistira.turnbackhoax.id/api/antihoax/search/"
        let acessKey : String = "528b200c3b53ce5c797a881ww31b0ac2"
        let body : [String:Any] = ["key": acessKey, "method": "content", "value": "gatot", "limit" : 49]
        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded", "Accept": "application/json"]
        
        guard let url = URL(string: baseUrl) else { 
            print("Cannot create url")
            completion(false)
            return
        }
        
        //request method post dengan alamofire
        AF.request(url, method: .post, parameters: body, headers: headers).responseJSON(completionHandler:  { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                let news = try! JSONDecoder().decode([WelcomeElement].self, from: data)
                
                print(news.count)
                
                if news.isEmpty {
                    self.isLoading = false
                    completion(true)
                }
                
                //di loop index dalam array news
                for i in news {
                    group.enter()
                    
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
                        
                        self.isLoading = false
                        completion(true)
                        
                        //sementara
                        if self.finalNews.count > 0 && self.finalNews.count < 50{
                            self.selectedNews = self.finalNews[0]
                        }
                        
                        group.leave()
                    }
                }
                self.relatedData()
                
                group.notify(queue: .main) {
                        print("Finished all requests.")
                }
                
            case .failure:
                print("Error Connect to Server")
                completion(false)
            }
        })
        
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


