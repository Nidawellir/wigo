//
//  GetInOnboardingCompletedUsecase.swift
//  Wigo
//
//  Created by Apple User on 8/31/23.
//

final class GetInOnboardingCompletedUsecase {
    
    // MARK: - Private properties
    
    private let userDefaultsGateway: UserDefaultsGateway
    private let isOnboardingCompletedKey: String = "isOnboardingCompletedKey"
    
    // MARK: - Initialization
    
    init(userDefaultsGateway: UserDefaultsGateway) {
        self.userDefaultsGateway = userDefaultsGateway
    }
}

// MARK: - Public methods

extension GetInOnboardingCompletedUsecase {
    func execute() -> Bool? {
        return userDefaultsGateway.load(key: isOnboardingCompletedKey)
    }
}
