//
//  FirstOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class FirstOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: FirstOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let firstOnboardingView: FirstOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: FirstOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = firstOnboardingView
    }
}

// MARK: - Public methods

extension FirstOnboardingViewController {}

// MARK: - FirstOnboardingPresenterOutput

extension FirstOnboardingViewController: FirstOnboardingPresenterOutput {}
