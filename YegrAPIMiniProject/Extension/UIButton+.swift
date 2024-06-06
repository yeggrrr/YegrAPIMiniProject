//
//  UIButton+.swift
//  YegrAPIMiniProject
//
//  Created by YJ on 6/6/24.
//

import UIKit

extension UIButton {
    func setUI(title: String, titleColor: UIColor) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        configuration?.titleAlignment = .center
        backgroundColor = .white
    }
}
