//
//  GoogleSearchModel.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 31/10/21.
//

import Foundation

struct GoogleSearchModel: Decodable, Identifiable {
    var id: Int?
    let position: Int
    let title: String
    let link: String
    let displayedLink: String
    let snippet: String
    let date: String?

    enum CodingKeys: String, CodingKey {
        case position, title, link, id
        case displayedLink = "displayed_link"
        case snippet
        case date
    }
}
