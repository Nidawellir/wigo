//
//  SMSCodePresenter.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

final class SMSCodePresenter {
    
    // MARK: - Public properties
    
    weak var output: SMSCodePresenterOutput?
    
    // MARK: - Private properties
    
}

// MARK: - SMSCodePresenterInput

extension SMSCodePresenter: SMSCodePresenterInput {
    func fetchSMSCode(for smsCode: String) {
        print(smsCode)
    }
}
