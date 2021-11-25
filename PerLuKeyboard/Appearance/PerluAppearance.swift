//
//  PerluAppearance.swift
//  PerLuKeyboard
//
//  Created by Rizky Mashudi on 25/11/21.
//

import Foundation
import KeyboardKit
import SwiftUI

class PerluAppearance: StandardKeyboardAppearance {
    override func buttonImage(for action: KeyboardAction) -> Image? {
        super.buttonImage(for: action)
    }
    
    override func buttonText(for action: KeyboardAction) -> String? {
        super.buttonText(for: action)
    }
    
    override func inputCalloutStyle() -> InputCalloutStyle {
        let style = super.inputCalloutStyle()
        
        return style
    }
    
    override func secondaryInputCalloutStyle() -> SecondaryInputCalloutStyle {
        let style = super.secondaryInputCalloutStyle()
        
        return style
    }
    
    override func systemKeyboardButtonStyle(for action: KeyboardAction, isPressed: Bool) -> SystemKeyboardButtonStyle {
        let style = super.systemKeyboardButtonStyle(for: action, isPressed: isPressed)
        
        return style
    }
    
}
