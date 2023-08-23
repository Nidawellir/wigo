//
//  EightOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum EightOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = EightOnboardingPresenter()
        let viewController = EightOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
