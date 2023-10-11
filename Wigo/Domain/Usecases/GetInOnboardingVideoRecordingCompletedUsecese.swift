//
//  GetInOnboardingVideoRecordingCompletedUsecese.swift
//  Wigo
//
//  Created by Apple User on 10/10/23.
//

final class GetInOnboardingVideoRecordingCompletedUsecese {
    
    // MARK: - Private properties
    
    private let userDefaultsGateway: UserDefaultsGateway
    private let isOnboardingVideoRecordingCompletedKey: String = "isOnboardingVideoRecordingCompletedKey"
    
    // MARK: - Initialization
    
    init(userDefaultsGateway: UserDefaultsGateway) {
        self.userDefaultsGateway = userDefaultsGateway
    }
}

// MARK: - Public methods

extension GetInOnboardingVideoRecordingCompletedUsecese {
    func execute() -> Bool? {
        return userDefaultsGateway.load(key: isOnboardingVideoRecordingCompletedKey)
    }
}
