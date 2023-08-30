//
//  UsecasesFactory.swift
//  Wigo
//
//  Created by Apple User on 8/30/23.
//

final class UsecasesFactory {
    
    // MARK: - Private properties
    
    private var gatewaysFactory: GatewaysFactory!
    
    // MARK: - Shared
    
    static let shared: UsecasesFactory = UsecasesFactory()
    
    // MARK: - Initialization
    
    private init() {}
    
    // MARK: - Resolve
    
    func resolve() -> SetIntroCompletedUsecase {
        return SetIntroCompletedUsecase(
            userDefaultsGateway: gatewaysFactory.resolve()
        )
    }
    
    func resolve() -> GetIsIntroCompletedUsecase {
        return GetIsIntroCompletedUsecase(
            userDefaultsGateway: gatewaysFactory.resolve()
        )
    }
}

// MARK: - Inject dependency

extension UsecasesFactory {
    func inject(gatewaysFactory: GatewaysFactory) {
        self.gatewaysFactory = gatewaysFactory
    }
}
