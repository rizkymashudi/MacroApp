//
//  WebViewVM.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 18/11/21.
//

import Foundation
import Combine

class WebViewVM: ObservableObject {
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showLoader = PassthroughSubject<Bool, Never>()
    var valuePublisher = PassthroughSubject<String, Never>()
}

enum WebViewNavigation {
    case backward, forward
}

enum WebUrl {
    case localUrl, publicUrl
}
