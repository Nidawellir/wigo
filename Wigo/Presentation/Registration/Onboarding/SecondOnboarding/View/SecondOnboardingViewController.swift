//
//  SecondOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class SecondOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: SecondOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let secondOnboardingView: SecondOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: SecondOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = secondOnboardingView
    }
}

// MARK: - Public methods

extension SecondOnboardingViewController {}

// MARK: - SecondOnboardingPresenterOutput

extension SecondOnboardingViewController: SecondOnboardingPresenterOutput {}
