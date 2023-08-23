//
//  ThirdOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum ThirdOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = ThirdOnboardingPresenter()
        let viewController = ThirdOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
