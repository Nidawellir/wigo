//
//  MainScreanCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/31/23.
//

import UIKit

final class MainScreanCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Usecases
    
    private let getInOnboardingVideoRecordingCompletedUsecese: GetInOnboardingVideoRecordingCompletedUsecese = UsecasesFactory.shared.resolve()
    private let setInOnboardingVideoRecordingCompletedUsecese: SetInOnboardingVideoRecordingCompletedUsecese = UsecasesFactory.shared.resolve()
    
    // MARK: - Private properties
    
    private weak var mainScreanModuleInput: MainScreanModuleInput?
    private weak var filtersModuleInput: FiltersModuleInput?
    private weak var videoOnboardingInput: VideoOnboardingModuleInput?
    private weak var videoRecorderInput: VideoRecordingModuleInput?
    private weak var videoPreviewModuleInput: VideoPreviewModuleInput?
    private weak var matchDescriptionModuleInput: MatchDescriptionModuleInput?
    private weak var matchPreviewModuleInput: MatchPreviewModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        openMainScrean()
    }
    
    private func openMainScrean() {
        let mainScrean: UIViewController
        
        (mainScrean, mainScreanModuleInput) = MainScreanBuilder.build(with: self)
        
        navigationController.viewControllers = [mainScrean]
    }
    
    private func openVideoRecordingView() {
        let videoRecorderViewController: UIViewController

        (videoRecorderViewController, videoRecorderInput) = VideoRecordingBuilder.build(with: self)

        navigationController.pushViewController(videoRecorderViewController, animated: false)
    }
    
    private func openVideoOnboarding() {
        let videoOnboardinCoordinator = VideoOnboardingCoordinator(navigationController: navigationController)
        
        capture(coordinator: videoOnboardinCoordinator)
        
        videoOnboardinCoordinator.start(with: (), completionHandler: { [weak self, weak videoOnboardinCoordinator] _ in
            guard
                let self = self,
                let videoOnboardinCoordinator = videoOnboardinCoordinator
            else { return }
            
            self.decapture(coordinator: videoOnboardinCoordinator)

            self.setInOnboardingVideoRecordingCompletedUsecese.execute()
            
            self.openVideoRecordingView()
        })
    }
}

// MARK: - IntroModuleOutput

extension MainScreanCoordinator: MainScreanModuleOutput {
    func openCreatingEvent() {
        let creatingEventCoordinator = CreatingEventCoordinator(navigationController: navigationController)

        capture(coordinator: creatingEventCoordinator)
        
        creatingEventCoordinator.start(with: (), completionHandler: { [weak self, weak creatingEventCoordinator] _ in
            guard let self = self, let creatingEventCoordinator = creatingEventCoordinator else { return }

            self.decapture(coordinator: creatingEventCoordinator)
        })
    }
    
    func openFilter() {
        let filtersViewController: UIViewController
        
        (filtersViewController, filtersModuleInput) = FiltersBuilder.build(with: self)
        
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.present(filtersViewController, animated: false)
    }
    
    func openVideoFlow() {
        if !(getInOnboardingVideoRecordingCompletedUsecese.execute() ?? false) {
            openVideoOnboarding()
        } else {
            openVideoRecordingView()
        }
    }
}

// MARK: - FiltersModuleOutput

extension MainScreanCoordinator: FiltersModuleOutput {
    func closeFilters() {
        navigationController.dismiss(animated: false)
    }
}

// MARK: - VideoOnboardingModuleOutput

extension MainScreanCoordinator: VideoOnboardingModuleOutput {
    func closeVideoOnboarding() {
        completionHandler?(())
    }
    
    func skipVideoOnboarding() {
        navigationController.popViewController(animated: false)
    }
}

// MARK: - VideoRecordingModuleOutput

extension MainScreanCoordinator: VideoRecordingModuleOutput {
    func openVideoPreview(videoUrl: String) {
        let videoPreviewViewController: UIViewController
        
        (videoPreviewViewController, videoPreviewModuleInput) = VideoPreviewBuilder.build(with: self)
        
        videoPreviewModuleInput?.getVideoUrl(videoUrl: videoUrl)
        
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.pushViewController(videoPreviewViewController, animated: false)
    }
    
    func closeVideoRecording() {
        navigationController.popViewController(animated: false)
    }
}

extension MainScreanCoordinator: VideoPreviewModuleOutput {
    func backToVideoRecording() {
        navigationController.popViewController(animated: false)
    }
    
    func openMatchingDescription(videoUrl: URL) {
        let matchCoordinator = MatchCoordinator(navigationController: navigationController)

        capture(coordinator: matchCoordinator)
        
        matchCoordinator.start(with: videoUrl, completionHandler: { [weak self, weak matchCoordinator] _ in
            guard let self = self, let matchCoordinator = matchCoordinator else { return }

            self.decapture(coordinator: matchCoordinator)
        })
    }
}
