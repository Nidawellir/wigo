//
//  AppleIDSignInBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum AppleIDSignInBuilder {
    static func build(with output: AppleIDSignInModuleOutput? = nil) -> (UIViewController, AppleIDSignInModuleInput) {
        let presenter = AppleIDSignInPresenter()
        let viewController = AppleIDSignInViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
