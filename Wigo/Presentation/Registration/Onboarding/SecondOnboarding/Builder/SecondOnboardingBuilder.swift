//
//  SecondOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum SecondOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = SecondOnboardingPresenter()
        let viewController = SecondOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
