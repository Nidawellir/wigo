//
//  TenOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum TenOnboardingBuilder {
    static func build() -> UIViewController {
        let presenter = TenOnboardingPresenter()
        let viewController = TenOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        
        return viewController
    }
}
