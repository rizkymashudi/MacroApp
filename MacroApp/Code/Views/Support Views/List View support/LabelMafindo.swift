//
//  LabelMafindo.swift
//  MacroApp
//
//  Created by Rizky Mashudi on 13/11/21.
//

import SwiftUI

struct LabelMafindo: View {
    @State public var hideLabel: Bool = false
    
    var body: some View {
        HStack(spacing: 4){
            Image(systemName: "info.circle.fill").imageScale(.large).foregroundColor(colorPallete.symbol)
                .padding(.trailing, 2)
            Text("MAFINDO").fontWeight(.bold).font(.system(size: 12))
            Text("adalah lembaga nirlaba anti hoax").fontWeight(.regular).font(.system(size: 12))
                .padding(.trailing, 15)
            Button(action: {
                print("close label tapped")
                hideLabel.toggle()
            }) {
                Image(systemName: "xmark.circle").imageScale(.large)
                    .foregroundColor(.red)
            }
        }
        .frame(width: hideLabel ? 0 : 350, height: hideLabel ? 0 : 41)
        .background(RoundedRectangle(cornerRadius: 6.0).stroke(.gray, lineWidth: 1))
        .background(colorPallete.mafindoLabel)
        .cornerRadius(6.0)
        .opacity(hideLabel ? 0 : 1)
        
    }
}

struct LabelMafindo_Previews: PreviewProvider {
    static var previews: some View {
        LabelMafindo()
    }
}
