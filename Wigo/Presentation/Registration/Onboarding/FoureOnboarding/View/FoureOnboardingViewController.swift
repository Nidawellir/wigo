//
//  FoureOnboardingViewController.swift
//  Wigo-Native
//
//  Created by Apple User on 7/25/23.
//

import UIKit

final class FoureOnboardingViewController: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private let presenter: FoureOnboardingPresenterInput
    
    // MARK: - UI properties
    
    private let foureOnboardingView: FoureOnboardingView = .init()
    
    // MARK: - Initialization
    
    init(presenter: FoureOnboardingPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        
        view = foureOnboardingView
    }
}

// MARK: - Public methods

extension FoureOnboardingViewController {}

// MARK: - FoureOnboardingPresenterOutput

extension FoureOnboardingViewController: FoureOnboardingPresenterOutput {}
