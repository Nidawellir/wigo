//
//  VideoOnboardingCoordinator.swift
//  Wigo
//
//  Created by Apple User on 9/26/23.
//

import UIKit

final class VideoOnboardingCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var videoOnboardingModuleInput: VideoOnboardingModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        let onboarding: UIViewController
        
        (onboarding, videoOnboardingModuleInput) = VideoOnboardingBuilder.build(with: self)
        
        navigationController.viewControllers = [onboarding]
    }
}
// MARK: - VideoOnboardingModuleOutput

extension VideoOnboardingCoordinator: VideoOnboardingModuleOutput {
    func skipVideoOnboarding() {
        completionHandler?(())
    }
}

