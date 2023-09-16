//
//  GetInRegistrationCompletedUsecese.swift
//  Wigo
//
//  Created by Apple User on 8/30/23.
//

final class GetInRegistrationCompletedUsecese {
    
    // MARK: - Private properties
    
    private let userDefaultsGateway: UserDefaultsGateway
    private let isRegistrationCompletedKey: String = "isRegistrationCompletedKey"
    
    // MARK: - Initialization
    
    init(userDefaultsGateway: UserDefaultsGateway) {
        self.userDefaultsGateway = userDefaultsGateway
    }
}

// MARK: - Public methods

extension GetInRegistrationCompletedUsecese {
    func execute() -> Bool? {
        return userDefaultsGateway.load(key: isRegistrationCompletedKey)
    }
}
