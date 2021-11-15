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
            ScrollView{
                VStack{
                    Image("Notfound")
                        .resizable()
                        .frame(width: 390, height: 212)
                        .background(Color.secondary)
//                    Image(systemName: "exclamationmark.shield")
//                        .resizable()
//                        .frame(width: 80, height: 100, alignment: .center)
//                        .foregroundColor(colorPallete.primary)
//                    Text("Page under construction").fontWeight(.medium)
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
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
                            Text("Dibuat: tanggal")
                                .multilineTextAlignment(.leading)
                        } icon: {
                            Image(systemName: "calendar")
                        }
                        .font(.system(size: 13).weight(.regular))
                        
                        Label{
                            Text("Penulis: who")
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
                VStack(alignment: .leading){
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(16)
                    Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(16)
                    Text("At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.")
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
