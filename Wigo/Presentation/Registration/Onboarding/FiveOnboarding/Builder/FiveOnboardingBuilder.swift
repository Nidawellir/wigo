//
//  FiveOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum FiveOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = FiveOnboardingPresenter()
        let viewController = FiveOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
