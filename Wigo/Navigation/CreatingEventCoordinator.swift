//
//  CreatingEventCoordinator.swift
//  Wigo
//
//  Created by Apple User on 10/23/23.
//

import UIKit

final class CreatingEventCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var eventDescriptionModuleInput: EventDescriptionModuleInput?
    private weak var matchPreviewModuleInput: MatchPreviewModuleInput?
    private weak var completedSendRequestInput: CompletedSendRequestModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        pushEventDescriptionModule()
    }
    
    private func pushEventDescriptionModule() {
        let eventDescriptionViewController: UIViewController
        
        (eventDescriptionViewController, eventDescriptionModuleInput) = EventDescriptionBuilder.build(with: self)
        
//        eventDescriptionModuleInput?.set(videoURL: videoURL)
        
        navigationController.pushViewController(eventDescriptionViewController, animated: true)
    }
}

// MARK: - EventDescriptionModuleOutput

extension CreatingEventCoordinator: EventDescriptionModuleOutput {
    func closeEventDescriptionMatch() {
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
    
    func openCompletedSendRequest() {
        pushCompletedSendRequest()
    }
    
    private func pushCompletedSendRequest() {
        let completedSendRequestViewController: UIViewController
        
        (completedSendRequestViewController, completedSendRequestInput) = CompletedSendRequestBuilder.build(with: self)
        
        navigationController.pushViewController(completedSendRequestViewController, animated: true)
    }
}

// MARK: - MatchPreviewModuleOutput

extension CreatingEventCoordinator: MatchPreviewModuleOutput {
    func closeMatchPreviewMatch() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - CompletedSendRequestModuleOutput

extension CreatingEventCoordinator: CompletedSendRequestModuleOutput {
    func closeCompletedSendRequest() {
        navigationController.popToRootViewController(animated: true)
    }
}
