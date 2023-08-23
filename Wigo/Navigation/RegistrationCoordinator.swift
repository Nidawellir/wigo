//
//  RegistrationCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/22/23.
//

import UIKit

final class RegistrationCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var createAccountModuleInput: CreateAccountModuleInput?
    private weak var smsCodeModuleInput: SMSCodeModuleInput?
    private weak var yourNameModuleInput: YourNameModuleInput?
    private weak var yourBirtdayModuleInput: YourBirthdayModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        let createAccountViewController: UIViewController
        
        (createAccountViewController, createAccountModuleInput) = CreateAccountBuilder.build(with: self)
        
        navigationController.viewControllers = [createAccountViewController]
    }
}

// MARK: - CreateAccountModuleOutput

extension RegistrationCoordinator: CreateAccountModuleOutput {
    func openSMSCode() {
        let smsCodeViewController: UIViewController
        
        (smsCodeViewController, smsCodeModuleInput) = SMSCodeBuilder.build(with: self)
                
        navigationController.pushViewController(smsCodeViewController, animated: true)
    }
}

// MARK: - SMSCodeModuleOutput

extension RegistrationCoordinator: SMSCodeModuleOutput {
    func openYourName() {
        let yourNameViewController: UIViewController
        
        (yourNameViewController, yourNameModuleInput) = YourNameBuilder.build(with: self)
                
        navigationController.pushViewController(yourNameViewController, animated: true)
    }
    
    func closeSMSCode() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - YourNameModuleOutput

extension RegistrationCoordinator: YourNameModuleOutput {
    func openYourBirtday() {
        let yourBirtdayViewController: UIViewController
        
        (yourBirtdayViewController, yourBirtdayModuleInput) = YourBirthdayBuilder.build(with: self)
                
        navigationController.pushViewController(yourBirtdayViewController, animated: true)
    }
    
    func closeYourName() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - YourBirthdayModuleOutput

extension RegistrationCoordinator: YourBirthdayModuleOutput {
    func closeYourBirthday() {
        navigationController.popViewController(animated: true)
    }
}
