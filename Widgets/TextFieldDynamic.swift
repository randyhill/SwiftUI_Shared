//
//  FormDynamicTextField.swift
//  Ike
//
//  Textfield resizes as text added .
//  Created by Randy Hill on 1/10/21.
//

import SwiftUI

struct TextFieldDynamic: View {
    @Binding var text: String
    @State var placeHolder: String
    var height: CGFloat
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.secondarySystemBackground

            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(Color.placeholderText)
                    .padding(4)
            }
            TextFieldDynamicNative(text: $text, height: .constant(height), placeHolder: .constant(placeHolder))
                .modifier(TextFieldClearButton(text: $text))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .frame(width: 300, height: height)
    }
}

struct FormDynamicTextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDynamic(text: .constant(""), placeHolder: "Placeholder", height: 64)
    }
}
