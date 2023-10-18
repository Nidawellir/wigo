//
//  MatchCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/23/23.
//

import UIKit

final class MatchCoordinator: BaseCoordinator<URL, Void> {
    
    // MARK: - Private properties
    
    private weak var matchDescriptionModuleInput: MatchDescriptionModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: URL, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        pushMatchDescriptionModule(with: input)
    }
    
    private func pushMatchDescriptionModule(with videoURL: URL) {
        let matchDescriptionViewController: UIViewController
        
        (matchDescriptionViewController, matchDescriptionModuleInput) = MatchDescriptionBuilder.build(with: self)
        
        matchDescriptionModuleInput?.set(videoURL: videoURL)
        
        navigationController.pushViewController(matchDescriptionViewController, animated: true)
    }
}

// MARK: - MatchDescriptionModuleOutput

extension MatchCoordinator: MatchDescriptionModuleOutput {
    func closeMatchDescriptionMatch() {
        print("-closeMatchDescriptionMatch()")
    }
    
    func openPreviewVideo(with videoURL: URL) {
        print(videoURL)
    }
}
