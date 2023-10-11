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
    func closeVideoRecording() {
        navigationController.popViewController(animated: false)
    }
}
