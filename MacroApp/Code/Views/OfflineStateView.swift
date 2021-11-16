//
//  OfflineStateView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 16/11/21.
//

import SwiftUI

struct OfflineStateView: View {
    var body: some View {
        VStack{
            Image(systemName: "wifi.exclamationmark")
                .frame(width: 126, height: 126)
                .foregroundColor(.gray)
                .font(.system(size: 70))
            Text("Tidak dapat tersambung ke internet, periksa Jaringan / wifi anda")
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 300)
        }
    }
}

struct OfflineStateView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineStateView()
    }
}
