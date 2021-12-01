//
//  APIGoogleModel.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 17/11/21.
//

import Foundation

// MARK: - tagsDeveloper
struct tagsDeveloper: Codable {
    let organicResults: [tagsOrganicResult]

    enum CodingKeys: String, CodingKey {
        case organicResults = "organic_results"
    }
}

// MARK: - tagsOrganicResult
struct tagsOrganicResult: Codable {
    let link: String
}

