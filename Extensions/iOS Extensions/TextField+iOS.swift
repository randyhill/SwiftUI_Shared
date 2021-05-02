//
//  TextField+iOS.swift
//  Arbitrage
//
//  Created by Randy Hill on 5/1/21.
//

import SwiftUI
import Introspect

extension TextField {
    public func addKeyboardDoneButton(activate: Bool = false) -> some View {
        return introspect(selector: TargetViewSelector.siblingContaining) { textField in
            if activate {
                textField.becomeFirstResponder()
            }
            if let textField = textField as? UITextField {
                textField.addDoneButton()
            }
        }
    }
}
