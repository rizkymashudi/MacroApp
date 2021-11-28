//
//  DetailViewSupport.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 08/11/21.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftUINavigationBarStyling

struct ListDetailViewSupport: View {
    
    //ambil data dari model newsYudistira
    let newsItems: NewsYudistira
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    if newsItems.imgUrl != "" {
                        WebImage(url: URL(string: newsItems.imgUrl)!)
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
                        Text(newsItems.title)
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
                            Text("Dibuat: \(newsItems.date)")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "calendar")
                        }
                        .font(.system(size: 13).weight(.regular))
                        
                        Label{
                            Text("Penulis: \(newsItems.authors)")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "person.fill")
                        }
                        .font(.system(size: 13).weight(.regular))
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 355, alignment: .leading)
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text(newsItems.content)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(16)
                        Text(newsItems.fact)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(16)
                        Text(newsItems.conclusion)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(16)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: 385, alignment: .leading)
                    Spacer()
                }
                .toolbar{
                    Button(action: {
                        print("share tapped")
                        print(newsItems.references)
                        actionSheet()
                    }) {
                        Image(systemName: "square.and.arrow.up").imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationBarTitle("Detail Hasil Pencarian")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .white)
        
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: newsItems.references) else { return }
        let activeVc = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activeVc, animated: true, completion: nil)
    }
}

