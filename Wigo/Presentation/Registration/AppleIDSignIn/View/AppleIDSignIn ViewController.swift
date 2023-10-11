//
//  AppleIDSignInViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class AppleIDSignInViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var output: AppleIDSignInModuleOutput?
    
    // MARK: - Private properties
    
    private let presenter: AppleIDSignInPresenterInput
    
    // MARK: - UI properties
    
    private let appleIDSignInView: AppleIDSignInView = .init()
    
    // MARK: - Initialization
    
    init(presenter: AppleIDSignInPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = appleIDSignInView
        appleIDSignInView.delegate = self
    }
}

// MARK: - AppleIDSignInModuleInput

extension AppleIDSignInViewController: AppleIDSignInModuleInput {}

// MARK: - Public methods

extension AppleIDSignInViewController: AppleIDSignInViewDelegate {
    func openCreateAccount() {
        output?.openCreateAccaunt()
    }
}

// MARK: - Public methods

extension AppleIDSignInViewController {}

// MARK: - AppleIDSignInPresenterOutput

extension AppleIDSignInViewController: AppleIDSignInPresenterOutput {}
