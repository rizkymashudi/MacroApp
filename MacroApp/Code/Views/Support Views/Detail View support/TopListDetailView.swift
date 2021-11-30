//
//  TopListDetailView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 14/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopListDetailView: View {
    
    var relatedNews: NewsYudistira?

    let imageNotFound = "https://dummyimage.com/358x172/d1d1d1/757575.png&text=Image+not+found"
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    if relatedNews?.imgUrl != "" {
                        WebImage(url: URL(string: relatedNews?.imgUrl ?? imageNotFound))
                            .resizable()
                            .frame(width: 390, height: 212)
                            .scaledToFill()
                            .background(Color.secondary)
                            .padding(.top, 16)
                            .border(Color.secondary, width: 0.3)
                    } else {
                        Image("Notfound")
                            .resizable()
                            .frame(width: 390, height: 212)
                            .background(Color.secondary)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text(relatedNews?.title ?? "Title")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .lineLimit(8)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: 355, alignment: .leading)
                    }
                    .frame(width: 355)
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 5){
                        Label{
                            Text("Dibuat: \(relatedNews?.date ?? "date not found")")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "calendar")
                        }
                        .font(.system(size: 13).weight(.regular))
                        
                        Label{
                            Text("Penulis: \(relatedNews?.authors ?? "authors not found")")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "person.fill")
                        }
                        .font(.system(size: 13).weight(.regular))
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 355, alignment: .leading)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 10){
                    Text(relatedNews?.content ?? "Content tidak tersedia")
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(16)
                    Text("Fakta").fontWeight(.bold).padding(.leading, 16)
                    Text(relatedNews?.fact ?? "Fakta tidak tersedia")
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.leading, 16)
                        .padding(.bottom, 16)
                        .padding(.trailing, 16)
                    Text("Kesimpulan").fontWeight(.bold).padding(.leading, 16)
                    Text(relatedNews?.conclusion ?? "Kesimpulan tidak tersedia")
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.leading, 16)
                        .padding(.bottom, 16)
                        .padding(.trailing, 16)
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 385, alignment: .leading)
                Spacer()
            }
            .toolbar{
                Button(action: {
                    print("share tapped")
                    actionSheet()
                }) {
                    Image(systemName: "square.and.arrow.up").imageScale(.large)
                        .foregroundColor(.black)
                }
            }
        }
        .navigationBarTitle("Detail Hasil Pencarian")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: relatedNews?.references ?? "https://www.w3.org/Provider/Style/dummy.html") else { return }
        let activeVc = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activeVc, animated: true, completion: nil)
    }
}

struct TopListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopListDetailView()
    }
}
