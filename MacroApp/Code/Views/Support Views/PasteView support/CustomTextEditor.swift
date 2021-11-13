////
////  CustomTextEditor.swift
////  MacroApp
////
////  Created by Rizky Mashudi on 11/11/21.
////
//
//import SwiftUI
//
//struct CustomTextEditor: View {
//    let placeHolder: String
//    @Binding var yourText: String
//
//    var body: some View {
//    
//        ZStack() {
//            if yourText.isEmpty {
//                VStack {
////                    Button {
////                        print("Button hand.tap was tapped")
////                        yourText = ""
////                    } label: {
////                        Image(systemName: "hand.tap")
////                            .foregroundColor(colorPallete.symbol)
////                            .font(.system(size: 75))
////                    }
////                    Label("", systemImage: "hand.tap")
////                        .font(.system(size: 75))
////                        .foregroundColor(colorPallete.symbol)
//
//                    Text(placeHolder)
//                        .multilineTextAlignment(.center)
//                        .font(.system(size: 17))
//                }
//
//            }
//
//            TextEditor(text: $yourText)
//                .frame(width: 320, height: 390, alignment: .center)
//                .cornerRadius(8)
////                .overlay(
////                    if yourText.isEmpty {
////                        VStack {
////                            Button {
////                                print("Button hand.tap was tapped")
////                                yourText = ""
////                            } label: {
////                                Image(systemName: "hand.tap")
////                                    .foregroundColor(colorPallete.symbol)
////                                    .font(.system(size: 75))
////                            }
////        //                    Label("", systemImage: "hand.tap")
////        //                        .font(.system(size: 75))
////        //                        .foregroundColor(colorPallete.symbol)
////
////                            Text(placeHolder)
////                                .multilineTextAlignment(.center)
////                                .font(.system(size: 17))
////                        }
////
////                    }
////                )
//
//        }
//        .onAppear() {
//            UITextView.appearance().backgroundColor = .clear
//        }.onDisappear() {
//            UITextView.appearance().backgroundColor = nil
//        }
//
//    }
//}
