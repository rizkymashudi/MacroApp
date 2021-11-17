//
//  WebView.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 18/11/21.
//

import Foundation
import UIKit
import SwiftUI
import Combine
import WebKit

struct WebView: UIViewRepresentable {
    var urlType: WebUrlType
    @ObservedObject var viewModel: WebViewVM

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let preverences = WKPreferences
        preverences.javaScriptEnabled = true

        let configuration = WKWebViewConfiguration()
        configuration.userContentController.add(self.makeCoordinator(), name: "iOSNative")
        configuration.preferences = preverences

        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if urlType == .localUrl {
            if let url = Bundle.main.url(forResource: "LocalWebsite", withExtension: "html", subdirectory: "www") {
                webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            }
        } else if urlType == .publicUrl {
            if let url = URL(string: "https://www.google.com") {
                webView.load(URLRequest(url: url))
            }
        }
    }

    class Coordinator : NSObject, WKNavigationDelegate {
        var parent: WebViewVM
        var webViewNavigationSubscriber: AnyCancellable? = nil

        init(_ uiWebView: WebViewVM) {
            self.parent = uiWebView
        }

        deinit {
            webViewNavigationSubscriber?.cancel()
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.parent.viewModel.showLoader.send(false)
        }

        
    }
}
