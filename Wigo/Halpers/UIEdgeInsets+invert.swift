//
//  UIEdgeInsets+invert.swift
//  Wigo
//
//  Created by Apple User on 7/28/23.
//

import UIKit

extension UIEdgeInsets {
    func invert() -> UIEdgeInsets {
        return UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right)
    }
}
