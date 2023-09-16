//
//  SetRegistrationCompletedUsecese.swift
//  Wigo
//
//  Created by Apple User on 8/30/23.
//

final class SetRegistrationCompletedUsecese {
    
    // MARK: - Private properties
    
    private let userDefaultsGateway: UserDefaultsGateway
    private let isRegistrationCompletedKey: String = "isRegistrationCompletedKey"
    
    // MARK: - Initialization
    
    init(userDefaultsGateway: UserDefaultsGateway) {
        self.userDefaultsGateway = userDefaultsGateway
    }
}

// MARK: - Public methods

extension SetRegistrationCompletedUsecese {
    func execute() {
        userDefaultsGateway.save(object: true, key: isRegistrationCompletedKey)
    }
}
