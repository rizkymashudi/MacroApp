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
                VStack(spacing: 5){
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
//                            .frame(width: 355)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing)
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
                    .aspectRatio(2, contentMode: .fit)
                    .padding(.trailing, 15)
                    
                    Spacer(minLength: -5)
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
                    Spacer()
                }
                .toolbar{
                    Button(action: {
                        print("share tapped")
                        print(newsItems.references)
                        actionSheet()
                    }) {
                        Image(systemName: "square.and.arrow.up").imageScale(.large)
                            .foregroundColor(.white)
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

//struct ListDetailViewSupport_Previews: PreviewProvider {
//    static let newsItems = NewsYudistira(id: "2222", authors: "Mafindo", title: "[HOAX] Yayasan Miracle Hope Ingin Membantu Untuk Mengobati Penderita Kanker Jenis Apapun", content: "RS Gatot Subroto Jkt, sdh mulai ada pengobatan tumor ganas/ kanker CELL CURE, tlh berhasil menyembuhkan kanker stadium 4, tanpa operasi, tanpa chemo therapy…\nEquipment tsb hibah oleh pemerintah Jerman.\n....Selengkapnya di bagian REFERENSI.", fact: "Hoax sudah beredar sejak tahun 2015, sudah debunked (terbongkar) oleh Indonesian Hoaxes Community.\nDikutip dari akun facebook  Indonesian Hoaxes Community, fani ferdiani adalah seorang marketer yang mencari database orang sebanyak banyaknya \nsilahkan cek link berikut hxxps://www[dot]facebook[dot]com/TiongHoa.Indonesia/posts/10152032145277258.\nSementara, web yayasan tersebut sudah mati. \nYayasan Harapan Mulia (Hope of Miracle)\nPaskal Hyper Square C-26\nBandung – Jawa Barat\n022-61587255 / 08112105544\n", references: "Hoax sudah beredar sejak tahun 2015, sudah debunked (terbongkar) oleh Indonesian Hoaxes Community.\nDikutip dari akun facebook  Indonesian Hoaxes Community, fani ferdiani adalah seorang marketer yang mencari database orang sebanyak banyaknya \nsilahkan cek link berikut hxxps://www[dot]facebook[dot]com/TiongHoa.Indonesia/posts/10152032145277258.\nSementara, web yayasan tersebut sudah mati. \nYayasan Harapan Mulia (Hope of Miracle)\nPaskal Hyper Square C-26\nBandung – Jawa Barat\n022-61587255 / 08112105544\n", imgUrl: "[HOAX] Yayasan Miracle Hope Ingin Membantu Untuk Mengobati Penderita Kanker Jenis Apapun", date: "2017-09-24", conclusion: "-")
//    
//    static var previews: some View {
//        ListDetailViewSupport(newsItems: newsItems)
//    }
//}
