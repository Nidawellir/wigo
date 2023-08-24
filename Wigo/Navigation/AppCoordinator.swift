//
//  File.swift
//  
//
//  Created by Евгений Капанов on 16.08.2022.
//

public final class AppCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Usecases
    
    // MARK: - Override methods
    
    public override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        coordinateToOnboarding()
//        if isAuthorized {
//            coordinateToHome()
//        } else {
//            coordinateToRegistration()
//        }
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
            
            self.coordinateToHome()
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
    
    private func coordinateToHome() {
        print("-coordinateToHome()")
    }
}
