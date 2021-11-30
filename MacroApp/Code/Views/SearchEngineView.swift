//
//  SearchEngineView.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 18/11/21.
//

import SwiftUI
import SwiftUINavigationBarStyling

struct SearchEngineView: View {
    @ObservedObject var webViewStateModel: WebViewStateModel = WebViewStateModel()
    @ObservedObject var apiServiceGoogle = ApiServiceGoogle()

    @Binding var text: String

    var body: some View {
        WebView(webViewStateModel: webViewStateModel, apiServiceGoogle: apiServiceGoogle)
            .navigationTitle("Hasil Pencarian")
            .toolbar{
                Button(action: {
                    print("Button Share is pressed")
                    MacroApp.actionSheet(link: apiServiceGoogle.linkGoogle)
                    webViewStateModel.linkWebsite = apiServiceGoogle.linkGoogle
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                })
            }
            .onAppear(perform: { apiServiceGoogle.fetchGoogle(userRawText: text) {result in }})
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.bottomBar){
                    HStack {
                        Button(action: {
                            webViewStateModel.goBack = true
                            print("Go Back")
                        }, label: {
                            Image(systemName: "chevron.left")
                        })

                        Spacer()

                        Button(action: {
                            webViewStateModel.goForward = true
                            print("Go Forward")
                        }, label: {
                            Image(systemName: "chevron.right")
                        })

                        Spacer()

                        Button(action: {
                            print("Button aA is presseed")
                        }, label: {
                            Image(systemName: "textformat.size")
                        })

                        Spacer()

                        Button(action: {
                            webViewStateModel.reload = true
                            print("reload tapped")
                        }, label: {
                            Image(systemName: "arrow.clockwise")

                        })
                    }
                }
            }
    }
}

func actionSheet(link: String) {
    guard let urlShare = URL(string: link ?? "https://www.google.com") else { return }
    let activeVc = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
    UIApplication.shared.windows.first?.rootViewController?.present(activeVc, animated: true, completion: nil)
}

//struct SearchEngineView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchEngineView()
//    }
//}


