//
//  UITextFieldView.swift
//  animalHealthLog
//
//  Created by 細川聖矢 on 2020/06/23.
//  Copyright © 2020 Seiya. All rights reserved.
//

import SwiftUI


var textFieldWidth = UIScreen.main.bounds.width
var textFieldHeight = 5

final class _TextFieldCoordinator: NSObject {
    var control: MakeTextField
    

    init(_ control: MakeTextField) {
        self.control = control
        super.init()
        control.textField.addTarget(self, action: #selector(textFieldEditingDidBegin(_:)), for: .editingDidBegin)
        control.textField.addTarget(self, action: #selector(textFieldEditingDidEnd(_:)), for: .editingDidEnd)
        control.textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        control.textField.addTarget(self, action: #selector(textFieldEditingDidEndOnExit(_:)), for: .editingDidEndOnExit)
    }
    
    @objc private func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        UIApplication.shared.endEditing()
        return true
    }

    @objc private func textFieldEditingDidBegin(_ textField: UITextField) {
        control.onEditingChanged(true)
    }

    @objc private func textFieldEditingDidEnd(_ textField: UITextField) {
        control.onEditingChanged(false)
    }

    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        control.text = textField.text ?? ""
    }

    @objc private func textFieldEditingDidEndOnExit(_ textField: UITextField) {
        control.onCommit()
    }
}

struct MakeTextField: UIViewRepresentable {

    private let title: String?
    @Binding var text: String
    
    let onEditingChanged: (Bool) -> Void
    let onCommit: () -> Void

    let textField = UITextField()

    init(title: String?, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void = { _ in }, onCommit: @escaping () -> Void = {}) {
        self.title = title
        self._text = text
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
    }

    func makeCoordinator() -> _TextFieldCoordinator {
        _TextFieldCoordinator(self)
    }

    func makeUIView(context: Context) -> UITextField {
        textField.placeholder = title
        textField.delegate = context.coordinator as? UITextFieldDelegate
//        textField.backgroundColor = UIColor.gYellow
        textField.clearButtonMode = UITextField.ViewMode.always
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.frame = CGRect(x: 0, y: 0, width: Int(textFieldWidth), height: Int(textFieldWidth)/4)
        textField.returnKeyType = UIReturnKeyType.done
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        }
    }

