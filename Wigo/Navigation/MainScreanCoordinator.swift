//
//  MainScreanCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/31/23.
//

import UIKit

final class MainScreanCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var mainScreanModuleInput: MainScreanModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        let intro: UIViewController
        
        (intro, mainScreanModuleInput) = MainScreanBuilder.build(with: self)
        
        navigationController.viewControllers = [intro]
    }
}

// MARK: - IntroModuleOutput

extension MainScreanCoordinator: MainScreanModuleOutput {
    
}
