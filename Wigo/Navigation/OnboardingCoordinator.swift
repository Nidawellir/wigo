//
//  OnboardingCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/23/23.
//

import UIKit

final class OnboardingCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var onboardingModuleInput: OnboardingModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        let onboarding: UIViewController
        
        (onboarding, onboardingModuleInput) = OnboardingBuilder.build(with: self)
        
        navigationController.viewControllers = [onboarding]
    }
}

extension OnboardingCoordinator: OnboardingModuleOutput {}
