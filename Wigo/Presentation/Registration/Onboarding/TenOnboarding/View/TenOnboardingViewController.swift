//
//  TenOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class TenOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: TenOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let tenOnboardingView: TenOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: TenOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = tenOnboardingView
    }
}

// MARK: - Public methods

extension TenOnboardingViewController {}

// MARK: - TenOnboardingPresenterOutput

extension TenOnboardingViewController: TenOnboardingPresenterOutput {}
