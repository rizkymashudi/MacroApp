//
//  WebViewViewModel.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 23/11/21.
//

import Foundation

class WebViewStateModel: ObservableObject {
    @Published var goBack: Bool = false
    @Published var goForward: Bool = false
}
