//
//  SixOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class SixOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: SixOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let sixOnboardingView: SixOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: SixOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = sixOnboardingView
    }
}

// MARK: - Public methods

extension SixOnboardingViewController {}

// MARK: - SixOnboardingPresenterOutput

extension SixOnboardingViewController: SixOnboardingPresenterOutput {}
