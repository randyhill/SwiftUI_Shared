//
//  PercentSlider.swift
//  Arbitrage
//
//  Created by Randy Hill on 5/1/21.
//

import SwiftUI

struct PercentSlider: View {
    @Binding var percentage: Double
    @State var percentString: String = ""
    var onChange: ((Int)->Void)?

    var body: some View {
        HStack {
            TextField("%", text: $percentString)
                .addKeyboardDoneButton()
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                 .onChange(of: percentString, perform: { value in
                    let percent = Double(value) ?? 0
                    if percent >= 0, percent <= 100 {
                        self.percentage = percent/100
                    }
                })
                .frame(width: 50, alignment: .center)
                Text("%")

            Slider(value: $percentage, in: 0...1.0)
                .onChange(of: percentage, perform: { value in
                    let intValue = value.percent
                    self.percentString = intValue.formatted
               })
        }
        .onAppear() {
            percentString = percentage.percent.formatted
        }
    }
}

struct ValueSlider_Previews: PreviewProvider {
    static var previews: some View {
        PercentSlider(percentage: .constant(0.5), onChange: nil)
    }
}
