//
//  CreateAccountViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: CreateAccountModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: CreateAccountPresenterInput
    
    // MARK: - UI properties
    
    private let createAccountView: CreateAccountView = .init()
    
    // MARK: - Initialization
    
    init(presenter: CreateAccountPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        createAccountView.delegate = self
        
        view = createAccountView
    }
}

// MARK: - CreateAccountModuleInput

extension CreateAccountViewController: CreateAccountModuleInput {}

// MARK: - Public methods

extension CreateAccountViewController {}

// MARK: - CreateAccountViewDelegate

extension CreateAccountViewController: CreateAccountViewDelegate {
    func didTapContinueButton(with phoneNumber: String) {
        presenter.fetchCreateAccount(for: phoneNumber)
    }
}

// MARK: - CreateAccountPresenterOutput

extension CreateAccountViewController: CreateAccountPresenterOutput {
    func didSuccessFetchCreateAccount() {
        output?.openSMSCode()
    }
    
    func didFailureFetchCreateAccount() {
        print("-didFailureFetchCreateAccount()")
    }
}
