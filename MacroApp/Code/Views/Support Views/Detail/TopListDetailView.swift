//
//  TopListDetailView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 14/11/21.
//

import SwiftUI

struct TopListDetailView: View {
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "exclamationmark.shield")
                    .resizable()
                    .frame(width: 80, height: 100, alignment: .center)
                    .foregroundColor(colorPallete.primary)
                Text("Page under construction").fontWeight(.medium)
            }
            .toolbar{
                Button(action: {
                    print("share tapped")
                    actionSheet()
                }) {
                    Image(systemName: "square.and.arrow.up").imageScale(.large)
                        .foregroundColor(.white)
                }
            }
        }
        .navigationBarTitle("Detail Hasil Pencarian")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: "https://www.w3.org/Provider/Style/dummy.html") else { return }
        let activeVc = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activeVc, animated: true, completion: nil)
    }
}

struct TopListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopListDetailView()
    }
}
