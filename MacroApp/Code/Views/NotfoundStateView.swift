//
//  NotfoundStateView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 16/11/21.
//

import SwiftUI

struct NotfoundStateView: View {
    @State var showingAlert: Bool = false
    
    var body: some View {
        VStack{
            LabelMafindo()
            Spacer()
            VStack{
                Image("NotfoundIcon")
                Text("Maaf, Hasil pencarian data Mafindo tidak ditemukan")
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 100)
            Button(action: {
                print("alert")
                showingAlert = true
            }){
                Text("Lanjutkan pencarian di search engine")
            }
            .buttonStyle(GrowingSearchEngineButton())
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Maaf, Hasil pencarian pada data Mafindo tidak ditemukan"),
                    message: Text("apakah anda ingin  melanjutkan pencarian melalui search engine?"),
                    primaryButton: .default(Text("Ya")) {
                                       print("Move to web view")
                                   },
                    secondaryButton: .cancel(Text("Nanti saja")) {
                        print("Cancel")
                    }
                )
            }
            
            Spacer()
        }
    }
}

struct NotfoundStateView_Previews: PreviewProvider {
    static var previews: some View {
        NotfoundStateView()
    }
}
