//
//  GatewaysFactory.swift
//  Wigo
//
//  Created by Apple User on 8/30/23.
//

final class GatewaysFactory {
    
    // MARK: - Shared
    
    static let shared: GatewaysFactory = GatewaysFactory()
    
    // MARK: - Initialization
    
    private init() {}
    
    // MARK: - Resolve
    
    func resolve() -> CombinedNetworkProvider {
        return CombinedNetworkProviderBuilder.build()
    }
    
    func resolve() -> UserDefaultsGateway {
        return UserDefaultsGatewayImp.shared
    }
    
    func resolve() -> TestGatewayImp {
        return TestGatewayImp(combinedNetworkProvider: resolve())
    }
}

