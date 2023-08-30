//
//  IntroCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/24/23.
//

import UIKit

final class IntroCoordonator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var introModuleInput: IntroModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        let intro: UIViewController
        
        (intro, introModuleInput) = IntroBuilder.build(with: self)
        
        navigationController.viewControllers = [intro]
    }
}

// MARK: - IntroModuleOutput

extension IntroCoordonator: IntroModuleOutput {
    func skipIntro() {
        completionHandler?(())
    }
}
