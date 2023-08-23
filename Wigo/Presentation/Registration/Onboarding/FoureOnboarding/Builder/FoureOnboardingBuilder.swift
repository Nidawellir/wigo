//
//  FoureOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum FoureOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = FoureOnboardingPresenter()
        let viewController = FoureOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
