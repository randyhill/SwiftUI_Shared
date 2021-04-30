//
//  TextFieldClearButton.swift
//  Ike
//
//  Created by Randy Hill on 1/24/21.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    var actionCallback: (()->Void)? = nil

    func body(content: Content) -> some View {
        HStack {
            content // Need to return content for some reason?

            if !text.isEmpty {
                Button(
                    action: {
                        self.text = ""
                        actionCallback?()
                      },
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color.opaqueSeparator)
                    }
                )
            }
        }
    }
}
