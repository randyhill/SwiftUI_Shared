//
//  TextFieldPlus.swift
//  Ike
//      Text field in standard style and with clear butotn
//
//  Created by Randy Hill on 1/24/21.
//

import SwiftUI
#if os(iOS)
import Introspect
#endif

struct TextFieldActive: View {
    var title: String?
    var placeholder: String
    var disableAutocorrection: Bool = true
    @Binding var text: String

    var body: some View {
        HStack {
            if let title = title {
                Text(title)
            }
            TextField(placeholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .introspectTextField { textField in
                    #if os(iOS)
                      textField.becomeFirstResponder()
                    #endif
                    textField.addDoneButton()
                }
                .modifier(TextFieldClearButton(text: $text))
                .disableAutocorrection(disableAutocorrection)
        }
    }
}

struct TextFieldActive_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldActive(title: "Hey", placeholder: "Task", text: .constant("Hi"))
    }
}


