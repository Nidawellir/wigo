//
//  CreatingEventCoordinator.swift
//  Wigo
//
//  Created by Apple User on 10/23/23.
//

import UIKit

final class CreatingEventCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var videoRecordingModuleInput: VideoRecordingModuleInput?
    private weak var videoPreviewModuleInput: VideoPreviewModuleInput?
    private weak var eventDescriptionModuleInput: EventDescriptionModuleInput?
    private weak var matchPreviewModuleInput: MatchPreviewModuleInput?
    private weak var meetingPointModuleInput: MeetingPointModuleInput?
    private weak var completedSendRequestInput: CompletedSendRequestModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        pushVideoRecording()
    }
    
    private func pushVideoRecording() {
        let videoRecordingViewController: UIViewController
        
        (videoRecordingViewController, videoRecordingModuleInput) = VideoRecordingBuilder.build(with: self)
        
        navigationController.pushViewController(videoRecordingViewController, animated: false)
    }
}

// MARK: - VideoRecordingModuleOutput

extension CreatingEventCoordinator: VideoRecordingModuleOutput {
    func closeVideoRecording() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func openVideoPreview(videoUrl: String) {
        let videoPreviewViewController: UIViewController
        
        (videoPreviewViewController, videoPreviewModuleInput) = VideoPreviewBuilder.build(with: self)
        
        videoPreviewModuleInput?.getVideoUrl(videoUrl: videoUrl)
        
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.pushViewController(videoPreviewViewController, animated: false)
    }
}

// MARK: - VideoPreviewModuleOutput

extension CreatingEventCoordinator: VideoPreviewModuleOutput {
    func backToVideoRecording() {
        navigationController.popViewController(animated: true)
    }
    
    func openMatchingDescription(videoUrl: URL) {
        let eventDescriptionViewController: UIViewController
        
        (eventDescriptionViewController, eventDescriptionModuleInput) = EventDescriptionBuilder.build(with: self)
        
        eventDescriptionModuleInput?.set(videoURL: videoUrl)
        
        navigationController.pushViewController(eventDescriptionViewController, animated: true)
    }
}

// MARK: - EventDescriptionModuleOutput

extension CreatingEventCoordinator: EventDescriptionModuleOutput {
    func openMeetingPoint() {
        let meetingPointViewController: UIViewController
        
        (meetingPointViewController, meetingPointModuleInput) = MeetingPointBuilder.build(with: self)
        
        navigationController.pushViewController(meetingPointViewController, animated: false)
    }
    
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

// MARK: - MeetingPointModuleOutput

extension CreatingEventCoordinator: MeetingPointModuleOutput {
    func sendGeolocation(longitude: Double, latitude: Double, address: String) {
        eventDescriptionModuleInput?.getGeolocation(longitude: longitude, latitude: latitude, address: address)
        navigationController.popViewController(animated: false)
    }
    
    func closeMeetingPoint() {
        navigationController.popViewController(animated: true)
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
