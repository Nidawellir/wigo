//
//  UIStackView+removeArrangedSubviews.swift
//  Wigo
//
//  Created by Apple User on 9/29/23.
//

import UIKit

extension UIStackView {
    func removeArrangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
