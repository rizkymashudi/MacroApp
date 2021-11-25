//
//  KeyboardViewController.swift
//  PerLuKeyboard
//
//  Created by Rizky Mashudi on 25/11/21.
//

import UIKit
import KeyboardKit
import SwiftUI
import Combine

class KeyboardViewController: KeyboardInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        autocompleteProvider = FakeAutocompleteProvider()
        keyboardAppearance = PerluAppearance(context: keyboardContext)
        keyboardContext.locale = KeyboardLocale.english.locale
        keyboardContext.locales = [KeyboardLocale.english.locale]
        keyboardActionHandler = PerluKeyboardActionHandler(
            inputViewController: self)
        keyboardInputSetProvider = StandardKeyboardInputSetProvider(
            context: keyboardContext,
            providers: [EnglishKeyboardInputSetProvider()])
        
        keyboardLayoutProvider = PerluKeyboardLayoutProvider(
            inputSetProvider: keyboardInputSetProvider,
            dictationReplacement: .keyboardType(.emojis))
        
        keyboardSecondaryCalloutActionProvider = StandardSecondaryCalloutActionProvider(
            context: keyboardContext,
            providers: [try? EnglishSecondaryCalloutActionProvider()].compactMap { $0 })
        
        
        // view.backgroundColor = UIColor(keyboardAppearance.keyboardBackgroundColor)
        
    }
    
    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()
        
//         setup(with: keyboardView)
        setup(with: keyboardPasteView)
    }
    
    
    // MARK: - Properties
        
    private var keyboardView: some View {
        
        KeyboardView(
            actionHandler: keyboardActionHandler,
            appearance: keyboardAppearance,
            layoutProvider: keyboardLayoutProvider)
    }
    
    private var keyboardPasteView: some View {
        KeyboardPasteView()
    }
    

}
