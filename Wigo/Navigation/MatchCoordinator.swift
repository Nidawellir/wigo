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
    private weak var matchPreviewModuleInput: MatchPreviewModuleInput?
    
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
        navigationController.popViewController(animated: false)
    }
    
    func openPreviewVideo(with videoURL: URL) {
        pushMatchPreviewModule(with: videoURL)
    }
    
    private func pushMatchPreviewModule(with videoURL: URL) {
        let matchPreviewViewController: UIViewController
        
        (matchPreviewViewController, matchPreviewModuleInput) = MatchPreviewBuilder.build(with: self)
        
        matchPreviewModuleInput?.set(videoURL: videoURL)
        
        navigationController.pushViewController(matchPreviewViewController, animated: true)
    }
}

// MARK: - MatchPreviewModuleOutput

extension MatchCoordinator: MatchPreviewModuleOutput {
    func closeMatchPreviewMatch() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - CompletedSendRequestModuleOutput

//extension MatchCoordinator: CompletedSendRequestModuleOutput {
//    func closeCompletedSendRequestView() {
//        navigationController.popToRootViewController(animated: true)
//    }
//}
