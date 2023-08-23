//
//  FiveOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class FiveOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: FiveOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let fiveOnboardingView: FiveOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: FiveOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = fiveOnboardingView
    }
}

// MARK: - Public methods

extension FiveOnboardingViewController {}

// MARK: - FiveOnboardingPresenterOutput

extension FiveOnboardingViewController: FiveOnboardingPresenterOutput {}
