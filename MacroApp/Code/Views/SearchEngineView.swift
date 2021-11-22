//
//  SearchEngineView.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 18/11/21.
//

import SwiftUI
import SwiftUINavigationBarStyling

struct SearchEngineView: View {
    var body: some View {
        WebView(url: "https://www.kominfo.go.id/content/detail/20086/hoaks-broadcast-pengobatan-gratis-kanker-tanpa-operasi-dan-kemo-rspad/0/laporan_isu_hoaks")
            .navigationTitle("Hasil Pencarian")
            .toolbar{
                Button(action: {
                    print("share tapped")
                }) {
                    Image(systemName: "arrow.clockwise").imageScale(.large)
                        .foregroundColor(.white)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.bottomBar){
                    HStack {
                        Button(action: {
                            print("Go Back")
                        }, label: {
                            Image(systemName: "chevron.left")
                        })

                        Spacer()

                        Button(action: {
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
                            print("Button Share is pressed")
                            MacroApp.actionSheet()
                        }, label: {
                            Image(systemName: "square.and.arrow.up")
                        })
                        
                    }
                }
            }
    }
}

func actionSheet() {
    guard let urlShare = URL(string: "https://www.kominfo.go.id/content/detail/20086/hoaks-broadcast-pengobatan-gratis-kanker-tanpa-operasi-dan-kemo-rspad/0/laporan_isu_hoaks" ) else { return }
    let activeVc = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
    UIApplication.shared.windows.first?.rootViewController?.present(activeVc, animated: true, completion: nil)
}

struct SearchEngineView_Previews: PreviewProvider {
    static var previews: some View {
        SearchEngineView()
    }
}


