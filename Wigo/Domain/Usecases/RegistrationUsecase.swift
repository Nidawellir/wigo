//
//  RegistrationUsecase.swift
//  Wigo
//
//  Created by Apple User on 10/3/23.
//

import Combine

final class RegistrationUsecase {
    
    // MARK: - Private properties
    
    private let authenticationGateway: AuthenticationGateway
    
    
    // MARK: - Initialization
    
    init(authenticationGateway: AuthenticationGateway) {
        self.authenticationGateway = authenticationGateway
    }
}

// MARK: - Public methods

extension RegistrationUsecase {
    func execute(uuid: String, appleID: String, phoneNumber: String) -> AnyPublisher<DecodableStruct, CNPError> {
        return authenticationGateway.registration(uuid: uuid, appleID: appleID, phoneNumber: phoneNumber)
    }
}
