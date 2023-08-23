//
//  CreateAccountBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum CreateAccountBuilder {
    static func build(with output: CreateAccountModuleOutput? = nil) -> (UIViewController, CreateAccountModuleInput) {
        let presenter = CreateAccountPresenter()
        let viewController = CreateAccountViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
