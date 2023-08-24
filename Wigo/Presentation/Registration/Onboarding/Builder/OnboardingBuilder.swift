//
//  OnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum OnboardingBuilder {
    static func build(with output: OnboardingModuleOutput? = nil) -> (UIViewController, OnboardingModuleInput) {
        let presenter = OnboardingPresenter()
        let viewController = OnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
