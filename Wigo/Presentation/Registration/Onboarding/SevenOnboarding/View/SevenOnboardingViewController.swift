//
//  SevenOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class SevenOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: SevenOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let sevenOnboardingView: SevenOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: SevenOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = sevenOnboardingView
    }
}

// MARK: - Public methods

extension SevenOnboardingViewController {}

// MARK: - SevenOnboardingPresenterOutput

extension SevenOnboardingViewController: SevenOnboardingPresenterOutput {}
