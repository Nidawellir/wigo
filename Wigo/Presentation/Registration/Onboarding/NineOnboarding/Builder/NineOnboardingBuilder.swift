//
//  NineOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum NineOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = NineOnboardingPresenter()
        let viewController = NineOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
