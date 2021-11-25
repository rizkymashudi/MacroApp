//
//  KeyboardActivationView.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 25/11/21.
//

import SwiftUI
import KeyboardKit

struct KeyboardActivationView: View {
    
    @StateObject private var keyboardState = KeyboardEnabledState(bundleId: "id.infiniteLearning.MacroApp.PerLuKeyboard")
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Image("AktivasiKeyboard")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                
                HStack{
                    Text("Aktivasi keyboard **PerLu**")
                        .font(.system(size: 24))
                }
            }
            .padding(.top, 20)
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.white)
                    .background(RoundedRectangle(cornerRadius: 8.0).stroke(.gray, lineWidth: 1))
                VStack(alignment: .center, spacing: 30){
                    VStack{
                        Text("Ikuti langkah mudah ini untuk mulai gunakan Keyboard **PerLu**")
                            .font(.system(size: 17))
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 35)
                    }
                    VStack(alignment: .leading, spacing: 20){
                        HStack(spacing: 20){
                            Image(systemName: "gear.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            HStack{
                                Text("Pergi ke **Pengaturan**")
                            }
                        }
                        HStack(spacing: 20){
                            Image("icon app aktivasi")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            HStack{
                                Text("Ketuk aplikasi **PerLu**")
                            }
                        }
                        HStack(spacing: 20){
                            Image(systemName: "keyboard")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            HStack(spacing: 3){
                                Text("Ketuk **Keyboard**")
                            }
                        }
                        HStack(spacing: 20){
                            Image("switch")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            HStack(spacing: 3){
                                Text("Aktifkan **PerLu**")
                            }
                        }
                        HStack(spacing: 20){
                            Image("switch")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            HStack(spacing: 3){
                                Text("Aktifkan **Izinkan akses penuh**")
                            }
                        }
                    }
                    .padding()
                }
                .padding(.top, 30)
                .padding(.bottom, 30)
            }
            .frame(width: 345)
            .fixedSize(horizontal: false, vertical: true)
            .edgesIgnoringSafeArea(.all)
            Spacer()
            
            Button("Aktifkan Sekarang"){
                print("Activation tapped")
                openSettings()
            }
            .buttonStyle(GrowingSearchButton())
            
            Spacer()
            
        }
        .navigationTitle("Keyboard")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(UIColor(colorPallete.navBarColor), textColor: .black)
    }
}

struct KeyboardActivationView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardActivationView()
    }
}

private extension KeyboardActivationView {
    var isFullAccessEnabled: Bool {
        keyboardState.isKeyboardEnabled
    }

    var isKeyboardEnabled: Bool {
        keyboardState.isKeyboardEnabled
    }
    
    func openSettings() {
        guard let url = URL.keyboardSettings else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
