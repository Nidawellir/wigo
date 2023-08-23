//
//  EightOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class EightOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: EightOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let eightOnboardingView: EightOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: EightOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = eightOnboardingView
    }
}

// MARK: - Public methods

extension EightOnboardingViewController {}

// MARK: - EightOnboardingPresenterOutput

extension EightOnboardingViewController: EightOnboardingPresenterOutput {}
