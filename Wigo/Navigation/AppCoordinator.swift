//
//  File.swift
//  
//
//  Created by Aleksey Fedorov on 16.08.2022.
//

public final class AppCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Usecases
    
    private let getIsIntroCompletedUsecase: GetIsIntroCompletedUsecase = UsecasesFactory.shared.resolve()
    private let setIntroCompletedUsecase: SetIntroCompletedUsecase = UsecasesFactory.shared.resolve()
    
    // MARK: - Override methods
    
    public override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        coordinateToRequired()
    }
    
    private func coordinateToRequired() {
        if getIsIntroCompletedUsecase.execute() == true {
            coordinateToRegistration()
        } else {
            coordinateToIntro()
        }
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
            
            self.coordinateToOnboarding()
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
            
            self.coordinateToHome()
        })
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
    
    private func coordinateToHome() {
        print("-coordinateToHome()")
    }
}
