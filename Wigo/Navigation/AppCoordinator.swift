//
//  File.swift
//  
//
//  Created by Aleksey Fedorov on 16.08.2022.
//

import Foundation

public final class AppCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Usecases
    
    private let getIsIntroCompletedUsecase: GetIsIntroCompletedUsecase = UsecasesFactory.shared.resolve()
    private let setIntroCompletedUsecase: SetIntroCompletedUsecase = UsecasesFactory.shared.resolve()
    private let getInRegistrationCompletedUsecese: GetInRegistrationCompletedUsecese = UsecasesFactory.shared.resolve()
    private let setRegistrationCompletedUsecese: SetRegistrationCompletedUsecese = UsecasesFactory.shared.resolve()
    private let getInOnboardingCompletedUsecase: GetInOnboardingCompletedUsecase = UsecasesFactory.shared.resolve()
    private let setOnboardingCompletedUsecase: SetOnboardingCompletedUsecase = UsecasesFactory.shared.resolve()
    
    // MARK: - Override methods
    
    public override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        coordinateToRequired()
//        coordinateToRegistration()
//        coordinateToMatch()
    }
    
    private func coordinateToRequired() {
        if !(getIsIntroCompletedUsecase.execute() ?? false) {
            coordinateToIntro()
        } else if !(getInRegistrationCompletedUsecese.execute() ?? false) {
            coordinateToRegistration()
        } else if !(getInOnboardingCompletedUsecase.execute() ?? false) {
            coordinateToOnboarding()
        } else {
            coordinateToMainScrean()
        }
    }
    
    private func coordinateToIntro() {
        let introCoordinator = IntroCoordonator(navigationController: navigationController)
        
        capture(coordinator: introCoordinator)
        
        introCoordinator.start(with: (), completionHandler: { [weak self, weak introCoordinator] _ in
            guard
                let self = self,
                let introCoordinator = introCoordinator
            else { return }
            
            self.decapture(coordinator: introCoordinator)

            self.setIntroCompletedUsecase.execute()
            
            self.coordinateToRequired()
        })
    }
    
    private func coordinateToRegistration() {
        let registrationCoordinator = RegistrationCoordinator(navigationController: navigationController)
        
        capture(coordinator: registrationCoordinator)
        
        registrationCoordinator.start(with: (), completionHandler: { [weak self, weak registrationCoordinator] _ in
            guard
                let self = self,
                let registrationCoordinator = registrationCoordinator
            else { return }
            
            self.decapture(coordinator: registrationCoordinator)
            
            self.setRegistrationCompletedUsecese.execute()
            
            self.coordinateToRequired()
        })
    }
    
    private func coordinateToOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        
        capture(coordinator: onboardingCoordinator)
        
        onboardingCoordinator.start(with: (), completionHandler: { [weak self, weak onboardingCoordinator] _ in
            guard
                let self = self,
                let onboardingCoordinator = onboardingCoordinator
            else { return }
            
            self.decapture(coordinator: onboardingCoordinator)
            
            self.setOnboardingCompletedUsecase.execute()
            
            self.coordinateToRequired()
        })
    }
    
    private func coordinateToMainScrean() {
        let mainScreanCoordinator = MainScreanCoordinator(navigationController: navigationController)
        
        capture(coordinator: mainScreanCoordinator)
        
        mainScreanCoordinator.start(with: (), completionHandler: { [weak self, weak mainScreanCoordinator] _ in
            guard
                let self = self,
                let mainScreanCoordinator = mainScreanCoordinator
            else { return }
            
            self.decapture(coordinator: mainScreanCoordinator)
        })
    }
    
    private func coordinateToVideoOnboarding() {
        let videoOnboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        
        capture(coordinator: videoOnboardingCoordinator)
        
        videoOnboardingCoordinator.start(with: (), completionHandler: { [weak self, weak videoOnboardingCoordinator] _ in
            guard
                let self = self,
                let videoOnboardingCoo0rdinator = videoOnboardingCoordinator
            else { return }
            
            self.decapture(coordinator: videoOnboardingCoo0rdinator)
        })
    }
    
    private func coordinateToMatch() {
        let matchCoordinator = MatchCoordinator(navigationController: navigationController)
        
        capture(coordinator: matchCoordinator)
        
        matchCoordinator.start(with: makeMockVideoURL(), completionHandler: { [weak self, weak matchCoordinator] _ in
            guard let self = self, let matchCoordinator = matchCoordinator else { return }
            
            self.decapture(coordinator: matchCoordinator)
        })
    }
    
    private func makeMockVideoURL() -> URL {
        guard let mockVideoPath = Bundle.main.path(forResource: "SexyGirlDance", ofType:"MP4") else { fatalError() }
        return URL(fileURLWithPath: mockVideoPath)
    }
}
