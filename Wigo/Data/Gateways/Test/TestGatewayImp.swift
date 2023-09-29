//
//  TestGateway.swift
//  Wigo
//
//  Created by Apple User on 9/28/23.
//

import Combine

final class TestGatewayImp {
    
    // MARK: - Private properties
    
    private let combinedNetworkProvider: CombinedNetworkProvider
    
    // MARK: - Initialization
    
    init(combinedNetworkProvider: CombinedNetworkProvider) {
        self.combinedNetworkProvider = combinedNetworkProvider
    }
}

// MARK: - TestGateway

extension TestGatewayImp: TestGateway {
    func makeTestGateway() -> AnyPublisher<DecodableStruct, CNPError> {
//        return combinedNetworkProvider.execute(request: SingleRequest(firstParam: "", secondParam: true))
        return combinedNetworkProvider.execute(request: TestRequest.firstRequest(firstParam: "hui", secondParam: true))
    }
}
