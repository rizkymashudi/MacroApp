//
//  DummyApiService.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import Foundation

struct DummyLists: Hashable, Codable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject {
    
    @Published var lists: [DummyLists] = []
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let lists = try JSONDecoder().decode([DummyLists].self, from: data)
                DispatchQueue.main.async {
                    self?.lists = lists
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
