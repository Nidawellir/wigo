//
//  SMSCodeBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum SMSCodeBuilder {
    static func build() -> UIViewController {
        let presenter = SMSCodePresenter()
        let viewController = SMSCodeViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}