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
    
    func resolve() -> SetRegistrationCompletedUsecese {
        return SetRegistrationCompletedUsecese(
            userDefaultsGateway: gatewaysFactory.resolve()
        )
    }
    
    func resolve() -> GetInRegistrationCompletedUsecese {
        return GetInRegistrationCompletedUsecese(
            userDefaultsGateway: gatewaysFactory.resolve()
        )
    }
    
    func resolve() -> SetOnboardingCompletedUsecase {
        return SetOnboardingCompletedUsecase(
            userDefaultsGateway: gatewaysFactory.resolve()
        )
    }
    
    func resolve() -> GetInOnboardingCompletedUsecase {
        return GetInOnboardingCompletedUsecase(
            userDefaultsGateway: gatewaysFactory.resolve()
        )
    }
    
    func resolve() -> RegistrationUsecase {
        return RegistrationUsecase(authenticationGateway: gatewaysFactory.resolve())
    }
    
    func resolve() -> SetInOnboardingVideoRecordingCompletedUsecese {
        return SetInOnboardingVideoRecordingCompletedUsecese(userDefaultsGateway: gatewaysFactory.resolve())
    }
    
    func resolve() -> GetInOnboardingVideoRecordingCompletedUsecese {
        return GetInOnboardingVideoRecordingCompletedUsecese(userDefaultsGateway: gatewaysFactory.resolve())
    }
}

// MARK: - Inject dependency

extension UsecasesFactory {
    func inject(gatewaysFactory: GatewaysFactory) {
        self.gatewaysFactory = gatewaysFactory
    }
}
