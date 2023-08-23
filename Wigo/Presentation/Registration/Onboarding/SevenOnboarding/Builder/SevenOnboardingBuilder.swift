//
//  SevenOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum SevenOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = SevenOnboardingPresenter()
        let viewController = SevenOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
