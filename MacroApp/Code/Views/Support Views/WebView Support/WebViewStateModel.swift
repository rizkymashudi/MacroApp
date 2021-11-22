//
//  WebViewViewModel.swift
//  MacroApp
//
//  Created by Tenti Atika Putri on 23/11/21.
//

import Foundation

class WebViewStateModel: ObservableObject {
    @Published var linkWebsite: String = "https://www.kominfo.go.id/content/detail/20086/hoaks-broadcast-pengobatan-gratis-kanker-tanpa-operasi-dan-kemo-rspad/0/laporan_isu_hoaks"
    @Published var goToPage: Bool = false
    @Published var goBack: Bool = false
    @Published var goForward: Bool = false
}