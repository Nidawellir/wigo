//
//  VideoOnboardingBuilder.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

enum VideoOnboardingBuilder {
    static func build(with output: VideoOnboardingModuleOutput? = nil) -> (UIViewController, VideoOnboardingModuleInput) {
        let presenter = VideoOnboardingPresenter()
        let viewController = VideoOnboardingViewController(presenter: presenter)
        
        presenter.output = viewController
        viewController.output = output
        
        return (viewController, viewController)
    }
}
