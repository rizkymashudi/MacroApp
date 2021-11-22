//
//  WebView.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 18/11/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
//    var url: String
//
//    func makeUIView(context: Context) -> WKWebView {
//        guard let url = URL(string: self.url) else {
//            return WKWebView()
//        }
//
//        let request = URLRequest(url: url)
//        let wkWebView = WKWebView()
//        wkWebView.load(request)
//        return wkWebView
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<WebView>) {
//
//    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    @ObservedObject var webViewStateModel: WebViewStateModel
    typealias UIViewType = WKWebView

    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebView
        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            if parent.webViewStateModel.goBack {
                webView.goBack()
                parent.webViewStateModel.goBack = false
            }

            if parent.webViewStateModel.goForward {
                webView.goForward()
                parent.webViewStateModel.goForward = false
            }
        }
    }

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: CGRect.zero)
        view.navigationDelegate = context.coordinator
        view.allowsBackForwardNavigationGestures = true
        view.scrollView.isScrollEnabled = true
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: webViewStateModel.linkWebsite)!))

        if webViewStateModel.goToPage {
            uiView.load(URLRequest(url: URL(string: webViewStateModel.linkWebsite)!))
            webViewStateModel.goToPage = false
        }
    }
    
}
