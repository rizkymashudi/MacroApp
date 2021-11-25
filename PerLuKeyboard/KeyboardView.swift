//
//  File.swift
//  PerLuKeyboard
//
//  Created by Rizky Mashudi on 25/11/21.
//

import Foundation
import SwiftUI
import KeyboardKit

struct KeyboardView: View{
    
    let addTextFieldAboveKeyboard = false
    let actionHandler: KeyboardActionHandler
    let appearance: KeyboardAppearance
    let layoutProvider: KeyboardLayoutProvider
    
    @State private var text = "Text"
        
    @EnvironmentObject private var keyboardContext: KeyboardContext
    @EnvironmentObject private var inputContext: InputCalloutContext
    @EnvironmentObject private var secondaryInputContext: SecondaryInputCalloutContext
    
    var body: some View {
        switch keyboardContext.keyboardType {
        case .alphabetic, .numeric, .symbolic: systemKeyboardStack
        case .emojis: emojiKeyboard
        default: Button("Unsupported keyboard", action: switchToDefaultKeyboard)
        }
        
    }
}

// MARK: -Private Views
private extension KeyboardView {
    
    @ViewBuilder
    var emojiKeyboard: some View {
        if #available(iOSApplicationExtension 14.0, *) {
            EmojiCategoryKeyboard(
                appearance: appearance,
                context: keyboardContext)
                .padding(.vertical)
        } else {
            Text("Requires iOS 14 or later")
        }
    }
    
    var systemKeyboard: some View {
        SystemKeyboard(layout: layoutProvider.keyboardLayout(for: keyboardContext),
                       appearance: appearance,
                       actionHandler: actionHandler,
                       context: keyboardContext,
                       inputContext: inputContext,
                       secondaryInputContext: secondaryInputContext)
    }
    
    var systemKeyboardStack: some View {
        VStack(spacing: 0){
            KeyboardToolbar()
            if addTextFieldAboveKeyboard {
                textField
            }
            systemKeyboard
        }
    }
    
    var textField: some View {
        KeyboardTextField(text: $text, config: {
            $0.placeholder = "Try typing here, press return to stop"
            $0.borderStyle = .roundedRect
            $0.autocapitalizationType = .sentences
        }).padding(3)
    }
}


// MARK: -Private Functions

private extension KeyboardView {
    func buttonBuilder(action: KeyboardAction, appearance: KeyboardAppearance, context: KeyboardContext) -> AnyView {
            switch action {
            default :
                return SystemKeyboard.standardButtonBuilder(action: action, appearance: appearance, context: context)
            }
    }
    
    func switchToDefaultKeyboard() {
        keyboardContext.keyboardType = .alphabetic(.lowercased)
    }
    
    
}


