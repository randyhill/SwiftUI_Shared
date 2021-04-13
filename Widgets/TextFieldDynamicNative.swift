//
//  DynamicTextField.swift
//  Ike
//
//  Created by Randy Hill on 1/10/21.
//

import SwiftUI

struct TextFieldDynamicNative: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    @Binding var text: String
    @Binding var height: CGFloat
    @Binding var placeHolder: String 

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.isScrollEnabled = true
        textView.alwaysBounceVertical = false
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.text = text
        textView.backgroundColor = UIColor.clear
        textView.addDoneButton()
        
        context.coordinator.textView = textView
        textView.delegate = context.coordinator
        textView.layoutManager.delegate = context.coordinator

        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(dynamicSizeTextField: self)
    }
}

struct DynamicTextField_Previews: PreviewProvider {
    @State var starting = ""
    static var previews: some View {
        TextFieldDynamicNative(text: .constant("The text"), height: .constant(32), placeHolder: .constant("Notes"))
    }
}

class Coordinator: NSObject, UITextViewDelegate, NSLayoutManagerDelegate {
    
    var DynamicTextField: TextFieldDynamicNative
    
    weak var textView: UITextView?

    
    init(dynamicSizeTextField: TextFieldDynamicNative) {
        self.DynamicTextField = dynamicSizeTextField
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.DynamicTextField.text = textView.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func layoutManager(_ layoutManager: NSLayoutManager, didCompleteLayoutFor textContainer: NSTextContainer?, atEnd layoutFinishedFlag: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            guard let textView = self?.textView else {
                return
            }
            let size = textView.sizeThatFits(textView.bounds.size)
            if self?.DynamicTextField.height != size.height {
                self?.DynamicTextField.height = size.height
            }
        }

    }
}
