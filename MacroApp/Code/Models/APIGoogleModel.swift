//
//  APIGoogleModel.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 17/11/21.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tagsDeveloper = try? newJSONDecoder().decode(tagsDeveloper.self, from: jsonData)

import Foundation

// MARK: - tagsDeveloper
struct tagsDeveloper: Codable {
    let searchMetadata: tagsSearchMetadata
    let searchParameters: tagsSearchParameters
    let searchInformation: tagsSearchInformation
//    let inlineImages: [tagsInlineImage]
//    let organicResults: [tagsOrganicResult]
//    let relatedSearches: [tagsRelatedSearch]
    let pagination, serpapiPagination: tagsPagination

    enum CodingKeys: String, CodingKey {
        case searchMetadata = "search_metadata"
        case searchParameters = "search_parameters"
        case searchInformation = "search_information"
//        case inlineImages = "inline_images"
//        case organicResults = "organic_results"
//        case relatedSearches = "related_searches"
        case pagination
        case serpapiPagination = "serpapi_pagination"
    }
}

//// MARK: - tagsInlineImage
//struct tagsInlineImage: Codable {
//    let link: String
//    let thumbnail: String
//}
//
//// MARK: - tagsOrganicResult
//struct tagsOrganicResult: Codable {
//    let position: Int
//    let title: String
//    let link, displayedLink: String
//    let snippet: String
//    let aboutThisResult: tagsOrganicResultAboutThisResult
//    let cachedPageLink: String
//    let relatedResults: [tagsRelatedResult]?
//    let date: String?
//
//    enum CodingKeys: String, CodingKey {
//        case position, title, link
//        case displayedLink = "displayed_link"
//        case snippet
//        case aboutThisResult = "about_this_result"
//        case cachedPageLink = "cached_page_link"
//        case relatedResults = "related_results"
//        case date
//    }
//}

// MARK: - tagsOrganicResultAboutThisResult
struct tagsOrganicResultAboutThisResult: Codable {
    let source: tagsSource
    let keywords: [tagsKeyword]
    let relatedKeywords: [String]?
    let languages, regions: [String]

    enum CodingKeys: String, CodingKey {
        case source, keywords
        case relatedKeywords = "related_keywords"
        case languages, regions
    }
}

enum tagsKeyword: String, Codable {
    case gatot = "gatot"
    case kanker = "kanker"
    case subroto = "subroto"
}

// MARK: - tagsSource
struct tagsSource: Codable {
    let sourceDescription: String
    let sourceInfoLink: String?
    let security: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case sourceDescription = "description"
        case sourceInfoLink = "source_info_link"
        case security, icon
    }
}

//// MARK: - tagsRelatedResult
//struct tagsRelatedResult: Codable {
//    let position: Int
//    let title: String
//    let link, displayedLink: String
//    let snippet: String
//    let aboutThisResult: tagsRelatedResultAboutThisResult
//    let cachedPageLink: String
//    let date: String?
//
//    enum CodingKeys: String, CodingKey {
//        case position, title, link
//        case displayedLink = "displayed_link"
//        case snippet
//        case aboutThisResult = "about_this_result"
//        case cachedPageLink = "cached_page_link"
//        case date
//    }
//}

// MARK: - tagsRelatedResultAboutThisResult
struct tagsRelatedResultAboutThisResult: Codable {
    let source: tagsSource
    let keywords: [tagsKeyword]
    let languages, regions: [String]
}

// MARK: - tagsPagination
struct tagsPagination: Codable {
    let current: Int
    let next: String
    let otherPages: [String: String]
    let nextLink: String?

    enum CodingKeys: String, CodingKey {
        case current, next
        case otherPages = "other_pages"
        case nextLink = "next_link"
    }
}

// MARK: - tagsRelatedSearch
struct tagsRelatedSearch: Codable {
    let query: String
    let link: String
}

// MARK: - tagsSearchInformation
struct tagsSearchInformation: Codable {
    let organicResultsState, queryDisplayed: String
    let totalResults: Int
    let timeTakenDisplayed: Double

    enum CodingKeys: String, CodingKey {
        case organicResultsState = "organic_results_state"
        case queryDisplayed = "query_displayed"
        case totalResults = "total_results"
        case timeTakenDisplayed = "time_taken_displayed"
    }
}

// MARK: - tagsSearchMetadata
struct tagsSearchMetadata: Codable {
    let id, status: String
    let jsonEndpoint: String
    let createdAt, processedAt: String
    let googleURL: String
    let rawHTMLFile: String
    let totalTimeTaken: Double

    enum CodingKeys: String, CodingKey {
        case id, status
        case jsonEndpoint = "json_endpoint"
        case createdAt = "created_at"
        case processedAt = "processed_at"
        case googleURL = "google_url"
        case rawHTMLFile = "raw_html_file"
        case totalTimeTaken = "total_time_taken"
    }
}

// MARK: - tagsSearchParameters
struct tagsSearchParameters: Codable {
    let engine, q, googleDomain, hl: String
    let gl, device: String

    enum CodingKeys: String, CodingKey {
        case engine, q
        case googleDomain = "google_domain"
        case hl, gl, device
    }
}
