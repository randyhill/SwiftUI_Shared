//
//  TextFieldPlus.swift
//  Ike
//      Text field in standard style and with clear butotn
//
//  Created by Randy Hill on 1/24/21.
//

import SwiftUI

struct TextFieldActive: View {
    var title: String?
    var placeholder: String
    var disableAutocorrection: Bool = true
    @State var activate: Bool = false
    @Binding var text: String

    var body: some View {
        HStack {
            if let title = title {
                Text(title)
            }
            TextField(placeholder, text: $text)
                .addKeyboardDoneButton(activate: activate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(disableAutocorrection)
            Button(action: {
                text = ""
                activate = true
            }, label: {
                Image(systemName: "delete.left")
                    .foregroundColor(Color.opaqueSeparator)
            })
        }
    }
}

struct TextFieldActive_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldActive(title: "Hey", placeholder: "Task", text: .constant("Hi"))
    }
}


