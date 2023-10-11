//
//  AuthorizationGatewayImp.swift
//  Wigo
//
//  Created by Apple User on 10/3/23.
//

import Combine

final class AuthenticationGatewayImp {
    
    // MARK: - Private properties
    
    private let combinedNetworkProvider: CombinedNetworkProvider
    
    // MARK: - Initialization
    
    init(combinedNetworkProvider: CombinedNetworkProvider) {
        self.combinedNetworkProvider = combinedNetworkProvider
    }
}

// MARK: - AuthenticationGateway

extension AuthenticationGatewayImp: AuthenticationGateway {
     func registration(uuid: String, appleID: String, phoneNumber: String) -> AnyPublisher<DecodableStruct, CNPError> {
        return combinedNetworkProvider.execute(request: AuthenticationRequest.registration(
            uuid: uuid,
            appleID: appleID,
            phoneNumber: phoneNumber
        ))
    }
}
