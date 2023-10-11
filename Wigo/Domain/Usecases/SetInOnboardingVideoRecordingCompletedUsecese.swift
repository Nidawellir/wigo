//
//  SetInOnboardingVideoRecordingCompletedUsecese.swift
//  Wigo
//
//  Created by Apple User on 10/10/23.
//

final class SetInOnboardingVideoRecordingCompletedUsecese {
    
    // MARK: - Private properties
    
    private let userDefaultsGateway: UserDefaultsGateway
    private let isOnboardingVideoRecordingCompletedKey: String = "isOnboardingVideoRecordingCompletedKey"
    
    // MARK: - Initialization
    
    init(userDefaultsGateway: UserDefaultsGateway) {
        self.userDefaultsGateway = userDefaultsGateway
    }
}

extension SetInOnboardingVideoRecordingCompletedUsecese {
    func execute() {
        userDefaultsGateway.save(object: true, key: isOnboardingVideoRecordingCompletedKey)
    }
}
