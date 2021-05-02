//
//  ValueSlider.swift
//  Arbitrage
//
//  Created by Randy Hill on 5/1/21.
//

import SwiftUI

struct PercentSlider: View {
    @Binding var percentage: Double
    @State var percentString: String = ""
    var range: ClosedRange<Double>
    var onChange: ((Int)->Void)?

    var body: some View {
        HStack {
            TextField("%", text: $percentString)
                .addKeyboardDoneButton()
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                 .onChange(of: percentString, perform: { value in
                    if let percent = Int(value), percent >= 0, percent <= 100 {
                        self.percentage = Double(percent)/100
                    }
                })
                .frame(width: 50, alignment: .center)
                Text("%")

            Slider(value: $percentage, in: range)
                .onChange(of: percentage, perform: { value in
                    let intValue = Int(value*100)
                    self.percentString = intValue.formatted
               })
        }
        .onAppear() {
            percentString = Int(percentage*100).formatted
        }
    }
}

struct ValueSlider_Previews: PreviewProvider {
    static var previews: some View {
        PercentSlider(percentage: .constant(0.5), range: 0...1.0, onChange: nil)
    }
}
