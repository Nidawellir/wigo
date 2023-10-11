//
//  RegistrationCoordinator.swift
//  Wigo
//
//  Created by Apple User on 8/22/23.
//

import UIKit

final class RegistrationCoordinator: BaseCoordinator<Void, Void> {
    
    // MARK: - Private properties
    
    private weak var appleIDSignInModuleInput: AppleIDSignInModuleInput?
    private weak var createAccountModuleInput: CreateAccountModuleInput?
    private weak var yourNameModuleInput: YourNameModuleInput?
    private weak var yourBirtdayModuleInput: YourBirthdayModuleInput?
    private weak var genderModuleInput: GenderModuleInput?
    private weak var turnGeolocationModuleInput: TurnGeolocationModuleInpute?
    private weak var turnNotificationsModuleInput: TurnNotificationsModuleInput?
    
    // MARK: - Override methods
    
    override func start(with input: Void, completionHandler: @escaping (()) -> Void) {
        super.start(with: input, completionHandler: completionHandler)
        
        let appleIDSignInViewController: UIViewController
        
        (appleIDSignInViewController, appleIDSignInModuleInput) = AppleIDSignInBuilder.build(with: self)
        
        navigationController.viewControllers = [appleIDSignInViewController]
    }
}

extension RegistrationCoordinator: AppleIDSignInModuleOutput {
    func openCreateAccaunt() {
        let createAccountViewController: UIViewController
        
        (createAccountViewController, createAccountModuleInput) = CreateAccountBuilder.build(with: self)
        navigationController.pushViewController(createAccountViewController, animated: true)
    }
}

// MARK: - CreateAccountModuleOutput

extension RegistrationCoordinator: CreateAccountModuleOutput {
    func openYourName() {
        let yourNameViewController: UIViewController
        
        (yourNameViewController, yourNameModuleInput) = YourNameBuilder.build(with: self)
                
        navigationController.pushViewController(yourNameViewController, animated: true)
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
    func openGender() {
        let genderViewController: UIViewController
        
        (genderViewController, genderModuleInput) = GenderBuilder.build(with: self)
                
        navigationController.pushViewController(genderViewController, animated: true)
    }
    
    func closeYourBirthday() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - GenderModuleOutput

extension RegistrationCoordinator: GenderModuleOutput {
    func openTurnGeolocation() {
        let turnGeolocationViewController: UIViewController
        
        (turnGeolocationViewController, turnGeolocationModuleInput) = TurnGeolocationBuilder.build(with: self)
                
        navigationController.pushViewController(turnGeolocationViewController, animated: true)
    }
    
    func closeGender() {
        navigationController.popViewController(animated: true)
    }
}

// MARK: - TurnGeolocationModuleOutput

extension RegistrationCoordinator: TurnGeolocationModuleOutput {
    func openTurnNotification() {
        let turnNotificationsViewController: UIViewController
        
        (turnNotificationsViewController, turnNotificationsModuleInput) = TurnNotificationsBuilder.build(with: self)
                
        navigationController.pushViewController(turnNotificationsViewController, animated: true)
    }
}

// MARK: - TurnNotificationsModuleOutput

extension RegistrationCoordinator: TurnNotificationsModuleOutput {
    func openOnboarding() {
        completionHandler?(())
    }
}
