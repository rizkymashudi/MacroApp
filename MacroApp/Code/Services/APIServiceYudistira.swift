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
    @Published var relatedNews = [RelatedNewsModel]()
    
    @Published var isLoading: Bool = false
    
    @Published var selectedNews: NewsYudistira?
    

    func fetch(userRawText: String, completion: @escaping (Bool) -> Void) {
        isLoading = true

        let group = DispatchGroup()
            
        let baseUrl : String = "https://keywordsproject.herokuapp.com/api/keyword/"
        let body : [String:Any] = ["text": userRawText]
//        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded", "Accept": "application/json"]
    
        guard let url = URL(string: baseUrl) else { 
            print("Cannot create url")
            completion(false)
            
            return
        }
        
        //request method post dengan alamofire
        AF.request(url, method: .post, parameters: body).responseJSON(completionHandler:  { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                let news = try! JSONDecoder().decode([WelcomeElement].self, from: data)
                
                if news.isEmpty {
                    print("Empty")
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
                        
                        self.relatedNews.append(RelatedNewsModel(relatedContent: content ?? "-"))
                        
                        self.isLoading = false
                        completion(true)

                    
                        //sementara
                        if self.finalNews.count > 0 && self.finalNews.count < 50{
                            self.selectedNews = self.finalNews[0]
                        }
                        
                        group.leave()
                    }
                }
                
                self.relatedData(userRawText: userRawText)
                
                group.notify(queue: .main) {
                    print("Finished all requests.")
                    print("Final News: \(self.finalNews.count)")
                    print(self.relatedNews.count)
                    
                }
                
            case .failure:
                print("Error Connect to Server")
                completion(false)
            }
        })
    }
    
    
    func relatedData(userRawText: String) {

        var currentIndex = 0
        for i in self.relatedNews{
            if i.relatedContent == "Warning..." {
                print("found \(i.relatedContent) for index \(currentIndex)")
                break
            }
            currentIndex += 1
        }
    }

}


