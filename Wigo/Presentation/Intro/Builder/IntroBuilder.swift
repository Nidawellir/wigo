//
//  IntroBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum IntroBuilder {
    static func build(with output: IntroModuleOutput? = nil) -> (UIViewController, IntroModuleInput) {
        let presenter = IntroPresenter()
        let viewController = IntroViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
