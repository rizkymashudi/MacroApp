//
//  NewsAPIModel.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 03/11/21.
//

import Foundation

struct NewsApiModel: Identifiable{
    var id = UUID()
    var title: String
    var image: String
    var desc: String
    var content: String
    var author: String
    var date: String
    
}
