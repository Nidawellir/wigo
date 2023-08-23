//
//  SixOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum SixOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = SixOnboardingPresenter()
        let viewController = SixOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
