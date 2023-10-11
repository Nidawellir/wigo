//
//  CreateAccountPresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import Combine
import Foundation

final class CreateAccountPresenter {
    
    // MARK: - Public properties
    
    weak var output: CreateAccountPresenterOutput?
    
    // MARK: - Private properties
    
    private let registrationUsecase: RegistrationUsecase
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(registrationUsecase: RegistrationUsecase) {
        self.registrationUsecase = registrationUsecase
    }
}

// MARK: - CreateAccountPresenterInput

extension CreateAccountPresenter: CreateAccountPresenterInput {
    func fetchCreateAccount(for phoneNumber: String) {
        let uuid = NSUUID().uuidString
        
        registrationUsecase.execute(uuid: "111222", appleID: "33344", phoneNumber: phoneNumber)
            .sink { completion in
                print(completion)
            } receiveValue: { result in
                print(result)
            }
            .store(in: &cancellableSet)
        
        output?.didSuccessFetchCreateAccount()
    }
}
