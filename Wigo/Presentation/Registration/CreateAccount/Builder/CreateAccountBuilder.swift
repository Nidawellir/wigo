//
//  CreateAccountBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum CreateAccountBuilder {
    static func build(with output: CreateAccountModuleOutput? = nil) -> (UIViewController, CreateAccountModuleInput) {
        let usecasesFactory = UsecasesFactory.shared
        let presenter = CreateAccountPresenter(registrationUsecase: usecasesFactory.resolve())
        let viewController = CreateAccountViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
