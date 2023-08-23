//
//  YourBirthdayBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum YourBirthdayBuilder {
    static func build(with output: YourBirthdayModuleOutput? = nil) -> (UIViewController, YourBirthdayModuleInput) {
        let presenter = YourBirthdayPresenter()
        let viewController = YourBirthdayViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
