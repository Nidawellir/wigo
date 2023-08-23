//
//  FirstOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum FirstOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = FirstOnboardingPresenter()
        let viewController = FirstOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
