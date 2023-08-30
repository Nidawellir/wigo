//
//  GetIsIntroCompletedUsecase.swift
//  Wigo
//
//  Created by Apple User on 8/30/23.
//

final class GetIsIntroCompletedUsecase {
    
    // MARK: - Private properties
    
    private let userDefaultsGateway: UserDefaultsGateway
    private let isIntroCompletedKey: String = "isIntroCompletedKey"
    
    // MARK: - Initialization
    
    init(userDefaultsGateway: UserDefaultsGateway) {
        self.userDefaultsGateway = userDefaultsGateway
    }
}

// MARK: - Public methods

extension GetIsIntroCompletedUsecase {
    func execute() -> Bool? {
        return userDefaultsGateway.load(key: isIntroCompletedKey)
    }
}

