//
//  MatchCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/23/23.
//

import UIKit

final class MatchCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var matchDescriptionModuleInput: MatchDescriptionModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        let matchDescriptionViewController: UIViewController
        
        (matchDescriptionViewController, matchDescriptionModuleInput) = MatchDescriptionBuilder.build(with: self)
        
        navigationController.pushViewController(matchDescriptionViewController, animated: true)
    }
}

// MARK: - MatchDescriptionModuleOutput

extension MatchCoordinator: MatchDescriptionModuleOutput {}
