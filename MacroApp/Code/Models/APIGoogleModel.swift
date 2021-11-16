//
//  APIGoogleModel.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 17/11/21.
//

import Foundation

struct googleAPIModel: Codable {
    let position: Int
    let title: String
    let link, displayedLink: String
    let snippet: String
    let cachedPageLink: String
    let date: String?

    enum CodingKeys: String, CodingKey {
        case position, title, link
        case displayedLink = "displayed_link"
        case snippet
        case cachedPageLink = "cached_page_link"
        case date
    }
}
