//
//  SetOnboardingCompletedUsecase.swift
//  Wigo
//
//  Created by Apple User on 8/31/23.
//

final class SetOnboardingCompletedUsecase {
    
    // MARK: - Private properties
    
    private let userDefaultsGateway: UserDefaultsGateway
    private let isOnboardingCompletedKey: String = "isRegistrationCompletedKey"
    
    // MARK: - Initialization
    
    init(userDefaultsGateway: UserDefaultsGateway) {
        self.userDefaultsGateway = userDefaultsGateway
    }
}

// MARK: - Public methods

extension SetOnboardingCompletedUsecase {
    func execute() {
        userDefaultsGateway.save(object: true, key: isOnboardingCompletedKey)
    }
}
