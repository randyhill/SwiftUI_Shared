//
//  DatePickerButtons.swift
//  Arbitrage
//
//  Created by Randy Hill on 5/1/21.
//

import SwiftUI

struct DatePickerButtons: View {
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
      
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                  .edgesIgnoringSafeArea(.all)
              
              
            VStack {
                DatePicker("Test", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Divider()
                HStack {
                      
                    Button(action: {
                        showDatePicker = false
                    }, label: {
                        Text("Cancel")
                    })
                      
                    Spacer()
                      
                    Button(action: {
                        savedDate = selectedDate
                        showDatePicker = false
                    }, label: {
                        Text("Save")
                    })
                      
                  }
                  .padding(.horizontal)

            }
            .padding()
            .background(
                Color.white
                    .cornerRadius(30)
            )
        }
    }
}

struct DatePickerButtons_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerButtons(showDatePicker: .constant(true), savedDate: .constant(Date()), selectedDate: Date())
    }
}
