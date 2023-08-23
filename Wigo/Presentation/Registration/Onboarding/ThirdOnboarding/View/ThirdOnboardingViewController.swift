//
//  ThirdOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class ThirdOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: ThirdOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let thirdOnboardingView: ThirdOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: ThirdOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = thirdOnboardingView
    }
}

// MARK: - Public methods

extension ThirdOnboardingViewController {}

// MARK: - ThirdOnboardingPresenterOutput

extension ThirdOnboardingViewController: ThirdOnboardingPresenterOutput {}
