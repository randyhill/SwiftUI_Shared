//
//  CheckboxView.swift
//  Ike
//
//  Created by Randy Hill on 1/23/21.
//

import SwiftUI

let checkBoxDimension: CGFloat = 24.0

struct Checkbox: View {
    @Binding var isChecked: Bool
    var title: String
    var isChanged: ((Bool)->Void)
    
    // Apple says 44 by 44 is the minimum comfortable tap area, but we don't have that much space
    let imageSize: CGFloat = checkBoxDimension
    let buttonSize = CGSize(width: checkBoxDimension, height: checkBoxDimension)

    var body: some View {
        if isChecked {
            Button(action: {
                isChecked = false
                isChanged(false)
            }, label: {
                Image(systemName: "checkmark.square")
                    .resizable()
                    .frame(width: imageSize, height: imageSize, alignment: .center)
            })
            .frame(width: buttonSize.width, height: buttonSize.height, alignment: .center)
            .buttonStyle(BorderlessButtonStyle())
        } else {
            Button(action: {
                isChecked = true
                isChanged(true)
            }, label: {
                Image(systemName: "square")
                    .resizable()
                    .frame(width: imageSize, height: imageSize, alignment: .center)
             })
            .frame(width: buttonSize.width, height: buttonSize.height, alignment: .center)
            .buttonStyle(BorderlessButtonStyle())
        }
        Text(title)
            .onTapGesture {
                isChecked = !isChecked
                isChanged(isChecked)
            }

    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(isChecked: .constant(true), title: "Title") { (newValue) in
            Log.console("New value: \(newValue)")
        }
    }
}
