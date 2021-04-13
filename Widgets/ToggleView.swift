//
//  ToggleView.swift
//  Ike
//
//  Created by Randy Hill on 12/31/20.
//

import SwiftUI

struct ToggleView: View {
    @State var isChecked = false
    var title: String

    var body: some View {
        HStack {
            Toggle(isOn: $isChecked){}
                .frame(width: 64)
            Text(title)
                .font(.title3)
       }
    }
}

struct Toggle_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView(isChecked: true, title: "Checkbox")
    }
}
