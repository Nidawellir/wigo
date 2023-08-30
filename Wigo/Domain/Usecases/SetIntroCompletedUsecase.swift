//
//  MarkIntroCompleteUsecase.swift
//  Wigo
//
//  Created by Apple User on 8/30/23.
//

final class MarkIntroCompleteUsecase {
    
    // MARK: - Private properties
    
    private let userDefaultsGateway: UserDefaultsGateway
    private let isIntroCompletedKey: String = "isIntroCompletedKey"
    
    // MARK: - Initialization
    
    init(userDefaultsGateway: UserDefaultsGateway) {
        self.userDefaultsGateway = userDefaultsGateway
    }
}

extension MarkIntroCompleteUsecase {
    func execute() {
        userDefaultsGateway.save(object: true, key: isIntroCompletedKey)
    }
}
