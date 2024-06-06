//
//  UITextField+.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/6/24.
//

import UIKit

extension UITextField {
    func setCustomUI(_ placeholderText: String, isSecureText: Bool, _ keyboardStyle: UIKeyboardType) {
        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        backgroundColor = .clear
        textColor = .white
        tintColor = .black
        keyboardType = keyboardStyle
        isSecureTextEntry = isSecureText
        returnKeyType = .done
        keyboardAppearance = .dark
        layer.cornerRadius = 5
        leftPadding()
    }
    
    func leftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
