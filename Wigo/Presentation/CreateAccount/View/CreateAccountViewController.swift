//
//  CreateAccountViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    
    // MARK: - Public properties
    
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
        
        view = createAccountView
    }
}

// MARK: - Public methods

extension CreateAccountViewController {}

// MARK: - CreateAccountPresenterOutput

extension CreateAccountViewController: CreateAccountPresenterOutput {}
