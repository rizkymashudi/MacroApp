//
//  WebViewViewModel.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 23/11/21.
//

import Foundation

class WebViewStateModel: ObservableObject {
//    @ObservedObject var apiServiceGoogle = ApiServiceGoogle()
    @Published var linkWebsite: String = "https://www.google.com"
//    @Published var linkWebsite: String? = ""
    @Published var goToPage: Bool = false
    @Published var goBack: Bool = false
    @Published var goForward: Bool = false
    @Published var reload: Bool = false
}
