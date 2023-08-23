//
//  YourNameBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum YourNameBuilder {
    static func build(with output: YourNameModuleOutput? = nil) -> (UIViewController, YourNameModuleInput) {
        let presenter = YourNamePresenter()
        let viewController = YourNameViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
